package CRUD;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import DB.Database;
import Model.DBUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BookAdd")
public class AddBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Hiển thị form để thêm sách mới
        request.getRequestDispatcher("/Form_Book.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form
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
        Book newBook = new Book(0, tenSach, tenLoai, tacGia, nxb, moTa, image, soLuong, giaGoc, giaBan);

        // Xử lý thêm sách vào cơ sở dữ liệu
        try (Connection conn = Database.getConnection()) {
            boolean isAdded = DBUtils.addBook(conn, newBook);
            
            if (isAdded) {
                // Nếu thêm sách thành công, chuyển hướng tới trang danh sách sách
                response.sendRedirect("BookList");
            } else {
                // Nếu không thêm được, thông báo lỗi
                request.setAttribute("errorMessage", "Có lỗi khi thêm sách!");
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
