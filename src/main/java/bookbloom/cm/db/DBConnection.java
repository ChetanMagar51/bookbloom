package bookbloom.cm.db;


import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String USER = "ebook"; // Change to your SQL username
    private static final String PASSWORD = "book"; // Change to your SQL password

    public static Connection getConnection() {
        Connection conn = null;
        try {
        	Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Database connected successfully!");
        } catch (Exception  e) {
            e.printStackTrace();
        }
        return conn;
    }
}