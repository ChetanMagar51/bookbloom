<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        .container {
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
            text-align: center;
        }
        .card {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.15);
        }
        .btn {
            margin: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-success"><%= session.getAttribute("message") %></h2>
        <p>Your book will be delivered soon.</p>
        
        <!-- Order Details -->
       <%--  <div class="card">
            <h4>Order Summary</h4>
            <p><strong>Book Name:</strong> <%= request.getAttribute("title") %></p>
            <p><strong>Quantity:</strong> <%= request.getAttribute("quantity") %></p>
            <p><strong>Name:</strong> <%= request.getAttribute("name") %></p>
            <p><strong>Email:</strong> <%= request.getAttribute("email") %></p>
            <p><strong>Phone:</strong> <%= request.getAttribute("phone") %></p>
            <p><strong>Address:</strong> <%= request.getAttribute("address") %></p>
            <p><strong>Total Price:</strong> &#8377; <%= request.getAttribute("totalPrice") %></p>
        </div> --%>
        <div class="card">
            <h4>Order Summary</h4>
            <p><strong>Book Name:</strong> <%= session.getAttribute("title") %></p>
            <p><strong>Quantity:</strong> <%= session.getAttribute("quantity") %></p>
            <p><strong>Name:</strong> <%= session.getAttribute("name") %></p>
            <p><strong>Email:</strong> <%= session.getAttribute("email") %></p>
            <p><strong>Phone:</strong> <%= session.getAttribute("phone") %></p>
            <p><strong>Address:</strong> <%= session.getAttribute("address") %></p>
            <p><strong>Total Price:</strong> &#8377; <%= session.getAttribute("total") %></p>
        </div>
        
        
        <!-- Buttons -->
        <div class="mt-4">
            <a href="HomeServlet" class="btn btn-primary">Back to Home</a>
            <a href="ViewOrdersServlet" class="btn btn-secondary">View My Orders</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>