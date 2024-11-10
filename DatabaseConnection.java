// DatabaseConnection.java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static Connection getConnection() throws SQLException {
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database URL, username, and password
            String url = "jdbc:mysql://localhost:3306/GuruDB"; // Replace with your database name
            String username = "root"; // Replace with your MySQL username
            String password = "piyush713"; // Replace with your MySQL password

            // Create and return connection
            return DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("MySQL JDBC Driver not found.");
        }
    }
}
