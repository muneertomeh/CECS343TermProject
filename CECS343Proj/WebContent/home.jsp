<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.project.Login"  %>
<%@ page import="com.project.Register"  %>
<%@ page import="com.project.Restaurant"  %>
<%@ page import="com.project.Review"  %>
<%@ page import="com.project.User"  %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Welcome ^.^</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<style>
</style>
<body background = "food.png">


<%
	//retrieves the User object passed from the login.jsp or register.jsp page
	User loggedUser = (User)request.getAttribute("User");
	String name;
	
	//if the entry inside the loggedUser variable is null, then don't display a username
	if(loggedUser==null){
		name = null;
	
	}
	else{
		name = loggedUser.getUsername();
	}	
%>
		<div class="w3-bar w3-teal">
  		<a href="home.jsp" class="w3-bar-item w3-button">Home</a>
  		<a href="#" class="w3-bar-item w3-button">Link 1</a>
  		<a href="#" class="w3-bar-item w3-button">Link 2</a>
  		<a href="#" class="w3-bar-item w3-button">Link 3</a>
  		<a href = "#" class = "w3-bar-item w3-button"> <%=name %> </a>
		</div>	

	
		<div class="topnav" align = "center">
		 <form action = "Search" method = "get">
		    <button type = "submit">Search</button>	
		 	<input name = "keyword" type="search" placeholder="Search..">
		 	<input type ="hidden" name = "nameOfUser" value = <%=name %>>
		 </form>
		</div>
		
		
		<img src = "logo.jpg">
		 
		<div class = "middlenav"> 
		  <a href="login.jsp">
		    <button type = "submit" class = "btn btn-primary btn-lg">Login</button>
		  </a>
		  <a href="register.jsp">
		    <button type = "submit" class = "btn btn-primary btn-lg">Register</button>
		  </a>
		</div>
		
		</body>
		</html>