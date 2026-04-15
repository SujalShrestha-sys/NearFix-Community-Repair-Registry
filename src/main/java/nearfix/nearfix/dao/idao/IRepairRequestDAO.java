package nearfix.nearfix.dao.idao;

import nearfix.nearfix.model.RepairRequest;

import java.sql.SQLException;
import java.util.List;

public interface IRepairRequestDAO {

    int createRequest(RepairRequest request) throws SQLException;

    RepairRequest getRequestById(int requestId) throws SQLException;

    List<RepairRequest> getRequestsByUserId(int userId) throws SQLException;

    List<RepairRequest> getPendingRequests(int page, int pageSize) throws SQLException;

    List<RepairRequest> getPendingRequestsByCategory(int categoryId, int page, int pageSize) throws SQLException;

    List<RepairRequest> getRequestsByRepairerId(int repairerId) throws SQLException;

    List<RepairRequest> getAllRequests(int page, int pageSize) throws SQLException;

    boolean acceptRequest(int requestId, int repairerId) throws SQLException;

    boolean updateStatus(int requestId, String newStatus) throws SQLException;

    boolean updateRequest(RepairRequest request) throws SQLException;

    boolean cancelRequest(int requestId) throws SQLException;

    boolean deleteRequest(int requestId) throws SQLException;

    int getTotalCompletedRepairs() throws SQLException;

    int getTotalRequests() throws SQLException;

}
