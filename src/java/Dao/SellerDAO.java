/*
 * Click nbfs:
 * Click nbfs:
 */
package Dao;

import Context.DBContext;
import Model.Category;
import Model.Product;
import Model.SoldProductDTO;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Statement;

/**
 *
 * @author ADMIN
 */
public class SellerDAO {

    private DBContext db = new DBContext();

    public List<SoldProductDTO> getSoldProductsBySellerId(int sellerId) {
        List<SoldProductDTO> list = new ArrayList<>();
        String sql = "SELECT o.id AS orderId, p.id AS productId, p.name AS productName, "
                + "oi.quantity, oi.unit_price, o.order_date, u.name AS buyerName, o.buyer_address "
                + "FROM OrderItem oi "
                + "JOIN Orders o ON oi.order_id = o.id "
                + "JOIN Product p ON oi.product_id = p.id "
                + "JOIN users u ON o.buyer_id = u.id "
                + "WHERE p.seller_id = ?";
        try (PreparedStatement ps = db.connection.prepareStatement(sql)) {
            ps.setInt(1, sellerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SoldProductDTO dto = new SoldProductDTO();
                dto.setOrderId(rs.getInt("orderId"));
                dto.setProductId(rs.getInt("productId"));
                dto.setProductName(rs.getString("productName"));
                dto.setQuantity(rs.getInt("quantity"));
                dto.setUnitPrice(rs.getDouble("unit_price"));
                dto.setOrderDate(rs.getTimestamp("order_date"));
                dto.setBuyerName(rs.getString("buyerName"));
                dto.setBuyerAddress(rs.getString("buyer_address"));
                list.add(dto);
            }
        } catch (Exception ex) {

        }
        return list;
    }

    public boolean createProduct(Product product) {
        String sql = "INSERT INTO Product (name, price, title, description, img_url, seller_id, category_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = db.connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, product.getName());
            ps.setDouble(2, product.getPrice());
            ps.setString(3, product.getTitle());
            ps.setString(4, product.getDescription());
            ps.setString(5, product.getImg_url());
            ps.setInt(6, product.getSeller_id());
            ps.setInt(7, product.getCategory_id());
            int affectedRows = ps.executeUpdate();
            if (affectedRows == 0) {
                return false;
            }
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    product.setId(rs.getInt(1));
                }
            }
            return true;
        } catch (Exception ex) {
        }
        return false;
    }

    public boolean updateProduct(Product product) {
        String sql = "UPDATE Product SET name=?, price=?, title=?, description=?, img_url=?, seller_id=?, category_id=? WHERE id=?";
        try (PreparedStatement ps = db.connection.prepareStatement(sql)) {
            ps.setString(1, product.getName());
            ps.setDouble(2, product.getPrice());
            ps.setString(3, product.getTitle());
            ps.setString(4, product.getDescription());
            ps.setString(5, product.getImg_url());
            ps.setInt(6, product.getSeller_id());
            ps.setInt(7, product.getCategory_id());
            ps.setInt(8, product.getId());
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
        }
        return false;
    }

    public boolean deleteProduct(int productId) {
        String sql = "DELETE FROM Product WHERE id=?";
        try (PreparedStatement ps = db.connection.prepareStatement(sql)) {
            ps.setInt(1, productId);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (Exception ex) {
        }
        return false;
    }

    public Product getProductById(int productId) {
        String sql = "SELECT * FROM Product WHERE id=?";
        try (PreparedStatement ps = db.connection.prepareStatement(sql)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setTitle(rs.getString("title"));
                    product.setDescription(rs.getString("description"));
                    product.setImg_url(rs.getString("img_url"));
                    product.setSeller_id(rs.getInt("seller_id"));
                    product.setCategory_id(rs.getInt("category_id"));
                    return product;
                }
            }
        } catch (Exception ex) {
        }
        return null;
    }

    // Trong SellerDAO.java
    public List<Product> getProductsBySellerId(int sellerId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.*, c.id AS c_id, c.name AS c_name "
                + "FROM Product p "
                + "JOIN category c ON p.category_id = c.id "
                + "WHERE p.seller_id = ?";
        try (PreparedStatement ps = db.connection.prepareStatement(sql)) {
            ps.setInt(1, sellerId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setTitle(rs.getString("title"));
                    product.setDescription(rs.getString("description"));
                    product.setImg_url(rs.getString("img_url"));
                    product.setSeller_id(rs.getInt("seller_id"));
                    product.setCategory_id(rs.getInt("category_id"));

                    // Tạo đối tượng Category từ dữ liệu truy vấn (alias c_id, c_name)
                    Category category = new Category(rs.getInt("c_id"), rs.getString("c_name"));
                    product.setCategory(category);

                    list.add(product);
                }
            }
        } catch (Exception ex) {
        }
        return list;
    }
}
