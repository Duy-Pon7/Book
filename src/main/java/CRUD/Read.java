package CRUD;

import DB.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/read")
public class Read extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> books = new ArrayList<>();
        
        try (Connection conn = Database.getConnection()) {
            // Truy vấn dữ liệu từ bảng sách
            String sql = "SELECT id, name, original_price, sale_price, description, image FROM books";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            // Đọc kết quả và thêm vào danh sách sách
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double originalPrice = rs.getDouble("original_price");
                double salePrice = rs.getDouble("sale_price");
                String description = rs.getString("description");
                String image = rs.getString("image");
                System.out.println(image);
                // Tạo đối tượng Book và thêm vào danh sách
                books.add(new Book(id, name, originalPrice, salePrice, description, image));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        // Lưu danh sách sách vào request
        request.setAttribute("books", books);
        
        // Chuyển tiếp yêu cầu tới JSP để hiển thị
        RequestDispatcher dispatcher = request.getRequestDispatcher("Views/Form_List.jsp");
        dispatcher.forward(request, response);
    }
}
