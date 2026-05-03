package nearfix.nearfix.dao.idao;

import nearfix.nearfix.model.Repairer;

import java.sql.SQLException;
import java.util.List;

/**
 * Interface for Repairer Data Access Object.
 * Manages database operations specifically for repairer profiles.
 */
public interface IRepairerDAO {
    /**
     * Creates a new repairer profile.
     * @param repairer The Repairer object to create.
     * @return True if creation was successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean createRepairer(Repairer repairer) throws SQLException;

    /**
     * Retrieves a repairer profile by ID.
     * @param repairerId The ID of the repairer.
     * @return The Repairer object, or null if not found.
     * @throws SQLException if a database access error occurs.
     */
    Repairer getRepairerById(int repairerId) throws SQLException;

    /**
     * Retrieves a repairer profile by email.
     * @param email The email address of the repairer.
     * @return The Repairer object, or null if not found.
     * @throws SQLException if a database access error occurs.
     */
    Repairer getRepairerByEmail(String email) throws SQLException;

    /**
     * Retrieves all repairers with a specific specialization.
     * @param specialization The specialization to filter by.
     * @return List of matching Repairer objects.
     * @throws SQLException if a database access error occurs.
     */
    List<Repairer> getRepairersBySpecialization(String specialization) throws SQLException;

    /**
     * Retrieves a paginated list of verified repairers.
     * @param page Page number.
     * @param pageSize Records per page.
     * @return List of verified repairers.
     * @throws SQLException if a database access error occurs.
     */
    List<Repairer> getVerifiedRepairers(int page, int pageSize) throws SQLException;

    /**
     * Updates an existing repairer profile.
     * @param repairer The Repairer object with updated info.
     * @return True if successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean updateRepairer(Repairer repairer) throws SQLException;

    /**
     * Updates the average rating of a repairer.
     * @param repairerId The ID of the repairer.
     * @param newRating The new average rating.
     * @return True if successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean updateRepairerRating(int repairerId, double newRating) throws SQLException;

    /**
     * Updates the count of jobs completed by a repairer.
     * @param repairerId The ID of the repairer.
     * @param count The number to add to the total completed jobs.
     * @return True if successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean updateJobsCompleted(int repairerId, int count) throws SQLException;

    /**
     * Marks a repairer as verified.
     * @param repairerId The ID of the repairer to verify.
     * @return True if successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean verifyRepairer(int repairerId) throws SQLException;

    /**
     * Searches for repairers based on a keyword.
     * @param keyword Search keyword.
     * @return List of matching Repairer objects.
     * @throws SQLException if a database access error occurs.
     */
    List<Repairer> searchRepairers(String keyword) throws SQLException;

    /**
     * Gets the total count of all repairers.
     * @return Total count of repairers.
     * @throws SQLException if a database access error occurs.
     */
    int getTotalRepairers() throws SQLException;

    /**
     * Gets the total count of verified repairers.
     * @return Total count of verified repairers.
     * @throws SQLException if a database access error occurs.
     */
    int getTotalVerifiedRepairers() throws SQLException;
}