package bookbloom.cm.user.servlet;
import java.io.IOException;
import java.util.List;

import bookbloom.cm.dao.OrderDAO;
import bookbloom.cm.entity.Order;
import bookbloom.cm.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ViewOrdersServlet")
public class ViewOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get user session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        try {
            // Fetch user orders from the database
            OrderDAO orderDAO = new OrderDAO();
            List<Order> orders = orderDAO.getAllOrders((int)user.getId());
            
            
            // Set orders in request scope
            request.setAttribute("orders", orders);
            
            // Forward to orders page
         
            request.getRequestDispatcher("vieworders.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to fetch orders. Please try again.");
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }
    }
}