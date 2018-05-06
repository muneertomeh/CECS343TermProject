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
	<title>Home</title>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="css/style.css" type="text/css" />
	<style>
        body{
            background-image: url("./img/food.png");
            background-size: cover;
            background-attachment: fixed;
        }
    </style>
</head>

<body>
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
	<header>
        <div id="header-wrapper">
        	<div class="w3-bar w3-teal" id="navigation-wrapper">
                <div>
                    <a href="register.jsp" class="w3-bar-item w3-button">Home</a>
                    <a href="#" class="w3-bar-item w3-button">Link 1</a>
                    <a href="#" class="w3-bar-item w3-button">Link 2</a>
                    <a href="#" class="w3-bar-item w3-button"><%=name %></a>
                </div>
            </div>
            <div id="search-wrapper">
            	<form action="Search" method="get">
                	<button type="submit">Search</button>	
             		<input name="keyword" type="search" placeholder="Search..">
             		<input type="hidden" name="nameOfUser" value=<%=name %>>
             	</form>
             </div>
         </div>
    </header>
    <section id="main-content">
    	<div id="homepage-wrapper">
	    	<div id="homepage-logo-wrapper">
	    		<div>
					<img src="./img/logo.jpg">
				</div>
			</div>
			<div id="homepage-links-wrapper">
				<div>
					<div>
						<h4>Have an Account?</h4>
						<a class="a-btn" href="login.jsp">
						    <button type="submit" class="btn btn-primary btn-lg">Login</button>
						</a>
					</div>
					<div>
					  	<h4>New User?</h4>

						<a class="a-btn" href="register.jsp">
						    <button type="submit" class="btn btn-primary btn-lg">Register</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<div id="footer-wrapper">
			<div id="footer-info-wrapper">
				<p>&copy; Gabe Flores, Muneer Tomeh, Truc Tran</p>
			</div>
			<div id="footer-icon-wrapper">
				<ul id="footer-icons">
					<li class="footer-icon"><a href="https://facebook.com"><img src="./img/logo_facebook.png"/></a></li>
					<li class="footer-icon"><a href="https://twitter.com"><img src="./img/logo_twitter.png"/></a></li>
					<li class="footer-icon"><a href="https://youtube.com"><img src="./img/logo_youtube.png"/></a></li>
				</ul>
			</div>
		</div>
	</footer>
</body>
</html>