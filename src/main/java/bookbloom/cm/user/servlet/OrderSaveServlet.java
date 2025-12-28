package bookbloom.cm.user.servlet;

import java.io.IOException;

import bookbloom.cm.dao.BookDAO;
import bookbloom.cm.dao.OrderDAO;
import bookbloom.cm.entity.Book;
import bookbloom.cm.entity.Order;
import bookbloom.cm.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/OrderSaveServlet")
public class OrderSaveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Retrieve session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return; // Stop execution if the user is not logged in
        }

        try {
            // Check if parameters are empty or null before parsing
            String bookidStr = request.getParameter("bookid");
            String useridStr = request.getParameter("userid");
            String quantityStr = request.getParameter("quantity");
            String totalStr = request.getParameter("total");

            
            
//            quantityStr == null || quantityStr.isEmpty() ||
//                    totalStr == null || totalStr.isEmpty()   useridStr == null || useridStr.isEmpty() 
            
            // Ensure that the required fields are not null or empty
            if (bookidStr == null || bookidStr.isEmpty() 
               
                ) {
                
                request.setAttribute("errorMessage", "Invalid input: Some fields are missing.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }

            // Now parse the values safely
            int bookid = Integer.parseInt(bookidStr);
            int userid = Integer.parseInt(useridStr);
            int quantity = Integer.parseInt(quantityStr);
            double total = Double.parseDouble(totalStr);

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
           
            long l = bookid;
            long u=userid;
            
            Order order =  new Order();
            order.setBookId(l);
            order.setName(name);
            order.setUserId(u);
            order.setAddress(address);
            order.setEmail(email);
            order.setQuantity(quantity);
            order.setTotalPrice(total);
            order.setPhone(phone);
            
            boolean done = new OrderDAO().saveOrder(order);
            
            if(done)
            {
            	Book book =  new BookDAO().getBookById(bookid);
            	int t = book.getStock();
            	boolean r = new BookDAO().AlterBookQuantity(bookid, t-quantity );
            	String title = book.getTitle();
            	double p = total*quantity;
            	
            	
            	// Set attributes for confirmation page
            	request.setAttribute("title", title);
            	request.setAttribute("quantity", quantity);
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("address", address);
                request.setAttribute("totalPrice", total);
              //  request.setAttribute("message", "Your order has been placed successfully!");
                
              //  HttpSession session = request.getSession();
                session.setAttribute("title", title);
                session.setAttribute("quantity", quantity);
                session.setAttribute("email", email);
                session.setAttribute("phone", phone);
                session.setAttribute("address", address);
                session.setAttribute("name", name);
                session.setAttribute("total", total);
                //session.setAttribute("payment", payment);
                session.setAttribute("message", "Your order has been placed successfully!");
                
                System.out.println("total price ,....");
                System.out.println(total);
                

                // Forward request to confirmation 
                //request.getRequestDispatcher("orderCon.jsp").forward(request, response);
                response.sendRedirect("orderCon.jsp");

            	
            }else
            {
            	
            	request.setAttribute("message", "Your order has not been placed successfully!");

                // Forward request to confirmation page
                request.getRequestDispatcher("index.jsp").forward(request, response);
            	
            }
            
            
            
            
            
            
            

            
        } catch (NumberFormatException e) {
            // Handle invalid number format errors
            request.setAttribute("errorMessage", "Invalid number format. Please enter valid numbers.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}