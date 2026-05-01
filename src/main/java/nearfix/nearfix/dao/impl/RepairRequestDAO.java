package nearfix.nearfix.dao.impl;

import nearfix.nearfix.dao.idao.IRepairRequestDAO;
import nearfix.nearfix.model.RepairRequest;
import nearfix.nearfix.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RepairRequestDAO implements IRepairRequestDAO {

    @Override
    public int createRequest(RepairRequest request) throws SQLException {
        String sql = "INSERT INTO repair_requests (user_id, category_id, item_name, description, urgency, status) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1, request.getUserId());
            pstmt.setInt(2, request.getCategoryId());
            pstmt.setString(3, request.getItemName());
            pstmt.setString(4, request.getDescription());
            pstmt.setString(5, request.getUrgency());
            pstmt.setString(6, request.getStatus());

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
        String sql = "SELECT rr.*, c.name as category_name, u.name as user_name FROM repair_requests rr JOIN categories c ON rr.category_id = c.category_id JOIN users u ON rr.user_id = u.user_id WHERE rr.request_id = ?";
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
        String sql = "SELECT rr.*, c.name as category_name, u.name as user_name FROM repair_requests rr JOIN categories c ON rr.category_id = c.category_id JOIN users u ON rr.user_id = u.user_id WHERE rr.user_id = ? ORDER BY rr.created_at DESC";

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
        String sql = "SELECT rr.*, c.name as category_name, u.name as user_name FROM repair_requests rr JOIN categories c ON rr.category_id = c.category_id JOIN users u ON rr.user_id = u.user_id WHERE rr.status = 'PENDING' ORDER BY rr.urgency DESC, rr.created_at DESC LIMIT ? OFFSET ?";

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
        String sql = "SELECT rr.*, c.name as category_name, u.name as user_name FROM repair_requests rr JOIN categories c ON rr.category_id = c.category_id JOIN users u ON rr.user_id = u.user_id WHERE rr.status = 'PENDING' AND rr.category_id = ? ORDER BY rr.urgency DESC, rr.created_at DESC LIMIT ? OFFSET ?";

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
        String sql = "SELECT rr.*, c.name as category_name, u.name as user_name FROM repair_requests rr JOIN categories c ON rr.category_id = c.category_id JOIN users u ON rr.user_id = u.user_id WHERE rr.repairer_id = ? ORDER BY rr.updated_at DESC";

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
        String sql = "SELECT rr.*, c.name as category_name, u.name as user_name FROM repair_requests rr JOIN categories c ON rr.category_id = c.category_id JOIN users u ON rr.user_id = u.user_id ORDER BY rr.created_at DESC LIMIT ? OFFSET ?";

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
        String sql = "UPDATE repair_requests SET item_name = ?, description = ?, urgency = ? WHERE request_id = ? AND status = 'PENDING'";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, request.getItemName());
            pstmt.setString(2, request.getDescription());
            pstmt.setString(3, request.getUrgency());
            pstmt.setInt(4, request.getRequestId());

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

    private RepairRequest mapResultSetToRequest(ResultSet rs) throws SQLException {
        RepairRequest request = new RepairRequest();
        request.setRequestId(rs.getInt("request_id"));
        request.setUserId(rs.getInt("user_id"));
        request.setUserName(rs.getString("user_name"));
        request.setCategoryId(rs.getInt("category_id"));
        request.setCategoryName(rs.getString("category_name"));
        if (rs.getObject("repairer_id") != null) {
            request.setRepairerId(rs.getInt("repairer_id"));
        }
        request.setItemName(rs.getString("item_name"));
        request.setDescription(rs.getString("description"));
        request.setUrgency(rs.getString("urgency"));
        request.setStatus(rs.getString("status"));
        request.setCreatedAt(rs.getTimestamp("created_at"));
        request.setUpdatedAt(rs.getTimestamp("updated_at"));
        return request;
    }
}
