package nearfix.nearfix.dao.impl;

import nearfix.nearfix.dao.idao.IRepairRequestDAO;
import nearfix.nearfix.model.RepairRequest;
import nearfix.nearfix.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class RepairRequestDAO implements IRepairRequestDAO {

    @Override
    public int createRequest(RepairRequest request) throws SQLException {
        String sql = "INSERT INTO repair_requests (user_id, category_id, item_name, description, urgency, location, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1, request.getUserId());
            pstmt.setInt(2, request.getCategoryId());
            pstmt.setString(3, request.getItemName());
            pstmt.setString(4, request.getDescription());
            pstmt.setString(5, request.getUrgency());
            pstmt.setString(6, request.getLocation());
            pstmt.setString(7, request.getStatus());

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return -1;
    }

    @Override
    public RepairRequest getRequestById(int requestId) throws SQLException {
        String sql = "SELECT rr.*, c.name as category_name, u.name as user_name, ru.name as repairer_name " +
                "FROM repair_requests rr " +
                "JOIN categories c ON rr.category_id = c.category_id " +
                "JOIN users u ON rr.user_id = u.user_id " +
                "LEFT JOIN users ru ON rr.repairer_id = ru.user_id " +
                "WHERE rr.request_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, requestId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToRequest(rs);
            }
        }
        return null;
    }

    @Override
    public List<RepairRequest> getRequestsByUserId(int userId) throws SQLException {
        List<RepairRequest> requests = new ArrayList<>();
        String sql = "SELECT rr.*, c.name as category_name, u.name as user_name, ru.name as repairer_name FROM repair_requests rr JOIN categories c ON rr.category_id = c.category_id JOIN users u ON rr.user_id = u.user_id LEFT JOIN users ru ON rr.repairer_id = ru.user_id WHERE rr.user_id = ? ORDER BY rr.created_at DESC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                requests.add(mapResultSetToRequest(rs));
            }
        }
        return requests;
    }

    @Override
    public List<RepairRequest> getPendingRequests(int page, int pageSize) throws SQLException {
        List<RepairRequest> requests = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String sql = "SELECT rr.*, c.name as category_name, u.name as user_name, ru.name as repairer_name FROM repair_requests rr JOIN categories c ON rr.category_id = c.category_id JOIN users u ON rr.user_id = u.user_id LEFT JOIN users ru ON rr.repairer_id = ru.user_id WHERE rr.status = 'PENDING' ORDER BY rr.urgency DESC, rr.created_at DESC LIMIT ? OFFSET ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, pageSize);
            pstmt.setInt(2, offset);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                requests.add(mapResultSetToRequest(rs));
            }
        }
        return requests;
    }

    @Override
    public List<RepairRequest> getPendingRequestsByCategory(int categoryId, int page, int pageSize)
            throws SQLException {
        List<RepairRequest> requests = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String sql = "SELECT rr.*, c.name as category_name, u.name as user_name, ru.name as repairer_name FROM repair_requests rr JOIN categories c ON rr.category_id = c.category_id JOIN users u ON rr.user_id = u.user_id LEFT JOIN users ru ON rr.repairer_id = ru.user_id WHERE rr.status = 'PENDING' AND rr.category_id = ? ORDER BY rr.urgency DESC, rr.created_at DESC LIMIT ? OFFSET ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, categoryId);
            pstmt.setInt(2, pageSize);
            pstmt.setInt(3, offset);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                requests.add(mapResultSetToRequest(rs));
            }
        }
        return requests;
    }

    @Override
    public List<RepairRequest> getRequestsByRepairerId(int repairerId) throws SQLException {
        List<RepairRequest> requests = new ArrayList<>();
        String sql = "SELECT rr.*, c.name as category_name, u.name as user_name, ru.name as repairer_name FROM repair_requests rr JOIN categories c ON rr.category_id = c.category_id JOIN users u ON rr.user_id = u.user_id LEFT JOIN users ru ON rr.repairer_id = ru.user_id WHERE rr.repairer_id = ? ORDER BY rr.updated_at DESC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, repairerId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                requests.add(mapResultSetToRequest(rs));
            }
        }
        return requests;
    }

    @Override
    public List<RepairRequest> getAllRequests(int page, int pageSize) throws SQLException {
        List<RepairRequest> requests = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String sql = "SELECT rr.*, c.name as category_name, u.name as user_name, ru.name as repairer_name FROM repair_requests rr JOIN categories c ON rr.category_id = c.category_id JOIN users u ON rr.user_id = u.user_id LEFT JOIN users ru ON rr.repairer_id = ru.user_id ORDER BY rr.created_at DESC LIMIT ? OFFSET ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, pageSize);
            pstmt.setInt(2, offset);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                requests.add(mapResultSetToRequest(rs));
            }
        }
        return requests;
    }

    @Override
    public boolean acceptRequest(int requestId, int repairerId) throws SQLException {
        String sql = "UPDATE repair_requests SET repairer_id = ?, status = 'ACCEPTED' WHERE request_id = ? AND status = 'PENDING'";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, repairerId);
            pstmt.setInt(2, requestId);

            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public boolean updateStatus(int requestId, String newStatus) throws SQLException {
        String sql = "UPDATE repair_requests SET status = ?, updated_at = CURRENT_TIMESTAMP WHERE request_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, newStatus);
            pstmt.setInt(2, requestId);

            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public boolean updateRequest(RepairRequest request) throws SQLException {
        String sql = "UPDATE repair_requests SET item_name = ?, description = ?, urgency = ?, category_id = ?, location = ? WHERE request_id = ? AND status = 'PENDING'";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, request.getItemName());
            pstmt.setString(2, request.getDescription());
            pstmt.setString(3, request.getUrgency());
            pstmt.setInt(4, request.getCategoryId());
            pstmt.setString(5, request.getLocation());
            pstmt.setInt(6, request.getRequestId());

            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public boolean cancelRequest(int requestId) throws SQLException {
        String sql = "UPDATE repair_requests SET status = 'CANCELLED' WHERE request_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, requestId);
            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public boolean deleteRequest(int requestId) throws SQLException {
        String sql = "DELETE FROM repair_requests WHERE request_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, requestId);
            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public int getTotalCompletedRepairs() throws SQLException {
        String sql = "SELECT COUNT(*) as count FROM repair_requests WHERE status = 'COMPLETED'";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        }
        return 0;
    }

    @Override
    public int getTotalRequests() throws SQLException {
        String sql = "SELECT COUNT(*) as count FROM repair_requests";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        }
        return 0;
    }

    @Override
    public List<RepairRequest> searchPendingRequests(String keyword, Integer categoryId, int page, int pageSize)
            throws SQLException {
        List<RepairRequest> requests = new ArrayList<>();
        int offset = (page - 1) * pageSize;

        // We use a single SQL string with OR logic to handle "All Categories" or "No
        // Search" cases.
        // This is easier for beginners to read than building the string dynamically.
        String sql = "SELECT rr.*, c.name as category_name, u.name as user_name, ru.name as repairer_name " +
                "FROM repair_requests rr " +
                "JOIN categories c ON rr.category_id = c.category_id " +
                "JOIN users u ON rr.user_id = u.user_id " +
                "LEFT JOIN users ru ON rr.repairer_id = ru.user_id " +
                "WHERE rr.status = 'PENDING' " +
                "AND (rr.category_id = ? OR ? = 0) " + // If categoryId is 0, this filter is ignored
                "AND (rr.item_name LIKE ? OR rr.description LIKE ? OR ? = '') " + // If search is empty, this is ignored
                "ORDER BY rr.urgency DESC, rr.created_at DESC LIMIT ? OFFSET ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // If categoryId is null, we treat it as 0 (show all)
            int catId = (categoryId != null) ? categoryId : 0;
            String search = (keyword != null) ? "%" + keyword.trim() + "%" : "%%";
            String rawSearch = (keyword != null) ? keyword.trim() : "";

            pstmt.setInt(1, catId);
            pstmt.setInt(2, catId);
            pstmt.setString(3, search);
            pstmt.setString(4, search);
            pstmt.setString(5, rawSearch);
            pstmt.setInt(6, pageSize);
            pstmt.setInt(7, offset);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                requests.add(mapResultSetToRequest(rs));
            }
        }
        return requests;
    }

    @Override
    public List<RepairRequest> searchAllRequests(String keyword, Integer categoryId, String status, int page,
            int pageSize) throws SQLException {
        List<RepairRequest> requests = new ArrayList<>();
        int offset = (page - 1) * pageSize;

        String sql = "SELECT rr.*, c.name as category_name, u.name as user_name, ru.name as repairer_name " +
                "FROM repair_requests rr " +
                "JOIN categories c ON rr.category_id = c.category_id " +
                "JOIN users u ON rr.user_id = u.user_id " +
                "LEFT JOIN users ru ON rr.repairer_id = ru.user_id " +
                "WHERE (rr.category_id = ? OR ? = 0) " +
                "AND (rr.status = ? OR ? = '') " +
                "AND (rr.item_name LIKE ? OR rr.description LIKE ? OR ? = '') " +
                "ORDER BY rr.created_at DESC LIMIT ? OFFSET ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            int catId = (categoryId != null) ? categoryId : 0;
            String stat = (status != null) ? status : "";
            String search = (keyword != null) ? "%" + keyword.trim() + "%" : "%%";
            String rawSearch = (keyword != null) ? keyword.trim() : "";

            pstmt.setInt(1, catId);
            pstmt.setInt(2, catId);
            pstmt.setString(3, stat);
            pstmt.setString(4, stat);
            pstmt.setString(5, search);
            pstmt.setString(6, search);
            pstmt.setString(7, rawSearch);
            pstmt.setInt(8, pageSize);
            pstmt.setInt(9, offset);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                requests.add(mapResultSetToRequest(rs));
            }
        }
        return requests;
    }

    @Override
    public int getTotalRequestsCount(String keyword, Integer categoryId, String status) throws SQLException {
        String sql = "SELECT COUNT(*) as count FROM repair_requests rr " +
                "WHERE (rr.category_id = ? OR ? = 0) " +
                "AND (rr.status = ? OR ? = '') " +
                "AND (rr.item_name LIKE ? OR rr.description LIKE ? OR ? = '')";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            int catId = (categoryId != null) ? categoryId : 0;
            String stat = (status != null) ? status : "";
            String search = (keyword != null) ? "%" + keyword.trim() + "%" : "%%";
            String rawSearch = (keyword != null) ? keyword.trim() : "";

            pstmt.setInt(1, catId);
            pstmt.setInt(2, catId);
            pstmt.setString(3, stat);
            pstmt.setString(4, stat);
            pstmt.setString(5, search);
            pstmt.setString(6, search);
            pstmt.setString(7, rawSearch);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        }
        return 0;
    }

    @Override
    public List<RepairRequest> searchRepairerRequests(int repairerId, String keyword, String status)
            throws SQLException {
        List<RepairRequest> requests = new ArrayList<>();
        String sql = "SELECT rr.*, c.name as category_name, u.name as user_name, ru.name as repairer_name " +
                "FROM repair_requests rr " +
                "JOIN categories c ON rr.category_id = c.category_id " +
                "JOIN users u ON rr.user_id = u.user_id " +
                "LEFT JOIN users ru ON rr.repairer_id = ru.user_id " +
                "WHERE rr.repairer_id = ? " +
                "AND (rr.status = ? OR ? = '') " +
                "AND (rr.item_name LIKE ? OR rr.description LIKE ? OR ? = '') " +
                "ORDER BY rr.updated_at DESC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            String stat = (status != null) ? status : "";
            String search = (keyword != null) ? "%" + keyword.trim() + "%" : "%%";
            String rawSearch = (keyword != null) ? keyword.trim() : "";

            pstmt.setInt(1, repairerId);
            pstmt.setString(2, stat);
            pstmt.setString(3, stat);
            pstmt.setString(4, search);
            pstmt.setString(5, search);
            pstmt.setString(6, rawSearch);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                requests.add(mapResultSetToRequest(rs));
            }
        }
        return requests;
    }

    @Override
    public List<RepairRequest> searchUserRequests(int userId, String keyword, String status) throws SQLException {
        List<RepairRequest> requests = new ArrayList<>();
        String sql = "SELECT rr.*, c.name as category_name, u.name as user_name, ru.name as repairer_name " +
                "FROM repair_requests rr " +
                "JOIN categories c ON rr.category_id = c.category_id " +
                "JOIN users u ON rr.user_id = u.user_id " +
                "LEFT JOIN users ru ON rr.repairer_id = ru.user_id " +
                "WHERE rr.user_id = ? " +
                "AND (rr.status = ? OR ? = '') " +
                "AND (rr.item_name LIKE ? OR rr.description LIKE ? OR ? = '') " +
                "ORDER BY rr.created_at DESC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            String stat = (status != null) ? status : "";
            String search = (keyword != null) ? "%" + keyword.trim() + "%" : "%%";
            String rawSearch = (keyword != null) ? keyword.trim() : "";

            pstmt.setInt(1, userId);
            pstmt.setString(2, stat);
            pstmt.setString(3, stat);
            pstmt.setString(4, search);
            pstmt.setString(5, search);
            pstmt.setString(6, rawSearch);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                requests.add(mapResultSetToRequest(rs));
            }
        }
        return requests;
    }

    @Override
    public int getUserCompletedRequestsCount(int userId) throws SQLException {
        String sql = "SELECT COUNT(*) as count FROM repair_requests WHERE user_id = ? AND status = 'COMPLETED'";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        }
        return 0;
    }

    @Override
    public int getUserTotalRequestsCount(int userId) throws SQLException {
        String sql = "SELECT COUNT(*) as count FROM repair_requests WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        }
        return 0;
    }

    private RepairRequest mapResultSetToRequest(ResultSet rs) throws SQLException {
        RepairRequest request = new RepairRequest();
        request.setRequestId(rs.getInt("request_id"));
        request.setUserId(rs.getInt("user_id"));
        request.setUserName(rs.getString("user_name"));
        request.setCategoryId(rs.getInt("category_id"));
        request.setCategoryName(rs.getString("category_name"));
        if (rs.getObject("repairer_id") != null) {
            request.setRepairerId(rs.getInt("repairer_id"));
            request.setRepairerName(rs.getString("repairer_name"));
        }
        request.setItemName(rs.getString("item_name"));
        request.setDescription(rs.getString("description"));
        request.setUrgency(rs.getString("urgency"));
        request.setLocation(rs.getString("location"));
        request.setStatus(rs.getString("status"));
        request.setCreatedAt(rs.getTimestamp("created_at"));
        request.setUpdatedAt(rs.getTimestamp("updated_at"));
        return request;
    }

    @Override
    public Map<String, Integer> getJobsByCategoryCount() throws SQLException {
        Map<String, Integer> counts = new LinkedHashMap<>();
        String sql = "SELECT c.name, COUNT(rr.request_id) as count " +
                "FROM categories c " +
                "LEFT JOIN repair_requests rr ON c.category_id = rr.category_id " +
                "GROUP BY c.name " +
                "ORDER BY count DESC";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                counts.put(rs.getString("name"), rs.getInt("count"));
            }
        }
        return counts;
    }

    @Override
    public Map<String, Integer> getMonthlyRequestsTrend() throws SQLException {
        Map<String, Integer> trend = new LinkedHashMap<>();

        // This query gets the name of the month and count of requests
        // We look at requests from the last 6 months
        String sql = "SELECT DATE_FORMAT(created_at, '%M') as month_name, COUNT(*) as request_count " +
                "FROM repair_requests " +
                "WHERE created_at >= DATE_SUB(NOW(), INTERVAL 6 MONTH) " +
                "GROUP BY month_name, MONTH(created_at) " +
                "ORDER BY MONTH(created_at) ASC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String month = rs.getString("month_name");
                int count = rs.getInt("request_count");
                trend.put(month, count);
            }
        }
        return trend;
    }

    @Override
    public double getAverageRepairTime() throws SQLException {
        // We calculate the difference in days between when a request was created and
        // when it was finished
        // DATEDIFF is an easy way to get the number of days between two dates
        String sql = "SELECT AVG(DATEDIFF(updated_at, created_at)) as avg_days " +
                "FROM repair_requests " +
                "WHERE status = 'COMPLETED'";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getDouble("avg_days");
            }
        }
        return 0.0;
    }

    @Override
    public Map<String, Integer> getRequestsByStatusCount() throws SQLException {
        Map<String, Integer> counts = new LinkedHashMap<>();

        // Simple GROUP BY to see how many requests are in each status (PENDING,
        // COMPLETED, etc.)
        String sql = "SELECT status, COUNT(*) as status_count FROM repair_requests GROUP BY status";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                counts.put(rs.getString("status"), rs.getInt("status_count"));
            }
        }
        return counts;
    }
}
