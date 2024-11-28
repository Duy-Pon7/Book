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

    public Book(int id, String name, String category, String author, String publisher, String description, String image, int quantity, double originalPrice, double salePrice) {
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

    // Getter and setter methods
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getCategory() {
        return category;
    }

    public String getAuthor() {
        return author;
    }

    public String getPublisher() {
        return publisher;
    }

    public String getDescription() {
        return description;
    }

    public String getImage() {
        return image;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getOriginalPrice() {
        return originalPrice;
    }

    public double getSalePrice() {
        return salePrice;
    }
}
