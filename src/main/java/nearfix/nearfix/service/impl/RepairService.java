package nearfix.nearfix.service.impl;

import nearfix.nearfix.dao.impl.RatingDAO;
import nearfix.nearfix.dao.impl.RepairRequestDAO;
import nearfix.nearfix.dao.impl.RepairerDAO;
import nearfix.nearfix.dao.impl.SavedJobDAO;
import nearfix.nearfix.dao.idao.IRatingDAO;
import nearfix.nearfix.dao.idao.IRepairRequestDAO;
import nearfix.nearfix.dao.idao.IRepairerDAO;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.Rating;
import nearfix.nearfix.model.RepairRequest;
import nearfix.nearfix.model.SavedJob;
import nearfix.nearfix.service.iservice.IRepairService;

import java.sql.SQLException;
import java.util.List;

/**
 * RepairService - Business logic for repair requests.
 */
public class RepairService implements IRepairService {

    private final IRepairRequestDAO repairRequestDAO = new RepairRequestDAO();
    private final IRepairerDAO repairerDAO = new RepairerDAO();
    private final IRatingDAO ratingDAO = new RatingDAO();
    private final SavedJobDAO savedJobDAO = new SavedJobDAO();

    @Override
    public int postRepairRequest(int userId, int categoryId, String itemName, String description, String urgency)
            throws ValidationException, SQLException {

        if (itemName == null || itemName.trim().isEmpty()) {
            throw new ValidationException("Item name is required.");
        }
        if (description == null || description.trim().isEmpty()) {
            throw new ValidationException("Description is required.");
        }

        RepairRequest request = new RepairRequest();
        request.setUserId(userId);
        request.setCategoryId(categoryId);
        request.setItemName(itemName);
        request.setDescription(description);
        request.setUrgency(urgency);
        request.setStatus("PENDING");

        return repairRequestDAO.createRequest(request);
    }

    @Override
    public RepairRequest getRepairRequest(int requestId) throws SQLException {
        return repairRequestDAO.getRequestById(requestId);
    }

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

    @Override
    public void updateRequest(RepairRequest request) throws ValidationException, SQLException {
        if (request.getItemName() == null || request.getItemName().trim().isEmpty()) {
            throw new ValidationException("Item name is required.");
        }
        repairRequestDAO.updateRequest(request);
    }

    @Override
    public void cancelRequest(int requestId) throws ValidationException, SQLException {
        repairRequestDAO.cancelRequest(requestId);
    }

    @Override
    public boolean deleteRequest(int requestId) throws SQLException, ValidationException {
        return repairRequestDAO.deleteRequest(requestId);
    }

    @Override
    public int getTotalCompletedRepairs() throws SQLException {
        return repairRequestDAO.getTotalCompletedRepairs();
    }

    @Override
    public boolean markRequestAsCompleted(int requestId) throws SQLException, ValidationException {
        RepairRequest request = repairRequestDAO.getRequestById(requestId);
        if (request == null)
            throw new ValidationException("Request not found.");

        boolean success = repairRequestDAO.updateStatus(requestId, "COMPLETED");

        return success;
    }

    @Override
    public int getTotalRequests() throws SQLException {
        return repairRequestDAO.getTotalRequests();
    }

    @Override
    public List<RepairRequest> searchPendingRequests(String keyword, Integer categoryId, int page, int pageSize)
            throws SQLException {
        return repairRequestDAO.searchPendingRequests(keyword, categoryId, page, pageSize);
    }

    @Override
    public List<RepairRequest> searchAllRequests(String keyword, Integer categoryId, String status, int page,
            int pageSize) throws SQLException {
        return repairRequestDAO.searchAllRequests(keyword, categoryId, status, page, pageSize);
    }

    @Override
    public int getTotalRequestsCount(String keyword, Integer categoryId, String status) throws SQLException {
        return repairRequestDAO.getTotalRequestsCount(keyword, categoryId, status);
    }

    @Override
    public List<RepairRequest> searchRepairerRequests(int repairerId, String keyword, String status)
            throws SQLException {
        return repairRequestDAO.searchRepairerRequests(repairerId, keyword, status);
    }

    @Override
    public List<RepairRequest> searchUserRequests(int userId, String keyword, String status) throws SQLException {
        return repairRequestDAO.searchUserRequests(userId, keyword, status);
    }

    @Override
    public boolean addRating(int requestId, int userId, int ratingScore, String comment)
            throws SQLException, ValidationException {
        RepairRequest request = repairRequestDAO.getRequestById(requestId);
        if (request == null)
            throw new ValidationException("Request not found.");
        if (!"COMPLETED".equals(request.getStatus()))
            throw new ValidationException("Can only rate completed repairs.");

        // --- Create Rating ---
        Rating rating = new Rating();
        rating.setRequestId(requestId);
        rating.setUserId(userId);
        rating.setRepairerId(request.getRepairerId());
        rating.setRatingScore(ratingScore);
        rating.setComment(comment);

        boolean success = ratingDAO.addRating(rating);
        if (success) {
            double avg = ratingDAO.getAverageRating(request.getRepairerId());
            repairerDAO.updateRepairerRating(request.getRepairerId(), avg);
        }
        return success;
    }

    @Override
    public Rating getRatingByRequest(int requestId) throws SQLException {
        return ratingDAO.getRatingByRequest(requestId);
    }

    @Override
    public List<Rating> getRatingsByRepairer(int repairerId) throws SQLException {
        return ratingDAO.getRatingsByRepairer(repairerId);
    }

    @Override
    public boolean toggleSaveJob(int repairerId, int requestId) throws SQLException {
        if (savedJobDAO.isJobSaved(repairerId, requestId)) {
            return savedJobDAO.unsaveJob(repairerId, requestId);
        } else {
            return savedJobDAO.saveJob(repairerId, requestId);
        }
    }

    @Override
    public List<SavedJob> getSavedJobs(int repairerId) throws SQLException {
        return savedJobDAO.getSavedJobsByRepairer(repairerId);
    }

    @Override
    public boolean isJobSaved(int repairerId, int requestId) throws SQLException {
        return savedJobDAO.isJobSaved(repairerId, requestId);
    }
}
