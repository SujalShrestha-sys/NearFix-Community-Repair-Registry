package nearfix.nearfix.util;

import java.util.regex.Pattern;

/**
 * Validation - Utility class for validating user input fields.
 *
 * Each method checks if a value matches a specific pattern (regex).
 * Returns true if valid, false if invalid.
 *
 * RULES:
 * - Name → Only letters and spaces
 * - Email → Must contain @ and a domain
 * - Phone → Exactly 10 digits
 * - Password → 8+ chars, 1 uppercase, 1 digit, 1 special char
 */
public class Validation {

    /**
     * Validates an email address.
     * Example valid: "user@example.com"
     * Example invalid: "user@", "user.com"
     */
    public static boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
        return email != null && Pattern.matches(emailRegex, email);
    }

    /**
     * Validates a phone number (must be exactly 10 digits).
     * Example valid: "9841234567"
     * Example invalid: "12345", "98412345ab"
     */
    public static boolean isValidPhone(String phone) {
        return phone != null && phone.matches("[0-9]{10}");
    }

    /**
     * Validates a password.
     * Must contain:
     * - At least 8 characters
     * - At least 1 uppercase letter (A-Z)
     * - At least 1 digit (0-9)
     * - At least 1 special character (!@#$%^&*)
     */
    public static boolean isValidPassword(String password) {
        String passwordRegex = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,}$";
        return password != null && Pattern.matches(passwordRegex, password);
    }

    /**
     * Validates a name (only letters and spaces allowed).
     * Example valid: "Sujal Shrestha"
     * Example invalid: "Sujal123", "Sujal@Dev"
     */
    public static boolean isValidName(String name) {
        String nameRegex = "^[a-zA-Z\\s]+$";
        return name != null && Pattern.matches(nameRegex, name);
    }
}
