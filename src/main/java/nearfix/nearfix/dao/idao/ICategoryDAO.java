package nearfix.nearfix.dao.idao;

import nearfix.nearfix.model.Category;

import java.sql.SQLException;
import java.util.List;

public interface ICategoryDAO {

    List<Category> getAllCategories() throws SQLException;

    Category getCategoryById(int categoryId) throws SQLException;

    boolean createCategory(Category category) throws SQLException;

    boolean updateCategory(Category category) throws SQLException;

    boolean deleteCategory(int categoryId) throws SQLException;

    int getTotalCategories() throws SQLException;
}
