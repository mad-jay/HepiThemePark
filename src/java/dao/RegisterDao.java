/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.RegisterBean;
import util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author User
 */
public class RegisterDao {
    
    public String registerUser(RegisterBean rb){
        String username = rb.getUsername();
        String email = rb.getEmail();
        String password = rb.getPassword();
        String nophone = rb.getNophone();
        
        
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = null;
        
        try {
            if (isExists(username)) {
            return "Username already exist!";
            }
            con = DBConnection.createConnection();
            pstmt =con.prepareStatement("INSERT INTO USERS (USERNAME, EMAIL, PASSWORD, NOPHONE) VALUES (?, ?, ?, ?)");
            pstmt.setString(1,username);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, nophone);
            
            int i = pstmt.executeUpdate();
            
            if(i!=0){
                return "SUCCESS";
            }
            
        }catch(SQLException e){
            e.printStackTrace();
        }
        return "Oh no..Something went wrong there..!";
    }
    public boolean isExists(String username) {

        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String sql = "";
        String usernameDB = "";
        
        
        
        try {
            con = DBConnection.createConnection();
            statement = con.createStatement();

            //sql = "select username,email,address,university,password from user";
            sql = "SELECT USERNAME FROM USERS";

            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {     
                usernameDB = resultSet.getString("username");
                if(username.equals(usernameDB)) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } 
        return false;
    }
    
}
