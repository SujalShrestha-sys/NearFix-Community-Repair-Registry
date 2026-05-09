package nearfix.nearfix.dao.idao;

import nearfix.nearfix.model.Category;

import java.sql.SQLException;
import java.util.List;

/**
 * Interface for Category Data Access Object.
 * Defines operations related to category management in the database.
 */
public interface ICategoryDAO {

    /**
     * Retrieves all categories from the database.
     * @return List of Category objects.
     * @throws SQLException if a database access error occurs.
     */
    List<Category> getAllCategories() throws SQLException;

    /**
     * Retrieves a specific category by its ID.
     * @param categoryId The ID of the category.
     * @return The Category object, or null if not found.
     * @throws SQLException if a database access error occurs.
     */
    Category getCategoryById(int categoryId) throws SQLException;
    
    /**
     * Retrieves a category by its name.
     */
    Category getCategoryByName(String name) throws SQLException;

    /**
     * Creates a new category in the database.
     * @param category The Category object to create.
     * @return True if creation was successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean createCategory(Category category) throws SQLException;

    /**
     * Updates an existing category in the database.
     * @param category The Category object with updated information.
     * @return True if update was successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean updateCategory(Category category) throws SQLException;

    /**
     * Deletes a category from the database by its ID.
     * @param categoryId The ID of the category to delete.
     * @return True if deletion was successful, false otherwise.
     * @throws SQLException if a database access error occurs.
     */
    boolean deleteCategory(int categoryId) throws SQLException;

    /**
     * Gets the total number of categories in the database.
     * @return Total count of categories.
     * @throws SQLException if a database access error occurs.
     */
    int getTotalCategories() throws SQLException;
}

