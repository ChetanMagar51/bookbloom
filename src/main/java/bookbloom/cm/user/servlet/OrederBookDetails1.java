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

@SuppressWarnings("serial")
@WebServlet("/OrederBookDetails1")
public class OrederBookDetails1 extends HttpServlet {

	/*
	 * @Override protected void doPost(HttpServletRequest request,
	 * HttpServletResponse response) throws ServletException, IOException { // Get
	 * form data int id = Integer.parseInt(request.getParameter("id")); BookDAO
	 * bookDAO = new BookDAO(); Book book = bookDAO.getBookById(id);
	 * 
	 * Double price = book.getPrice();
	 * 
	 * 
	 * 
	 * 
	 * request.setAttribute("price",price );
	 * response.sendRedirect("DetailsBook.jsp");
	 * request.getRequestDispatcher("DetailsBook.jsp").forward(request, response);
	 * 
	 * 
	 * 
	 * 
	 * 
	 * }
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 HttpSession session = request.getSession();
	        User user = (User) session.getAttribute("user");
	        if (user == null) {
	            response.sendRedirect("login.jsp");
	            return;
	        }
		
		  int id = Integer.parseInt(request.getParameter("id")); 
		  BookDAO bookDAO = new BookDAO(); 
		  Book book = bookDAO.getBookById(id);
		  
		  Double price = book.getPrice();
		 System.out.println(price);
		 System.out.println(id);
		 System.out.println();
		request.setAttribute("book",book);
		request.getRequestDispatcher("OrderUserDetails1.jsp").forward(request, response);

	}

}