/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Context.DBContext;
import Model.User;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

/**
 *
 * @author ADMIN
 */
public class UserDao extends DBContext {

    public void insertUser(User u) {
        String sql = """
                     INSERT INTO [dbo].[users]
                     
                                ([username]
                                ,[password]
                                ,[name]
                                ,[phone]
                                ,[role])
                          VALUES
                                (?,?,?,?,?)""";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getName());
            ps.setString(4, u.getPhone());
            ps.setString(5, u.getRole());
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
   
    public User getUserByUserName(String username){
        User user = null;
        String sql = """
                SELECT [id]
                           ,[username]
                           ,[password]
                           ,[name]
                           ,[phone]
                           ,[role]
                       FROM [dbo].[users]
                       where username= ?      """;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("name"), rs.getString("phone"), rs.getString("role"));
            }
            
        } catch (Exception e) {
                 e.printStackTrace();
        }
        return user;
    }
}
