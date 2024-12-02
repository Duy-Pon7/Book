package CRUD;

import DB.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/form_create")
public class Form_Create extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Form_Create() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Views/Form_Create.jsp").forward(request, response); // Forward to your JSP page if needed
    }
    // Handles POST requests
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String firstName = request.getParameter("inputFirstName");
        String lastName = request.getParameter("inputLastName");
        String address = request.getParameter("inputAddress");
        String phone = request.getParameter("inputPhone");
        String password = request.getParameter("inputPassword");

        // Set the role as "KhachHang" (customer) by default
        String role = "KhachHang";

        // Validate form data (basic check)
        if (firstName != null && lastName != null && address != null && phone != null && password != null) {
            // Insert data into the database
            try (Connection conn = Database.getConnection()) {
                // SQL statement to insert a new account
                String sql = "INSERT INTO TAIKHOAN (SDT, MatKhau, Ho, Ten, DiaChi, VaiTro) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, phone);
                    stmt.setString(2, password);
                    stmt.setString(3, firstName);
                    stmt.setString(4, lastName);
                    stmt.setString(5, address);
                    stmt.setString(6, role);

                    // Execute the update
                    int rowsAffected = stmt.executeUpdate();

                    if (rowsAffected > 0) {
                        // Notify and redirect to Form_Login.jsp
                        request.setAttribute("message", "Tạo tài khoản thành công! Vui lòng đăng nhập.");
                        request.getRequestDispatcher("Views/Form_Login.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "Lỗi khi tạo tài khoản.");
                        request.getRequestDispatcher("Views/Form_Create.jsp").forward(request, response);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    request.setAttribute("message", "Lỗi kết nối với cơ sở dữ liệu.");
                    request.getRequestDispatcher("Views/Form_Create.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("message", "Lỗi kết nối với cơ sở dữ liệu.");
                request.getRequestDispatcher("Views/Form_Create.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("message", "Vui lòng điền đầy đủ thông tin.");
            request.getRequestDispatcher("Views/Form_Create.jsp").forward(request, response);
        }
    }
}
