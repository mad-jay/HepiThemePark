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
        <title>Registration</title>
        <link rel="stylesheet" href="registrationStyle.css">
        
        <script> 
function validate()
{ 
     var username = document.form.username.value;
     var email = document.form.email.value;
     var psw = document.form.psw.value; 
     var nophone = document.form.nophone.value;
     var conpsw= document.form.conpsw.value;
     
     if (username==null || username==0)
     { 
     alert("Username can't be blank"); 
     return false; 
     }
     else if (email==null || email==0)
     { 
     alert("Email can't be blank"); 
     return false; 
     }
     else if (nophone==null || nophone==0)
     { 
     alert("Telephone Number can't be blank"); 
     return false; 
     }
     else if(psw.length<8)
     { 
     alert("Password must be at least 6 characters long."); 
     return false; 
     } 
     else if (psw!==conpsw)
     { 
     alert("Confirm Password should match with the Password"); 
     return false; 
     } 
 } 
</script> 
    </head>
    <body>

        <section class="register">
            <form action="RegisterServlet" method="POST">
                <div class="container">
                    <h1>Register</h1>
                <p>Please fill in this form to create an account.</p>
                <hr>

                <label for="username"><b>Username</b></label>
                <input type="text" placeholder="Enter Username" name="username" id="username" required>
            
                <label for="email"><b>Email</b></label>
                <input type="text" placeholder="Enter Email" name="email" id="email" required>
            
                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="password" id="password" required>
                
                <label for="conpsw"><b>Confirm Password</b></label>
                <input type="password" placeholder="Enter Password" name="conpsw" id="conpsw" required>

                <label for="nophone"><b>Phone Number</b></label>
                <input type="text" placeholder="Enter Phone Number" name="nophone" id="nophone" required>
            
                
                <hr>

                <button type="submit" class="registerbtn" value="Register">Register</button>
            
              
             
                <p>Already have an account? <a href="login.jsp">Sign in</a>.</p>
                </div>
            </form>

        </section>
    </body>
</html>
