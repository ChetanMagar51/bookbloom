<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Upload Book</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    * {
      box-sizing: border-box;
    }
@media (max-width: 576px) {
    body {
        padding: 20px;
        background: linear-gradient(135deg, #667eea, #764ba2);
    }

    .card {
        padding: 15px;
        border-radius: 10px;
        box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.15);
    }
    .error-message {
            color: #ff4c4c;
            margin-top: 10px;
            font-size: 14px;
        }

    h2 {
        font-size: 20px;
        margin-bottom: 20px;
    }

    .form-label {
        font-size: 14px;
        margin-bottom: 5px;
    }

    .form-control {
        font-size: 14px;
        padding: 10px;
    }

    .btn-upload {
        font-size: 15px;
        padding: 10px;
        border-radius: 8px;
        width: 100%;
    }

    .btn-upload i {
        margin-right: 6px;
    }
}

    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      min-height: 100vh;
      background: linear-gradient(135deg, #1e3c72, #2a5298);
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .upload-card {
      background: rgba(255, 255, 255, 0.08);
      backdrop-filter: blur(16px);
      border-radius: 20px;
      padding: 40px;
      width: 100%;
      max-width: 550px;
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.3);
      color: #fff;
      position: relative;
    }

    .upload-card h2 {
      font-weight: 600;
      margin-bottom: 30px;
      text-align: center;
      font-size: 28px;
      color: #ffffff;
    }

    .form-label {
      font-weight: 500;
      color: #ffffff;
    }

    .form-control {
      background-color: rgba(255, 255, 255, 0.15);
      border: none;
      border-radius: 12px;
      padding: 12px 15px;
      color: #fff;
      font-size: 14px;
    }

    .form-control::placeholder {
      color: #e0e0e0;
    }

    .form-control:focus {
      outline: none;
      box-shadow: 0 0 8px #00c3ff;
      background-color: rgba(255, 255, 255, 0.25);
    }

    .btn-upload {
      width: 100%;
      background: linear-gradient(90deg, #00c6ff, #0072ff);
      border: none;
      color: #fff;
      padding: 14px;
      font-size: 16px;
      border-radius: 12px;
      font-weight: 600;
      letter-spacing: 0.5px;
      transition: 0.3s ease-in-out;
      box-shadow: 0 4px 14px rgba(0, 195, 255, 0.3);
    }

    .btn-upload:hover {
      transform: translateY(-3px);
      box-shadow: 0 6px 20px rgba(0, 195, 255, 0.5);
    }
    
     .alert {
    padding: 15px;
    margin: 10px 0;
    border-radius: 5px;
    font-weight: bold;
    text-align: center;

    @media (max-width: 576px) {
      .upload-card {
        padding: 25px;
      }

      .upload-card h2 {
        font-size: 24px;
      }
    }
  </style>
</head>
<body>

  <div class="upload-card">
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
    <h2><i class="fas fa-book me-2"></i> Upload Book Details</h2>
    <form action="<%= request.getContextPath() %>/admin/UploadBookServlet"
      method="post" enctype="multipart/form-data">
   <div class="mb-3">
        <label for="title" class="form-label">Book Title</label>
        <input type="text" id="title" name="title" class="form-control" placeholder="e.g. Java Programming Masterclass" required>
      </div>
      <div class="mb-3">
        <label for="author" class="form-label"><i class="fa fa-user"></i>Author Name</label>
        <input type="text" id="author" name="author" class="form-control" placeholder="e.g. John Doe" required>
      </div>
      <div class="mb-3">
        <label for="price" class="form-label">Price <i class="fa fa-tag"></i></label>
        <input type="number" id="price" name="price" class="form-control" step="0.01" placeholder="e.g. 499.99" required>
      </div>
      <div class="mb-3">
        <label for="stock" class="form-label">Stock</label>
        <input type="number" id="stock" name="stock" class="form-control" placeholder="e.g. 25" required>
      </div>
      <div class="mb-3">
        <label for="category" class="form-label">Category</label>
        <input type="text" id="category" name="category" class="form-control" placeholder="e.g. Programming / Self Help" required>
      </div>
      <div class="mb-3">
        <label for="description" class="form-label">Book Description</label>
        <textarea id="description" name="description" rows="4" class="form-control" placeholder="Short summary of the book..." required></textarea>
      </div>
      <div class="mb-4">
        <label for="image" class="form-label">Upload Book Image</label>
        <input type="file" id="image" name="image" accept="image/*" class="form-control" required>
      </div>
      <button type="submit" class="btn btn-upload"><class="fas fa-cloud-upload-alt me-2"> Upload Book</button>
     
 <button class="btn btn-upload" onclick="window.location.href='admin_dashboard.jsp'">Cancel </button>
 
    </form>
    
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