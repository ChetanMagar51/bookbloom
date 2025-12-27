package bookbloom.cm.admin.servlets;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import bookbloom.cm.dao.BookDAO;
import bookbloom.cm.entity.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,     // 10MB
                 maxRequestSize = 1024 * 1024 * 50)  // 50MB
@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get form data
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        String category = request.getParameter("category");
        Part filePart = request.getPart("bookImage");
        int stock = Integer.parseInt(request.getParameter("stock"));

        // Define upload directory
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir(); // Create uploads folder if not exists
        }

        // Get file name and save to server
        String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
        String filePath = uploadPath + File.separator + fileName;
        try (InputStream fileContent = filePart.getInputStream();
             FileOutputStream fos = new FileOutputStream(filePath)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
        }

        // Save book details in database
        
        try {
            
            Book book = new Book();
            book.setTitle(title);
            book.setAuthor(author);
            book.setCategory(category);
            book.setImageUrl(filePath);
            book.setPrice(price);
            book.setStock(stock);
        	BookDAO b = new BookDAO();
        	Boolean r = b.addBook(book);
            if ( r) {
                //response.sendRedirect("admin_dashboard.jsp");
                request.getSession().setAttribute("message", "Book added successfully!");
                response.sendRedirect("admin_dashboard.jsp");
            } else {
            	 request.getSession().setAttribute("message", "faild to add book!");
                response.sendRedirect("add_book.jsp?error=Failed to add book");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "error!");
            response.sendRedirect("add_book.jsp?error=Database error");
        } 
            
        
    }
}
