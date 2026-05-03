package nearfix.nearfix.dao.idao;

import nearfix.nearfix.model.Rating;
import java.sql.SQLException;
import java.util.List;

/**
 * Interface for Rating Data Access Object.
 * Handles database operations for user ratings and reviews.
 */
public interface IRatingDAO {
    /**
     * Adds a new rating to the database.
     * @param rating The Rating object to add.
     * @return True if addition was successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean addRating(Rating rating) throws SQLException;

    /**
     * Retrieves all ratings for a specific repairer.
     * @param repairerId The ID of the repairer.
     * @return List of Rating objects.
     * @throws SQLException if a database access error occurs.
     */
    List<Rating> getRatingsByRepairer(int repairerId) throws SQLException;

    /**
     * Retrieves a rating for a specific repair request.
     * @param requestId The ID of the repair request.
     * @return The Rating object, or null if not found.
     * @throws SQLException if a database access error occurs.
     */
    Rating getRatingByRequest(int requestId) throws SQLException;

    /**
     * Calculates the average rating score for a specific repairer.
     * @param repairerId The ID of the repairer.
     * @return The average rating score.
     * @throws SQLException if a database access error occurs.
     */
    double getAverageRating(int repairerId) throws SQLException;
}

