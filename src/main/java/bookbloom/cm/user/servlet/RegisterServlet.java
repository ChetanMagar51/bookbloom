package bookbloom.cm.user.servlet;



import java.io.IOException;

import bookbloom.cm.dao.UserDAO;
import bookbloom.cm.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Create User object
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);

        // Register user using UserDAO
        UserDAO userDAO = new UserDAO();
        
//        boolean isEamil = userDAO.isEmailAready(email);
//        
//        if(isEamil)
//        {
//        	boolean isRegistered = userDAO.registerUser(user);
//       	 if (isRegistered) {
//         	   response.sendRedirect("login.jsp?error=reistion+sucessfull..+you+can+login");
//         } else {
//         	  
//             response.sendRedirect("register.jsp?error=Invalid+input+fields+are+missin.+Try+again");
//         }
//        }
//        else {
//        	
//        	 
//        	response.sendRedirect("register.jsp?error=Email+aredy+registered");
//            
//        }
        
        boolean isEamil = userDAO.isEmailAready(email);
        if(isEamil) {
        	response.sendRedirect("register.jsp?error=Email+aredy+registered");
        	
        }
        
        else {
        
        boolean isRegistered = userDAO.registerUser(user);
      	 if (isRegistered) {
        	   response.sendRedirect("login.jsp?error=reistion+sucessfull..+you+can+login");
        } else {
        	  
            response.sendRedirect("register.jsp?error=Invalid+input+fields+are+missin.+Try+again");
        }
        }

        
    }
}