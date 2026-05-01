package nearfix.nearfix.dao.impl;

import nearfix.nearfix.dao.idao.IRepairerDAO;
import nearfix.nearfix.model.Repairer;
import nearfix.nearfix.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RepairerDAO implements IRepairerDAO {

    @Override
    public boolean createRepairer(Repairer repairer) throws SQLException {
        String sql = "INSERT INTO repairer_profiles (user_id, specialization, expertise, years_of_experience, license_number, verification_status) "
                +
                "VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, repairer.getUserId());
            pstmt.setString(2, repairer.getSpecialization());
            pstmt.setString(3, repairer.getExpertise());
            pstmt.setInt(4, repairer.getYearsOfExperience());
            pstmt.setString(5, repairer.getLicenseNumber());
            pstmt.setBoolean(6, repairer.isVerificationStatus());

            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public Repairer getRepairerById(int repairerId) throws SQLException {
        String sql = "SELECT r.*, u.* FROM repairer_profiles r JOIN users u ON r.user_id = u.user_id WHERE r.user_id = ?";
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
        String sql = "SELECT r.*, u.* FROM repairer_profiles r JOIN users u ON r.user_id = u.user_id WHERE u.email = ?";
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
        List<Repairer> repairer_profiles = new ArrayList<>();
        String sql = "SELECT r.*, u.* FROM repairer_profiles r JOIN users u ON r.user_id = u.user_id " +
                "WHERE r.specialization = ? AND r.verification_status = TRUE ORDER BY r.rating DESC";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, specialization);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                repairer_profiles.add(mapResultSetToRepairer(rs));
            }
        }
        return repairer_profiles;
    }

    @Override
    public List<Repairer> getVerifiedRepairers(int page, int pageSize) throws SQLException {
        List<Repairer> repairer_profiles = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String sql = "SELECT r.*, u.* FROM repairer_profiles r JOIN users u ON r.user_id = u.user_id " +
                "WHERE r.verification_status = TRUE ORDER BY r.rating DESC LIMIT ? OFFSET ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, pageSize);
            pstmt.setInt(2, offset);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                repairer_profiles.add(mapResultSetToRepairer(rs));
            }
        }
        return repairer_profiles;
    }

    @Override
    public boolean updateRepairer(Repairer repairer) throws SQLException {
        String sql = "UPDATE repairer_profiles SET specialization = ?, expertise = ?, years_of_experience = ? WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, repairer.getSpecialization());
            pstmt.setString(2, repairer.getExpertise());
            pstmt.setInt(3, repairer.getYearsOfExperience());
            pstmt.setInt(4, repairer.getUserId());

            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public boolean updateRepairerRating(int repairerId, double newRating) throws SQLException {
        String sql = "UPDATE repairer_profiles SET rating = ? WHERE user_id = ?";
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
        String sql = "UPDATE repairer_profiles SET verification_status = TRUE WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, repairerId);
            return pstmt.executeUpdate() > 0;
        }
    }

    @Override
    public List<Repairer> searchRepairers(String keyword) throws SQLException {
        List<Repairer> repairer_profiles = new ArrayList<>();
        String sql = "SELECT r.*, u.* FROM repairer_profiles r JOIN users u ON r.user_id = u.user_id " +
                "WHERE (u.name LIKE ? OR r.specialization LIKE ? OR r.expertise LIKE ?) " +
                "AND r.verification_status = TRUE ORDER BY r.rating DESC";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            String searchTerm = "%" + keyword + "%";
            pstmt.setString(1, searchTerm);
            pstmt.setString(2, searchTerm);
            pstmt.setString(3, searchTerm);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                repairer_profiles.add(mapResultSetToRepairer(rs));
            }
        }
        return repairer_profiles;
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
        String sql = "SELECT COUNT(*) as count FROM repairer_profiles WHERE verification_status = TRUE";
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
        Repairer repairer = new Repairer();
        repairer.setUserId(rs.getInt("user_id"));
        repairer.setName(rs.getString("name"));
        repairer.setEmail(rs.getString("email"));
        repairer.setPhone(rs.getString("phone"));
        repairer.setPasswordHash(rs.getString("password_hash"));
        repairer.setRole(rs.getString("role"));
        repairer.setActive(rs.getBoolean("is_active"));
        repairer.setSpecialization(rs.getString("specialization"));
        repairer.setExpertise(rs.getString("expertise"));
        repairer.setYearsOfExperience(rs.getInt("years_of_experience"));
        repairer.setRating(rs.getDouble("rating"));
        repairer.setTotalJobsCompleted(rs.getInt("total_jobs_completed"));
        repairer.setJoinDate(rs.getTimestamp("join_date"));
        repairer.setLicenseNumber(rs.getString("license_number"));
        repairer.setVerificationStatus(rs.getBoolean("verification_status"));
        return repairer;
    }
}
