package nearfix.nearfix.dao.impl;

import nearfix.nearfix.model.SavedJob;
import nearfix.nearfix.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Data Access Object for SavedJob entities.
 * Handles operations for repairers to save and unsave jobs.
 */
public class SavedJobDAO {

    /**
     * Saves a job for a specific repairer.
     * @param repairerId The ID of the repairer.
     * @param requestId The ID of the repair request.
     * @return True if successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    public boolean saveJob(int repairerId, int requestId) throws SQLException {
        String sql = "INSERT INTO saved_jobs (repairer_id, request_id) VALUES (?, ?) ON DUPLICATE KEY UPDATE saved_at = CURRENT_TIMESTAMP";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, repairerId);
            pstmt.setInt(2, requestId);

            return pstmt.executeUpdate() > 0;
        }
    }

    /**
     * Removes a saved job for a specific repairer.
     * @param repairerId The ID of the repairer.
     * @param requestId The ID of the repair request.
     * @return True if successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    public boolean unsaveJob(int repairerId, int requestId) throws SQLException {
        String sql = "DELETE FROM saved_jobs WHERE repairer_id = ? AND request_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, repairerId);
            pstmt.setInt(2, requestId);

            return pstmt.executeUpdate() > 0;
        }
    }

    /**
     * Retrieves all jobs saved by a specific repairer.
     * @param repairerId The ID of the repairer.
     * @return List of SavedJob objects.
     * @throws SQLException if a database access error occurs.
     */
    public List<SavedJob> getSavedJobsByRepairer(int repairerId) throws SQLException {
        List<SavedJob> savedJobs = new ArrayList<>();
        String sql = "SELECT sj.*, rr.item_name, rr.urgency, c.name as category_name " +
                 "FROM saved_jobs sj " +
                 "JOIN repair_requests rr ON sj.request_id = rr.request_id " +
                 "JOIN categories c ON rr.category_id = c.category_id " +
                 "WHERE sj.repairer_id = ? ORDER BY sj.saved_at DESC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, repairerId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                savedJobs.add(mapResultSetToSavedJob(rs));
            }
        }
        return savedJobs;
    }

    /**
     * Checks if a job is already saved by a specific repairer.
     * @param repairerId The ID of the repairer.
     * @param requestId The ID of the repair request.
     * @return True if saved, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    public boolean isJobSaved(int repairerId, int requestId) throws SQLException {
        String sql = "SELECT 1 FROM saved_jobs WHERE repairer_id = ? AND request_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, repairerId);
            pstmt.setInt(2, requestId);
            ResultSet rs = pstmt.executeQuery();
            return rs.next();
        }
    }

    /**
     * Maps a single row from the ResultSet to a SavedJob object.
     * @param rs ResultSet containing saved job data.
     * @return A populated SavedJob object.
     * @throws SQLException if a database access error occurs.
     */
    private SavedJob mapResultSetToSavedJob(ResultSet rs) throws SQLException {
        SavedJob sj = new SavedJob();
        sj.setSaveId(rs.getInt("save_id"));
        sj.setRepairerId(rs.getInt("repairer_id"));
        sj.setRequestId(rs.getInt("request_id"));
        sj.setSavedAt(rs.getTimestamp("saved_at"));
        sj.setItemName(rs.getString("item_name"));
        sj.setCategoryName(rs.getString("category_name"));
        sj.setUrgency(rs.getString("urgency"));
        return sj;
    }
}

