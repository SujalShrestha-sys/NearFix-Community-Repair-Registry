package nearfix.nearfix.service.iservice;

import nearfix.nearfix.exception.DatabaseException;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {

        boolean registerUser(String name, String email, String phone, String password, String role)
                        throws ValidationException, SQLException, DatabaseException;

        User login(String email, String password) throws ValidationException;

        User getUserById(int userId) throws SQLException;

        boolean updateProfile(int userId, String name, String email, String phone)
                        throws ValidationException, SQLException;

        boolean changePassword(int userId, String oldPassword, String newPassword)
                        throws ValidationException, SQLException;

        List<User> getAllUsers(int page, int pageSize) throws SQLException;

        int getTotalUsers() throws SQLException;

        boolean deactivateUser(int userId) throws SQLException;

        boolean activateUser(int userId) throws SQLException;

        List<User> searchUsers(String keyword, String role, int page, int pageSize) throws SQLException;

        int getTotalUsersCount(String keyword, String role) throws SQLException;

        boolean verifyRepairer(int userId) throws SQLException;
}
