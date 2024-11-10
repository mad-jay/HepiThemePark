<%-- 
    Document   : updateReserve
    Created on : Feb 9, 2023, 11:10:27 AM
    Author     : mad
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Reserve</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                margin: 0;
                font-family: Arial, Helvetica, sans-serif;
                background-color: #FEF4BE;
            }

            .topnav {
                overflow: hidden;
                background-color: #DF9881;
                height: 60px;
            }

            .topnav a { /**words on nav bar**/
                float: left;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }

            .topnav a:hover {
                background-color: #FAF884;
                color: black;
                height: 60px;
            }


            .center {
                margin: auto;
                width: 60%;
                border: 3px solid #FFC0CB;
                padding: 10px;
                text-align: center;
            }
            .container {
                margin: 40px auto;
                margin-bottom: 20px;
                border-radius: 30px;
                text-align: center;
                background-color: white;
                width: 40%;
                padding-bottom: 10px;
            }
            table th,
            tr,
            td {
                border: 1px solid black;
                border-collapse: collapse;
                padding: 10px 0px 10px 0px;
            }
            table {
                width: 100%;
            }
            th {
                color: white;
                background-color: #FFC0CB;
            }
            tr {
                background-color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            .timeregis {
                text-align: center;
            }
            .modify {
                text-align: center;
            }
            .delete {
                text-align: center;
            }
            .pay {
                text-align: center;
            }
            .modify .bfix {
                border-radius: 15px;
                background-color: #ffcc33;
                color: white;
                text-decoration: none;
                padding: 4px 20px 4px 20px;
                transition: 0.5s;
            }
            .modify .bfix:hover {
                background-color: #fdb515;
                color: black;
            }
            .delete .bdelete {
                border-radius: 15px;
                background-color: #e60000;
                text-decoration: none;
                color: white;
                padding: 4px 20px 4px 20px;
                transition: 0.5s;
            }
            .delete .bdelete:hover {
                background-color: #D9ddd4;
                color: red;
            }
            .pay .bpay {
                border-radius: 15px;
                background-color: #00A600;
                text-decoration: none;
                color: white;
                padding: 4px 20px 4px 20px;
                transition: 0.5s;
            }
            .pay .bpay:hover {
                background-color: #BBFFBB;
                color: black;
            }
            .Addlist {
                margin-right: 25px;
                padding: 5px 30px 5px 30px;
                border-radius: 15px;
                text-decoration: none;
                color: white;
                background-color: rgb(248, 140, 210);
                transition: 0.5s;
            }
            .Addlist:hover {
                color: black;
                background-color: #BBFFBB;
            }
            .footer{
                margin-top: 95px;
                width: 80%;
                padding: 55px 10%;
                background: #DF9881;
                color: #efefef;
                display: flex;
            }

            .footer div{
                text-align: center;
            }


            .h3{
                font-weight: 300;
                margin-bottom: 20px;
                letter-spacing: 1px;
            }

            .col-3 {
                text-align: center;
                padding-left: 450px;
            }
            .modify{
                border-radius: 15px;
                border: transparent;
                color: white;
                padding: 4px 40px 4px 40px;
                margin: 0px 50px 50px 100px;
                font-size: 20px;
                border-collapse: collapse;
                background-color: #00A600;
                font-family: "Mitr", sans-serif;
                transition: 0.5s;
            }
            .modify:hover{
                color: black;
                background-color: #BBFFBB;
            }
            .reset{
                border-radius: 15px;
                border: transparent;
                color: white;
                padding: 4px 40px 4px 40px;
                margin: 0px 50px 50px 100px;
                font-size: 20px;
                border-collapse: collapse;
                background-color: red;
                font-family: "Mitr", sans-serif;
                transition: 0.5s;
            }
            .reset:hover{
                color: black;
                background-color: #D9ddd4;
            }
            .return{
                border-radius: 15px;
                background-color: #ffcc33;
                color: black;
                text-decoration: none;
                padding: 4px 40px 4px 40px;
                margin: 0px 0px 50px 100px;
                font-size: 20px;
                transition: 0.5s;
            }
            .return:hover{
                background-color: #fdb515;
                color: white;
            }
        </style>
    </head>
    <body>

        <div class="topnav">
            <a class="navbar-brand" href="dashboard.html">H E P I</a>
            <a href="dashboard.html">Home</a>
            <a href="bookticket.html" >Ticket</a>
            <a class="active" href="payment.html">Payment</a>
            <a href="ReserveServlet">Reserve</a>
            <a href="LogoutServlet">Log Out</a>
        </div>
        <br>
        <div class="container">
            <h1>Reservation Details:</h1>
        </div>
        <%
            Connection con = null;
            Statement statement = null;
            ResultSet resultSet = null;

            String ic = request.getParameter("ic");
            String email = "";
            String name ="";
            int nChild = 0;
            int nAdult = 0;
            Date hari = (Date) request.getAttribute("currentDate");

            

            try {
                con = DBConnection.createConnection();
                statement = con.createStatement();
                resultSet = statement.executeQuery("select name,email,children_Ticket,adult_Ticket,date from TICKET WHERE ic = '" + ic + "'");
                while (resultSet.next()) {

                    name = resultSet.getString("name");
                    email = resultSet.getString("email");
                    nChild = resultSet.getInt("children_Ticket");
                    nAdult = resultSet.getInt("adult_Ticket");
                    hari = resultSet.getDate("date");
                    
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

        %>

        <form name = 'update' method = 'post'  action ="UpdateReserveServlet" >
            <div class="fixproduct">
                <div class="center">
                    <h3>REVERVATION</h3>
                    <hr>
                    <p>Edit Reservation</b></p>
                </div>
                <br>
                <div class="center">
                    <h3>REVERVATION INFO</h3><br>
                    <h3><%=name%></h3>
                    <h3><%= ic%></h3>
                    
                    
                    <input type="hidden" name="ic" value="<%= ic%>"><br><br>
                    Email  :
                    <input type="text" name="email" value="<%= email%>"><br><br>
                    Adult:
                    <input type="number" name='adult_Ticket' value="<%= nAdult%>"><br><br>
                    Child:
                    <input type='number' name='children_Ticket' value="<%= nChild%>"><br><br>
                    Date:
                    <input type='date' name='hari' value="<%= hari%>"<br><br><br><br>

                    <div class="form-button">
                        <tr><td colspan=2 align="center"><input type='hidden' name='name' value='$row[name]'>
                                <input class="modify"  type ='submit' name='submit' value='Update'>
                                <input class="reset" type ='reset' name = 'reset'>
                    </div>
                    </td></tr>
                    </table>
                    </form>
                </div>
                <a name="" id="" class="return" href="ReserveServlet" role="button" style="float:left">Return</a>






                <!-- footer -->
                <section class="footer">
                    <div class="col-3">
                        <h3 class="h3">CONTACT</h3>
                        <p>Email: hepithemepark@hr.com <br> <br> 1030, Jalan Genting Highland, <br> Pahang</p>
                    </div>      
                </section>
                <!-- footer -->

                <!--For feedback and time-->

                <!--For button top end-->
                </body>
                </html>
