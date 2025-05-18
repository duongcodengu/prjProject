/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class Product {

    private int id;
    private String name;
    private double price;
    private String title;
    private String description;
    private String img_url;
    private int seller_id, category_id;
    private User seller;
   
    private Category category;

    public Product() {
    }

    

    public Product(int id, String name, double price, String title, String description, String img_url, int seller_id, int category_id, User seller, Category category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.title = title;
        this.description = description;
        this.img_url = img_url;
        this.seller_id = seller_id;
        this.category_id = category_id;
        this.seller = seller;
        this.category = category;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public User getSeller() {
        return seller;
    }

    public void setSeller(User seller) {
        this.seller = seller;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public int getSeller_id() {
        return seller_id;
    }

    public void setSeller_id(int seller_id) {
        this.seller_id = seller_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public Product(int id, String name, double price, String title, String description, String img_url, User seller, Category category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.title = title;
        this.description = description;
        this.img_url = img_url;
        this.seller = seller;
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", price=" + price + ", title=" + title + ", description=" + description + ", img_url=" + img_url + ", seller_id=" + seller_id + ", category_id=" + category_id + '}';
    }

}
