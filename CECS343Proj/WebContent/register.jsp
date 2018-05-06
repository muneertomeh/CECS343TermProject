<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.project.UserDAO"  %>
<%@ page import="com.project.Register"  %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="css/style.css" type="text/css" />
	<style>
        body{
            background-image: url("./img/food.png");
            background-size: cover;
            background-attachment: fixed;
        }
    </style>
	<title>Login</title>
</head>

<body>
	<section class ="registerContainer">
		<div class = "registration">
			<h2> Register </h2>
			<div style="color:red">${errorMessage}</div>	
			<form action="Register" method="GET">
				<p class="registerType"> <input type="text" placeholder="Enter Username" name="username" required></p>
				<p class="registerType"> <input type="password" placeholder="Enter Password" name="password" required> </p>
				<p class="registerType"> <input type = "text" placeholder = "Enter Email Address" name="emailAddress" required ></p>
				
  				<button class="button registerButton" type="submit"> Register</button>
			</form>
			<div class="registerAdditional">
				<p class="registerType"><a href="login.jsp">Already have an account, sign in</a></p>
			</div>
		</div>
	</section>

</body>
</html>
