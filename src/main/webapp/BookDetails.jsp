<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bookbloom.cm.entity.Book" %>

<%@ include file="navbar.jsp" %>
<%
    // Fetch books from database (Assuming it's stored in request scope)
    Book book = (Book)request.getAttribute("book");
%>
<%
    boolean isOutOfStock = (book.getStock() <= 0);
%>


<%
    if (request.getAttribute("book") == null) {
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: url('https://source.unsplash.com/1920x1080/?books,library') no-repeat center center/cover;
            background-attachment: fixed;
            color: #f5f5f5;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background: rgba(0, 0, 0, 0.8);
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.5);
        }

        .book-img {
            width: 100%;
            height: 400px;
            object-fit: cover;
            border-radius: 10px;
        }

        h1 {
            font-size: 32px;
            color: #f1c40f;
            margin-bottom: 20px;
        }

        p, span {
            font-size: 16px;
            color: #ddd;
            margin: 10px 0;
        }

        .btn {
            margin-top: 20px;
        }

        .rating {
            font-size: 20px;
            color: #f1c40f;
        }

        .breadcrumb {
            margin-bottom: 20px;
        }

        .dark-mode-toggle {
            position: fixed;
            top: 10px;
            right: 10px;
            z-index: 10;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Breadcrumb Navigation -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
           <!--  <li class="breadcrumb-item"><a href="home" class="text-warning">Home</a></li> -->
            <li class="breadcrumb-item active" aria-current="page">Book Details</li>
        </ol>
    </nav>

    <!-- Book Details -->
    <img src="${book.imageUrl}" alt="${book.title}" class="book-img">
    <h1>${book.title}</h1>
    <p><strong>Author:</strong> ${book.author}</p>
    <p><strong>Price:</strong> ₹${book.price}</p>
    <p><strong>Description:</strong> ${book.description}</p>
    <p><strong>Availability:</strong> <span class="${book.stock > 0 ? 'text-success' : 'text-danger'}">${book.stock > 0 ? 'In Stock' : 'Out of Stock'}</span></p>
    <%-- <p><strong>Rating:</strong> <span class="rating">⭐⭐⭐⭐☆ (${book.rating})</span></p> --%>

    <!-- Reviews -->
    <h3>Reviews</h3>
    <%-- <ul>
        <c:forEach var="review" items="${book.reviews}">
            <li>${review}</li>
        </c:forEach>
    </ul> --%>

    <!-- Order Button -->
   <%--  
    <button class="btn btn-warning" onclick="openBuyModal()" ${book.stock <= 0 ? 'disabled' : ''}>Buy Now</button>  --%>
    <%
    if (isOutOfStock) {
    	 %>
    	<button class="btn btn-warning" <%= isOutOfStock ? "disabled" : "" %>>Buy Now</button>
    	<button class="btn btn-secondary mt-3" onclick="history.back()">Go Back</button>
    	<%
    	}
    	
    	else{
    	
    %>
     <a href="OrederBookDetails1?id=<%= book.getId() %>" class="btn btn-primary" >Buy Now</a>
     <button class="btn btn-secondary mt-3" onclick="history.back()">Go Back</button>
    	<%
       
    }
    %>

    
</div>
<!-- Buy Now Button -->
<%-- href="edit_book.jsp?id=<%= book.getId() %> --%>
<%-- <a href="OrederDetails?id=<%= book.getId() %>" class="btn btn-primary">Buy Now1</a>
 --%>
</body>
</html>