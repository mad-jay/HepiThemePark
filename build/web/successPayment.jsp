<%-- 
    Document   : successPayment
    Created on : Feb 4, 2023, 12:51:07 PM
    Author     : arish
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="paymentCss.css">
        <title>Successfully Reserved</title>
    </head>
    <style>
         .footer{
                position: fixed;
                left: 0;
                bottom: 0;
                width: 100%;
                background-color: #DF9881;
                color: white;
                text-align: center;
                padding: 2px;
            }

            .footer div{
                text-align: center;
            }
    </style>
    <body align="center">
        <div class="topnav">
        <a href="dashboard.html"><b>H E P I</b></a>
        <a href="bookticket.jsp" >Ticket</a>
        <a href="reserve.jsp">Reserve</a>
        <a href="LogoutServlet">Log Out</a>
        </div>
        <br>
        <% 
            String CARDNAME = request.getParameter("CARDNAME");
        %>
        <div class="center">
            <b>Thank you, <%= CARDNAME %>  <br>
            Your reservation has been confirmed!<br>
        Please check your email for more details of your tickets.</b>
            <br>
        <% 
           Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/HepiDB", "app", "app");
           Statement stmt = conn.createStatement();
           String IC = request.getParameter("IC");
           String NAME = request.getParameter("NAME"); 
           String ADULT_TICKET = request.getParameter("ADULT_TICKET");
           String CHILDREN_TICKET = request.getParameter("CHILDREN_TICKET");
           String TOTALPRICE = request.getParameter("TOTALPRICE");
           ResultSet rs = stmt.executeQuery("SELECT NAME, EMAIL, ADULT_TICKET, CHILDREN_TICKET, TOTALPRICE FROM TICKET WHERE IC = '" + IC + "'");
           
           if(!rs.next()){
               out.println("Data not found");}
           else {
        %>
        <div>
                <h3>Ticket Details</h3>
                <hr>
                <table align="center">
                 <tr>
                    <td>Name:  </td>
                    <td><%= rs.getString(1) %></td>
                 </tr>
                 <tr>
                    <td>Email:  </td>
                    <td><%= rs.getString(2) %></td>
                 </tr>
                <tr>
                    <td>Adult Ticket:  </td>
                    <td><%= rs.getString(3) %></td>
                </tr>
                <tr>
                    <td>Children Ticket:  </td>
                    <td><%= rs.getString(4) %></td>
                </tr>
                <tr>
                    <td>Total Price:RM  </td>
                    <td><%= rs.getString(5) %></td>    
                </tr>  
                </table>
        </div>
  
            <% 
                }
            %>
        
        <br>
        <input type="submit" class="b1" value="Home" onclick="document.location='dashboard.html'"><br><br>
        <br>
        </div>
        <section class="footer">
            <div>
                <h3>CONTACT</h3>
                <p>Email: hepithemepark@hr.com <br> 1030, Jalan Genting Highland,Pahang </p>
            </div>      
        </section>
    </body>
</html>

