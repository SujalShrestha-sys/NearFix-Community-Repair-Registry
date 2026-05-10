package nearfix.nearfix.dao.idao;

import nearfix.nearfix.model.RepairRequest;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * Interface for Repair Request Data Access Object.
 * Manages database operations for repair requests.
 */
public interface IRepairRequestDAO {

    /**
     * Creates a new repair request.
     * @param request The RepairRequest object to create.
     * @return The ID of the created request, or -1 if failed.
     * @throws SQLException if a database access error occurs.
     */
    int createRequest(RepairRequest request) throws SQLException;

    /**
     * Retrieves a repair request by its ID.
     * @param requestId The ID of the request.
     * @return The RepairRequest object, or null if not found.
     * @throws SQLException if a database access error occurs.
     */
    RepairRequest getRequestById(int requestId) throws SQLException;

    /**
     * Retrieves all repair requests made by a specific user.
     * @param userId The ID of the user.
     * @return List of RepairRequest objects.
     * @throws SQLException if a database access error occurs.
     */
    List<RepairRequest> getRequestsByUserId(int userId) throws SQLException;

    /**
     * Retrieves a paginated list of pending repair requests.
     * @param page Page number.
     * @param pageSize Number of records per page.
     * @return List of pending RepairRequest objects.
     * @throws SQLException if a database access error occurs.
     */
    List<RepairRequest> getPendingRequests(int page, int pageSize) throws SQLException;

    /**
     * Retrieves a paginated list of pending repair requests filtered by category.
     * @param categoryId The category ID.
     * @param page Page number.
     * @param pageSize Number of records per page.
     * @return List of filtered pending RepairRequest objects.
     * @throws SQLException if a database access error occurs.
     */
    List<RepairRequest> getPendingRequestsByCategory(int categoryId, int page, int pageSize) throws SQLException;

    /**
     * Retrieves all repair requests assigned to a specific repairer.
     * @param repairerId The ID of the repairer.
     * @return List of RepairRequest objects.
     * @throws SQLException if a database access error occurs.
     */
    List<RepairRequest> getRequestsByRepairerId(int repairerId) throws SQLException;

    /**
     * Retrieves a paginated list of all repair requests.
     * @param page Page number.
     * @param pageSize Number of records per page.
     * @return List of all RepairRequest objects.
     * @throws SQLException if a database access error occurs.
     */
    List<RepairRequest> getAllRequests(int page, int pageSize) throws SQLException;

    /**
     * Updates a request when it is accepted by a repairer.
     * @param requestId The ID of the request.
     * @param repairerId The ID of the repairer who accepted it.
     * @return True if successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean acceptRequest(int requestId, int repairerId) throws SQLException;

    /**
     * Updates the status of a repair request.
     * @param requestId The ID of the request.
     * @param newStatus The new status (e.g., COMPLETED, CANCELLED).
     * @return True if successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean updateStatus(int requestId, String newStatus) throws SQLException;

    /**
     * Updates the details of an existing repair request.
     * @param request The RepairRequest object with updated info.
     * @return True if successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean updateRequest(RepairRequest request) throws SQLException;

    /**
     * Cancels a repair request.
     * @param requestId The ID of the request to cancel.
     * @return True if successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean cancelRequest(int requestId) throws SQLException;

    /**
     * Deletes a repair request from the database.
     * @param requestId The ID of the request to delete.
     * @return True if successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean deleteRequest(int requestId) throws SQLException;

    /**
     * Gets the total count of completed repairs.
     * @return Total count of completed repairs.
     * @throws SQLException if a database access error occurs.
     */
    int getTotalCompletedRepairs() throws SQLException;

    /**
     * Gets the total count of all repair requests.
     * @return Total count of requests.
     * @throws SQLException if a database access error occurs.
     */
    int getTotalRequests() throws SQLException;

    /**
     * Searches for pending requests based on keywords and category.
     * @param keyword Search keyword.
     * @param categoryId Category ID filter.
     * @param page Page number.
     * @param pageSize Records per page.
     * @return List of matching pending requests.
     * @throws SQLException if a database access error occurs.
     */
    List<RepairRequest> searchPendingRequests(String keyword, Integer categoryId, int page, int pageSize) throws SQLException;

    /**
     * Searches through all requests with multiple filters.
     * @param keyword Search keyword.
     * @param categoryId Category ID filter.
     * @param status Status filter.
     * @param page Page number.
     * @param pageSize Records per page.
     * @return List of matching requests.
     * @throws SQLException if a database access error occurs.
     */
    List<RepairRequest> searchAllRequests(String keyword, Integer categoryId, String status, int page, int pageSize) throws SQLException;

    /**
     * Gets the total count of requests matching search criteria.
     * @param keyword Search keyword.
     * @param categoryId Category ID filter.
     * @param status Status filter.
     * @return Total count of matching requests.
     * @throws SQLException if a database access error occurs.
     */
    int getTotalRequestsCount(String keyword, Integer categoryId, String status) throws SQLException;

    /**
     * Searches requests assigned to a specific repairer.
     * @param repairerId The repairer ID.
     * @param keyword Search keyword.
     * @param status Status filter.
     * @return List of matching requests for the repairer.
     * @throws SQLException if a database access error occurs.
     */
    List<RepairRequest> searchRepairerRequests(int repairerId, String keyword, String status) throws SQLException;

    /**
     * Searches requests made by a specific user.
     * @param userId The user ID.
     * @param keyword Search keyword.
     * @param status Status filter.
     * @return List of matching requests for the user.
     * @throws SQLException if a database access error occurs.
     */
    List<RepairRequest> searchUserRequests(int userId, String keyword, String status) throws SQLException;

    /**
     * Gets the total count of completed repairs for a specific user.
     * @param userId The user ID.
     * @return Total count of completed repairs.
     * @throws SQLException if a database access error occurs.
     */
    int getUserCompletedRequestsCount(int userId) throws SQLException;

    /**
     * Gets the total count of all repair requests for a specific user.
     * @param userId The user ID.
     * @return Total count of requests.
     * @throws SQLException if a database access error occurs.
     */
    int getUserTotalRequestsCount(int userId) throws SQLException;
    Map<String, Integer> getJobsByCategoryCount() throws SQLException;
}

