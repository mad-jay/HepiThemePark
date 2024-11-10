<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="bookticket.css">
    </head>
    <body>
        <section class="navbar">
        <a class="navbar-brand" href="dashboard.html">H E P I</a>
        <a href="bookticket.jsp" >Ticket</a>
        <a href="ReserveServlet">Reserve</a>
        <a href="LogoutServlet">Log Out</a>
        </section>
        <section class="booking">
            <table>
                <tr>
                    <th><img src="phpThumb_generated_thumbnailjpg"  width="300" height="230"></th>
                    <th><img src="south-korea-theme-park.jpeg"  width="310" height="230"></th>
                    <th><img src="Best-Theme-Park-Games.jpg"  width="310" height="230"></th>
                  </tr>
                  <tr>
                    <td >
                        <ul class="ul1">Hepi Theme Park Out-Door </ul>
                        <ul class="ul1">1-Day Ticket</ul><br>
                        <ul class="ul1">Ticket include:</ul><br>
                        <li>Park Hours: 11 am to 6 pm; 1-Day</br> 
                            unlimited entry to Hepi Theme Park</li>
                            <br>
                            <p>RM150 - Adult <br> RM120 - Children/Senior</p>
                            <br>
                            <ul><button type="submit" class="buttonB" onclick="document.location='reserveForm.jsp'">Book Now</button></ul>
                        
                    </td>
                    <td >
                            <ul class="ul1">Hepi Theme Park Indoor </ul>
                            <ul class="ul1">1-Day Ticket</ul><br>
                            <ul class="ul1">Ticket include:</ul><br>
                            <li>Park Hours: 1 pm to 8 pm; 1-Day
                            </br>unlimited entry to Hepi Theme Park Indoor
                            </li>
                            <br>
                            <p>RM80 - Adult <br> RM75 - Children/Senior</p>
                            <br>
                            <ul><button type="submit" class="buttonB" onclick="document.location='reserveForm1.jsp'">Book Now</button></ul>
                    </td>
                    <td>
                            <ul class="ul1">Hepi Theme Park Family Package </ul>
                            <ul class="ul1">2-Day Ticket</ul><br>
                            <ul class="ul1">Ticket include:</ul><br>
                            <li>2-day unlimited entry to Hepi Theme Park Out-Door
                            </br>(11am-6pm) and entry to unlimited ride at Hepi Theme<br>
                            Park Indoor (1pm-8pm)
                            </li>
                            <br>
                            <p>RM350 - Adult <br> RM280 - Children/Senior</p>
                            <br>
                            <ul><button type="submit" class="buttonB" onclick="document.location='reserveForm2.jsp'">Book Now</button></ul>
                    </td>
                  </tr>
                  
            </table>
        </section>
        <section class="footer">
            <div>
                <h3>CONTACT</h3>
                <p>Email: hepithemepark@hr.com <br> 1030, Jalan Genting Highland,Pahang </p>
            </div>      
        </section>
    </body>
</html>