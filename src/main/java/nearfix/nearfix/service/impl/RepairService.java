package nearfix.nearfix.service.impl;

import nearfix.nearfix.dao.idao.IRepairRequestDAO;
import nearfix.nearfix.dao.impl.RepairRequestDAO;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.RepairRequest;
import nearfix.nearfix.service.iservice.IRepairService;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

/**
 * RepairService - Business logic for repair requests.
 * Validates user input before delegating to the DAO layer.
 * FLOW: Servlet → RepairService → RepairRequestDAO → Database
 */
public class RepairService implements IRepairService {

    private static final Logger logger = Logger.getLogger(RepairService.class.getName());

    private final IRepairRequestDAO repairRequestDAO = new RepairRequestDAO();

    /**
     * Creates a new repair request after validating the input.
     *
     * @return the generated request ID, or -1 if creation failed
     */
    @Override
    public int postRepairRequest(int userId, int categoryId, String itemName, String description, String urgency)
            throws ValidationException, SQLException {

        // Validate required fields
        if (itemName == null || itemName.trim().isEmpty()) {
            throw new ValidationException("Item name is required.");
        }
        if (description == null || description.trim().isEmpty()) {
            throw new ValidationException("Description is required.");
        }

        // Build the request object
        RepairRequest request = new RepairRequest();
        request.setUserId(userId);
        request.setCategoryId(categoryId);
        request.setItemName(itemName);
        request.setDescription(description);
        request.setUrgency(urgency);
        request.setStatus("PENDING");

        int requestId = repairRequestDAO.createRequest(request);
        logger.info("Repair request created: ID " + requestId + " by user " + userId);

        return requestId;
    }

    /**
     * Gets a single repair request by its ID.
     */
    @Override
    public RepairRequest getRepairRequest(int requestId) throws SQLException {
        return repairRequestDAO.getRequestById(requestId);
    }

    /**
     * Gets all repair requests submitted by a specific user.
     */
    @Override
    public List<RepairRequest> getUserRequests(int userId) throws SQLException {
        return repairRequestDAO.getRequestsByUserId(userId);
    }

    @Override
    public List<RepairRequest> getPendingRequests(int page, int pageSize) throws SQLException {
        return repairRequestDAO.getPendingRequests(page, pageSize);
    }

    @Override
    public List<RepairRequest> getRepairRequestsByCategoryId(int categoryId, int page, int pageSize)
            throws SQLException {
        return repairRequestDAO.getPendingRequestsByCategory(categoryId, page, pageSize);
    }

    @Override
    public List<RepairRequest> getRequestsByRepairerId(int repairerId) throws SQLException {
        return repairRequestDAO.getRequestsByRepairerId(repairerId);
    }

    @Override
    public List<RepairRequest> getAllRequests(int page, int pageSize) throws SQLException {
        return repairRequestDAO.getAllRequests(page, pageSize);
    }

    @Override
    public boolean acceptRequest(int requestId, int repairerId) throws ValidationException, SQLException {
        RepairRequest request = repairRequestDAO.getRequestById(requestId);

        if (request == null) {
            throw new ValidationException("Request not found.");
        }

        if (!"PENDING".equals(request.getStatus())) {
            throw new ValidationException("This request is no longer available.");
        }

        return repairRequestDAO.acceptRequest(requestId, repairerId);
    }

    /**
     * Updates an existing repair request (only if status is PENDING).
     */
    @Override
    public void updateRequest(RepairRequest request) throws ValidationException, SQLException {
        if (request.getItemName() == null || request.getItemName().trim().isEmpty()) {
            throw new ValidationException("Item name is required.");
        }
        repairRequestDAO.updateRequest(request);
        logger.info("Repair request updated: ID " + request.getRequestId());
    }

    /**
     * Cancels a repair request by setting its status to CANCELLED.
     */
    @Override
    public void cancelRequest(int requestId) throws ValidationException, SQLException {
        repairRequestDAO.cancelRequest(requestId);
        logger.info("Repair request cancelled: ID " + requestId);
    }

    @Override
    public boolean deleteRequest(int requestId) throws SQLException, ValidationException {
        RepairRequest request = repairRequestDAO.getRequestById(requestId);

        if (request == null) {
            throw new ValidationException("Request not found.");
        }

        return repairRequestDAO.deleteRequest(requestId);
    }

    /**
     * Gets the total number of completed repairs across all users.
     */
    @Override
    public int getTotalCompletedRepairs() throws SQLException {
        return repairRequestDAO.getTotalCompletedRepairs();
    }

    @Override
    public boolean markRequestAsCompleted(int requestId) throws SQLException, ValidationException {
        RepairRequest request = repairRequestDAO.getRequestById(requestId);
        if (request == null) {
            throw new ValidationException("Request not found.");
        }

        boolean success = repairRequestDAO.updateStatus(requestId, "COMPLETED");
        if (success && request.getRepairerId() != null) {
            new nearfix.nearfix.dao.impl.RepairerDAO().updateJobsCompleted(request.getRepairerId(), 1);
        }
        return success;
    }

    @Override
    public int getTotalRequests() throws SQLException {
        return repairRequestDAO.getTotalRequests();
    }

    @Override
    public List<RepairRequest> searchPendingRequests(String keyword, Integer categoryId, int page, int pageSize) throws SQLException {
        return repairRequestDAO.searchPendingRequests(keyword, categoryId, page, pageSize);
    }

    @Override
    public List<RepairRequest> searchAllRequests(String keyword, Integer categoryId, String status, int page, int pageSize) throws SQLException {
        return repairRequestDAO.searchAllRequests(keyword, categoryId, status, page, pageSize);
    }

    @Override
    public int getTotalRequestsCount(String keyword, Integer categoryId, String status) throws SQLException {
        return repairRequestDAO.getTotalRequestsCount(keyword, categoryId, status);
    }

    @Override
    public List<RepairRequest> searchRepairerRequests(int repairerId, String keyword, String status) throws SQLException {
        return repairRequestDAO.searchRepairerRequests(repairerId, keyword, status);
    }

    @Override
    public List<RepairRequest> searchUserRequests(int userId, String keyword, String status) throws SQLException {
        return repairRequestDAO.searchUserRequests(userId, keyword, status);
    }
}