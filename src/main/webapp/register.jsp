<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #74b9ff, #81ecec);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .card {
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            padding: 30px;
            width: 100%;
            max-width: 450px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2d3436;
        }

        .btn-register {
            background-color: #0984e3;
            color: white;
            font-weight: 600;
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .btn-register:hover {
            background-color: #74b9ff;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
        }

        .login-link a {
            text-decoration: none;
            color: #0984e3;
            font-weight: 600;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card mx-auto">
            <h2>Create Your Account</h2>

            <%-- Display error message if registration fails --%>
            <% String message = request.getParameter("message"); %>
            <% if (message != null) { %>
                <p class="error-message"><%= message %></p>
            <% } %>
            
				<% String error = request.getParameter("error");
				   if (error != null) { %>
					<p id="errorMessage" class="error-message"><%= error %></p>
				<% } %>

            <form action="RegisterServlet" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" id="name" name="name" class="form-control" placeholder="Enter your name" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="btn btn-register">Register</button>
            </form>

            <p class="login-link">Already registered? <a href="login.jsp">Login here</a>
            </p>
        </div>
    </div>
<script>
		// Hide error message after 3 seconds
		setTimeout(function () {
			var errorMessage = document.getElementById("errorMessage");
			if (errorMessage) {
				errorMessage.style.display = "none";
			}
		}, 3000);
	</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>