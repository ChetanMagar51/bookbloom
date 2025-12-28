
<%@ page import="java.util.List" %>
<%@ page import="bookbloom.cm.entity.*" %>
<%@ page import="bookbloom.cm.dao.*" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">My Orders</h2>
        
        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
            <div class="alert alert-danger"><%= error %></div>
        <% } %>
        
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Order ID</th>
                    <th>Book Name</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Payment Method</th>
                    <th>Order Date</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Order> orders = (List<Order>) request.getAttribute("orders");
                    if (orders != null && !orders.isEmpty()) {
                        for (Order order : orders) { 
                        	Book book = new BookDAO().getBookById(order.getBookId());
                %>
                <tr>
                    <td><%= order.getOrderId() %></td>
                    <td><%= book.getTitle() %></td>
                    <td><%= order.getQuantity() %></td>
                    <td><%= order.getTotalPrice() %></td>
                    <td><%= order.getPaymentMethod() %></td>
                    <td><%= order.getOrderDate() %></td>
                </tr>
                <% 
                        } 
                    } else { 
                %>
                <tr>
                    <td colspan="6" class="text-center">No orders found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <button class="btn btn-primary" style="color:blue" onclick="window.location.href='HomeServlet'">Back to Home </button>
                   
        <a href="HomeServlet" class="btn btn-primary">Back to Dashboard</a>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>