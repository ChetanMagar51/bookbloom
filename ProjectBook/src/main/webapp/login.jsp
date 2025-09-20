<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>User Login</title>

	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

	<style>
		body {
			font-family: 'Poppins', sans-serif;
			background: linear-gradient(to right, #74ebd5, #acb6e5);
			height: 100vh;
			display: flex;
			align-items: center;
			justify-content: center;
		}

		.card {
			border: none;
			border-radius: 15px;
			overflow: hidden;
			box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
			max-width: 900px;
			width: 100%;
		}

		.login-image {
			background: url('https://source.unsplash.com/400x500/?books,library') no-repeat center center;
			background-size: cover;
		}

		.login-form {
			padding: 40px 30px;
			background: #fff;
		}

		.login-form h2 {
			font-weight: 600;
			margin-bottom: 25px;
			color: #333;
		}

		.btn-login {
			background-color: #3498db;
			color: white;
			font-weight: 500;
			transition: 0.3s;
		}

		.btn-login:hover {
			background-color: #2980b9;
		}

		.register-link {
			margin-top: 15px;
			font-size: 14px;
			color: #666;
		}

		.register-link a {
			color: #3498db;
			text-decoration: none;
		}

		.register-link a:hover {
			text-decoration: underline;
		}

		.error-message {
			color: #e74c3c;
			background: #fbeaea;
			padding: 8px 12px;
			border-radius: 5px;
			margin-bottom: 15px;
			font-size: 14px;
		}

		@media (max-width: 768px) {
			.login-image {
				display: none;
			}
			.login-form {
				padding: 30px 20px;
			}
		}
	</style>
</head>
<body>

	<div class="container">
		<div class="card mx-auto row">
			<!-- Image Section -->
			<div class="col-md-6 login-image d-none d-md-block"></div>

			<!-- Login Form Section -->
			<div class="col-md-6 login-form">
				<h2>Welcome Back!</h2>
				
				

				<% String error = request.getParameter("error");
				   if (error != null) { %>
					<p id="errorMessage" class="error-message"><%= error %></p>
				<% } %>

				<form action="UserLoginServlet" method="post">
					<input type="hidden" name="userType" value="user">

					<div class="mb-3">
						<label for="email" class="form-label">Email:</label>
						<input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
					</div>

					<div class="mb-3">
						<label for="password" class="form-label">Password:</label>
						<input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
					</div>

					<button type="submit" class="btn btn-login w-100">Login</button>
				</form>

				<p class="register-link">
					Don't have an account? <a href="register.jsp">Register here</a>
				</p>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		// Hide error message after 3 seconds
		setTimeout(function () {
			var errorMessage = document.getElementById("errorMessage");
			if (errorMessage) {
				errorMessage.style.display = "none";
			}
		}, 3000);
	</script>

</body>
</html>
