package CRUD;

import DB.Database;
import Model.Book;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/read")
public class Read extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Book> books = new ArrayList<>();

		try (Connection conn = Database.getConnection()) {
			String sql = "SELECT MaSach, TenSach, TenLoai, TacGia, NXB, MoTa, Image, SoLuong, GiaGoc, GiaBan FROM SACH";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("MaSach");
				String name = rs.getString("TenSach");
				String category = rs.getString("TenLoai");
				String author = rs.getString("TacGia");
				String publisher = rs.getString("NXB");
				String description = rs.getString("MoTa");
				String image = rs.getString("Image");
				int quantity = rs.getInt("SoLuong");
				double originalPrice = rs.getDouble("GiaGoc");
				double salePrice = rs.getDouble("GiaBan");
				System.out.println(image);

				books.add(new Book(id, name, category, author, publisher, description, image, quantity, originalPrice,
						salePrice));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("books", books);

		request.getRequestDispatcher("Views/Form_List.jsp").forward(request, response);
	}
}
