package bookbloom.cm.admin.servlets;



import java.io.IOException;

import bookbloom.cm.dao.AdminDAO;
import bookbloom.cm.entity.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        System.out.println(password);
        

        HttpSession session = request.getSession();

        AdminDAO adminDAO = new AdminDAO();
        Admin admin = adminDAO.login(email, password);
        
        

        if (admin != null) {
            session.setAttribute("admin", admin);
           // response.sendRedirect("admin_dashboard.jsp");
            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
            System.out.println("if block");
            
        } else {
        	 System.out.println("else block");
             
           response.sendRedirect("admin_login.jsp?error=Invalid email or password");
        }
        
//        if(adminDAO.login(email, password)) {
//        	//session.setAttribute("admin", admin);
//          response.sendRedirect("admin_dashboard.jsp");
//        	
//        }
//        else {
//          response.sendRedirect("admin_login.jsp?error=Invalid email or password");
//      }
        
        	
        	
    }
}
