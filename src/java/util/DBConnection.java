package util;
import java.sql.Connection;
import java.sql.DriverManager;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author arish
 */
public class DBConnection {
    public static Connection createConnection(){
        Connection conn=null;
        
        String connectionString = "jdbc:derby://localhost:1527/HepiDB;create=true;user=app;password=app";
        try{
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }
        
        try{
            conn= DriverManager.getConnection(connectionString);
            System.out.println("Printing connection object" + conn);
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        
        return conn;
    }
}