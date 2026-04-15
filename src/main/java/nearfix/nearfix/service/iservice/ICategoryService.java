package nearfix.nearfix.service.iservice;

import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.Category;

import java.sql.SQLException;
import java.util.List;

public interface ICategoryService {

    List<Category> getAllCategories() throws SQLException;

    Category getCategoryById(int categoryId) throws SQLException;

    boolean createCategory(String name, String description) throws ValidationException, SQLException;

    boolean updateCategory(int categoryId, String name, String description)
            throws ValidationException, SQLException;

    boolean deleteCategory(int categoryId) throws SQLException, ValidationException;

    int getTotalCategories() throws SQLException;
}
