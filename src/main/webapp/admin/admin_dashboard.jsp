<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="bookbloom.cm.entity.Admin" %>
<%
Admin admin = (Admin) session.getAttribute("admin");
if (admin == null) {
    response.sendRedirect("admin_login.jsp");
    return;
}

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #1E3C72, #2A5298);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: white;
        }
        .dashboard {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            text-align: center;
            width: 400px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        }
        .dashboard h2 {
            margin-bottom: 10px;
        }
        .btn {
            display: block;
            padding: 12px;
            margin: 10px 0;
            background: #0a3d62;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s;
        }
        .btn:hover {
            background: #1e5799;
            transform: scale(1.05);
        }
        .logout {
            background: #e74c3c;
        }
        .logout:hover {
            background: #c0392b;
        }
        .dark-mode {
            background: #121212;
        }
        .toggle-btn {
            margin-top: 15px;
            background: white;
            color: black;
            padding: 8px 20px;
            border-radius: 20px;
            border: none;
            cursor: pointer;
        }
        .alert {
    padding: 15px;
    margin: 10px 0;
    border-radius: 5px;
    font-weight: bold;
    text-align: center;
}

.success {
    background-color: #4CAF50;
    color: white;
}

.error {
    background-color: #f44336;
    color: white;
}
        
    </style>
</head>
<body>

<div class="dashboard">
<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
    <div class="alert success">
        <%= message %>
    </div>
<%
        session.removeAttribute("message"); // Remove after displaying
    }
%>
    <h2>Welcome, <%= admin.getName() %>!</h2>
    <h3>Admin Dashboard</h3>
    <a href="upload.jsp" class="btn">📖 Add Book</a>
    <a href="manage_books.jsp" class="btn">📚 Manage Books</a>
    <a href="AdminViewAllOrde" class="btn">📦 View Orders</a>
   
    <a href="LogoutServlet" class="btn logout">🚪 Logout</a>
    
    <!-- <button class="toggle-btn" onclick="toggleDarkMode()">🌙 Toggle Dark Mode</button> -->
    
</div>

<script>
    /* function toggleDarkMode() {
        document.body.classList.toggle("dark-mode");
    } */
    setTimeout(function() {
        var alertBox = document.querySelector(".alert");
        if (alertBox) {
            alertBox.style.display = "none";
        }
    }, 4000);

</script>

</body>
</html>