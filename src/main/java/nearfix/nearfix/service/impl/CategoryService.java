package nearfix.nearfix.service.impl;

import nearfix.nearfix.dao.impl.CategoryDAO;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.Category;
import nearfix.nearfix.service.iservice.ICategoryService;

import java.sql.SQLException;
import java.util.List;
public class CategoryService implements ICategoryService {

    private CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    public List<Category> getAllCategories() throws SQLException {
        return categoryDAO.getAllCategories();
    }

    @Override
    public Category getCategoryById(int categoryId) throws SQLException {
        return categoryDAO.getCategoryById(categoryId);
    }

    @Override
    public boolean createCategory(String name, String description)
            throws ValidationException, SQLException {

        // Validate: name is required
        if (name == null || name.trim().isEmpty()) {
            throw new ValidationException("Category name is required.");
        }

        // Validate: name length
        if (name.length() > 50) {
            throw new ValidationException("Category name cannot exceed 50 characters.");
        }

        // Create and save
        Category category = new Category(name, description);
        return categoryDAO.createCategory(category);
    }

    @Override
    public boolean updateCategory(int categoryId, String name, String description)
            throws ValidationException, SQLException {

        // Check if category exists
        Category category = categoryDAO.getCategoryById(categoryId);
        if (category == null) {
            throw new ValidationException("Category not found.");
        }

        // Validate: name is required
        if (name == null || name.trim().isEmpty()) {
            throw new ValidationException("Category name is required.");
        }

        // Validate: name length
        if (name.length() > 50) {
            throw new ValidationException("Category name cannot exceed 50 characters.");
        }

        // Update and save
        category.setName(name);
        category.setDescription(description);
        return categoryDAO.updateCategory(category);
    }

    @Override
    public boolean deleteCategory(int categoryId) throws ValidationException, SQLException {

        // Check if category exists
        Category category = categoryDAO.getCategoryById(categoryId);
        if (category == null) {
            throw new ValidationException("Category not found.");
        }

        return categoryDAO.deleteCategory(categoryId);
    }

    @Override
    public int getTotalCategories() throws SQLException {
        return categoryDAO.getTotalCategories();
    }
}
