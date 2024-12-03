package CRUD;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;

import DB.Database;
import Model.Book;
import Model.DBUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/BookUpdate")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class UpdateBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "Images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int maSach = Integer.parseInt(request.getParameter("id"));

        try (Connection conn = Database.getConnection()) {
            Book book = DBUtils.getBookById(conn, maSach);
            if (book != null) {
                request.setAttribute("book", book);
                request.getRequestDispatcher("/Form_Book.jsp").forward(request, response);
            } else {
                response.sendRedirect("BookList");
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
        String oldImage = request.getParameter("nameimg"); // Tên ảnh cũ
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));
        double giaGoc = Double.parseDouble(request.getParameter("giaGoc"));
        double giaBan = Double.parseDouble(request.getParameter("giaBan"));

        // Xử lý upload file ảnh
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String image = oldImage; // Mặc định giữ nguyên ảnh cũ
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            if (part.getName().equals("image") && part.getSize() > 0) {
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                part.write(uploadPath + File.separator + fileName);
                image = fileName; // Cập nhật tên file mới
            }
        }

        // Tạo đối tượng Book từ dữ liệu form
        Book updatedBook = new Book(maSach, tenSach, tenLoai, tacGia, nxb, moTa, image, soLuong, giaGoc, giaBan);

        try (Connection conn = Database.getConnection()) {
            boolean isUpdated = DBUtils.updateBook(conn, updatedBook);

            if (isUpdated) {
                response.sendRedirect("BookList");
            } else {
                request.setAttribute("errorMessage", "Có lỗi khi cập nhật sách!");
                request.getRequestDispatcher("/BookList").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi kết nối cơ sở dữ liệu: " + e.getMessage());
            request.getRequestDispatcher("/BookList").forward(request, response);
        }
    }
}
