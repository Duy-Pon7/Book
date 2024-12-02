package Model;

public class AddressModel {
	private int Id;
	public AddressModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AddressModel(int id, String phone, String diaChi) {
		super();
		Id = id;
		Phone = phone;
		DiaChi = diaChi;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
	private String Phone;
	private String DiaChi;
}
