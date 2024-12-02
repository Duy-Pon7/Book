package Model;

public class ThongTinDonMuaModel {
	private int maDon;
	private int maSach;
	private String tenSach;
	private String image;
	private float giaBan;
	private int soluong;
	public ThongTinDonMuaModel(int maDon, int maSach, String tenSach, String image, float giaBan, int soluong) {
		super();
		this.maDon = maDon;
		this.maSach = maSach;
		this.tenSach = tenSach;
		this.image = image;
		this.giaBan = giaBan;
		this.soluong = soluong;
	}
	public int getMaDon() {
		return maDon;
	}
	public void setMaDon(int maDon) {
		this.maDon = maDon;
	}
	public int getMaSach() {
		return maSach;
	}
	public void setMaSach(int maSach) {
		this.maSach = maSach;
	}
	public String getTenSach() {
		return tenSach;
	}
	public void setTenSach(String tenSach) {
		this.tenSach = tenSach;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public float getGiaBan() {
		return giaBan;
	}
	public void setGiaBan(float giaBan) {
		this.giaBan = giaBan;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public ThongTinDonMuaModel() {
		super();
		// TODO Auto-generated constructor stub
	}
}
