<%-- 
    Document   : login
    Created on : Feb 2, 2023, 1:36:01 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<style>
  body {
  background:  #f3f2f2; 
}
.row {
  height: 100vh;
}
.form {
  background:  #ffffff; 
  border-radius:  4px; 
  box-shadow:  0px 2px 6px -1px rgba(0,0,0,.12);
}
.image img {
  width: 320px;
  height: 500px;
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}
.my-form {
  padding: 2.5rem;
}
.my-form h4 {
  color: #FFC0CB;
}
.my-form p {
  font-size: .875rem;
  font-weight: 400;
}
.btn {
  background-color: #FFC0CB;
  right: 0;
  margin-top: 10px;
}
.btn:hover, .btn:active, .btn:focus {
  color: #fff;
}
a {
  bottom: 0;
}
.space {
  
  padding-bottom: 2rem;
}
.link {
  font-size: .875rem;
  float: right;
  color: #FFC0CB;
}
.link:hover, .link:active {
  color: #FFC0CB;
}
@-webkit-keyframes autofill {
  to {
    color: #FFC0CB;
    background: transparent; } }

@keyframes autofill {
  to {
    color: #FFC0CB;
    background: transparent; } }

input:-webkit-autofill {
  -webkit-animation-name: autofill;
  animation-name: autofill;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both; }
</style>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<script> 
function validate()
{ 
     var username = document.form.username.value; 
     var password = document.form.password.value;
 
     if (username == null || username=="")
     { 
     alert("Username cannot be blank"); 
     return false; 
     }
     else if(password==null || password=="")
     { 
     alert("Password cannot be blank"); 
     return false; 
     } 
}
</script> 
</head>
<div class="container">
  <div class="row d-flex justify-content-center align-items-center">
    <div class="col-md-7">
      <div class="form d-flex justify-content-between">
        <div class="image">
          <img src="theme park.jpg">
        </div>
        <form name="form" class="my-form" action="LoginServlet" method="post" onsubmit="return validate()">
          <h4 class="font-weight-bold mb-3">Log in to Hepi Theme Park</h4>
          <p class="mdb-color-text">Hepi Place For All !</p>
          <!-- Email address -->
          <div class="md-form md-outline">
            <label for="usernameExample">Username</label>
            <input name="username" type="username" id="usernameExample" class="form-control">
          </div>
          <!-- Password -->
          <div class="md-form md-outline">
            <label for="passwordExample">Password</label>
            <input name="password" type="password" id="passwordExample" class="form-control">
            
          </div>
          
        <button class="btn btn-rounded" type="submit">Log in</button>
        <!-- <input type="submit" value="Login"></input> -->
            
          <hr>
          <a class="link" href="registration.jsp">New user ? Register here and join our hepi member :)</a>
        </form>
      </div>
    </div>
  </div>
</div>
