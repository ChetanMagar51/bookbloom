<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bookbloom.cm.entity.Book" %>
<%@ include file="navbar.jsp" %>

<%
    List<Book> bookList = (List<Book>) request.getAttribute("bookList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BookBloom - Explore Books</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://source.unsplash.com/1600x900/?bookshelf,library') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        .glass-overlay {
            backdrop-filter: blur(10px);
            background-color: rgba(255, 255, 255, 0.85);
            min-height: 100vh;
            padding: 40px 20px;
        }

        .hero-heading {
            text-align: center;
            font-size: 2.8rem;
            font-weight: 600;
            margin-bottom: 30px;
            color: #333;
        }

        .search-bar {
            max-width: 700px;
            margin: 0 auto 40px auto;
        }

        .search-bar input {
            border-radius: 30px;
            padding: 12px 20px;
        }

        .search-bar button {
            border-radius: 30px;
            padding: 12px 30px;
        }

        .card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.25);
        }

        .card-img-top {
            height: 250px;
            object-fit: cover;
        }

        .card-body {
            text-align: center;
            padding: 20px;
        }

        .card-title {
            font-size: 18px;
            font-weight: 600;
            color: #222;
        }

        .card-text {
            font-size: 16px;
            margin-bottom: 15px;
            color: #666;
        }

        .btn-gradient {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            transition: background 0.3s ease;
        }

        .btn-gradient:hover {
            background: linear-gradient(to right, #0072ff, #00c6ff);
        }

        .no-books {
            text-align: center;
            font-size: 20px;
            color: #555;
            margin-top: 80px;
        }
    </style>
</head>

<body>
    <div class="glass-overlay">
        <div class="container">

            <!-- Hero Title -->
            <!-- <div class="hero-heading">Welcome to <span style="color: #0072ff;">BookBloom</span> 📚</div>
 -->
            <!-- Search Form -->
            <form class="search-bar d-flex shadow-sm bg-white p-2 rounded-pill" action="GetbooksServlet" method="GET">
                <input type="text" class="form-control border-0" name="title" placeholder="Search for books..." required>
                <button class="btn btn-gradient ms-2" type="submit">Search</button>
            </form>

            <!-- Book Grid -->
            <div class="row mt-5 g-4">
                <% if (bookList != null && !bookList.isEmpty()) {
                    for (Book book : bookList) { %>
                        <div class="col-sm-6 col-md-4 col-lg-3">
                            <div class="card h-100">
                              <%--   <img src="<%= book.getImageUrl() %>" class="card-img-top" alt="<%= book.getTitle() %>">
                              --%>   
                                <img src="<%= request.getContextPath() + "/" + book.getImageUrl() %>" 
     class="card-img-top" alt="<%= book.getTitle() %>">
                                
                                
                                <div class="card-body">
                                    <h5 class="card-title"><%= book.getTitle() %></h5>
                                    <p class="card-text">Price: ₹<%= book.getPrice() %></p>
                                    <a href="BookDetailsServlet?id=<%= book.getId() %>" class="btn btn-gradient">View Details</a>
                                </div>
                            </div>
                        </div>
                <%  } 
                } else { %>
                    <div class="no-books">
                        <p>No books available at the moment. Please check back later!</p>
                        
                         <button class="btn btn-upload" style="color:blue" onclick="window.location.href='home'">Back to Home </button>
                    </div>
                <% } %>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>