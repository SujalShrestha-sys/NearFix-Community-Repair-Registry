package nearfix.nearfix.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/**
 * PasswordEncryption - Utility class for hashing and verifying passwords.
 *
 * HOW IT WORKS:
 * - Uses SHA-256 (a one-way hashing algorithm) to convert passwords
 * into a fixed-length string of hex characters.
 * - The hash is stored in the database instead of the plain password.
 * - To verify a login, we hash the entered password and compare it
 * to the stored hash.
 *
 * EXAMPLE:
 * String hash = PasswordEncryption.encryptPassword("MyPassword123!");
 * boolean match = PasswordEncryption.verifyPassword("MyPassword123!", hash); //
 * true
 */
public class PasswordEncryption {

    /**
     * Hashes a plain-text password using SHA-256.
     *
     * @param password the plain-text password to hash
     * @return the hashed password as a hex string
     */
    public static String encryptPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            return bytesToHex(hash);
        } catch (Exception e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }

    /**
     * Verifies a plain-text password against a stored hash.
     *
     * @param password the plain-text password entered by the user
     * @param hash     the stored hash from the database
     * @return true if the password matches the hash
     */
    public static boolean verifyPassword(String password, String hash) {
        return encryptPassword(password).equals(hash);
    }

    /**
     * Converts a byte array into a hex string.
     * (e.g., [0x1A, 0x2B] → "1a2b")
     */
    private static String bytesToHex(byte[] hash) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }
}
