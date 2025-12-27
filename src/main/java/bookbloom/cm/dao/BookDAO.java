package bookbloom.cm.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bookbloom.cm.db.DBConnection;
import bookbloom.cm.entity.Book;

public class BookDAO {

    // Method to fetch all books from the database
    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM books";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setImageUrl(rs.getString("image_url")); // Fetch image URL
                book.setStock(rs.getInt("stock"));

                books.add(book);

            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return books;
    }
    
    public List<Book> getShortedBook(String title) {
        List<Book> books = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM books where title=?";
            
            
            
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, title);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setImageUrl(rs.getString("image_url")); // Fetch image URL
                book.setStock(rs.getInt("stock"));

                books.add(book);

            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return books;
    }

    // Method to fetch a single book by ID
    public Book getBookById(int bookId) {
        String query = "SELECT * FROM books WHERE id = ?";
        Book book = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, bookId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                book = new Book(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("author"),
                    rs.getDouble("price"),
                    rs.getString("image_url"),
                    rs.getString("description"),
                    rs.getString("category"),
                    rs.getInt("stock")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }
    
    public Book getBookById(long bookId) {
        String query = "SELECT * FROM books WHERE id = ?";
        Book book = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, (int)bookId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                book = new Book(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("author"),
                    rs.getDouble("price"),
                    rs.getString("image_url"),
                    rs.getString("description"),
                    rs.getString("category"),
                    rs.getInt("stock")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    // Method to add a new book
    public boolean addBook(Book book) {
        String query = "INSERT INTO books (title, author, price, image_url, description, category, stock) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, book.getTitle());
            stmt.setString(2, book.getAuthor());
            stmt.setDouble(3, book.getPrice());
            stmt.setString(4, book.getImageUrl());
            stmt.setString(5, book.getDescription());
            stmt.setString(6, book.getCategory());
            stmt.setInt(7, book.getStock());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to update an existing book
    public boolean updateBook(Book book) {
        String query = "UPDATE books SET title = ?, author = ?, price = ?, image_url = ?, description = ?, category = ?, stock = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, book.getTitle());
            stmt.setString(2, book.getAuthor());
            stmt.setDouble(3, book.getPrice());
            stmt.setString(4, book.getImageUrl());
            stmt.setString(5, book.getDescription());
            stmt.setString(6, book.getCategory());
            stmt.setInt(7, book.getStock());
            stmt.setInt(8, book.getId());

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to delete a book by ID
    public boolean deleteBook(int bookId) {
        String query = "DELETE FROM books WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, bookId);
            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
    public boolean AlterBookQuantity(int bookId, int qun) {
        String query = "update books set STOCK = ?  WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(2, bookId);
            stmt.setInt(1, qun);
            int update = stmt.executeUpdate();
            return update > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}