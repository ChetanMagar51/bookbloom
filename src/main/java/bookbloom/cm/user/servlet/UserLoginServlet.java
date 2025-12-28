package bookbloom.cm.user.servlet;


import java.io.IOException;

import bookbloom.cm.dao.UserDAO;
import bookbloom.cm.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@SuppressWarnings("serial")
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
   // private static final long serialVersionUID = 1L;

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        UserDAO userDAO = new UserDAO();
        if(userDAO.isEmailAready(email)) {
        User user = userDAO.loginUser(email, password);

        if (user != null) {
            session.setAttribute("user", user);
            response.sendRedirect("HomeServlet");

        } else {
        	response.sendRedirect("login.jsp?error=Invalid+password");

        }
        }
        else {
        	response.sendRedirect("login.jsp?error=Invalid+email");

        
        }
    }
}