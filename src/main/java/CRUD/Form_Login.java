package CRUD;

import DB.Database; // Lớp Database tự định nghĩa, đảm bảo đã tồn tại.
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class Form_Login
 */
@WebServlet("/form_login") // Đảm bảo URL mapping trùng với form action
public class Form_Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Form_Login() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("errorMessage", "Tên đăng nhập và mật khẩu không được để trống!");
            request.getRequestDispatcher("Views/Form_Login.jsp").forward(request, response);
            return;
        }

        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT * FROM TAIKHOAN WHERE SDT = ? AND MatKhau = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, username);
                ps.setString(2, password);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        // Đăng nhập thành công
                        HttpSession session = request.getSession();
                        session.setAttribute("SDT", username); // Lưu số điện thoại vào session
                        response.sendRedirect(request.getContextPath() + "/read");
                    } else {
                        // Đăng nhập thất bại
                        request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng!");
                        request.getRequestDispatcher("Views/Form_Login.jsp").forward(request, response);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi kết nối cơ sở dữ liệu!");
            request.getRequestDispatcher("Views/Form_Login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/Views/Form_Login.jsp");
    }
}
