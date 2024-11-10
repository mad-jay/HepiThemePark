<%-- 
    Document   : registration
    Created on : Jan 12, 2023, 4:10:00 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ticket Receipt</title>
        <link rel="stylesheet" href="reserveStyle.css">

    </head>
    <body>
        <section class="navbar">
        <a class="navbar-brand" href="dashboard.html">H E P I</a>
        <a href="bookticket.jsp" >Ticket</a>
        <a href="reserve.jsp">Reserve</a>
        <a href="login.html">Log Out</a>
        </section>

        <section class="booking">
            <form action="TicketServlet" method="POST" class="f1">
                
                    <%
                        String name = request.getParameter("name");
                        String email = request.getParameter("email");
                        String ic = request.getParameter("ic");
                        String date = request.getParameter("date");
                        String packages = request.getParameter("package");
                        int adult = Integer.parseInt(request.getParameter("total_adults"));
                        int children = Integer.parseInt(request.getParameter("total_children"));
                        String packagename = null;
                        
                        int totalprice = 0;
                        int priceForChild = 0;
                        int priceForAdult = 0;

                        
                        
                        if(packages.equals("package1")){
                            priceForChild = 120;
                            priceForAdult = 150;
                            
                            packagename = "1-Day Hepi Theme Park Out Door Unlimited Entry";
                            
                        }else if(packages.equals("package2")){
                            priceForChild = 75;
                            priceForAdult = 80;
                            
                            packagename = "1-Day Hepi Theme Park In Door Unlimited Entry";
                        } else if(packages.equals("package3")){
                            priceForChild = 280;
                            priceForAdult = 350;
                            
                            packagename = "2-Day Hepi Theme Park Out Door Unlimited Entry Family Package";
                        }
                        
                        totalprice = (priceForChild * children) + (priceForAdult * adult);


                        %>
                        
                        <h1>Ticket Receipt </h1><br>
                        <p>Your Purchases.</p><br>
                        <hr><br>
              
                <label for="name" class="l1"><b>Name: </b></label>
                <input type="text" id="name" name="name" value="<%= name %>" class="t1" >
            
                <label for="email" class="l1"><b>Email:</b></label>
                <input type="email" id="email" name="email" value=" <%= email %>" class="t1" >
            
                <label for="ic" class="l1"><b>New MyKad No: </b></label>
                <input type="text" id="ic" name="ic" value="<%= ic %>" class="t1" >
                
                <label for="date" class="l1"><b>Date: </b></label>
                <input type="date" id="date" name="date" value="<%= date %>" class="t1" >
                
                <hr><br>

                <p class="l1"><b>Choice of Ticket:</b></p>
                
                <label for="adult" class="l1" class="l1"><%= packagename %> - Adults: </label>
                <input type="text" id="total_adults" name="total_adults" value="<%= adult %>" class="t1" >
                
                  <label for="child" class="l1" class="l1"><%= packagename %> - Children/Senior: </label>
                  <input type="text" id="total_children" name="total_children" value="<%= children %>" class="t1" >
                
                  <hr><br>
                  
                  <label for="totalprice" class="l1"><b>Total Price: </b></label>
                  <input type="text" id="totalprice" name="totalprice" value="<%= totalprice %>" class="t1" >
                  
                  <br><br>
                
                
                <div class="elem-group inlined">
                <input type="submit" class="b1" value="Book Now"/>
                </div>
                 
                <div class="elem-group inlined">
                <button type="submit" class="b1" value="Back" onclick="document.location='reserveForm.jsp'">Back</button>
                
                </div>

            </form>

        </section>
    
    </body>
</html>