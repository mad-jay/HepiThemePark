<%-- 
    Document   : payment
    Created on : Feb 4, 2023, 12:08:55 AM
    Author     : arish
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" 
url="jdbc:derby://localhost:1527/HepiDB" user="app" password="app"/> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="paymentCss.css">
        <title>Payment Page</title>
    </head>
 
    <body>
        <div class="topnav">
            <a href="dashboard.html"><b>H E P I</b></a>
            <a href="bookticket.jsp" >Ticket</a>
            <a href="reserve.jsp">Reserve</a>
        </div>
        <br>
   
        <% 
           Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/HepiDB", "app", "app");
           Statement stmt = conn.createStatement();
           String IC = request.getParameter("IC");
           ResultSet rs = stmt.executeQuery("SELECT TOTALPRICE FROM TICKET WHERE IC = '" + IC + "'");
           
           if(!rs.next()){
               out.println("Data not found");}
           else {
        %>
            <div class="center">
                <h3>AMOUNT</h3>
                <hr>
                <tr>
                    <th>Total:RM </th>
                </tr>  
                <tr>
                    <td><%= rs.getString(1) %></td>
                </tr>
            </div>
            <% 
                }
            %>
        <form action="successPayment.jsp" method="POST">
            
            
            <br>
            <div class="center">
            <h3>PAYMENT INFO</h3>
            
            <img src="visa mastercard.png" alt="" width="50" height="30"><br/><br/>
      
            <label for="CARDNO" class="l1">Card No:</label>
            <input type="text" name="CARDNO" value="${param.CARDNO}" required><br/><br/>
            <label for="CARDNAME" class="l1">Name on card:</label>
            <input type="text" name="CARDNAME" value="${param.CARDNAME}" required><br/><br/>
            <label for="CVV" class="l1">CVV:</label>
            <input type="text" name="CVV"><br/><br/>
            <label for="EXPMONTH" class="l1" >Expiration Date :</label>
            <input type="text" name="EXPMONTH" value="${param.EXPMONTH}" placeholder="month" required>&nbsp;<label for="EXPYEAR" class="l1" ></label><input type="text" name="EXPYEAR" value="${param.EXPYEAR}" placeholder="year" required><br/><br/>
            <label for="IC" class="l1">IC :</label>
            <input type="text" name="IC" value="${param.IC}" required><br/><br/>
            <br>
            
            <input type="submit" class="b1"  value="Proceed"> <input type="reset" class="b1" value="Reset">
            <br>
            </div>
        </form>
            <br>

    </body>
</html>

