/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;
import java.util.List;

public class Order {
    private int id;
    private int buyerId;
    private String buyerAddress;
    private Date orderDate;
    private List<OrderItem> orderItems;

    public Order() {
    }

    public Order(int buyerId, String buyerAddress, Date orderDate, List<OrderItem> orderItems) {
        this.buyerId = buyerId;
        this.buyerAddress = buyerAddress;
        this.orderDate = orderDate;
        this.orderItems = orderItems;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getBuyerId() {
        return buyerId;
    }
    public void setBuyerId(int buyerId) {
        this.buyerId = buyerId;
    }
    public String getBuyerAddress() {
        return buyerAddress;
    }
    public void setBuyerAddress(String buyerAddress) {
        this.buyerAddress = buyerAddress;
    }
    public Date getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
    public List<OrderItem> getOrderItems() {
        return orderItems;
    }
    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }
}
