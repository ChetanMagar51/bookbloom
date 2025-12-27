<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="bookbloom.cm.entity.Admin"  %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }
%>

<html>
<head>
    <title>Add New Book</title>
    <style>
        /* Modern Gradient Background */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Glassmorphism Effect */
        .container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: center;
            color: white;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
            letter-spacing: 1px;
        }

        /* Input Fields */
        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            outline: none;
            font-size: 16px;
            color: black;
            transition: 0.3s;
        }

        input:focus, select:focus {
            box-shadow: 0 0 8px rgba(255, 255, 255, 0.5);
        }

        /* File Input Customization */
        input[type="file"] {
            background: white;
            padding: 8px;
            cursor: pointer;
        }

        /* Buttons */
        .btn {
            background: #ff7b00;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
            border-radius: 5px;
            transition: 0.3s;
        }

        .btn:hover {
            background: #ff9800;
            transform: scale(1.05);
        }

        .back-btn {
            display: block;
            margin-top: 10px;
            text-decoration: none;
            color: #ffcc80;
            transition: 0.3s;
        }

        .back-btn:hover {
            color: white;
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>📚 Add New Book</h2>
    <form action="AddBookServlet" method="post" enctype="multipart/form-data">
        <input type="text" name="title" placeholder="Book Title" required>
        <input type="text" name="author" placeholder="Author Name" required>
         <input type="number" name="price" placeholder="Price (₹)" required>
        <input type="number" name="stock" placeholder="stock" required>
        
        <select name="category" required>
            <option value="" disabled selected>-- Select Category --</option>
            <option value="Fiction">Fiction</option>
            <option value="Non-Fiction">Non-Fiction</option>
            <option value="Science">Science</option>
            <option value="Technology">Technology</option>
        </select>

        <input type="file" name="bookImage" accept="image/*" required>

        <button type="submit" class="btn">📥 Add Book</button>
        <button class="btn btn-secondary mt-3" onclick="history.back()">Go Back</button>
        <a href="admin_dashboard.jsp" class="back-btn">← Back to Dashboard</a>
    </form>
</div>

</body>
</html>
	