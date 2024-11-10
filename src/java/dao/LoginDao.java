package dao;
import bean.LoginBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.DBConnection;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author frsha
 */
public class LoginDao {
    private String usernameDB = "";
    
    public String authenticateUser(LoginBean loginBean){
        
        String username = loginBean.getUsername();
        String password = loginBean.getPassword();
        
        Connection con=null;
        Statement statement = null;
        ResultSet resultSet= null;
//        String usernameDB ="";
        String passwordDB="";
        
        try{
            con = DBConnection.createConnection();
            statement=con.createStatement();
            resultSet= statement.executeQuery("select username, password from users");
            while(resultSet.next()){
                usernameDB =resultSet.getString("username");
                passwordDB =resultSet.getString("password");
                
                if(username.equals(usernameDB) && password.equals(passwordDB)){        
                return "SUCCESS";
            }
                con.close();
          }
        }catch(SQLException e){
            e.printStackTrace();
        }
    return "Invalid user credentials";
}
    public String getUsername(){
        return usernameDB;
    }
    public void setUsername(){
        
    }
}