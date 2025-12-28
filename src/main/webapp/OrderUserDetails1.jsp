<%@ page import="java.util.List" %>
<%@ page import="bookbloom.cm.entity.Book" %>
<%
    Book book = (Book) request.getAttribute("book");
    if (book == null) {
        response.sendRedirect("home.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Purchase - Booking Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }

        .booking-container {
            max-width: 700px;
            margin: 40px auto;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.7s ease-in-out;
        }

        .booking-container h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .form-label {
            font-weight: 500;
        }

        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(101, 115, 255, 0.25);
        }

        .btn-primary {
            background: #4e54c8;
            border: none;
        }

        .btn-primary:hover {
            background: #3b40a4;
        }

        .btn-secondary {
            background: #f0f0f0;
            color: #333;
        }

        .btn-secondary:hover {
            background: #e0e0e0;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 576px) {
            .booking-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="booking-container">
        <h2>Booking Details</h2>
        <form action="OrderUserDetailsServlet2?id=<%= book.getId() %>" method="post">
            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" name="name" class="form-control" placeholder="Your full name" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Email Address</label>
                <input type="email" name="email" class="form-control" placeholder="you@example.com" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <input type="tel" name="phone" class="form-control" placeholder="1234567890" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Address</label>
                <textarea name="address" class="form-control" rows="2" placeholder="Complete delivery address" required></textarea>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Quantity</label>
                    <input type="number" name="quantity" id="quantity" class="form-control" min="1" value="1" required oninput="updateTotal()">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Price per Book</label>
                    <input type="number" id="price" name="price" class="form-control" value="<%= book.getPrice() %>" readonly>
                </div>
            </div>
            <div class="mb-4">
                <label class="form-label">Total Price</label>
                <input type="text" id="totalPrice" class="form-control" value="<%= book.getPrice() %>" readonly>
            </div>
            <button type="submit" class="btn btn-primary w-100">Submit Booking</button>
            <button type="button" class="btn btn-secondary mt-3 w-100" onclick="history.back()">Go Back</button>
        </form>
    </div>
</div>

<script>
    function updateTotal() {
        const quantity = parseInt(document.getElementById("quantity").value) || 1;
        const price = parseFloat(document.getElementById("price").value);
        const total = quantity * price;
        document.getElementById("totalPrice").value = total.toFixed(2);
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>