/*
 * Click nbfs:
 * Click nbfs:
 */
package Dao;

import Context.DBContext;
import Model.CartDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class CartDao extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void saveCart(int productId, int buyerId, int amount) {
        String query = """
        IF EXISTS (SELECT * FROM cart WHERE product_id = ? AND buyer_id = ?)
        BEGIN
            UPDATE cart
            SET amount = amount + ?
            WHERE product_id = ? AND buyer_id = ?;
        END
        ELSE
        BEGIN
            INSERT INTO cart (product_id, buyer_id, amount)
            VALUES (?, ?, ?);
        END
        """;

        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, productId);
            ps.setInt(2, buyerId);
            ps.setInt(3, amount);
            ps.setInt(4, productId);
            ps.setInt(5, buyerId);
            ps.setInt(6, productId);
            ps.setInt(7, buyerId);
            ps.setInt(8, amount);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public List<CartDTO> getAllCartByBuyerId(int buyerId) {
        List<CartDTO> cartList = new ArrayList<>();
        String query = """
        SELECT c.amount AS quantity, p.name AS product_name, p.price, p.id as pid
        FROM cart c
        JOIN Product p ON c.product_id = p.id
        WHERE c.buyer_id = ?
        """;

        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, buyerId);
            rs = ps.executeQuery();

            while (rs.next()) {
                CartDTO cartDTO = new CartDTO(
                        rs.getInt("pid"),
                        rs.getString("product_name"),
                        rs.getDouble("price"),
                        rs.getInt("quantity")
                );

                cartList.add(cartDTO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartList;
    }

    public void removeCart(int productId, int buyerId) {
        String query = """
        DELETE FROM cart
        WHERE product_id = ? AND buyer_id = ?;
        """;

        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, productId);
            ps.setInt(2, buyerId);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateQuantity(int productId, int buyerId, int quantity) {
        String query = """
        UPDATE cart
           SET 
              amount = ?
         WHERE product_id =? and buyer_id = ?
        """;

        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(2, productId);
            ps.setInt(3, buyerId);
            ps.setInt(1, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
