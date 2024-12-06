package Model;

import java.sql.Date;

public class DonMuaModel {
	private int maDon;
    private String sDT;
    private Date ngayMua;
    private float triGiaDH;
    private String diaChi;
	public int getMaDon() {
		return maDon;
	}
	public void setMaDon(int maDon) {
		this.maDon = maDon;
	}
	public String getsDT() {
		return sDT;
	}
	public void setsDT(String sDT) {
		this.sDT = sDT;
	}
	public Date getNgayMua() {
		return ngayMua;
	}
	public void setNgayMua(Date ngayMua) {
		this.ngayMua = ngayMua;
	}
	public float getTriGiaDH() {
		return triGiaDH;
	}
	public void setTriGiaDH(float triGiaDH) {
		this.triGiaDH = triGiaDH;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public DonMuaModel(int maDon, String sDT, Date ngayMua, float triGiaDH, String diaChi) {
		super();
		this.maDon = maDon;
		this.sDT = sDT;
		this.ngayMua = ngayMua;
		this.triGiaDH = triGiaDH;
		this.diaChi = diaChi;
	}
	
}
