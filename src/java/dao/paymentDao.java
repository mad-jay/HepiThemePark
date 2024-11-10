/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.paymentBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.DBConnection;

/**
 *
 * @author arish
 */
public class paymentDao {
     public String paymentUser(paymentBean paymentBean){
        
        //assign user entered values to temporary variables
        String CARDNO = paymentBean.getCARDNO();
        String CARDNAME = paymentBean.getCARDNAME();
        String CVV = paymentBean.getCVV();
        String IC = paymentBean.getIC();
        
        Connection conn = null;
        Statement statement = null;
        PreparedStatement pstmt = null;
        ResultSet resultSet = null;
        
  
            try{
            //fetch database connection obj
            conn = DBConnection.createConnection();
            pstmt = conn.prepareStatement("INSERT INTO PAYMENT(CARDNO, CARDNAME, CVV, IC) VALUES (?, ?, ?, ?)");
            pstmt.setString(1, CARDNO);
            pstmt.setString(2, CARDNAME);
            pstmt.setString(3, CVV);
             pstmt.setString(4, IC);
            pstmt.executeUpdate(); 
            conn.close();
            
            return "SUCCESS";
        }catch(SQLException e){
            e.printStackTrace();
        }
        return "Invalid credentials";
    
    }
}


