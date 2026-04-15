package nearfix.nearfix.service.iservice;

import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.RepairRequest;

import java.sql.SQLException;
import java.util.List;

public interface IRepairService {

    int postRepairRequest(int userId, int categoryId, String itemName,
                          String description, String urgency)
            throws ValidationException, SQLException;

    RepairRequest getRepairRequest(int requestId) throws SQLException;

    List<RepairRequest> getUserRequests(int userId) throws SQLException;

    void updateRequest(RepairRequest request) throws ValidationException, SQLException;

    void cancelRequest(int requestId) throws ValidationException, SQLException;

    int getTotalCompletedRepairs() throws SQLException;
}
