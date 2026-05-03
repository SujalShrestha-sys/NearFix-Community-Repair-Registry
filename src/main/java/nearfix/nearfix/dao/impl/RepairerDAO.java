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
        String sql = "INSERT INTO repairer_profiles (user_id, specialization, expertise, years_of_experience, license_number, verification_status) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, repairer.getUserId());
            pstmt.setString(2, repairer.getSpecialization());
            pstmt.setString(3, repairer.getExpertise());
            pstmt.setInt(4, repairer.getYearsOfExperience());
            pstmt.setString(5, repairer.getLicenseNumber());
            pstmt.setBoolean(6, repairer.isVerified());

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
        List<Repairer> repairers = new ArrayList<>();
        String sql = "SELECT r.*, u.* FROM repairer_profiles r JOIN users u ON r.user_id = u.user_id WHERE r.specialization = ? AND r.verification_status = TRUE ORDER BY r.rating DESC";
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
        String sql = "SELECT r.*, u.* FROM repairer_profiles r JOIN users u ON r.user_id = u.user_id WHERE r.verification_status = TRUE ORDER BY r.rating DESC LIMIT ? OFFSET ?";
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
        List<Repairer> repairers = new ArrayList<>();
        String sql = "SELECT r.*, u.* FROM repairer_profiles r JOIN users u ON r.user_id = u.user_id " +
                "WHERE (u.name LIKE ? OR r.specialization LIKE ? OR r.expertise LIKE ?) " +
                "AND r.verification_status = TRUE ORDER BY r.rating DESC";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            String search = "%" + keyword + "%";
            pstmt.setString(1, search);
            pstmt.setString(2, search);
            pstmt.setString(3, search);
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
        Repairer r = new Repairer();
        r.setUserId(rs.getInt("user_id"));
        r.setName(rs.getString("name"));
        r.setEmail(rs.getString("email"));
        r.setPhone(rs.getString("phone"));
        r.setPasswordHash(rs.getString("password_hash"));
        r.setRole(rs.getString("role"));
        r.setActive(rs.getBoolean("is_active"));
        r.setSpecialization(rs.getString("specialization"));
        r.setExpertise(rs.getString("expertise"));
        r.setYearsOfExperience(rs.getInt("years_of_experience"));
        r.setRating(rs.getDouble("rating"));
        r.setTotalJobsCompleted(rs.getInt("total_jobs_completed"));
        r.setJoinDate(rs.getTimestamp("join_date"));
        r.setLicenseNumber(rs.getString("license_number"));
        r.setVerified(rs.getBoolean("verification_status"));
        return r;
    }
}
