package nearfix.nearfix.service.iservice;

import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.Rating;
import nearfix.nearfix.model.RepairRequest;
import nearfix.nearfix.model.SavedJob;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IRepairService {

        int postRepairRequest(int userId, int categoryId, String itemName, String description, String urgency,
                        String location) throws ValidationException, SQLException;

        RepairRequest getRepairRequest(int requestId) throws SQLException;

        List<RepairRequest> getUserRequests(int userId) throws SQLException;

        void updateRequest(RepairRequest request) throws ValidationException, SQLException;

        void cancelRequest(int requestId) throws ValidationException, SQLException;

        int getTotalCompletedRepairs() throws SQLException;

        int LANDFILL_BASE_SEED = 8235;

        int getPlatformTotalSaved() throws SQLException;

        List<RepairRequest> getPendingRequests(int page, int pageSize) throws SQLException;

        List<RepairRequest> getRepairRequestsByCategoryId(int categoryId, int page, int pageSize) throws SQLException;

        List<RepairRequest> getRequestsByRepairerId(int repairerId) throws SQLException;

        List<RepairRequest> getAllRequests(int page, int pageSize) throws SQLException;

        boolean acceptRequest(int requestId, int repairerId) throws ValidationException, SQLException;

        boolean deleteRequest(int requestId) throws SQLException, ValidationException;

        boolean markRequestAsInProgress(int requestId) throws SQLException, ValidationException;

        boolean markRequestAsCompleted(int requestId) throws SQLException, ValidationException;

        int getTotalRequests() throws SQLException;

        List<RepairRequest> searchPendingRequests(String keyword, Integer categoryId, int page, int pageSize)
                        throws SQLException;

        List<RepairRequest> searchAllRequests(String keyword, Integer categoryId, String status, int page, int pageSize)
                        throws SQLException;

        int getTotalRequestsCount(String keyword, Integer categoryId, String status) throws SQLException;

        List<RepairRequest> searchRepairerRequests(int repairerId, String keyword, String status) throws SQLException;

        List<RepairRequest> searchUserRequests(int userId, String keyword, String status) throws SQLException;

        boolean addRating(int requestId, int userId, int ratingScore, String comment)
                        throws SQLException, ValidationException;

        Rating getRatingByRequest(int requestId) throws SQLException;

        List<Rating> getRatingsByRepairer(int repairerId) throws SQLException;

        boolean toggleSaveJob(int repairerId, int requestId) throws SQLException;

        List<SavedJob> getSavedJobs(int repairerId) throws SQLException;

        boolean isJobSaved(int repairerId, int requestId) throws SQLException;

        Map<String, Integer> getJobsByCategoryCount() throws SQLException;

        Map<String, Integer> getMonthlyRequestsTrend() throws SQLException;

        double getAverageRepairTime() throws SQLException;

        Map<String, Integer> getRequestsByStatusCount() throws SQLException;
}
