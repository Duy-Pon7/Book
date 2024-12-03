package CRUD;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.SQLException;

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

@WebServlet("/BookAdd")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class AddBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "Images";

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
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));
        double giaGoc = Double.parseDouble(request.getParameter("giaGoc"));
        double giaBan = Double.parseDouble(request.getParameter("giaBan"));

        // Xử lý upload file ảnh
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String image = "default.jpg"; // Ảnh mặc định nếu không có ảnh được upload
        Part filePart = request.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            filePart.write(uploadPath + File.separator + fileName);
            image = fileName; // Lưu tên file mới
        }

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
                request.getRequestDispatcher("/Form_Book.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            // Log lỗi và hiển thị thông báo lỗi
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi kết nối cơ sở dữ liệu: " + e.getMessage());
            request.getRequestDispatcher("/Form_Book.jsp").forward(request, response);
        }
    }
}
