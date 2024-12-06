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
import java.util.ArrayList;
import java.util.List;

import DB.Database;
import Model.Book;

@WebServlet("/form_detail")
public class Form_Detail extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Form_Detail() {
        super();
    }

    // Lấy danh sách sách theo thể loại
    private List<Book> getBooksByCategory(String category) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM SACH WHERE TenLoai = ?";

        try (Connection conn = Database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, category);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Book book = new Book(
                        rs.getInt("MaSach"),
                        rs.getString("TenSach"),
                        rs.getString("TenLoai"),
                        rs.getString("TacGia"),
                        rs.getString("NXB"),
                        rs.getString("MoTa"),
                        rs.getString("Image"),
                        rs.getInt("SoLuong"),
                        rs.getDouble("GiaGoc"),
                        rs.getDouble("GiaBan")
                );
                books.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }

    // Phân nhóm sách theo kích thước nhóm
    private List<List<Book>> groupBooks(List<Book> books, int groupSize) {
        List<List<Book>> groupedBooks = new ArrayList<>();
        for (int i = 0; i < books.size(); i += groupSize) {
            int end = Math.min(i + groupSize, books.size());
            groupedBooks.add(books.subList(i, end));
        }
        return groupedBooks;
    }

    // Lấy chi tiết sách theo ID
    private Book getBookDetails(int bookId) {
        Book book = null;
        String sql = "SELECT * FROM SACH WHERE MaSach = ?";

        try (Connection conn = Database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, bookId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                book = new Book(
                        rs.getInt("MaSach"),
                        rs.getString("TenSach"),
                        rs.getString("TenLoai"),
                        rs.getString("TacGia"),
                        rs.getString("NXB"),
                        rs.getString("MoTa"),
                        rs.getString("Image"),
                        rs.getInt("SoLuong"),
                        rs.getDouble("GiaGoc"),
                        rs.getDouble("GiaBan")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return book;
    }

    // Phương thức GET để xử lý yêu cầu từ người dùng
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookIdParam = request.getParameter("bookId");
        int bookId = 1; // Mặc định là 1 nếu không có ID được truyền vào

        if (bookIdParam != null) {
            try {
                bookId = Integer.parseInt(bookIdParam); // Chuyển từ chuỗi sang số nguyên
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // Lấy thông tin chi tiết sách
        Book book = getBookDetails(bookId);

        if (book != null) {
            // Gửi thông tin sách vào JSP để hiển thị
            request.setAttribute("book", book);

            // Lấy danh sách sách theo thể loại của cuốn sách hiện tại
            List<Book> booksByCategory = getBooksByCategory(book.getCategory());

            // Phân nhóm sách theo thể loại để hiển thị trong carousel
            List<List<Book>> booksByCategoryGrouped = groupBooks(booksByCategory, 4);
            request.setAttribute("booksByCategoryGrouped", booksByCategoryGrouped);
        } else {
            request.setAttribute("errorMessage", "Sách không tìm thấy.");
        }

        // Chuyển tiếp sang JSP để hiển thị
        request.getRequestDispatcher("/Views/Form_Detail.jsp").forward(request, response);
    }

    // Phương thức POST để xử lý khi người dùng gửi dữ liệu
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
