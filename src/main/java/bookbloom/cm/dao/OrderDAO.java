package bookbloom.cm.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import bookbloom.cm.db.DBConnection;
import bookbloom.cm.entity.Order;

public class OrderDAO {

    // Save a new order
    public boolean saveOrder(Order order) {
    	String sql = "INSERT INTO orders (USER_ID, BOOK_ID, QUANTITY, TOTAL_PRICE, STATUS, PAYMENT_METHOD, PAYMENT_DETAILS, EMAIL, ADDRESS, PHONE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
        		PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setLong(1, order.getUserId());
            stmt.setLong(2, order.getBookId());
            stmt.setInt(3, order.getQuantity());
            stmt.setDouble(4, order.getTotalPrice());
            //stmt.setDate(5, (order.getOrderDate().getTime()));
            stmt.setString(5, order.getStatus());
            stmt.setString(6, order.getPaymentMethod());
            stmt.setString(7, order.getPaymentDetails());
            stmt.setString(8, order.getEmail());
            stmt.setString(9, order.getAddress());
            stmt.setString(10, order.getPhone());
//            stmt.executeUpdate();
        
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Fetch all orders
    public List<Order> getAllOrders12() {
    	List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders ";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);)
        		 
             {
            	 ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("ORDER_ID"));
                order.setUserId(rs.getLong("user_id"));
                order.setBookId((long) rs.getInt("book_id"));
                
                
                order.setTotalPrice(rs.getDouble("TOTAL_PRICE"));
              
                order.setQuantity(rs.getInt("quantity"));
                order.setAddress(rs.getString("address"));
                order.setPhone(rs.getString("phone"));
              order.setPaymentMethod(rs.getString("payment_method"));
                order.setPaymentDetails(rs.getString("payment_details"));
               order.setOrderDate(rs.getTimestamp("order_date"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
    
    public List<Order> getAllOrders(int Userid) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM orders where user_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);)
        		 
             {
            	 ps.setInt(1, Userid);
            	 ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("ORDER_ID"));
                order.setUserId(rs.getLong("user_id"));
                order.setBookId((long) rs.getInt("book_id"));
              
                order.setQuantity(rs.getInt("quantity"));
                order.setAddress(rs.getString("address"));
                order.setPhone(rs.getString("phone"));
              order.setPaymentMethod(rs.getString("payment_method"));
                order.setPaymentDetails(rs.getString("payment_details"));
               order.setOrderDate(rs.getTimestamp("order_date"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
}
