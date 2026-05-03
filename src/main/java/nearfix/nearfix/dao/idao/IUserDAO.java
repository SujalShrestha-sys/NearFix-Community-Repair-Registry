package nearfix.nearfix.dao.idao;

import nearfix.nearfix.model.User;

import java.sql.SQLException;
import java.util.List;

/**
 * Interface for User Data Access Object.
 * Manages core user account operations in the database.
 */
public interface IUserDAO {
    /**
     * Creates a new user account.
     * @param user The User object to create.
     * @return The ID of the created user.
     * @throws SQLException if a database access error occurs.
     */
    int createUser(User user) throws SQLException;

    /**
     * Retrieves a user by their email address.
     * @param email The email address.
     * @return The User object, or null if not found.
     * @throws SQLException if a database access error occurs.
     */
    User getUserByEmail(String email) throws SQLException;

    /**
     * Retrieves a user by their phone number.
     * @param phone The phone number.
     * @return The User object, or null if not found.
     * @throws SQLException if a database access error occurs.
     */
    User getUserByPhone(String phone) throws SQLException;

    /**
     * Retrieves a user by their ID.
     * @param userId The ID of the user.
     * @return The User object, or null if not found.
     * @throws SQLException if a database access error occurs.
     */
    User getUserById(int userId) throws SQLException;

    /**
     * Retrieves a paginated list of all users.
     * @param page Page number.
     * @param pageSize Records per page.
     * @return List of User objects.
     * @throws SQLException if a database access error occurs.
     */
    List<User> getAllUsers(int page, int pageSize) throws SQLException;

    /**
     * Updates an existing user's information.
     * @param user The User object with updated info.
     * @return True if successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean updateUser(User user) throws SQLException;

    /**
     * Updates a user's password.
     * @param userId The ID of the user.
     * @param newPasswordHash The new hashed password.
     * @return True if successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean updatePassword(int userId, String newPasswordHash) throws SQLException;

    /**
     * Deactivates a user account.
     * @param userId The ID of the user to deactivate.
     * @return True if successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean deactivateUser(int userId) throws SQLException;

    /**
     * Activates a user account.
     * @param userId The ID of the user to activate.
     * @return True if successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean activateUser(int userId) throws SQLException;

    /**
     * Gets the total count of all users.
     * @return Total count of users.
     * @throws SQLException if a database access error occurs.
     */
    int getTotalUsers() throws SQLException;

    /**
     * Searches for users based on keyword and role.
     * @param keyword Search keyword.
     * @param role Role filter (optional).
     * @param page Page number.
     * @param pageSize Records per page.
     * @return List of matching User objects.
     * @throws SQLException if a database access error occurs.
     */
    List<User> searchUsers(String keyword, String role, int page, int pageSize) throws SQLException;

    /**
     * Gets the total count of users matching search criteria.
     * @param keyword Search keyword.
     * @param role Role filter.
     * @return Total count of matching users.
     * @throws SQLException if a database access error occurs.
     */
    int getTotalUsersCount(String keyword, String role) throws SQLException;
}

