package nearfix.nearfix.service.iservice;

import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.RepairRequest;

import java.sql.SQLException;
import java.util.List;

public interface IRepairService {

    int postRepairRequest(int userId, int categoryId, String itemName, String description, String urgency)
            throws ValidationException, SQLException;

    RepairRequest getRepairRequest(int requestId) throws SQLException;

    List<RepairRequest> getUserRequests(int userId) throws SQLException;

    void updateRequest(RepairRequest request) throws ValidationException, SQLException;

    void cancelRequest(int requestId) throws ValidationException, SQLException;

    int getTotalCompletedRepairs() throws SQLException;

    List<RepairRequest> getPendingRequests(int page, int pageSize) throws SQLException;

    List<RepairRequest> getRepairRequestsByCategoryId(int categoryId, int page, int pageSize) throws SQLException;

    List<RepairRequest> getRequestsByRepairerId(int repairerId) throws SQLException;

    List<RepairRequest> getAllRequests(int page, int pageSize) throws SQLException;

    boolean acceptRequest(int requestId, int repairerId) throws ValidationException, SQLException;

    boolean deleteRequest(int requestId) throws SQLException, ValidationException;

    boolean markRequestAsCompleted(int requestId) throws SQLException, ValidationException;

    int getTotalRequests() throws SQLException;
}
