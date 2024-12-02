package CRUD;

import DB.Database;
import Model.Book;
import Model.DBUtils;
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
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet("/read")
public class Read extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Book> books = new ArrayList<>();
		List<Book> filter = new ArrayList<>();
		String theLoai = request.getParameter("theLoai");
		String nxb = request.getParameter("nxb");
		String gia = request.getParameter("gia");
		float giaMin = -1.0f;
		float giaMax = -1.0f;
		if (gia != null && !"empty".equals(gia)) {
			String[] parts = gia.split("-");
	        if (parts.length == 2) { 
	            try {
	                giaMin = Float.parseFloat(parts[0]);
	                giaMax = Float.parseFloat(parts[1]);
	            } catch (NumberFormatException e) {
	            	giaMin = Float.parseFloat(parts[0]);
	            }
	        } 
		}
		try (Connection conn = Database.getConnection()) {			
			StringBuilder sqlBuilder = new StringBuilder("SELECT MaSach, TenSach, TenLoai, TacGia, NXB, MoTa, Image, SoLuong, GiaGoc, GiaBan FROM SACH WHERE 1=1");
			if (theLoai != null && !"empty".equals(theLoai)) { sqlBuilder.append(" AND TenLoai = ?");}
			if (nxb != null && !"empty".equals(nxb)) { sqlBuilder.append(" AND NXB = ?");}
			if (giaMin != -1.0f) { sqlBuilder.append(" AND GiaBan >= ?");}
			if (giaMax != -1.0f) { sqlBuilder.append(" AND GiaBan <= ?");}
			PreparedStatement ps = conn.prepareStatement( sqlBuilder.toString());
			int paramIndex = 1;
			if (theLoai != null && !"empty".equals(theLoai)) { ps.setString(paramIndex++, theLoai);}
			if (nxb != null && !"empty".equals(nxb)) { ps.setString(paramIndex++, nxb);}		
			if (giaMin != -1.0f) { ps.setDouble(paramIndex++, giaMin);}
			if (giaMax != -1.0f) { ps.setDouble(paramIndex++, giaMax);}
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
				books.add(new Book(id, name, category, author, publisher, description, image, quantity, originalPrice, salePrice));
			}
			filter = DBUtils.LoadHomeList(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Set<String> uniqueCategories = new HashSet<>();
		Set<String> uniquePublishers = new HashSet<>();
		Set<String> uniqueName = new HashSet<>();
		for (Book book : filter) {
		    uniqueCategories.add(book.getCategory());
		    uniquePublishers.add(book.getPublisher());
		    uniqueName.add(book.getName());
		}

		request.setAttribute("uniqueCategories", new ArrayList<>(uniqueCategories));
		request.setAttribute("uniquePublishers", new ArrayList<>(uniquePublishers));
		request.setAttribute("uniqueName", new ArrayList<>(uniqueName));
		request.setAttribute("books", books);
		request.setAttribute("theLoai", theLoai);
		request.setAttribute("nxb", nxb);
		request.setAttribute("gia", gia);
		request.getRequestDispatcher("Views/Form_List.jsp").forward(request, response);
	}
}
