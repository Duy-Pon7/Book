package Model;

public class Book {
    private int id;
    private String name;
    private String category;
    private String author;
    private String publisher;
    private String description;
    private String image;
    private int quantity;
    private double originalPrice;
    private double salePrice;
	public Book(int id, String name, String category, String author, String publisher, String description, String image,
			int quantity, double originalPrice, double salePrice) {
		super();
		this.id = id;
		this.name = name;
		this.category = category;
		this.author = author;
		this.publisher = publisher;
		this.description = description;
		this.image = image;
		this.quantity = quantity;
		this.originalPrice = originalPrice;
		this.salePrice = salePrice;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getOriginalPrice() {
		return originalPrice;
	}
	public void setOriginalPrice(double originalPrice) {
		this.originalPrice = originalPrice;
	}
	public double getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(double salePrice) {
		this.salePrice = salePrice;
	}

}
