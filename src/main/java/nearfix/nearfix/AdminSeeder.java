package nearfix.nearfix;

import nearfix.nearfix.dao.impl.UserDAO;
import nearfix.nearfix.model.User;
import nearfix.nearfix.util.PasswordEncryption;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * AdminSeeder - A utility class to initialize the database with a default Admin
 * account.
 * Run this class to ensure at least one Admin exists in the system.
 */
public class AdminSeeder {

    private static final Logger logger = Logger.getLogger(AdminSeeder.class.getName());

    public static void main(String[] args) {
        String adminEmail = "admin@nearfix.com";
        String adminPassword = "Admin@123";

        try {
            System.out.println("   NearFix Database Seeder: Admin User    ");

            UserDAO userDAO = new UserDAO();

            // 1. Check if admin already exists
            User existingAdmin = userDAO.getUserByEmail(adminEmail);

            if (existingAdmin != null) {
                System.out.println("Info: Admin user already exists (" + adminEmail + ").");
            } else {
                // 2. Create new Admin user
                System.out.println("Creating Admin account...");

                User admin = new User();
                admin.setName("System Administrator");
                admin.setEmail(adminEmail);
                admin.setPhone("9800000000");
                admin.setPasswordHash(PasswordEncryption.encryptPassword(adminPassword));
                admin.setRole("ADMIN");
                admin.setActive(true);

                int userId = userDAO.createUser(admin);

                if (userId > 0) {
                    System.out.println("\nSuccess: Admin account created successfully!");
                    System.out.println("Email:    " + adminEmail);
                    System.out.println("Password: " + adminPassword);
                    System.out.println("User ID:  " + userId);
                } else {
                    System.err.println("Error: Could not create admin account. Please check database constraints.");
                }
            }

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Database connection error during admin seeding", e);
            System.err.println("Database Error: Failed to connect or execute query. Check if the database is running.");
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Unexpected error in AdminSeeder", e);
            System.err.println("Unexpected Error: " + e.getMessage());
        } finally {
            System.out.println("\nSeeding process finished.");
        }
    }
}