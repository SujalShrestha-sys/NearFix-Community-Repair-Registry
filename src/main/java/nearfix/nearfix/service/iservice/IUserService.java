package nearfix.nearfix.service.iservice;

import nearfix.nearfix.exception.DatabaseException;
import nearfix.nearfix.exception.ValidationException;
import nearfix.nearfix.model.User;

import java.sql.SQLException;

public interface IUserService {

    boolean registerUser(String name, String email, String phone, String password, String role)
            throws ValidationException, SQLException, DatabaseException;

    User login(String email, String password) throws ValidationException;

    User getUserById(int userId) throws ValidationException, SQLException;

    boolean updateProfile(int userId, String name, String email, String phone)
            throws ValidationException, SQLException;

    boolean changePassword(int userId, String oldPassword, String newPassword)
            throws ValidationException, SQLException;
}
