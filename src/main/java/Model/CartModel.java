package Model;

public class CartModel {
	private int Id;
	public CartModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartModel(int id, String image, String name, int qty, double price, double total) {
		super();
		Id = id;
		Image = image;
		Name = name;
		Qty = qty;
		Price = price;
		Total = total;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public int getQty() {
		return Qty;
	}
	public void setQty(int qty) {
		Qty = qty;
	}
	public double getPrice() {
		return Price;
	}
	public void setPrice(double price) {
		Price = price;
	}
	public double getTotal() {
		return Total;
	}
	public void setTotal(double total) {
		Total = total;
	}
	private String Image;
	private String Name;
	private int Qty;
	private double Price;
	private double Total;
}
