package Model;

public class KhachHangModel {
	private String sDT;
	private String matKhau;
	private String ho;
	private String ten;
	private String diaChi;
	
	public KhachHangModel(String sDT, String matKhau, String ho, String ten, String diaChi) {
		super();
		this.sDT = sDT;
		this.matKhau = matKhau;
		this.ho = ho;
		this.ten = ten;
		this.diaChi = diaChi;
	}

	public String getsDT() {
		return sDT;
	}

	public void setsDT(String sDT) {
		this.sDT = sDT;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String getHo() {
		return ho;
	}

	public void setHo(String ho) {
		this.ho = ho;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public KhachHangModel() {
		super();
		// TODO Auto-generated constructor stub
	}
}
