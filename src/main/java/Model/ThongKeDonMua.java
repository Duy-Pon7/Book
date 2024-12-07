package Model;

public class ThongKeDonMua {
	private int month;
    public ThongKeDonMua() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ThongKeDonMua(int month, int year, int totalOrders, double totalValue) {
		super();
		this.month = month;
		this.year = year;
		this.totalOrders = totalOrders;
		this.totalValue = totalValue;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getTotalOrders() {
		return totalOrders;
	}
	public void setTotalOrders(int totalOrders) {
		this.totalOrders = totalOrders;
	}
	public double getTotalValue() {
		return totalValue;
	}
	public void setTotalValue(double totalValue) {
		this.totalValue = totalValue;
	}
	private int year;
    private int totalOrders;
    private double totalValue;
}
