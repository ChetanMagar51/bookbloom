package bookbloom.cm.admin.servlets;



import java.io.File;
import java.io.IOException;

import bookbloom.cm.dao.BookDAO;
import bookbloom.cm.entity.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
@MultipartConfig
@SuppressWarnings("serial")
@WebServlet("/admin/EditBookServlet")
public class EditBookServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    int id = Integer.parseInt(request.getParameter("id"));
	    int stock = Integer.parseInt(request.getParameter("stock"));
	    String title = request.getParameter("title");
	    String author = request.getParameter("author");
	    String description = request.getParameter("description");
	    double price = Double.parseDouble(request.getParameter("price"));

	    String oldImage = request.getParameter("oldImage");
	    String imagePath = oldImage; // default → keep old image

	    Part imagePart = request.getPart("image");

	    if (imagePart != null && imagePart.getSize() > 0) {
	        String imageName = imagePart.getSubmittedFileName();

	        String uploadPath = getServletContext().getRealPath("/images");
	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdirs();
	        }

	        imagePart.write(uploadPath + File.separator + imageName);
	        imagePath = "images/" + imageName;
	    }
	    
	    BookDAO bookDAO = new BookDAO();

	    Book book = new Book();
	    book.setId(id);
	    book.setTitle(title);
	    book.setAuthor(author);
	    book.setPrice(price);
	    book.setImageUrl(imagePath);
	    book.setStock(stock);
	    book.setDescription(description);
	    book.setCategory(bookDAO.getBookById(id).getCategory());
	    

	    
	    boolean updated = bookDAO.updateBook(book);

	    if (updated) {
	        request.getSession().setAttribute("message", "Book updated successfully!");
	        response.sendRedirect(request.getContextPath() + "/admin/manage_books.jsp");
	    } else {
	        response.sendRedirect(request.getContextPath() + "/admin/manage_books.jsp?msg=Error Updating Book");
	    }
	}

}
