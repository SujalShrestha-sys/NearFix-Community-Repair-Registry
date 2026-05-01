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
import java.util.logging.Logger;

/**
 * CategoryDAO - Database operations for repair categories.
 * Implements ICategoryDAO interface.
 *
 * Each method:
 * 1. Opens a database connection using DBConnection.
 * 2. Executes a SQL query using PreparedStatement (prevents SQL injection).
 * 3. Auto-closes connection via try-with-resources.
 */
public class CategoryDAO implements ICategoryDAO {

    private static final Logger logger = Logger.getLogger(CategoryDAO.class.getName());

    @Override
    public List<Category> getAllCategories() throws SQLException {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM categories ORDER BY name ASC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                categories.add(mapResultSetToCategory(rs));
            }

            logger.info("Retrieved " + categories.size() + " categories from database");
        }
        return categories;
    }

    @Override
    public Category getCategoryById(int categoryId) throws SQLException {
        String sql = "SELECT * FROM categories WHERE category_id = ?";

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

    @Override
    public boolean createCategory(Category category) throws SQLException {
        String sql = "INSERT INTO categories (name, description) VALUES (?, ?)";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, category.getName());
            pstmt.setString(2, category.getDescription());

            boolean success = pstmt.executeUpdate() > 0;

            if (success) {
                logger.info("Category created: " + category.getName());
            } else {
                logger.warning("Failed to create category: " + category.getName());
            }

            return success;
        }
    }

    @Override
    public boolean updateCategory(Category category) throws SQLException {
        String sql = "UPDATE categories SET name = ?, description = ? WHERE category_id = ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, category.getName());
            pstmt.setString(2, category.getDescription());
            pstmt.setInt(3, category.getCategoryId());

            boolean success = pstmt.executeUpdate() > 0;

            if (success) {
                logger.info("Category updated: ID " + category.getCategoryId());
            } else {
                logger.warning("Failed to update category: ID " + category.getCategoryId());
            }

            return success;
        }
    }

    @Override
    public boolean deleteCategory(int categoryId) throws SQLException {
        String sql = "DELETE FROM categories WHERE category_id = ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, categoryId);

            boolean success = pstmt.executeUpdate() > 0;

            if (success) {
                logger.info("Category deleted: ID " + categoryId);
            } else {
                logger.warning("Failed to delete category: ID " + categoryId);
            }

            return success;
        }
    }

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
     */
    private Category mapResultSetToCategory(ResultSet rs) throws SQLException {
        Category category = new Category();
        category.setCategoryId(rs.getInt("category_id"));
        category.setName(rs.getString("name"));
        category.setDescription(rs.getString("description"));
        return category;
    }
}
