package bookbloom.com.db;


import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe"; //url
    private static final String USER = "ebook"; // oracl username
    private static final String PASSWORD = "book"; // oracl password

    public static Connection getConnection() {
        Connection conn = null;
        try {
        	Class.forName("oracle.jdbc.driver.OracleDriver"); 
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database connected successfully!");
        } catch (Exception  e) {
            e.printStackTrace();
        }
        return conn;
    }
}
