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

@WebServlet("/addcart")
public class AddCart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddCart() {
        super();
    }

    // Handles GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the parameters passed from the frontend (bookId, quantity, sdt)
        String bookId = request.getParameter("bookId");
        String quantity = request.getParameter("quantity");
        String sdt = request.getParameter("sdt");

        // Validate the data (make sure bookId, quantity, and sdt are provided)
        if (bookId != null && quantity != null && sdt != null) {
            try (Connection conn = Database.getConnection()) {
                // SQL statement to insert into GIOHANG table
                String sql = "INSERT INTO GIOHANG (SDT, MaSach, SoLuong) VALUES (?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, sdt);           // Set the phone number (SDT)
                    stmt.setInt(2, Integer.parseInt(bookId));  // Set the book ID (MaSach)
                    stmt.setInt(3, Integer.parseInt(quantity)); // Set the quantity (SoLuong)

                    // Execute the insert statement
                    int rowsInserted = stmt.executeUpdate();

                    if (rowsInserted > 0) {
                        // If insert is successful, set a success message
                        request.setAttribute("message", "Đã thêm sách vào giỏ hàng!");
                    } else {
                        // If insert fails, set a failure message
                        request.setAttribute("message", "Lỗi khi thêm vào giỏ hàng.");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    request.setAttribute("message", "Lỗi khi kết nối với cơ sở dữ liệu.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("message", "Lỗi khi kết nối với cơ sở dữ liệu.");
            }
        } else {
            request.setAttribute("message", "Vui lòng điền đầy đủ thông tin.");
        }

        // Forward the request to a JSP page (you can customize the page)
        //request.getRequestDispatcher("Views/Cart.jsp").forward(request, response);
    }

    // Handles POST requests (if needed for future functionality)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);  // For this case, we only handle GET requests
    }
}
