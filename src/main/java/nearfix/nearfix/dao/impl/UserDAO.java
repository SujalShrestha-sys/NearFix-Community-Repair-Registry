package nearfix.nearfix.dao.impl;

import nearfix.nearfix.dao.idao.IUserDAO;
import nearfix.nearfix.model.User;
import nearfix.nearfix.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Implementation of IUserDAO using JDBC.
 * Manages core user account operations in the database.
 */
public class UserDAO implements IUserDAO {

    @Override
    public int createUser(User user) throws SQLException {
        String sql = "INSERT INTO users (name, email, phone, password_hash, role, is_active, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPhone());
            pstmt.setString(4, user.getPasswordHash());
            pstmt.setString(5, user.getRole());
            pstmt.setBoolean(6, user.isActive());
            pstmt.setString(7, user.getAddress());

            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int id = generatedKeys.getInt(1);
                        user.setUserId(id);
                        return id;
                    }
                }
            }
            return 0;
        }
    }

    @Override
    public User getUserByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM users WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
        }
        return null;
    }

    @Override
    public User getUserByPhone(String phone) throws SQLException {
        String sql = "SELECT * FROM users WHERE phone = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, phone);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
        }
        return null;
    }

    @Override
    public User getUserById(int userId) throws SQLException {
        String sql = "SELECT * FROM users WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToUser(rs);
            }
        }
        return null;
    }

    @Override
    public List<User> getAllUsers(int page, int pageSize) throws SQLException {
        List<User> users = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String sql = "SELECT * FROM users LIMIT ? OFFSET ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, pageSize);
            pstmt.setInt(2, offset);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                users.add(mapResultSetToUser(rs));
            }
        }
        return users;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        String sql = "UPDATE users SET name = ?, email = ?, phone = ?, address = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPhone());
            pstmt.setString(4, user.getAddress());
            pstmt.setInt(5, user.getUserId());

            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public boolean updatePassword(int userId, String newPasswordHash) throws SQLException {
        String sql = "UPDATE users SET password_hash = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, newPasswordHash);
            pstmt.setInt(2, userId);

            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public boolean deactivateUser(int userId) throws SQLException {
        String sql = "UPDATE users SET is_active = FALSE WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public boolean activateUser(int userId) throws SQLException {
        String sql = "UPDATE users SET is_active = TRUE WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public int getTotalUsers() throws SQLException {
        String sql = "SELECT COUNT(*) as count FROM users";
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
    public List<User> searchUsers(String keyword, String role, int page, int pageSize) throws SQLException {
        List<User> users = new ArrayList<>();
        int offset = (page - 1) * pageSize;

        // Join with repairer_profiles to get verification status
        String sql = "SELECT u.*, rp.verification_status FROM users u " +
                "LEFT JOIN repairer_profiles rp ON u.user_id = rp.user_id " +
                "WHERE (? = '' OR u.role = ?) " +
                "AND (? = '' OR (u.name LIKE ? OR u.email LIKE ? OR u.phone LIKE ?)) " +
                "ORDER BY u.user_id DESC LIMIT ? OFFSET ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            String r = (role != null) ? role : "";
            String rawSearch = (keyword != null) ? keyword : "";
            String searchPattern = (keyword != null && !keyword.isEmpty()) ? "%" + keyword + "%" : "";

            pstmt.setString(1, r);
            pstmt.setString(2, r);
            pstmt.setString(3, rawSearch);
            pstmt.setString(4, searchPattern);
            pstmt.setString(5, searchPattern);
            pstmt.setString(6, searchPattern);
            pstmt.setInt(7, pageSize);
            pstmt.setInt(8, offset);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                User user = mapResultSetToUser(rs);
                // Also set verification status if it exists in the result set
                // rs.getObject checks for null since verification_status might not exist for
                // non-repairers
                Object verified = rs.getObject("verification_status");
                if (verified != null) {
                    if (verified instanceof Number) {
                        user.setVerified(((Number) verified).intValue() == 1);
                    } else {
                        user.setVerified(
                                "VERIFIED".equals(verified.toString()) || "APPROVED".equals(verified.toString()));
                    }
                }
                users.add(user);
            }
        }
        return users;
    }

    @Override
    public int getTotalUsersCount(String keyword, String role) throws SQLException {
        String sql = "SELECT COUNT(*) as count FROM users " +
                "WHERE (? = '' OR role = ?) " +
                "AND (? = '' OR (name LIKE ? OR email LIKE ? OR phone LIKE ?))";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            String r = (role != null) ? role : "";
            String rawSearch = (keyword != null) ? keyword : "";
            String searchPattern = (keyword != null && !keyword.isEmpty()) ? "%" + keyword + "%" : "";

            pstmt.setString(1, r);
            pstmt.setString(2, r);
            pstmt.setString(3, rawSearch);
            pstmt.setString(4, searchPattern);
            pstmt.setString(5, searchPattern);
            pstmt.setString(6, searchPattern);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        }
        return 0;
    }

    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUserId(rs.getInt("user_id"));
        user.setName(rs.getString("name"));
        user.setEmail(rs.getString("email"));
        user.setPhone(rs.getString("phone"));
        user.setPasswordHash(rs.getString("password_hash"));
        user.setRole(rs.getString("role"));
        user.setActive(rs.getBoolean("is_active"));
        user.setAddress(rs.getString("address"));
        return user;
    }
}
