package bookbloom.cm.user.servlet;

import java.io.IOException;
import java.util.List;

import bookbloom.cm.dao.BookDAO;
import bookbloom.cm.entity.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch books from database
        BookDAO bookDAO = new BookDAO();
        List<Book> bookList = bookDAO.getAllBooks();
       

        // Set books in request scope
        request.setAttribute("bookList", bookList);
        
        
        
        
        
        
        
        
        
        

        // Forward to home.jsp
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}