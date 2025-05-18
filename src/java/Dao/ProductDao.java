/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Context.DBContext;
import Model.Category;
import Model.Product;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

/**
 *
 * @author ADMIN
 */
public class ProductDao extends DBContext {
Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = """
                     SELECT * FROM [Product]""";
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setImg_url(rs.getString("img_url"));
                p.setSeller_id(rs.getInt("seller_id"));
                p.setCategory_id(rs.getInt("category_id"));
                list.add(p);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return list;
    }
    public Product getProductById(int id){
        String sql ="""
                    SELECT * FROM Product WHERE ID =?""";
        
        try {
           Product p = new Product();
            PreparedStatement pt = connection.prepareStatement(sql);
            pt.setInt(1, id);
            ResultSet rs = pt.executeQuery();
            if (rs.next()) {
                 p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setImg_url(rs.getString("img_url"));
                p.setSeller_id(rs.getInt("seller_id"));
                p.setCategory_id(rs.getInt("category_id"));
            return p;
            }
            
        } catch (Exception e) {
        }
        return null;
    }
    public void insertProduct( Product p){
        String sql ="""
                    INSERT INTO [dbo].[Product]
                               ([name]
                               ,[price]
                               ,[title]
                               ,[description]
                               ,[img_url]
                               ,[seller_id]
                               ,[category_id])
                         VALUES
                               (?,?,?,?,,?,?)""";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setDouble(2, p.getPrice());
            ps.setString(3, p.getTitle());
            ps.setString(4, p.getDescription());
            ps.setString(5, p.getImg_url());
            ps.setInt(6, p.getSeller().getId());
            ps.setInt(7, p.getCategory().getId());
            
        } catch (Exception e) {
        }
    }
    public static void main(String[] args) {
        ProductDao pd = new ProductDao();
        Product c = pd.getProductById(1);
        
        System.out.println(c);
        }  
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = """
            SELECT id, name
            FROM category
            """;

        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {

                Category category = new Category(
                        rs.getInt("id"),
                        rs.getString("name")
                );

                list.add(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
   public void deleteCartfromUseIDAndProductId( int pid , int bid){
       String sql = """
                    Delete from cart where product_id =? and buyer_id =?""";
       try {
           
           PreparedStatement ps = connection.prepareStatement(sql);
           ps.setInt(1, pid);
           ps.setInt(2, bid);
           ps.executeUpdate();
           
       } catch (Exception e) {
          e.printStackTrace();
       }
   }
    public List<Product> searchProducts(String query) {
    List<Product> list = new ArrayList<>();
    String sql = "SELECT * FROM Product WHERE name LIKE ?";
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setString(1, "%" + query + "%");
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                p.setImg_url(rs.getString("img_url"));
                p.setSeller_id(rs.getInt("seller_id"));
                p.setCategory_id(rs.getInt("category_id"));
                list.add(p);
            }
        }
    } catch (Exception e) {
        System.out.println(e);
    }
    return list;
}
}
