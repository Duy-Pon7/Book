package Model;

public class OderModel {
	private int MaDon;
	public OderModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OderModel(int maDon, String phone, String ngayMua, Double triGia) {
		super();
		MaDon = maDon;
		Phone = phone;
		NgayMua = ngayMua;
		TriGia = triGia;
	}
	public int getMaDon() {
		return MaDon;
	}
	public void setMaDon(int maDon) {
		MaDon = maDon;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(String ngayMua) {
		NgayMua = ngayMua;
	}
	public Double getTriGia() {
		return TriGia;
	}
	public void setTriGia(Double triGia) {
		TriGia = triGia;
	}
	private String Phone;
	private String NgayMua;
	private Double TriGia;
	
}
