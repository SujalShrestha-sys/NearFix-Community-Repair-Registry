package nearfix.nearfix.dao.idao;

import nearfix.nearfix.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    boolean createUser(User user) throws SQLException;

    User getUserByEmail(String email) throws SQLException;

    User getUserByPhone(String phone) throws SQLException;

    User getUserById(int userId) throws SQLException;

    List<User> getAllUsers(int page, int pageSize) throws SQLException;

    boolean updateUser(User user) throws SQLException;

    boolean updatePassword(int userId, String newPasswordHash) throws SQLException;

    boolean deactivateUser(int userId) throws SQLException;

    boolean activateUser(int userId) throws SQLException;

    int getTotalUsers() throws SQLException;
}
