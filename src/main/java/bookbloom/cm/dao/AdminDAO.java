package bookbloom.cm.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bookbloom.cm.db.DBConnection;
import bookbloom.cm.entity.Admin;



public class AdminDAO {
	
	
	
	
	// Authenticate user login
    public Admin login(String email, String password) {
       Admin admin = null;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM admin WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
            	System.out.println("login if ....");
                admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setName(rs.getString("name"));
                admin.setEmail(rs.getString("email"));
                admin.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }
	
	
	
	
	
    
    // Method to authenticate admin login
    public Admin login33(String email, String password) {
    	Admin admin = null;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "select * from admin where password = ? and email = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(2, email);
            ps.setString(1, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
            	admin = new Admin();
            	admin.setId(rs.getInt("id"));
            	admin.setName(rs.getString("name"));
            	admin.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }
    
    
    public boolean login12(String email, String password) {
    	boolean result = false;
    	Admin admin = new Admin();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM admin WHERE  password = ? and email = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(2, email);
            ps.setString(1, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
            	result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}