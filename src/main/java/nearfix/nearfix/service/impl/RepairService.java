package nearfix.nearfix.service.impl;

import nearfix.nearfix.dao.impl.RepairRequestDAO;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.RepairRequest;
import nearfix.nearfix.service.iservice.IRepairService;
import nearfix.nearfix.util.Validation;

import java.sql.SQLException;
import java.util.List;

public class RepairService implements IRepairService {

    private RepairRequestDAO repairRequestDAO = new RepairRequestDAO();

    @Override
    public int postRepairRequest(int userId, int categoryId, String itemName,
                                 String description, String urgency)
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
    public int getTotalCompletedRepairs() throws SQLException {
        return repairRequestDAO.getTotalCompletedRepairs();
    }
}
