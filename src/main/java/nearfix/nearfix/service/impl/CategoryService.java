package nearfix.nearfix.service.impl;

import nearfix.nearfix.dao.impl.CategoryDAO;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.Category;
import nearfix.nearfix.service.iservice.ICategoryService;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

/**
 * CategoryService - Business logic for repair categories.
 * Handles validation before calling the DAO layer.
 *
 * FLOW: Servlet → CategoryService → CategoryDAO → Database
 */
public class CategoryService implements ICategoryService {

    private static final Logger logger = Logger.getLogger(CategoryService.class.getName());

    private final CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    public List<Category> getAllCategories() throws SQLException {
        List<Category> categories = categoryDAO.getAllCategories();
        logger.info("CategoryService: Retrieved " + categories.size() + " categories");
        return categories;
    }

    @Override
    public Category getCategoryById(int categoryId) throws SQLException {
        Category category = categoryDAO.getCategoryById(categoryId);

        if (category == null) {
            logger.warning("CategoryService: Category not found with ID " + categoryId);
        }

        return category;
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
        boolean success = categoryDAO.createCategory(category);

        if (success) {
            logger.info("CategoryService: Category created — " + name);
        } else {
            logger.warning("CategoryService: Failed to create category — " + name);
        }

        return success;
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
        boolean success = categoryDAO.updateCategory(category);

        if (success) {
            logger.info("CategoryService: Category updated — ID " + categoryId);
        } else {
            logger.warning("CategoryService: Failed to update category — ID " + categoryId);
        }

        return success;
    }

    @Override
    public boolean deleteCategory(int categoryId) throws ValidationException, SQLException {

        // Check if category exists
        Category category = categoryDAO.getCategoryById(categoryId);
        if (category == null) {
            throw new ValidationException("Category not found.");
        }

        boolean success = categoryDAO.deleteCategory(categoryId);

        if (success) {
            logger.info("CategoryService: Category deleted — ID " + categoryId);
        } else {
            logger.warning("CategoryService: Failed to delete category — ID " + categoryId);
        }

        return success;
    }

    @Override
    public int getTotalCategories() throws SQLException {
        return categoryDAO.getTotalCategories();
    }
}
