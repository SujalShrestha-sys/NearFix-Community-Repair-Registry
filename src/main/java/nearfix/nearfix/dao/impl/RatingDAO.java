package nearfix.nearfix.dao.impl;

import nearfix.nearfix.dao.idao.IRatingDAO;
import nearfix.nearfix.model.Rating;
import nearfix.nearfix.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Implementation of IRatingDAO using JDBC.
 */
public class RatingDAO implements IRatingDAO {

    /**
     * {@inheritDoc}
     */
    @Override
    public boolean addRating(Rating rating) throws SQLException {
        String sql = "INSERT INTO ratings (request_id, user_id, repairer_id, stars, comment) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, rating.getRequestId());
            pstmt.setInt(2, rating.getUserId());
            pstmt.setInt(3, rating.getRepairerId());
            pstmt.setInt(4, rating.getRatingScore());
            pstmt.setString(5, rating.getComment());

            return pstmt.executeUpdate() > 0;
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Rating> getRatingsByRepairer(int repairerId) throws SQLException {
        List<Rating> ratings = new ArrayList<>();
        String sql = "SELECT r.*, u.name as user_name FROM ratings r JOIN users u ON r.user_id = u.user_id WHERE r.repairer_id = ? ORDER BY r.created_at DESC";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, repairerId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                ratings.add(mapResultSetToRating(rs));
            }
        }
        return ratings;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Rating getRatingByRequest(int requestId) throws SQLException {
        String sql = "SELECT r.*, u.name as user_name FROM ratings r JOIN users u ON r.user_id = u.user_id WHERE r.request_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, requestId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToRating(rs);
            }
        }
        return null;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public double getAverageRating(int repairerId) throws SQLException {
        String sql = "SELECT AVG(stars) as avg_rating FROM ratings WHERE repairer_id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, repairerId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getDouble("avg_rating");
            }
        }
        return 0;
    }

    private Rating mapResultSetToRating(ResultSet rs) throws SQLException {
        Rating rating = new Rating();
        rating.setRatingId(rs.getInt("rating_id"));
        rating.setRequestId(rs.getInt("request_id"));
        rating.setUserId(rs.getInt("user_id"));
        rating.setUserName(rs.getString("user_name"));
        rating.setRepairerId(rs.getInt("repairer_id"));
        rating.setRatingScore(rs.getInt("stars"));
        rating.setComment(rs.getString("comment"));
        rating.setCreatedAt(rs.getTimestamp("created_at"));
        return rating;
    }
}
