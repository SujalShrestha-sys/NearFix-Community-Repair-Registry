package nearfix.nearfix.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * DBConnection - Utility class that creates database connections.
 *
 * HOW IT WORKS:
 * 1. Loads the MySQL JDBC driver when the class is first loaded.
 * 2. Provides a getConnection() method that returns a live database connection.
 * 3. Provides a closeConnection() method to safely close connections.
 *
 * USAGE EXAMPLE:
 * try (Connection conn = DBConnection.getConnection()) {
 * // Use connection here — it auto-closes when done
 * }
 *
 * NOTE: Update the constants below if your database name, user, or password
 * changes.
 */
public class DBConnection {

    // Database Configuration
    private static final String DB_URL = "jdbc:mysql://localhost:3306/nearfix";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Sujal@123";
    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";

    // Load the MySQL driver once when this class is first used
    static {
        try {
            Class.forName(DB_DRIVER);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found. Make sure it's in pom.xml.", e);
        }
    }

    /**
     * Creates and returns a new database connection.
     * Always use try-with-resources so the connection closes automatically.
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    /**
     * Safely closes a database connection.
     * Only needed if you're NOT using try-with-resources.
     */
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                throw new RuntimeException("Failed to close database connection.", e);
            }
        }
    }
}