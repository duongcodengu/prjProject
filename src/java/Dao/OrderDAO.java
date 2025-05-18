/*
 * Click nbfs:
 * Click nbfs:
 */
package Dao;
import Context.DBContext;
import Model.Order;
import Model.OrderItem;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDAO {
    private DBContext db;

    public OrderDAO() {
        db = new DBContext();
    }

    
    public Order getOrderById(int id) {
        Order order = null;
        String sqlOrder = "SELECT * FROM Orders WHERE id = ?";
        String sqlOrderItems = "SELECT * FROM OrderItem WHERE order_id = ?";
        try (PreparedStatement psOrder = db.connection.prepareStatement(sqlOrder)) {
            psOrder.setInt(1, id);
            ResultSet rsOrder = psOrder.executeQuery();
            if (rsOrder.next()) {
                order = new Order();
                order.setId(rsOrder.getInt("id"));
                order.setBuyerId(rsOrder.getInt("buyer_id"));
                order.setBuyerAddress(rsOrder.getString("buyer_address"));
                order.setOrderDate(rsOrder.getTimestamp("order_date"));
                
                
                try (PreparedStatement psItems = db.connection.prepareStatement(sqlOrderItems)) {
                    psItems.setInt(1, id);
                    ResultSet rsItems = psItems.executeQuery();
                    List<OrderItem> items = new ArrayList<>();
                    while (rsItems.next()) {
                        OrderItem item = new OrderItem();
                        item.setId(rsItems.getInt("id"));
                        item.setOrderId(rsItems.getInt("order_id"));
                        item.setProductId(rsItems.getInt("product_id"));
                        item.setQuantity(rsItems.getInt("quantity"));
                        item.setUnitPrice(rsItems.getDouble("unit_price"));
                        items.add(item);
                    }
                    order.setOrderItems(items);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return order;
    }

    
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> orders = new ArrayList<>();
        String sqlOrders = "SELECT * FROM Orders WHERE buyer_id = ?";
        try (PreparedStatement psOrders = db.connection.prepareStatement(sqlOrders)) {
            psOrders.setInt(1, userId);
            ResultSet rsOrders = psOrders.executeQuery();
            while (rsOrders.next()) {
                Order order = new Order();
                order.setId(rsOrders.getInt("id"));
                order.setBuyerId(rsOrders.getInt("buyer_id"));
                order.setBuyerAddress(rsOrders.getString("buyer_address"));
                order.setOrderDate(rsOrders.getTimestamp("order_date"));
                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    
    public boolean saveOrder(Order order) {
        boolean success = false;
        String sqlOrder = "INSERT INTO Orders(buyer_id, buyer_address, order_date) VALUES(?, ?, ?)";
        String sqlOrderItem = "INSERT INTO OrderItem(order_id, product_id, quantity, unit_price) VALUES(?, ?, ?, ?)";
        try {
            
            db.connection.setAutoCommit(false);
            
            try (PreparedStatement psOrder = db.connection.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS)) {
                psOrder.setInt(1, order.getBuyerId());
                psOrder.setString(2, order.getBuyerAddress());
                
                Timestamp ts = order.getOrderDate() != null ? new Timestamp(order.getOrderDate().getTime())
                        : new Timestamp(System.currentTimeMillis());
                psOrder.setTimestamp(3, ts);
                int affectedRows = psOrder.executeUpdate();
                if (affectedRows == 0) {
                    throw new SQLException("Tạo đơn hàng thất bại, không có dòng nào được thêm vào.");
                }
                
                try (ResultSet generatedKeys = psOrder.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int orderId = generatedKeys.getInt(1);
                        order.setId(orderId);
                    } else {
                        throw new SQLException("Tạo đơn hàng thất bại, không lấy được ID.");
                    }
                }
            }
            
            if (order.getOrderItems() != null && !order.getOrderItems().isEmpty()) {
                try (PreparedStatement psItem = db.connection.prepareStatement(sqlOrderItem)) {
                    for (OrderItem item : order.getOrderItems()) {
                        psItem.setInt(1, order.getId());
                        psItem.setInt(2, item.getProductId());
                        psItem.setInt(3, item.getQuantity());
                        psItem.setDouble(4, item.getUnitPrice());
                        psItem.addBatch();
                    }
                    psItem.executeBatch();
                }
            }
            
            db.connection.commit();
            success = true;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            try {
                db.connection.rollback();
            } catch (SQLException e) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        } finally {
            try {
                db.connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return success;
    }
}
