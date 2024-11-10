<%-- 
    Document   : error
    Created on : Jan 13, 2023, 5:07:18 PM
    Author     : arish
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="paymentCss.css">
         <title>error</title>
    </head>
    <body align="center">
        <h1>Error!</h1>
        <%
            List errorMsgs = (List) request.getAttribute("errorMsgs");
            if(errorMsgs!=null){
        %>
         <p>Please correct the following errors:
            <tr>
                <%
                    Iterator items = errorMsgs.iterator();
                    while (items.hasNext()) {
                            String message = (String) items.next();      
                %>
                <ul>
                    -> <%= message %>
                </ul>
                <%
                    }
                %>
            </tr>
        </p>
        <%
            }
        %>
        <br>
        <input type="submit" value="Back to home" onclick="document.location='payment.jsp'"> 
    </body>
</html>

