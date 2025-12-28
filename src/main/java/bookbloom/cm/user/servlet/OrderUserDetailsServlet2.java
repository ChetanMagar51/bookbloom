package bookbloom.cm.user.servlet;


import java.io.IOException;

import bookbloom.cm.dao.BookDAO;
import bookbloom.cm.entity.Book;
import bookbloom.cm.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/OrderUserDetailsServlet2")
public class OrderUserDetailsServlet2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	int id = Integer.parseInt(request.getParameter("id")); 
		  BookDAO bookDAO = new BookDAO(); 
		  Book book = bookDAO.getBookById(id);
		  
		  HttpSession session = request.getSession();
	        User user = (User) session.getAttribute("user");
	        if (user == null) {
	            response.sendRedirect("login.jsp");
	            return;
	        }
		  
		

        
    	 // Retrieve form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        
        
        System.out.println("befor paymentmethod.jsp page");
        
        //System.out.println(name);
        
       // System.out.println(email);
      //  System.out.println(phone);
        //System.out.println(address);
        
       
        
       int quantity = Integer.parseInt(request.getParameter("quantity"));
      
        double price = Double.parseDouble(request.getParameter("price"));
        
        
        double total = price*(double)quantity;
       // System.out.println(quantity);
       // System.out.println(price);
       // System.out.println(total);
        
        
       String title = book.getTitle();
       // System.out.println(title);
        int uid = user.getId();
      //  System.out.println(uid);

        
        //System.out.println("total 7 attribute");
       
       
        
        // Pass data to the payment page
        request.setAttribute("bookid", id);
        request.setAttribute("title", title);
        request.setAttribute("userid", uid);
        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
       request.setAttribute("quantity", quantity);
        request.setAttribute("total", total);


        // Forward to payment page
        request.getRequestDispatcher("paymentmode.jsp").forward(request, response);
    }
}