/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.TicketBean;
import util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class TicketDao {
    public String ticket (TicketBean ticketBean){
        
    
        String name = ticketBean.getName();
        String email = ticketBean.getEmail();
        String ic = ticketBean.getIc();
        int total_adults = ticketBean.getTotal_adults();
        int total_children = ticketBean.getTotal_children();
        int totalprice = ticketBean.getTotalprice();
        String date = ticketBean.getDate();
        
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = null;
        
        try {
            
            con = DBConnection.createConnection();
            pstmt =con.prepareStatement("INSERT INTO TICKET (NAME,EMAIL,IC,ADULT_TICKET,CHILDREN_TICKET,DATE,TOTALPRICE) VALUES (?, ?, ?, ?, ?, ?, ?)");
            pstmt.setString(1,name);
            pstmt.setString(2, email);
            pstmt.setString(3, ic);
            pstmt.setInt(4, total_adults);
            pstmt.setInt(5, total_children);
            pstmt.setString(6, date);
            pstmt.setInt(7, totalprice);
            
            int i = pstmt.executeUpdate();
            
            if(i!=0){
                return "SUCCESS";
            }
            
        }catch(SQLException e){
            e.printStackTrace();
        }
        return "Oh no..Something went wrong there..!";
    
}
}
