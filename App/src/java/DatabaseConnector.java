import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {

    public static Connection connectToDatabase() {
        Connection connection = null;
        try {
            String url = "jdbc:sql://http:3306/java_web";
            String user = "johndoe";
            String password = "@1234";

            connection = DriverManager.getConnection(url, user, password);
            System.out.println("Connected to the database successfully!");
        } catch (SQLException e) {
            System.out.println("Error connecting to the database: " + e.getMessage());
        }
        return connection;
    }

    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Database connection closed.");
            } catch (SQLException e) {
                System.out.println("Error closing database connection: " + e.getMessage());
            }
        }
    }

    public static void main(String[] args) {

        Connection connection = connectToDatabase();
        closeConnection(connection);
    }
}
