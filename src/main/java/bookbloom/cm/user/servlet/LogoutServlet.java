package bookbloom.cm.user.servlet;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
    	
    	
        HttpSession session = request.getSession();
        
        		request.getSession(false); // Get existing session
        if (session != null) {
            session.invalidate(); // Destroy session
        }
        
        response.sendRedirect("login.jsp"); // Redirect to login page
    }
}