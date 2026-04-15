package nearfix.nearfix.service;

import nearfix.nearfix.dao.UserDAO;
import nearfix.nearfix.model.User;
import nearfix.nearfix.util.PasswordEncryption;
import nearfix.nearfix.util.Validation;
import nearfix.nearfix.util.exception.ValidationException;

public class UserService {

    private final UserDAO userDAO = new UserDAO();

    /**
     * Register a new user with complete validation
     */
    public boolean registerUser(String name, String email, String phone,
                                String password, String role)
            throws ValidationException {

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

        return userDAO.createUser(user);
    }

    /**
     * Login user with email and password
     */
    public User login(String email, String password) throws ValidationException {

        if (!Validation.isValidEmail(email)) {
            throw new ValidationException("Invalid email format.");
        }

        if (email == null || email.trim().isEmpty()) {
            throw new ValidationException("Email is required.");
        }

        if (password == null || password.trim().isEmpty()) {
            throw new ValidationException("Password is required.");
        }

        // Find user by email
        User user = userDAO.getUserByEmail(email);

        if (user == null) {
            throw new ValidationException("Email not found. Please register first.");
        }

        // Check if account is active
        if (!user.isActive()) {
            throw new ValidationException("Your account has been deactivated. Contact admin.");
        }

        // Verify password
        if (!PasswordEncryption.verifyPassword(password, user.getPasswordHash())) {
            throw new ValidationException("Incorrect password. Please try again.");
        }

        return user;
    }

    /**
     * Get user by ID
     */
    public User getUserById(int userId) {
        return userDAO.getUserById(userId);
    }

    /**
     * Change user password
     */
    public boolean changePassword(int userId, String oldPassword, String newPassword)
            throws ValidationException {

        User user = userDAO.getUserById(userId);

        if (user == null) {
            throw new ValidationException("User not found.");
        }

        if (!PasswordEncryption.verifyPassword(oldPassword, user.getPasswordHash())) {
            throw new ValidationException("Old password is incorrect.");
        }

        if (!Validation.isValidPassword(newPassword)) {
            throw new ValidationException("New password is invalid.");
        }

        String newPasswordHash = PasswordEncryption.encryptPassword(newPassword);
        return userDAO.updatePassword(userId, newPasswordHash);
    }

    /**
     * Update user profile
     */
    public boolean updateProfile(int userId, String name, String email, String phone)
            throws ValidationException {

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
}