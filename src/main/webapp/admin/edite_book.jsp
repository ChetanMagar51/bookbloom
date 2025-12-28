<%@ page import="bookbloom.cm.dao.BookDAO, bookbloom.cm.entity.Book" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    int bookId = Integer.parseInt(request.getParameter("id"));
    BookDAO bookDAO = new BookDAO();
    Book book = bookDAO.getBookById(bookId);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Book</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;600&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Outfit', sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            border-radius: 20px;
            padding: 30px;
            width: 95%;
            max-width: 450px;
            color: #fff;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.2);
        }

        .glass-card h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
            color: #fff;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            font-weight: 500;
            font-size: 15px;
            margin-bottom: 6px;
            display: block;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px 14px;
            border: none;
            border-radius: 10px;
            font-size: 14px;
            background-color: rgba(255, 255, 255, 0.2);
            color: #fff;
            outline: none;
        }

        input[type="text"]::placeholder,
        input[type="number"]::placeholder {
            color: #e0dede;
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(135deg, #764ba2, #667eea);
            color: white;
            font-size: 16px;
            font-weight: 600;
            transition: 0.3s ease;
            cursor: pointer;
        }

        button:hover {
            background: linear-gradient(135deg, #5a3e91, #586cd6);
        }

        .actions {
            margin-top: 15px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .secondary-btn,
        .cancel-link {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .cancel-link {
            text-align: center;
            display: inline-block;
            font-size: 14px;
            text-decoration: none;
            color: #eee;
        }

        .cancel-link:hover {
            text-decoration: underline;
        }

        @media screen and (max-width: 500px) {
            .glass-card {
                padding: 20px;
            }

            input, button {
                font-size: 15px;
            }
        }
    </style>
</head>
<body>

<div class="glass-card">
    <h2><i class="fas fa-pen-to-square me-1"></i> Edit Book</h2>
    <form action="EditBookServlet" method="post">
        <input type="hidden" name="id" value="<%= book.getId() %>">

        <div class="form-group">
            <label>Title</label>
            <input type="text" name="title" value="<%= book.getTitle() %>" required>
        </div>

        <div class="form-group">
            <label>Author</label>
            <input type="text" name="author" value="<%= book.getAuthor() %>" required>
        </div>

        <div class="form-group">
            <label>Price</label>
            <input type="number" step="0.01" name="price" value="<%= book.getPrice() %>" required>
        </div>

        <div class="form-group">
            <label>Image URL</label>
            <input type="text" name="imageUrl" value="<%= request.getContextPath() + "/" +  book.getImageUrl() %>" required>
        </div>

        <div class="actions">
            <button type="submit"><i class="fas fa-save me-1"></i> Update Book</button>
            <button type="button" class="secondary-btn" onclick="history.back()">
                <i class="fas fa-arrow-left me-1"></i> Go Back
            </button>
            <a href="manage_books.jsp" class="cancel-link">Cancel and go to Manage Books</a>
        </div>
    </form>
</div>

</body>
</html>