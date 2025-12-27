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

@SuppressWarnings("serial")
@MultipartConfig
@WebServlet("/admin/UploadBookServlet")
public class UploadBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        int stock = Integer.parseInt(request.getParameter("stock"));
		/*
		 * Part imagePart = request.getPart("image"); String imageName =
		 * imagePart.getSubmittedFileName(); String imagePath = "images/" + imageName;
		 * 
		 * // Save the image to the server's directory String uploadPath =
		 * getServletContext().getRealPath("/") + "images";
		 * 
		 * 
		 * File uploadDir = new File(uploadPath); if (!uploadDir.exists()) {
		 * uploadDir.mkdir(); } imagePart.write(uploadPath + File.separator +
		 * imageName);
		 */
//        String name = request.getParameter("name");

        Part imagePart = request.getPart("image");
        String imageName = imagePart.getSubmittedFileName();

        // Path inside project
        String uploadPath = getServletContext().getRealPath("/images");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Save image physically
        imagePart.write(uploadPath + File.separator + imageName);

        // Store relative path in DB
        String imagePath = "images/" + imageName;
        
        
        
        // Save book details in the database
        try { Book book = new Book();
        book.setTitle(title);
        book.setAuthor(author);
        book.setDescription(description);
        book.setCategory(category);
        book.setImageUrl(imagePath);
        book.setPrice(price);
        book.setStock(stock);
        
    	BookDAO b = new BookDAO();
    	Boolean r = b.addBook(book);
    	
        if ( r) {
            //response.sendRedirect("admin_dashboard.jsp");
            request.getSession().setAttribute("message", "Book added successfully!");
            response.sendRedirect(request.getContextPath() +"/admin/admin_dashboard.jsp");
        } else {
        	 request.getSession().setAttribute("message", "faild to add book!");
            response.sendRedirect(request.getContextPath() +"/admin/upload.jsp?error=Failed to add book");
        }
        } catch (Exception e) {
            e.printStackTrace();
        }

//        request.getSession().setAttribute("message", "Book added successfully!");
//        response.sendRedirect("admin_dashboard.jsp");
    }
}