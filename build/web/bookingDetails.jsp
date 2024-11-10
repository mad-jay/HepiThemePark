<%-- 
    Document   : bookingDetails
    Created on : Feb 9, 2023, 9:08:39 PM
    Author     : arish
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="paymentCss.css">
        <title>Booking Details</title>
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
    <body>
        <div class="topnav">
            <a href="dashboard.html"><b>H E P I</b></a>
            <a href="bookticket.jsp" >Ticket</a>
            <a href="reservation.jsp">Reserve</a>
        </div>
        <br>
      
        <div class="center"> 
        
        <form action="payment.jsp" method="POST">
        <label for="IC" class="l1">Enter your IC number for confirmation :</label>
        <input type="text" name="IC" value="${param.IC}"><br/><br/>
        <input type="submit" class="b1" value="Proceed" onClick="myFunction()">
        </form>
       </div>
            <section class="footer">
            <div>
                <h3>CONTACT</h3>
                <p>Email: hepithemepark@hr.com <br> 1030, Jalan Genting Highland,Pahang </p>
            </div>      
        </section>
    <script>
    function myFunction() {
    var txt;
    if (confirm("Click OK if you would like to make an online payment.")) {
        window.location.href="payment.jsp";
    } else {
        window.location.href="successPayment.jsp";
    }
  document.getElementById("demo").innerHTML = txt;
   }
   </script>
  
     <br>
    </body>     
</html>
