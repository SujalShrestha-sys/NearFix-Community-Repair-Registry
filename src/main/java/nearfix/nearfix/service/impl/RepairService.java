package nearfix.nearfix.service.impl;

import nearfix.nearfix.dao.impl.RepairRequestDAO;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.RepairRequest;
import nearfix.nearfix.service.iservice.IRepairService;

import java.sql.SQLException;
import java.util.List;

public class RepairService implements IRepairService {

    private RepairRequestDAO repairRequestDAO = new RepairRequestDAO();

    @Override
    public int postRepairRequest(int userId, int categoryId, String itemName, String description, String urgency) throws ValidationException, SQLException {

        if (itemName == null || itemName.trim().isEmpty()) {
            throw new ValidationException("Item name is required.");
        }

        if (description == null || description.trim().isEmpty()) {
            throw new ValidationException("Description is required.");
        }

        if (itemName.length() > 100) {
            throw new ValidationException("Item name cannot exceed 100 characters.");
        }

        if (description.length() > 1000) {
            throw new ValidationException("Description cannot exceed 1000 characters.");
        }

        RepairRequest request = new RepairRequest(userId, categoryId, itemName, description, urgency);
        int requestId = repairRequestDAO.createRequest(request);

        if (requestId <= 0) {
            throw new ValidationException("Failed to create repair request.");
        }

        return requestId;
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
    public void updateRequest(RepairRequest request) throws ValidationException, SQLException {
        RepairRequest existing = repairRequestDAO.getRequestById(request.getRequestId());

        if (existing == null) {
            throw new ValidationException("Request not found.");
        }

        if (!existing.getStatus().equals("PENDING")) {
            throw new ValidationException("Can only edit pending requests.");
        }

        repairRequestDAO.updateRequest(request);
    }

    @Override
    public void cancelRequest(int requestId) throws ValidationException, SQLException {
        RepairRequest request = repairRequestDAO.getRequestById(requestId);

        if (request == null) {
            throw new ValidationException("Request not found.");
        }

        repairRequestDAO.cancelRequest(requestId);
    }

    @Override
    public int getTotalCompletedRepairs() throws SQLException {
        return repairRequestDAO.getTotalCompletedRepairs();
    }
}
