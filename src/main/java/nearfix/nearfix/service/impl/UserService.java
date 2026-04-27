package nearfix.nearfix.service.impl;

import nearfix.nearfix.dao.impl.RepairerDAO;
import nearfix.nearfix.dao.impl.UserDAO;
import nearfix.nearfix.model.Repairer;
import nearfix.nearfix.exception.DatabaseException;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.User;
import nearfix.nearfix.service.iservice.IUserService;
import nearfix.nearfix.util.PasswordEncryption;
import nearfix.nearfix.util.Validation;

import java.sql.SQLException;

public class UserService implements IUserService {

    private UserDAO userDAO = new UserDAO();
    private RepairerDAO repairerDAO = new RepairerDAO();

    @Override
    public boolean registerUser(String name, String email, String phone, String password, String role) throws ValidationException, SQLException, DatabaseException {
        if (!Validation.isValidName(name)) {
            throw new ValidationException("Invalid name. Only letters and spaces allowed.");
        }

        if (!Validation.isValidEmail(email)) {
            throw new ValidationException("Invalid email format.");
        }

        if (!Validation.isValidPhone(phone)) {
            throw new ValidationException("Invalid phone number. Must be 10 digits.");
        }

        if (!Validation.isValidPassword(password)) {
            throw new ValidationException("Password must have 8+ characters, 1 uppercase, 1 digit, 1 special char.");
        }

        if (userDAO.getUserByEmail(email) != null) {
            throw new ValidationException("Email already registered.");
        }

        if (userDAO.getUserByPhone(phone) != null) {
            throw new ValidationException("Phone number already registered.");
        }

        String passwordHash = PasswordEncryption.encryptPassword(password);
        User user = new User(name, email, phone, passwordHash, role);
        int userId = userDAO.createUser(user);
        if (userId <= 0) {
            throw new ValidationException(
                    "Registration failed. Please try again."
            );
        }

        // If the user is a repairer, initialize their entry in the repairers table
        if ("REPAIRER".equalsIgnoreCase(role)) {
            Repairer repairer = new Repairer();
            repairer.setUserId(userId);
            repairer.setVerificationStatus(false);
            repairer.setRating(0.0);
            repairer.setTotalJobsCompleted(0);
            // Default empty values for required fields
            repairer.setSpecialization("Not Specified");
            repairer.setExpertise("");
            repairer.setYearsOfExperience(0);
            repairer.setLicenseNumber("");

            repairerDAO.createRepairer(repairer);
        }

        return true;
    }



    public User login(String email, String password) throws ValidationException {
        try {
            User user = userDAO.getUserByEmail(email);

            if (user == null) {
                throw new ValidationException("User not found with this email.");
            }

            if (!PasswordEncryption.verifyPassword(password, user.getPasswordHash())) {
                throw new ValidationException("Invalid password. Please try again.");
            }

            if (!user.isActive()) {
                throw new ValidationException("Your account is deactivated. Please contact support.");
            }

            return user;
        } catch (SQLException e) {
            throw new ValidationException("Database error during login: " + e.getMessage());
        }
    }


    @Override
    public User getUserById(int userId) throws SQLException {
        return userDAO.getUserById(userId);
    }

    @Override
    public boolean updateProfile(int userId, String name, String email, String phone) throws ValidationException, SQLException {
        User user = userDAO.getUserById(userId);

        if (user == null) {
            throw new ValidationException("User not found.");
        }

        if (!Validation.isValidName(name)) {
            throw new ValidationException("Invalid name format.");
        }

        if (!email.equals(user.getEmail())) {
            if (userDAO.getUserByEmail(email) != null) {
                throw new ValidationException("Email already in use.");
            }
        }

        if (!phone.equals(user.getPhone())) {
            if (userDAO.getUserByPhone(phone) != null) {
                throw new ValidationException("Phone number already in use.");
            }
        }

        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);

        return userDAO.updateUser(user);
    }

    @Override
    public boolean changePassword(int userId, String oldPassword, String newPassword) throws ValidationException, SQLException {
        User user = userDAO.getUserById(userId);

        if (user == null) {
            throw new ValidationException("User not found.");
        }

        if (!PasswordEncryption.verifyPassword(oldPassword, user.getPasswordHash())) {
            throw new ValidationException("Old password incorrect.");
        }

        if (!Validation.isValidPassword(newPassword)) {
            throw new ValidationException("New password invalid.");
        }

        String newHash = PasswordEncryption.encryptPassword(newPassword);
        return userDAO.updatePassword(userId, newHash);
    }
}
