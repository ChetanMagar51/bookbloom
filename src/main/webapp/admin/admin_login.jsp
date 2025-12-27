 <%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #2c3e50, #3498db);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Login Form Container */
        .login-container {
            background: rgba(255, 255, 255, 0.1);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 350px;
            backdrop-filter: blur(10px);
            color: white;
        }

        .login-container h2 {
            margin-bottom: 20px;
            font-size: 24px;
        }

        /* Input Fields */
        .login-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            outline: none;
        }

        .login-container input[type="email"],
        .login-container input[type="password"] {
            background: rgba(255, 255, 255, 0.2);
            color: white;
        }

        .login-container input::placeholder {
            color: #ddd;
        }

        /* Button Styling */
        .login-container button {
            width: 100%;
            padding: 10px;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s ease-in-out;
            font-size: 16px;
        }

        .login-container button:hover {
            background: #2980b9;
        }

        /* Error Message */
        .error-message {
            color: #ff4c4c;
            margin-top: 10px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>

        <form action="AdminLoginServlet" method="post">
            <input type="email" name="email" placeholder="Enter your email" required>
            <input type="password" name="password" placeholder="Enter your password" required>
            <button type="submit">Login</button>
        </form>

        <% if(request.getParameter("error") != null) { %>
            <p class="error-message">Invalid email or password</p>
        <% } %>
    </div>
</body>
</html> 