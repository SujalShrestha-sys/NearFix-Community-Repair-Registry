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

        System.out.println("DEBUG: CategoryService - Getting all categories");
        List<Category> categories = categoryDAO.getAllCategories();
        System.out.println("DEBUG: CategoryService - Retrieved " + categories.size() + " categories");
        return categories;
    }

    @Override
    public Category getCategoryById(int categoryId) throws SQLException {

        System.out.println("DEBUG: CategoryService - Getting category by ID: " + categoryId);

        Category category = categoryDAO.getCategoryById(categoryId);

        if (category == null) {
            System.out.println("DEBUG: CategoryService - Category not found");
        } else {
            System.out.println("DEBUG: CategoryService - Category found: " + category.getName());
        }

        return category;
    }

    @Override
    public boolean createCategory(String name, String description) throws ValidationException, SQLException {

        System.out.println("DEBUG: CategoryService - Creating category: " + name);

        // Validate name
        if (name == null || name.trim().isEmpty()) {
            System.out.println("DEBUG: CategoryService - Category name is empty");
            throw new ValidationException("Category name is required.");
        }

        // Check length
        if (name.length() > 50) {
            System.out.println("DEBUG: CategoryService - Category name too long");
            throw new ValidationException("Category name cannot exceed 50 characters.");
        }

        // Create category object
        Category category = new Category(name, description);

        // Call DAO to create
        boolean success = categoryDAO.createCategory(category);

        if (success) {
            System.out.println("DEBUG: CategoryService - Category created successfully");
        } else {
            System.out.println("DEBUG: CategoryService - Failed to create category");
        }

        return success;
    }

    @Override
    public boolean updateCategory(int categoryId, String name, String description) throws ValidationException, SQLException {

        System.out.println("DEBUG: CategoryService - Updating category ID: " + categoryId);

        // Check if category exists
        Category category = categoryDAO.getCategoryById(categoryId);

        if (category == null) {
            System.out.println("DEBUG: CategoryService - Category not found");
            throw new ValidationException("Category not found.");
        }

        // Validate name
        if (name == null || name.trim().isEmpty()) {
            System.out.println("DEBUG: CategoryService - Category name is empty");
            throw new ValidationException("Category name is required.");
        }

        // Check length
        if (name.length() > 50) {
            System.out.println("DEBUG: CategoryService - Category name too long");
            throw new ValidationException("Category name cannot exceed 50 characters.");
        }

        // Update values
        category.setName(name);
        category.setDescription(description);

        // Call DAO to update
        boolean success = categoryDAO.updateCategory(category);

        if (success) {
            System.out.println("DEBUG: CategoryService - Category updated successfully");
        } else {
            System.out.println("DEBUG: CategoryService - Failed to update category");
        }

        return success;
    }

    @Override
    public boolean deleteCategory(int categoryId) throws ValidationException, SQLException {

        System.out.println("DEBUG: CategoryService - Deleting category ID: " + categoryId);

        // Check if category exists
        Category category = categoryDAO.getCategoryById(categoryId);

        if (category == null) {
            System.out.println("DEBUG: CategoryService - Category not found");
            throw new ValidationException("Category not found.");
        }

        // Call DAO to delete
        boolean success = categoryDAO.deleteCategory(categoryId);

        if (success) {
            System.out.println("DEBUG: CategoryService - Category deleted successfully");
        } else {
            System.out.println("DEBUG: CategoryService - Failed to delete category");
        }

        return success;
    }

    @Override
    public int getTotalCategories() throws SQLException {
        System.out.println("DEBUG: CategoryService - Getting total categories");
        int total = categoryDAO.getTotalCategories();
        System.out.println("DEBUG: CategoryService - Total categories: " + total);
        return total;
    }
}
