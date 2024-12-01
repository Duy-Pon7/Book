package CRUD;

public class Book {
    private int maSach;          // ID sách
    private String tenSach;      // Tên sách
    private String tenLoai;      // Loại sách
    private String tacGia;       // Tác giả
    private String nxb;          // Nhà xuất bản
    private String moTa;         // Mô tả
    private String image;        // Đường dẫn ảnh
    private int soLuong;         // Số lượng tồn kho
    private double giaGoc;       // Giá gốc
    private double giaBan;       // Giá bán

    // Constructor đầy đủ
    public Book(int maSach, String tenSach, String tenLoai, String tacGia, String nxb, 
                String moTa, String image, int soLuong, double giaGoc, double giaBan) {
        this.maSach = maSach;
        this.tenSach = tenSach;
        this.tenLoai = tenLoai;
        this.tacGia = tacGia;
        this.nxb = nxb;
        this.moTa = moTa;
        this.image = image;
        this.soLuong = soLuong;
        this.giaGoc = giaGoc;
        this.giaBan = giaBan;
    }

    // Getter và Setter
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

    public String getTenLoai() {
        return tenLoai;
    }

    public void setTenLoai(String tenLoai) {
        this.tenLoai = tenLoai;
    }

    public String getTacGia() {
        return tacGia;
    }

    public void setTacGia(String tacGia) {
        this.tacGia = tacGia;
    }

    public String getNxb() {
        return nxb;
    }

    public void setNxb(String nxb) {
        this.nxb = nxb;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public double getGiaGoc() {
        return giaGoc;
    }

    public void setGiaGoc(double giaGoc) {
        this.giaGoc = giaGoc;
    }

    public double getGiaBan() {
        return giaBan;
    }

    public void setGiaBan(double giaBan) {
        this.giaBan = giaBan;
    }
}
