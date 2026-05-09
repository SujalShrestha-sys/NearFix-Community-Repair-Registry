package nearfix.nearfix.dao.impl;

import nearfix.nearfix.dao.idao.IRepairerDAO;
import nearfix.nearfix.model.Repairer;
import nearfix.nearfix.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Implementation of IRepairerDAO using JDBC.
 * Manages database operations specifically for repairer profiles.
 */
public class RepairerDAO implements IRepairerDAO {

    @Override
    public boolean createRepairer(Repairer repairer) throws SQLException {
        CategoryDAO categoryDAO = new CategoryDAO();
        int categoryId = categoryDAO.getCategoryIdByName(repairer.getSpecialization());

        if (categoryId <= 0) {
            throw new SQLException("Invalid or missing skill category: " + repairer.getSpecialization() + 
                ". Please ensure categories are properly seeded in the database.");
        }

        String sql = "INSERT INTO repairer_profiles (user_id, skill_category, experience_years, bio, service_area, approval_status) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, repairer.getUserId());
            pstmt.setInt(2, categoryId);
            pstmt.setInt(3, repairer.getYearsOfExperience());
            pstmt.setString(4, repairer.getExpertise());
            pstmt.setString(5, repairer.getServiceArea());
            pstmt.setString(6, "PENDING"); // Default status

            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public Repairer getRepairerById(int repairerId) throws SQLException {
        String sql = "SELECT r.*, u.*, c.name as category_name FROM repairer_profiles r " +
                "JOIN users u ON r.user_id = u.user_id " +
                "JOIN categories c ON r.skill_category = c.category_id " +
                "WHERE r.user_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, repairerId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToRepairer(rs);
            }
        }
        return null;
    }

    @Override
    public Repairer getRepairerByEmail(String email) throws SQLException {
        String sql = "SELECT r.*, u.*, c.name as category_name FROM repairer_profiles r " +
                "JOIN users u ON r.user_id = u.user_id " +
                "JOIN categories c ON r.skill_category = c.category_id " +
                "WHERE u.email = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToRepairer(rs);
            }
        }
        return null;
    }

    @Override
    public List<Repairer> getRepairersBySpecialization(String specialization) throws SQLException {
        List<Repairer> repairers = new ArrayList<>();
        String sql = "SELECT r.*, u.*, c.name as category_name FROM repairer_profiles r " +
                "JOIN users u ON r.user_id = u.user_id " +
                "JOIN categories c ON r.skill_category = c.category_id " +
                "WHERE c.name = ? AND r.approval_status = 'APPROVED' ORDER BY r.average_rating DESC";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, specialization);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                repairers.add(mapResultSetToRepairer(rs));
            }
        }
        return repairers;
    }

    @Override
    public List<Repairer> getVerifiedRepairers(int page, int pageSize) throws SQLException {
        List<Repairer> repairers = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String sql = "SELECT r.*, u.*, c.name as category_name FROM repairer_profiles r " +
                "JOIN users u ON r.user_id = u.user_id " +
                "JOIN categories c ON r.skill_category = c.category_id " +
                "WHERE r.approval_status = 'APPROVED' ORDER BY r.average_rating DESC LIMIT ? OFFSET ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, pageSize);
            pstmt.setInt(2, offset);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                repairers.add(mapResultSetToRepairer(rs));
            }
        }
        return repairers;
    }

    @Override
    public boolean updateRepairer(Repairer repairer) throws SQLException {
        CategoryDAO categoryDAO = new CategoryDAO();
        int categoryId = categoryDAO.getCategoryIdByName(repairer.getSpecialization());

        String sql = "UPDATE repairer_profiles SET skill_category = ?, bio = ?, experience_years = ?, service_area = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, categoryId);
            pstmt.setString(2, repairer.getExpertise());
            pstmt.setInt(3, repairer.getYearsOfExperience());
            pstmt.setString(4, repairer.getServiceArea());
            pstmt.setInt(5, repairer.getUserId());

            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public boolean updateRepairerRating(int repairerId, double newRating) throws SQLException {
        String sql = "UPDATE repairer_profiles SET average_rating = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setDouble(1, newRating);
            pstmt.setInt(2, repairerId);

            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public boolean updateJobsCompleted(int repairerId, int count) throws SQLException {
        String sql = "UPDATE repairer_profiles SET total_jobs_completed = total_jobs_completed + ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, count);
            pstmt.setInt(2, repairerId);

            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public boolean verifyRepairer(int repairerId) throws SQLException {
        String sql = "UPDATE repairer_profiles SET approval_status = 'APPROVED' WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, repairerId);
            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public List<Repairer> searchRepairers(String keyword) throws SQLException {
        List<Repairer> repairers = new ArrayList<>();
        String sql = "SELECT r.*, u.*, c.name as category_name FROM repairer_profiles r " +
                "JOIN users u ON r.user_id = u.user_id " +
                "JOIN categories c ON r.skill_category = c.category_id " +
                "WHERE (u.name LIKE ? OR c.name LIKE ? OR r.bio LIKE ? OR r.service_area LIKE ?) " +
                "AND r.approval_status = 'APPROVED' ORDER BY r.average_rating DESC";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            String search = "%" + keyword + "%";
            pstmt.setString(1, search);
            pstmt.setString(2, search);
            pstmt.setString(3, search);
            pstmt.setString(4, search);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                repairers.add(mapResultSetToRepairer(rs));
            }
        }
        return repairers;
    }

    @Override
    public int getTotalRepairers() throws SQLException {
        String sql = "SELECT COUNT(*) as count FROM repairer_profiles";
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
    public int getTotalVerifiedRepairers() throws SQLException {
        String sql = "SELECT COUNT(*) as count FROM repairer_profiles WHERE approval_status = 'APPROVED'";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        }
        return 0;
    }

    private Repairer mapResultSetToRepairer(ResultSet rs) throws SQLException {
        Repairer r = new Repairer();
        r.setUserId(rs.getInt("user_id"));
        r.setName(rs.getString("name"));
        r.setEmail(rs.getString("email"));
        r.setPhone(rs.getString("phone"));
        r.setPasswordHash(rs.getString("password_hash"));
        r.setRole(rs.getString("role"));
        r.setActive(rs.getBoolean("is_active"));
        r.setSpecialization(rs.getString("category_name"));
        r.setExpertise(rs.getString("bio"));
        r.setYearsOfExperience(rs.getInt("experience_years"));
        r.setRating(rs.getDouble("average_rating"));
        r.setServiceArea(rs.getString("service_area"));
        r.setJoinDate(rs.getTimestamp("created_at"));
        r.setApprovalStatus(rs.getString("approval_status"));
        return r;
    }
}
