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

public class CategoryDAO implements ICategoryDAO {

    @Override
    public List<Category> getAllCategories() throws SQLException {

        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM categories ORDER BY name ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            System.out.println("DEBUG: Executing query - Get all categories");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));
                categories.add(category);
                System.out.println("DEBUG: Found category - " + category.getName());
            }

            System.out.println("DEBUG: Total categories found - " + categories.size());

        }
        return categories;
    }

    @Override
    public Category getCategoryById(int categoryId) throws SQLException {
        String sql = "SELECT * FROM categories WHERE category_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            System.out.println("DEBUG: Executing query - Get category by ID: " + categoryId);
            pstmt.setInt(1, categoryId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));

                System.out.println("DEBUG: Category found - " + category.getName());
                return category;
            } else {
                System.out.println("DEBUG: No category found with ID - " + categoryId);
            }
        }
        return null;
    }

    @Override
    public boolean createCategory(Category category) throws SQLException {
        String sql = "INSERT INTO categories (name, description) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            System.out.println("DEBUG: Executing query - Create category: " + category.getName());
            pstmt.setString(1, category.getName());
            pstmt.setString(2, category.getDescription());

            int rowsAffected = pstmt.executeUpdate();
            boolean success = rowsAffected > 0;

            if (success) {
                System.out.println("DEBUG: Category created successfully - " + category.getName());
            } else {
                System.out.println("DEBUG: Failed to create category");
            }

            return success;
        }
    }

    @Override
    public boolean updateCategory(Category category) throws SQLException {
        String sql = "UPDATE categories SET name = ?, description = ? WHERE category_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            System.out.println("DEBUG: Executing query - Update category ID: " + category.getCategoryId());
            pstmt.setString(1, category.getName());
            pstmt.setString(2, category.getDescription());
            pstmt.setInt(3, category.getCategoryId());

            int rowsAffected = pstmt.executeUpdate();
            boolean success = rowsAffected > 0;

            if (success) {
                System.out.println("DEBUG: Category updated successfully");
            } else {
                System.out.println("DEBUG: Failed to update category");
            }

            return success;

        }
    }

    @Override
    public boolean deleteCategory(int categoryId) throws SQLException {
        String sql = "DELETE FROM categories WHERE category_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            System.out.println("DEBUG: Executing query - Delete category ID: " + categoryId);
            pstmt.setInt(1, categoryId);

            int rowsAffected = pstmt.executeUpdate();
            boolean success = rowsAffected > 0;

            if (success) {
                System.out.println("DEBUG: Category deleted successfully");
            } else {
                System.out.println("DEBUG: Failed to delete category");
            }

            return success;

        }
    }

    @Override
    public int getTotalCategories() throws SQLException {
        String sql = "SELECT COUNT(*) as count FROM categories";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            System.out.println("DEBUG: Executing query - Get total categories");
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int total = rs.getInt("count");
                System.out.println("DEBUG: Total categories - " + total);
                return total;
            }

        }
        return 0;
    }
}
