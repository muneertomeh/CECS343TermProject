<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.project.Login"  %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Connection" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css" type="text/css" />

<title>Login</title>
</head>

<body>


<div class="w3-bar w3-teal">
  <a href="register.jsp" class="w3-bar-item w3-button">Home</a>
  <a href="#" class="w3-bar-item w3-button">Link 1</a>
  <a href="#" class="w3-bar-item w3-button">Link 2</a>
  <a href="#" class="w3-bar-item w3-button">Link 3</a>
</div>







	<section class ="registerContainer">
		<div class = "registration">
			<h2> Log In </h2>
			<div style="color:red">${errorMessage}</div>	
				<form action = "Login" method = "GET">
					<p class = "registerType"> <input type="text" placeholder="Enter Username" name="username" required></p>
					<p class = "registerType"> <input type = "text" placeholder = "Enter Password" name = "password" required> </p>
      				<button class = "button registerButton" "type="submit"> Log In</button>
				</form>
		</div>
			
	</section>


</body>
</html>