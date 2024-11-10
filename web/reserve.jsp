<%-- 
    Document   : reserve
    Created on : Feb 7, 2023, 3:29:43 PM
    Author     : mad
--%>
<%@page import="bean.ReserveBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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
        </style>
    </head>
    <body>

        <div class="topnav">
        <a class="navbar-brand" href="dashboard.html">H E P I</a>
        <a href="bookticket.jsp" >Ticket</a>
        <a href="reserve.jsp">Reserve</a>
        <a href="LogoutServlet">Log Out</a>
        </div>
        <br>
        <div class="container">
            <h1>Reservation Details:</h1>
        </div>
        <table>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">E-mail</th>
                <th scope="col">MyKad</th>
                <th scope="col">Date Reserve</th>
                <th scope="col">Adult Ticket</th>
                <th scope="col">Children Ticket</th>
                <th scope="col">Total Price</th>
                <th scope="col">Edit</th>
                <th scope="col">Delete</th>
                <th scope="col">Pay</th>
            </tr>
            <tbody>
                <%
                    List reserveList = (List) request.getAttribute("reserveList");
                    if (reserveList != null) {
                        Iterator reserves = reserveList.iterator();
                        while (reserves.hasNext()) {
                            ReserveBean reserve = (ReserveBean) reserves.next();
                %>


                <tr>

                    <td><%=reserve.getNAME()%></td>

                    <td><%=reserve.getEMAIL()%></td>

                    <td><%=reserve.getIC()%></td>

                    <td><%=reserve.getDATE()%></td>
                    
                    <td><%=reserve.getADULT_TICKET()%></td>

                    <td><%=reserve.getCHILDREN_TICKET()%></td>


                    <td><%=reserve.getTOTALPRICE()%></td>

                    
                    <td class="modify"><a name="id" id="" class="bfix" href="updateReserve.jsp?ic=<%=reserve.getIC()%>" role="button">
                            Edit
                        </a></td>
                    <td class="delete"><a name="id" id="" class="bdelete" href="DeleteReserveServlet?ic=<%=reserve.getIC()%>" role="button">
                            Delete
                        </a></td>
                    <td class="pay"><a name="id" id="" class="bpay" href="payment.jsp" role="button">
                            Pay
                        </a></td>

                </tr>


                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <br>
        <a name="" id="" class="Addlist" style="float:right" href="bookticket.jsp" role="button">New Reserve</a>
        <section class="footer">
            <div class="col-3">
                <h3 class="h3">CONTACT</h3>
                <p>Email: hepithemepark@hr.com <br> <br> 1030, Jalan Genting Highland, <br> Pahang</p>
            </div>      
        </section>

    </body>
</html>
