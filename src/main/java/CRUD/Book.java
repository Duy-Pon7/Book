package CRUD;

public class Book {
    private int id;
    private String name;
    private double originalPrice;
    private double salePrice;
    private String description;
    private String image;

    public Book(int id, String name, double originalPrice, double salePrice, String description, String image) {
        this.id = id;
        this.name = name;
        this.originalPrice = originalPrice;
        this.salePrice = salePrice;
        this.description = description;
        this.image = image;
    }

    // Getter and setter methods
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getOriginalPrice() {
        return originalPrice;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public String getDescription() {
        return description;
    }

    public String getImage() {
        return image;
    }
}
