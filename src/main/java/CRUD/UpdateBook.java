package CRUD;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import DB.Database;
import Model.Book;
import Model.DBUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BookUpdate")
public class UpdateBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy ID sách từ tham số URL
        int maSach = Integer.parseInt(request.getParameter("id"));
        
        // Lấy thông tin sách từ cơ sở dữ liệu
        try (Connection conn = Database.getConnection()) {
            Book book = DBUtils.getBookById(conn, maSach);
            if (book != null) {
                // Đưa thông tin sách vào request để hiển thị trên form
                request.setAttribute("book", book);
                request.getRequestDispatcher("/Form_Book.jsp").forward(request, response);  // Trang sửa sách
            } else {
                response.sendRedirect("/BookList");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form
        int maSach = Integer.parseInt(request.getParameter("id"));
        String tenSach = request.getParameter("tenSach");
        String tenLoai = request.getParameter("tenLoai");
        String tacGia = request.getParameter("tacGia");
        String nxb = request.getParameter("nxb");
        String moTa = request.getParameter("moTa");
        String image = request.getParameter("image");
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));
        double giaGoc = Double.parseDouble(request.getParameter("giaGoc"));
        double giaBan = Double.parseDouble(request.getParameter("giaBan"));

        // Tạo đối tượng Book từ dữ liệu form
        Book updatedBook = new Book(maSach, tenSach, tenLoai, tacGia, nxb, moTa, image, soLuong, giaGoc, giaBan);

        // Xử lý cập nhật sách vào cơ sở dữ liệu
        try (Connection conn = Database.getConnection()) {
            boolean isUpdated = DBUtils.updateBook(conn, updatedBook);
            
            if (isUpdated) {
                // Nếu cập nhật sách thành công, chuyển hướng tới trang danh sách sách
                response.sendRedirect("BookList");
            } else {
                // Nếu không cập nhật được, thông báo lỗi
                request.setAttribute("errorMessage", "Có lỗi khi cập nhật sách!");
                request.getRequestDispatcher("/BookList").forward(request, response);
            }
        } catch (SQLException e) {
            // Log lỗi và hiển thị thông báo lỗi
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi kết nối cơ sở dữ liệu: " + e.getMessage());
            request.getRequestDispatcher("/BookList").forward(request, response);
        }
    }
}
