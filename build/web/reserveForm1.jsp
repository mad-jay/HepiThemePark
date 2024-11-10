<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="reserveStyle.css">

    </head>
    <body>
        <section class="navbar">
        <a class="navbar-brand" href="dashboard.html">H E P I</a>
         <a href="bookticket.jsp" >Ticket</a>
        <a href="reserve.jsp">Reserve</a>
        <a href="LogoutServlet">Log Out</a>
        </section>

       <section class="booking">
            <form action="ticket.jsp" method="POST" class="f1">
                <input type="hidden" name="package" value="package2">
                    <label for="name" class="l1">Your Name</label>
                    <input type="text" id="name" name="name" placeholder="John Doe" pattern=[A-Z\sa-z]{3,20} class="t1" required>
                  

                    <label for="email" class="l1">Your E-mail</label>
                    <input type="email" id="email" name="email" placeholder="john.doe@email.com" class="t1" required>
                  
                      <label for="ic" class="l1">New MyKad No.</label>
                      <input type="text" id="ic" name="ic" placeholder="000000-00-0000" class="t1" required>
                        <br><br><br>
                        <hr>
                        <br>
                  
                      <label for="date" class="l1">Preferred Date</label>
                      <input type="date" id="date" name="date" class="t1" required>
                      <br><br>
                      <div class="elem-group inlined">
                        <label for="adult" class="l1">1-Day Hepi Theme Park In Door Unlimited Entry - Adults</label>
                        <input type="number" id="total_adults" name="total_adults" placeholder="2" min="1" class="t1" required>
                      </div>
                      
                      <div class="elem-group inlined">
                        <label for="child" class="l1" >1-Day Hepi Theme Park In Door Unlimited Entry - Children/Senior</label>
                        <input type="number" id="total_children" name="total_children" placeholder="2" min="0" class="t1" required>
                      </div>
                      
                      <hr><br>
                      <button type="submit" class="b1" >Book Now</button>

                    
            </form>
        </section>
      
       
        <section class="footer">
            <div class="col-3">
                <h3 class="h3">CONTACT</h3>
                <p>Email: hepithemepark@hr.com <br> <br> 1030, Jalan Genting Highland, <br> Pahang</p>
            </div>      
        </section>  
    </body>
</html>