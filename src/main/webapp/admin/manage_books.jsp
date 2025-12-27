<%@ page import="java.util.List" %>
<%@ page import="bookbloom.cm.entity.Book" %>
<%@ page import="bookbloom.cm.dao.BookDAO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Manage Books</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #fdfbfb, #ebedee);
            margin: 0;
            padding: 0;
        }

        header {
            background: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 26px;
            font-weight: bold;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
        }

        .container {
            padding: 30px;
            text-align: center;
        }

        .alert {
            background: #2ecc71;
            color: white;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-weight: bold;
            display: inline-block;
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from {opacity: 0;}
            to {opacity: 1;}
        }

        .btn {
            padding: 10px 16px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            margin: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn:hover {
            transform: scale(1.05);
        }

        .back-btn {
            background: #3498db;
            color: white;
        }

        .go-back {
            background: #95a5a6;
            color: white;
        }

        table {
            width: 95%;
            margin: 20px auto;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 14px 20px;
            text-align: center;
        }

        th {
            background: #34495e;
            color: white;
            font-size: 16px;
        }

        tr:nth-child(even) {
            background: #f9f9f9;
        }

        tr:hover {
            background: #ecf0f1;
        }

        img {
            width: 60px;
            height: 80px;
            object-fit: cover;
            border-radius: 4px;
        }

        .edit-btn {
            background: #27ae60;
            color: white;
        }

        .delete-btn {
            background: #e74c3c;
            color: white;
        }

        .edit-btn:hover {
            background: #2ecc71;
        }

        .delete-btn:hover {
            background: #c0392b;
        }

        footer {
            text-align: center;
            padding: 10px;
            color: #999;
            font-size: 14px;
        }
    </style>
</head>
<body>

<header>📚 Book Management Panel</header>

<div class="container">
<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
    <div class="alert"><%= message %></div>
<%
        session.removeAttribute("message");
    }
%>

<%
    BookDAO bookDAO = new BookDAO();
    List<Book> bookList = bookDAO.getAllBooks();
%>

    <button class="btn go-back" onclick="history.back()">⬅ Go Back</button>
    <a href="admin_dashboard.jsp" class="btn back-btn">🏠 Back to Home</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Image</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Action</th>
        </tr>

        <%
            for (Book book : bookList) {
        %>
        <tr>
            <td><%= book.getId() %></td>
            <td><img src="<%= request.getContextPath() + "/"+ book.getImageUrl() %>" alt="Book Image"></td>
            <td><%= book.getTitle() %></td>
            <td><%= book.getAuthor() %></td>
            <td>₹<%= book.getPrice() %></td>
            <td><%= book.getStock() %></td>
            <td>
                <a class="btn edit-btn" href="edite_book.jsp?id=<%= book.getId() %>">✏ Edit</a>
                <a class="btn delete-btn" href="DeleteBookServlet?id=<%= book.getId() %>"
                   onclick="return confirm('Are you sure you want to delete this book?');">
                   🗑 Delete
                </a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>

<footer>© <%= java.time.Year.now() %> BookBloom Admin Panel</footer>

<script>
    setTimeout(() => {
        const alertBox = document.querySelector(".alert");
        if (alertBox) alertBox.style.display = "none";
    }, 4000);
</script>

</body>
</html>