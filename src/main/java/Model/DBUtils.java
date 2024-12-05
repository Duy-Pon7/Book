package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import DB.Database;

import java.sql.Statement;  // Đảm bảo bạn đã import lớp Statement


public class DBUtils {
	public static boolean updateKhachHang(Connection conn, KhachHangModel KH){
        String query = "UPDATE TAIKHOAN SET MatKhau = ?, Ho = ?, Ten = ?, DiaChi = ? WHERE SDT = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
        	ps.setString(1, KH.getMatKhau());
            ps.setString(2, KH.getHo());
            ps.setString(3, KH.getTen());
            ps.setString(4, KH.getDiaChi());
            ps.setString(5, KH.getsDT());
            return ps.executeUpdate() > 0;
        }catch (Exception ex) {
		    ex.printStackTrace(); 
		    return false; 
		}
    }
	public static List<KhachHangModel> layIn4KH(Connection conn, String sdt){
		String query = "SELECT * from TAIKHOAN where SDT = ?";
		List<KhachHangModel> kh = new ArrayList<>();
		try { 
				PreparedStatement ps = conn.prepareStatement(query);
				ps.setString(1, sdt);
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            kh.add(new KhachHangModel(
		                rs.getString("SDT"),
		                rs.getString("MatKhau"),
		                rs.getString("Ho"),
		                rs.getString("Ten"),
		                rs.getString("DiaChi")
		            ));
		        }
		    } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    return kh;
	}
	// Phương thức lấy sách theo ID
    public static Book getBookById(Connection conn, int maSach) throws SQLException {
        String query = "SELECT * FROM SACH WHERE MaSach = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, maSach);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Tạo đối tượng Book và gán dữ liệu từ cơ sở dữ liệu
                    Book book = new Book(
                        rs.getInt("MaSach"),
                        rs.getString("TenSach"),
                        rs.getString("TenLoai"),
                        rs.getString("TacGia"),
                        rs.getString("NXB"),
                        rs.getString("MoTa"),
                        rs.getString("Image"),
                        rs.getInt("SoLuong"),
                        rs.getDouble("GiaGoc"),
                        rs.getDouble("GiaBan")
                    );
                    return book; // Trả về đối tượng sách
                }
            }
        }
        return null; // Nếu không tìm thấy sách, trả về null
    }
	public static List<Book> getBooks(Connection conn) throws Exception {
	    String query = "SELECT * FROM SACH";
	    List<Book> books = new ArrayList<>();
	    try (PreparedStatement ps = conn.prepareStatement(query);
	         ResultSet rs = ps.executeQuery()) {
	        while (rs.next()) {
	            books.add(new Book(
	                rs.getInt("MaSach"),
	                rs.getString("TenSach"),
	                rs.getString("TenLoai"),
	                rs.getString("TacGia"),
	                rs.getString("NXB"),
	                rs.getString("MoTa"),
	                rs.getString("Image"),
	                rs.getInt("SoLuong"),
	                rs.getDouble("GiaGoc"),
	                rs.getDouble("GiaBan")
	            ));
	        }
	    }
	    return books;
	}

    // Hàm thêm sách mới
    public static boolean addBook(Connection conn, Book book){
        String query = "INSERT INTO SACH (TenSach, TenLoai, TacGia, NXB, MoTa, Image, SoLuong, GiaGoc, GiaBan) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, book.getName());
            ps.setString(2, book.getCategory());
            ps.setString(3, book.getAuthor());
            ps.setString(4, book.getPublisher());
            ps.setString(5, book.getDescription());
            ps.setString(6, book.getImage());
            ps.setInt(7, book.getQuantity());
            ps.setDouble(8, book.getOriginalPrice());
            ps.setDouble(9, book.getSalePrice());
            return ps.executeUpdate() > 0;
        }catch (Exception ex) {
		    ex.printStackTrace(); 
		    return false; 
		}
    }


    public static boolean updateBook(Connection conn, Book book){
        String query = "UPDATE SACH SET TenSach = ?, TenLoai = ?, TacGia = ?, NXB = ?, MoTa = ?, Image = ?, " +
                       "SoLuong = ?, GiaGoc = ?, GiaBan = ? WHERE MaSach = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
        	ps.setString(1, book.getName());
            ps.setString(2, book.getCategory());
            ps.setString(3, book.getAuthor());
            ps.setString(4, book.getPublisher());
            ps.setString(5, book.getDescription());
            ps.setString(6, book.getImage());
            ps.setInt(7, book.getQuantity());
            ps.setDouble(8, book.getOriginalPrice());
            ps.setDouble(9, book.getSalePrice());
            ps.setInt(10, book.getId());
            return ps.executeUpdate() > 0;
        }catch (Exception ex) {
		    ex.printStackTrace(); 
		    return false; 
		}
    }


    // Hàm xóa sách
    public static boolean deleteBook(Connection conn, int id) {
        String query = "DELETE FROM SACH WHERE MaSach=?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public static List<ThongTinDonMuaModel> layTTDonMua(Connection conn, int ma) {
	    List<ThongTinDonMuaModel> list = new ArrayList<>();
	    String query = "SELECT T.MaDon, S.MaSach, S.TenSach, S.Image, S.GiaBan, T.SoLuong AS SoLuong FROM SACH S JOIN THONGTINDONMUA T ON S.MaSach = T.MaSach WHERE T.MaDon = ?";
	    try {
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setInt(1, ma);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            // Tạo đối tượng DonMuaModel và thêm dữ liệu vào danh sách
	        	ThongTinDonMuaModel ttDonMua = new ThongTinDonMuaModel(rs.getInt("MaDon"), rs.getInt("MaSach"), rs.getString("TenSach"), rs.getString("Image"), rs.getFloat("GiaBan"), rs.getInt("SoLuong"));
	            list.add(ttDonMua);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	    return list; // Trả về danh sách đơn mua
	}
	public static List<DonMuaModel> LoadDonMua(Connection conn) {
	    List<DonMuaModel> list = new ArrayList<>();
	    String query = "SELECT * from DONMUA";
	    try {
	        PreparedStatement ps = conn.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            // Tạo đối tượng DonMuaModel và thêm dữ liệu vào danh sách
	            DonMuaModel donMua = new DonMuaModel(rs.getInt("MaDon"), 
	                    rs.getString("SDT"), 
	                    rs.getDate("NgayMua"), 
	                    rs.getFloat("TriGiaDH"),
	                    rs.getString("DiaChi")
	                );
	            list.add(donMua);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	    return list; // Trả về danh sách đơn mua
	}
	
	public static List<Book> LoadHomeList(Connection conn){
		List<Book> books = new ArrayList<>();
		try{
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
		return books;
	}
	public static List<CartModel> LoadCart(Connection conn, String phone) {
		List<CartModel> list = new ArrayList<>();
		String query = "SELECT g.Id, s.Image, s.TenSach, g.SoLuong, s.GiaBan, (g.SoLuong * s.GiaBan) AS TongTien "
				+ "FROM GIOHANG g " + "JOIN SACH s ON g.MaSach = s.MaSach " + "WHERE g.SDT = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, phone); // Set giá trị của tham số số điện thoại (sdt)

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				// Tạo đối tượng Cart và thêm dữ liệu vào
				CartModel cart = new CartModel(rs.getInt("Id"), rs.getString("Image"), rs.getString("TenSach"),
						rs.getInt("SoLuong"), rs.getFloat("GiaBan"), rs.getFloat("TongTien"));
				list.add(cart);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list; // Trả về danh sách giỏ hàng
	}

	public static boolean Delete1Cart(Connection conn, int id) {
		String query = "DELETE FROM GIOHANG WHERE Id = ?";
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
	
	public static boolean UpdateCart(Connection conn, int id, int soluong) {
		String query = "UPDATE GIOHANG SET SoLuong = ? WHERE Id = ?";

	    try {
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setInt(1, soluong); 
	        ps.setInt(2, id);     

	        int rowsAffected = ps.executeUpdate();
	        return rowsAffected > 0; 
	    } catch (Exception ex) {
	        ex.printStackTrace();
	        return false; 
	    }
	}
	public static int Add_bill(Connection conn, String phone, float total, String diaChi) {
		String query = "INSERT INTO DONMUA (SDT, TriGiaDH, NgayMua, DiaChi) VALUES (?, ?, ?, ?)";
		int maDon = -1;
		try {
		    PreparedStatement ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS); // Chú ý tham số này
		    ps.setString(1, phone);
		    ps.setFloat(2, total);
		    java.time.LocalDate currentDate = java.time.LocalDate.now();
		    java.sql.Date sqlDate = java.sql.Date.valueOf(currentDate);
		    ps.setDate(3, sqlDate);
		    ps.setString(4, diaChi);

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
		String query = "INSERT INTO THONGTINDONMUA (MaDon, MaSach, SoLuong) " + "SELECT ?, MaSach, SoLuong FROM GIOHANG " + "WHERE SDT = ?";

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
	
	public static List<AddressModel> LoadAdress(Connection conn, String phone) {
		List<AddressModel> list = new ArrayList<>();
		String query = "SELECT Id, SDT, DiaChi "
		             + "FROM DIACHI "
		             + "WHERE SDT = ?";
		try {
		    PreparedStatement ps = conn.prepareStatement(query);
		    ps.setString(1, phone); // Set giá trị của tham số số điện thoại (sdt)

		    ResultSet rs = ps.executeQuery();

		    while (rs.next()) {
		        AddressModel address = new AddressModel(rs.getInt("Id"), rs.getString("SDT"), rs.getString("DiaChi"));
		        list.add(address);
		    }
		} catch (Exception ex) {
		    ex.printStackTrace();
		}
		return list;
	}
	public static boolean DeleteAddress(Connection conn, int id) {
		String query = "DELETE FROM DIACHI WHERE Id = ?";
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
	public static boolean Add1Address(Connection conn, String sdt, String Diachi) {
		String query = "INSERT INTO DIACHI (SDT, DiaChi) VALUES (?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(query);
		    ps.setString(1, sdt);
		    ps.setString(2, Diachi);
		    int rowsAffected = ps.executeUpdate();
		    return rowsAffected > 0;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
}
