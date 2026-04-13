package nearfix.nearfix.service;

import nearfix.nearfix.dao.UserDAO;
import nearfix.nearfix.model.User;
import nearfix.nearfix.util.PasswordEncryption;
import nearfix.nearfix.util.Validation;
import nearfix.nearfix.util.exception.DatabaseException;
import nearfix.nearfix.util.exception.ValidationException;

import java.sql.SQLException;

public class UserService {

    private final UserDAO userDAO = new UserDAO();

    public boolean registerUser(String name, String email, String phone, String password, String role) throws ValidationException, DatabaseException {

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

        try {
            if (userDAO.getUserByEmail(email) != null) {
                throw new ValidationException("Email already registered.");
            }

            if (userDAO.getUserByPhone(phone) != null) {
                throw new ValidationException("Phone number already registered.");
            }
        } catch (SQLException e) {
            throw new DatabaseException("Failed to check existing user: " + e.getMessage(), e);
        }

        String passwordHash = PasswordEncryption.encryptPassword(password);
        User user = new User(name, email, phone, passwordHash, role);

        return userDAO.createUser(user);
    }
}
