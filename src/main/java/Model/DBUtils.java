package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;  // Đảm bảo bạn đã import lớp Statement


public class DBUtils {
	public static List<CartModel> LoadCart(Connection conn, String phone) {
		List<CartModel> list = new ArrayList<>();
		String query = "SELECT g.Id, s.Image, s.TenSach, g.SoLuong, s.DonGia, (g.SoLuong * s.DonGia) AS TongTien "
				+ "FROM GioHang g " + "JOIN SACH s ON g.MaSach = s.MaSach " + "WHERE g.Phone = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, phone); // Set giá trị của tham số số điện thoại (sdt)

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				// Tạo đối tượng Cart và thêm dữ liệu vào
				CartModel cart = new CartModel(rs.getInt("Id"), rs.getString("Image"), rs.getString("TenSach"),
						rs.getInt("SoLuong"), rs.getFloat("DonGia"), rs.getFloat("TongTien"));
				list.add(cart);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list; // Trả về danh sách giỏ hàng
	}

	public static boolean Delete1Cart(Connection conn, int id) {
		String query = "DELETE FROM GioHang WHERE Id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	public static boolean DeleteAllCart(Connection conn, String phone) {
		String query = "DELETE FROM GioHang WHERE Phone = ?";

		try {
		    PreparedStatement ps = conn.prepareStatement(query);
		    ps.setString(1, phone); 
		    int rowsAffected = ps.executeUpdate(); 
		    return rowsAffected > 0; 
		} catch (Exception ex) {
		    ex.printStackTrace(); 
		    return false; 
		}
	}

	public static int Add_bill(Connection conn, String phone, float total) {
		String query = "INSERT INTO DONMUA (Phone, TriGiaDH, NgayMua) VALUES (?, ?, ?)";
		int maDon = -1;
		try {
		    PreparedStatement ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS); // Chú ý tham số này
		    ps.setString(1, phone);
		    ps.setFloat(2, total);
		    java.time.LocalDate currentDate = java.time.LocalDate.now();
		    java.sql.Date sqlDate = java.sql.Date.valueOf(currentDate);
		    ps.setDate(3, sqlDate);

		    int rowsAffected = ps.executeUpdate();
		    if (rowsAffected > 0) {
		        // Lấy khóa chính vừa được tạo
		        ResultSet generatedKeys = ps.getGeneratedKeys();
		        if (generatedKeys.next()) {
		            maDon = generatedKeys.getInt(1); // Lấy giá trị MaDon (khóa chính) vừa chèn
		            System.out.println("Mã đơn vừa tạo: " + maDon);
		            return maDon; // Trả về MaDon mới tạo
		        }
		    }
		    return maDon;
		} catch (Exception ex) {
		    ex.printStackTrace();
		    return maDon;
		}

	}

	public static boolean Add_InfBill(Connection conn, String phone, int maDon) {
		String query = "INSERT INTO THONGTINDONMUA (MaDon, MaSach, SoLuong) " + "SELECT ?, MaSach, SoLuong "
				+ "FROM GioHang " + "WHERE Phone = ?";

		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, maDon);
			ps.setString(2, phone);
			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;

		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
}
