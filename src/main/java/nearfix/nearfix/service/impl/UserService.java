package nearfix.nearfix.service.impl;

import nearfix.nearfix.dao.impl.RepairerDAO;
import nearfix.nearfix.dao.impl.UserDAO;
import nearfix.nearfix.exception.DatabaseException;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.Repairer;
import nearfix.nearfix.model.User;
import nearfix.nearfix.service.iservice.IUserService;
import nearfix.nearfix.util.PasswordEncryption;
import nearfix.nearfix.util.Validation;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {

    private UserDAO userDAO = new UserDAO();
    private RepairerDAO repairerDAO = new RepairerDAO();

    /**
     * Registers a new user. Validates all input fields, checks for duplicates,
     * hashes the password, and saves to database.
     * If the role is REPAIRER, also creates a repairer profile.
     */
    @Override
    public boolean registerUser(String name, String email, String phone, String password, String role)
            throws ValidationException, SQLException, DatabaseException {

        // --- Input Validation ---
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

        // --- Duplicate Checks ---
        if (userDAO.getUserByEmail(email) != null) {
            throw new ValidationException("Email already registered.");
        }
        if (userDAO.getUserByPhone(phone) != null) {
            throw new ValidationException("Phone number already registered.");
        }

        // --- Create User ---
        String passwordHash = PasswordEncryption.encryptPassword(password);
        User user = new User(name, email, phone, passwordHash, role);
        int userId = userDAO.createUser(user);

        if (userId <= 0) {
            throw new ValidationException("Registration failed. Please try again.");
        }

        // If REPAIRER, also create a repairer profile
        if ("REPAIRER".equalsIgnoreCase(role)) {
            Repairer repairer = new Repairer();
            repairer.setUserId(userId);
            repairer.setVerified(false);
            repairer.setRating(0.0);
            repairer.setTotalJobsCompleted(0);
            repairer.setSpecialization("Not Specified");
            repairer.setExpertise("");
            repairer.setYearsOfExperience(0);
            repairer.setLicenseNumber("");

            repairerDAO.createRepairer(repairer);
        }

        return true;
    }

    /**
     * Specialized registration for Repairers with additional profile data.
     */
    @Override
    public boolean registerRepairer(String name, String email, String phone, String password, String specialization,
            int experience, String expertise)
            throws ValidationException, SQLException, DatabaseException {

        // --- Input Validation ---
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

        // --- Duplicate Checks ---
        if (userDAO.getUserByEmail(email) != null) {
            throw new ValidationException("Email already registered.");
        }
        if (userDAO.getUserByPhone(phone) != null) {
            throw new ValidationException("Phone number already registered.");
        }

        // --- Create User ---
        String passwordHash = PasswordEncryption.encryptPassword(password);
        User user = new User(name, email, phone, passwordHash, "REPAIRER");
        int userId = userDAO.createUser(user);

        if (userId <= 0) {
            throw new ValidationException("Registration failed. Please try again.");
        }

        // Create detailed repairer profile
        Repairer repairer = new Repairer();
        repairer.setUserId(userId);
        repairer.setVerified(false);
        repairer.setRating(0.0);
        repairer.setTotalJobsCompleted(0);
        repairer.setSpecialization(specialization);
        repairer.setExpertise(expertise);
        repairer.setYearsOfExperience(experience);
        repairer.setLicenseNumber(""); // Optional field for now

        repairerDAO.createRepairer(repairer);

        return true;
    }

    /**
     * Authenticates a user by email and password.
     * Returns the User object if login is successful.
     * Throws ValidationException if credentials are wrong or account is inactive.
     */
    @Override
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

    /**
     * Gets a user by their ID.
     */
    @Override
    public User getUserById(int userId) throws SQLException {
        return userDAO.getUserById(userId);
    }

    /**
     * Updates the user's profile (name, email, phone).
     * Validates inputs and checks for duplicate email/phone.
     */
    @Override
    public boolean updateProfile(int userId, String name, String email, String phone)
            throws ValidationException, SQLException {

        User user = userDAO.getUserById(userId);
        if (user == null) {
            throw new ValidationException("User not found.");
        }

        if (!Validation.isValidName(name)) {
            throw new ValidationException("Invalid name format.");
        }

        // Check email uniqueness (only if changed)
        if (!email.equals(user.getEmail())) {
            if (userDAO.getUserByEmail(email) != null) {
                throw new ValidationException("Email already in use.");
            }
        }

        // Check phone uniqueness (only if changed)
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

    /**
     * Changes the user's password after verifying the old one.
     */
    @Override
    public boolean changePassword(int userId, String oldPassword, String newPassword)
            throws ValidationException, SQLException {

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

    @Override
    public List<User> getAllUsers(int page, int pageSize) throws SQLException {
        return userDAO.getAllUsers(page, pageSize);
    }

    @Override
    public int getTotalUsers() throws SQLException {
        return userDAO.getTotalUsers();
    }

    @Override
    public boolean deactivateUser(int userId) throws SQLException {
        return userDAO.deactivateUser(userId);
    }

    @Override
    public boolean activateUser(int userId) throws SQLException {
        return userDAO.activateUser(userId);
    }

    @Override
    public List<User> searchUsers(String keyword, String role, int page, int pageSize) throws SQLException {
        return userDAO.searchUsers(keyword, role, page, pageSize);
    }

    @Override
    public int getTotalUsersCount(String keyword, String role) throws SQLException {
        return userDAO.getTotalUsersCount(keyword, role);
    }

    @Override
    public boolean verifyRepairer(int userId) throws SQLException {
        return repairerDAO.verifyRepairer(userId);
    }
}
