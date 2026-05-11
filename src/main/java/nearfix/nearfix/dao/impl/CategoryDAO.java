package nearfix.nearfix.dao.impl;

import nearfix.nearfix.dao.idao.ICategoryDAO;
import nearfix.nearfix.model.Category;
import nearfix.nearfix.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Implementation of ICategoryDAO using JDBC.
 * Handles database interactions for Category entities.
 */
public class CategoryDAO implements ICategoryDAO {

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Category> getAllCategories() throws SQLException {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT c.*, " +
                "(SELECT COUNT(*) FROM repairer_profiles WHERE skill_category = c.category_id) as repairer_count, " +
                "(SELECT COUNT(*) FROM repair_requests WHERE category_id = c.category_id) as request_count " +
                "FROM categories c ORDER BY c.name ASC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                categories.add(mapResultSetToCategory(rs));
            }
        }
        return categories;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Category getCategoryById(int categoryId) throws SQLException {
        String sql = "SELECT c.*, " +
                "(SELECT COUNT(*) FROM repairer_profiles WHERE skill_category = c.category_id) as repairer_count, " +
                "(SELECT COUNT(*) FROM repair_requests WHERE category_id = c.category_id) as request_count " +
                "FROM categories c WHERE c.category_id = ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, categoryId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToCategory(rs);
            }
        }
        return null;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Category getCategoryByName(String name) throws SQLException {
        String sql = "SELECT * FROM categories WHERE LOWER(name) = LOWER(?)";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, name);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return mapResultSetToCategory(rs);
            }
        }
        return null;
    }

    /**
     * Gets category ID by name.
     */
    public int getCategoryIdByName(String name) throws SQLException {
        Category cat = getCategoryByName(name);
        return (cat != null) ? cat.getCategoryId() : 0;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public boolean createCategory(Category category) throws SQLException {
        String sql = "INSERT INTO categories (name, description) VALUES (?, ?)";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, category.getName());
            pstmt.setString(2, category.getDescription());

            return pstmt.executeUpdate() > 0;
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public boolean updateCategory(Category category) throws SQLException {
        String sql = "UPDATE categories SET name = ?, description = ? WHERE category_id = ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, category.getName());
            pstmt.setString(2, category.getDescription());
            pstmt.setInt(3, category.getCategoryId());

            return pstmt.executeUpdate() > 0;
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public boolean deleteCategory(int categoryId) throws SQLException {
        String sql = "DELETE FROM categories WHERE category_id = ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, categoryId);

            return pstmt.executeUpdate() > 0;
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int getTotalCategories() throws SQLException {
        String sql = "SELECT COUNT(*) as count FROM categories";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        }
        return 0;
    }

    // Helper Methods

    /**
     * Maps a single row from the ResultSet to a Category object.
     * 
     * @param rs ResultSet containing category data.
     * @return A populated Category object.
     * @throws SQLException if a database access error occurs.
     */
    private Category mapResultSetToCategory(ResultSet rs) throws SQLException {
        Category category = new Category();
        category.setCategoryId(rs.getInt("category_id"));
        category.setName(rs.getString("name"));
        category.setDescription(rs.getString("description"));

        // Check if counts exist in result set (they will if called from
        // getAllCategories)
        try {
            category.setRepairerCount(rs.getInt("repairer_count"));
            category.setRequestCount(rs.getInt("request_count"));
        } catch (SQLException e) {
            // These columns might not exist if called from other methods
        }
        return category;
    }
}
