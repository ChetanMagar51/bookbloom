<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bookbloom.cm.entity.User" %>
<%
    User loggedInUser = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookStore </title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        .navbar-custom {
            background-color: #007bff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .navbar-brand {
            color: white;
            font-size: 24px;
            font-weight: bold;
        }

        .navbar-brand i {
            margin-right: 5px;
        }

        .navbar-nav .nav-link {
            color: white;
            font-size: 17px;
            margin: 0 8px;
            transition: 0.3s;
        }

        .navbar-nav .nav-link:hover {
            text-decoration: underline;
        }

        .user-name {
            color: white;
            margin-right: 10px;
            font-weight: 500;
        }

        .btn-custom {
            background: white;
            color: #007bff;
            border-radius: 5px;
            font-weight: 500;
            padding: 5px 12px;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .btn-custom:hover {
            background-color: #0056b3;
            color: white;
        }

        @media (max-width: 767.98px) {
            .user-name {
                display: block;
                text-align: center;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="HomeServlet"><i class="fa fa-book"></i> BookBloom</a>

        <button class="navbar-toggler text-white border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" 
            aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars fa-lg"></i>
        </button>

        <div class="collapse navbar-collapse justify-content-between" id="navbarContent">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="HomeServlet">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ViewOrdersServlet">Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Categories</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact Us</a>
                </li>
            </ul>

            <div class="d-flex align-items-center">
                <% if (loggedInUser != null) { %>
                    <span class="user-name"><%= loggedInUser.getName() %></span>
                    <a href="LogoutServlet" class="btn-custom">Logout</a>
                <% } else { %>
                    <a href="login.jsp" class="btn-custom">Login</a>
                <% } %>
            </div>
        </div>
    </div>
</nav>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>