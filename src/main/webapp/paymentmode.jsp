<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .btn-primary {
            width: 100%;
            padding: 10px;
            font-size: 18px;
            border-radius: 5px;
            transition: 0.3s;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .form-check-label {
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4 text-center text-primary">Order Confirmation</h2>
        
        <table class="table table-bordered">
            
            <%-- <tr><th>User ID</th><td>${userid}</td></tr>  --%>
            <tr><th>Name</th><td>${name}</td></tr>
            <tr><th>Email</th><td>${email}</td></tr>
            <tr><th>Phone</th><td>${phone}</td></tr>
            <tr><th>Address</th><td>${address}</td></tr>
            <tr><th>Book name</th><td>${title}</td></tr>
            <tr><th>Quantity</th><td>${quantity}</td></tr>
            <tr><th>Total Price</th><td><strong>&#8377; ${total}</strong></td></tr>
        </table>
        
        <h3 class="text-center mt-4">Select Payment Mode</h3>
        <form action="OrderSaveServlet" method="post">
            <input type="hidden" name="bookid" value="${bookid}">
            <%--  <input type="hidden" name="book" value="${book}"> --%>
            <input type="hidden" name="userid" value="${userid}">
            <input type="hidden" name="name" value="${name}">
            <input type="hidden" name="email" value="${email}">
            <input type="hidden" name="phone" value="${phone}">
            <input type="hidden" name="address" value="${address}">
            <input type="hidden" name="quantity" value="${quantity}">
            <input type="hidden" name="total" value="${total}">
            
            <div class="form-check mt-3">
                <input class="form-check-input" type="radio" name="paymentMethod" value="cod" id="cod" checked>
                <label class="form-check-label" for="cod">Cash on Delivery</label>
            </div>
            <button class="btn btn-primary mt-3" onclick="history.back()">Go Back</button>
            <button type="submit" class="btn btn-primary mt-3">Proceed to Order</button>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>