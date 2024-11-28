package CRUD;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import DB.Database;
import Model.Book;

@WebServlet("/form_detail")
public class Form_Detail extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Form_Detail() {
        super();
    }

    // Method to get book details from the database based on MaSach
    private Book getBookDetails(int bookId) {
        Book book = null;
        String sql = "SELECT * FROM SACH WHERE MaSach = ?";
        
        try (Connection conn = Database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, bookId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                book = new Book(
                        rs.getInt("MaSach"),         // Book ID (MaSach)
                        rs.getString("TenSach"),      // Book Name (TenSach)
                        rs.getString("TenLoai"),      // Category (TenLoai)
                        rs.getString("TacGia"),       // Author (TacGia)
                        rs.getString("NXB"),          // Publisher (NXB)
                        rs.getString("MoTa"),         // Description (MoTa)
                        rs.getString("Image"),        // Image (Image)
                        rs.getInt("SoLuong"),         // Quantity (SoLuong)
                        rs.getDouble("GiaGoc"),       // Original Price (GiaGoc)
                        rs.getDouble("GiaBan")        // Sale Price (GiaBan)
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return book;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String bookIdParam = request.getParameter("bookId");
        int bookId = 1; // Default ID nếu không có ID được truyền vào

        if (bookIdParam != null) {
            try {
                bookId = Integer.parseInt(bookIdParam);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        // Retrieve book details
        Book book = getBookDetails(bookId);
        
        if (book != null) {
            // Set book details as request attributes to display in JSP
            request.setAttribute("book", book);
        } else {
            // Handle case if no book is found (optional)
            request.setAttribute("errorMessage", "Book not found.");
        }

        // Forward to JSP
        request.getRequestDispatcher("/Views/Form_Detail.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
