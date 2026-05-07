package nearfix.nearfix.model;

/**
 * Model class representing a user of the system.
 */
public class User {

    private int userId;
    private String name;
    private String email;
    private String phone;
    private String passwordHash;
    private String role;
    private boolean isActive;
    private boolean isVerified; // For repairers

    /**
     * Default constructor.
     */
    public User() {
    }

    /**
     * Constructor with essential fields.
     * 
     * @param name         Name of the user.
     * @param email        Email address of the user.
     * @param phone        Phone number of the user.
     * @param passwordHash Hashed password.
     * @param role         Role of the user (e.g., CUSTOMER, REPAIRER, ADMIN).
     */
    public User(String name, String email, String phone, String passwordHash, String role) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.passwordHash = passwordHash;
        this.role = role;
        this.isActive = true;
    }

    /**
     * Checks if the user (repairer) is verified.
     * 
     * @return True if verified, false otherwise.
     */
    public boolean isVerified() {
        return isVerified;
    }

    /**
     * Sets the verification status of the user.
     * 
     * @param verified Verification status to set.
     */
    public void setVerified(boolean verified) {
        isVerified = verified;
    }

    /**
     * Gets the user ID.
     * 
     * @return The user ID.
     */
    public int getUserId() {
        return userId;
    }

    /**
     * Sets the user ID.
     * 
     * @param userId The user ID to set.
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }

    /**
     * Gets the user's name.
     * 
     * @return The user's name.
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the user's name.
     * 
     * @param name The name to set.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the user's email address.
     * 
     * @return The email address.
     */
    public String getEmail() {
        return email;
    }

    /**
     * Sets the user's email address.
     * 
     * @param email The email address to set.
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Gets the user's phone number.
     * 
     * @return The phone number.
     */
    public String getPhone() {
        return phone;
    }

    /**
     * Sets the user's phone number.
     * 
     * @param phone The phone number to set.
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * Gets the hashed password.
     * 
     * @return The password hash.
     */
    public String getPasswordHash() {
        return passwordHash;
    }

    /**
     * Sets the hashed password.
     * 
     * @param passwordHash The password hash to set.
     */
    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    /**
     * Gets the role of the user.
     * 
     * @return The user role.
     */
    public String getRole() {
        return role;
    }

    /**
     * Sets the role of the user.
     * 
     * @param role The role to set.
     */
    public void setRole(String role) {
        this.role = role;
    }

    /**
     * Checks if the user account is active.
     * 
     * @return True if active, false otherwise.
     */
    public boolean isActive() {
        return isActive;
    }

    /**
     * Sets the active status of the user account.
     * 
     * @param active Active status to set.
     */
    public void setActive(boolean active) {
        isActive = active;
    }

}
