package CRUD;

import DB.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/addcart")
public class AddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddCart() {
		super();
	}

	// Handles GET requests
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String bookId = request.getParameter("bookId");
		String quantity = request.getParameter("quantity");
		String sdt = request.getParameter("sdt");
		String btn = request.getParameter("btn");
		System.out.println(btn);

		try (Connection conn = Database.getConnection()) {
			// Check if the record with the given SDT and MaSach already exists
			String checkSql = "SELECT SoLuong FROM GIOHANG WHERE SDT = ? AND MaSach = ?";
			try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
				checkStmt.setString(1, sdt);
				checkStmt.setInt(2, Integer.parseInt(bookId));
				ResultSet rs = checkStmt.executeQuery();

				if (rs.next()) {
					// If record exists, update the quantity
					int currentQuantity = rs.getInt("SoLuong");
					int newQuantity = currentQuantity + Integer.parseInt(quantity);

					String updateSql = "UPDATE GIOHANG SET SoLuong = ? WHERE SDT = ? AND MaSach = ?";
					try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
						updateStmt.setInt(1, newQuantity);
						updateStmt.setString(2, sdt);
						updateStmt.setInt(3, Integer.parseInt(bookId));

						int rowsUpdated = updateStmt.executeUpdate();
						if (rowsUpdated > 0) {
							if ("bn".equals(btn)) {
								response.sendRedirect(
										request.getContextPath() + "/ViewCart?sdt=" + URLEncoder.encode(sdt, "UTF-8"));
							} else {
								response.sendRedirect(
										request.getContextPath() + "/form_detail?bookId=" + URLEncoder.encode(bookId, "UTF-8"));
							}
						}
					}
				} else {
					// If the record does not exist, insert a new one
					String insertSql = "INSERT INTO GIOHANG (SDT, MaSach, SoLuong) VALUES (?, ?, ?)";
					try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
						insertStmt.setString(1, sdt);
						insertStmt.setInt(2, Integer.parseInt(bookId));
						insertStmt.setInt(3, Integer.parseInt(quantity));

						int rowsInserted = insertStmt.executeUpdate();
						if (rowsInserted > 0) {
							if ("bn".equals(btn)) {
								response.sendRedirect(
										request.getContextPath() + "/ViewCart?sdt=" + URLEncoder.encode(sdt, "UTF-8"));
							} else {
								response.sendRedirect(
										request.getContextPath() + "/form_detail?bookId=" + URLEncoder.encode(bookId, "UTF-8"));
							}
						}
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
				request.setAttribute("message", "Lỗi khi kết nối với cơ sở dữ liệu.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("message", "Lỗi khi kết nối với cơ sở dữ liệu.");
		}
	}

	// Handles POST requests (if needed for future functionality)
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response); // For this case, we only handle GET requests
	}
}
