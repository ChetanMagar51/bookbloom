package bookbloom.cm.admin.servlets;



import java.io.IOException;

import bookbloom.cm.dao.BookDAO;
import bookbloom.cm.entity.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/admin/EditBookServlet")
public class EditBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        String imageUrl = request.getParameter("imageUrl"); 

        Book book = new Book();
        book.setId(id);
        book.setTitle(title);
        book.setAuthor(author);
        book.setPrice(price);
        book.setImageUrl(imageUrl);

        BookDAO bookDAO = new BookDAO();
        boolean updated = bookDAO.updateBook(book);

        if (updated) {
        	 request.getSession().setAttribute("message", "Book updated successfully!");
            response.sendRedirect(request.getContextPath() +"/admin/manage_books.jsp");
        } else {
            response.sendRedirect(request.getContextPath() +" /admin/manage_books.jsp?msg=Error Updating Book");
        }
    }
}
