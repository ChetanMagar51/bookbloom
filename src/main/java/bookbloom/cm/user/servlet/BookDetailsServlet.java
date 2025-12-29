  package bookbloom.cm.user.servlet;




import java.io.IOException;

import bookbloom.cm.dao.BookDAO;
import bookbloom.cm.entity.Book;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/BookDetailsServlet")
public class  BookDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the book ID from the request
        String bookId = request.getParameter("id");

        // Fetch book details from the database
        BookDAO bookDAO = new BookDAO();
        Book book = bookDAO.getBookById(Integer.parseInt(bookId));

        // If book is not found, redirect to the home page
        if (book == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        // Set book as a request attribute and forward to JSP
        request.setAttribute("book", book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("BookDetails.jsp");
        dispatcher.forward(request, response);
    }
}