<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.project.Restaurant"  %>
<%@ page import="com.project.RestaurantDAO"  %>
<%@ page import="com.project.BusinessInfo"  %>
<%@ page import="com.project.Review"  %>
<%@ page import="java.util.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css" type="text/css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>
        <%
        	RestaurantDAO rd = new RestaurantDAO();
        	
        	Restaurant selectedRestaurant = (Restaurant) request.getAttribute("chosenRestaurant");
        	String username = (String) request.getAttribute("loggedUser");
        	ArrayList<Review> reviews = rd.retrieveReviews(selectedRestaurant.getRestaurantID());
        	
        	out.println(selectedRestaurant.getRestaurantName());
        %>
    </title>
    <style>
        body{
            background-image: url("./img/search.png");
            background-size: cover;
            background-attachment: fixed;
        }
    </style>
</head>
<body>
    <header>
        <div id="header-wrapper">
        	<div class="w3-bar w3-teal" id="navigation-wrapper">
                <div>
                    <a href="register.jsp" class="w3-bar-item w3-button">Home</a>
                    <a href="#" class="w3-bar-item w3-button">Link 1</a>
                    <a href="#" class="w3-bar-item w3-button">Link 2</a>
                    <a href="#" class="w3-bar-item w3-button"><%=username %></a>
                </div>
            </div>
            <div id="search-wrapper">
            	<form action ="Search" method = "POST">
                	<button type="submit" name = "Write Review" value = "Write Review">Search</button>	
             		<input name="keyword" type="search" placeholder="Search..">
             		<input type="hidden" name="nameOfUser" value=<%=username %>>
             	</form>
             </div>
         </div>
    </header>

    <section id="main-content">
        <div class="content-wrapper" id="info-wrapper">
            <div id="restaurant-info">
                <h2><strong><%=selectedRestaurant.getRestaurantName() %></strong></h2>
                <hr/>
                <h5><%=selectedRestaurant.getRestaurantType() %></h5>
                <h4>Address:</h4>
                <p><%=selectedRestaurant.getRestaurantAddress() %></p>
            </div>
            <div id="hours-wrapper">
                <h3><strong>Hours:</strong></h3>
                <hr/>
                <%
                    BusinessInfo bi = selectedRestaurant.getRestaurantBusinessInfo();
                    for(Map.Entry<String, String> mp : bi.getHours().entrySet()){
                %>
                    <div class="hours">
                        <span><%=mp.getKey() %></span>
                        <span><%=mp.getValue() %> </span>
                    </div>
                <% } %>
            </div>
        </div>
        <div class="content-wrapper" id="reviews-wrapper">
            <div class="restaurant-wrapper" id="write-review-wrapper">
                <div>
                    <h3><strong>Write a Review</strong></h3>
                    <hr/>
                    <textarea type="text" name="review"></textarea>
                    <button type="submit">Submit</button>
                </div>
            </div>
            <div class="restaurant-wrapper" id="list-reviews-wrapper">
                <div>
                    <h1>Reviews</h1>
                    <hr/>
                </div>
                <% for(Review r:reviews){
                    int stars = r.getStarsGiven();
                    int i=0;
                    int [] stats = r.countLikesAndDislikes();
                %>
                    <div class="review-wrapper">
                        <div class="review-content">
                            <% while(i<stars){ %>
                                <span class="fa fa-star checked"></span>
                            <%      i++;}
                                while(i<5){ i++; %>
                                <span class="fa fa-star"></span>
                            <% } %>
                            <span><%=r.getReviewNumber() %></span>
                            <span><%=r.getAuthor() %></span>
                            <p><%=r.getComment() %></p>
                            
                        </div>
                        <div class="review-actions">
                            <form action="Search" method="POST">
                                <input type="hidden" name="reviewNumber" value=<%=r.getReviewNumber() %> />
                                <input type="hidden" name="restaurID" value=<%=selectedRestaurant.getRestaurantID() %> />
                                <input type="hidden" name="restaurantName" value = <%= selectedRestaurant.getRestaurantName() %> />
                                <input type="hidden" name="restaurantAddress" value=<%= selectedRestaurant.getRestaurantAddress() %> />
                                <input type = "hidden" name="restaurantType" value = <%= selectedRestaurant.getRestaurantType() %> />
                                <button type="submit" class="btn btn-default btn-sm"name="Like" value="Like">
                                    <span class = "glyphicon glyphicon-thumbs-up">Like</span> 
                                    <span class="review-likes"><%=stats[0]%></span>
                                </button>
                            </form>
                            <form action="Search" method="post">
                                <input type="hidden" name="reviewNumber" value=<%=r.getReviewNumber() %> />
                                <input type="hidden" name="restaurID" value=<%=selectedRestaurant.getRestaurantID() %> />
                                <input type="hidden" name="restaurantName" value = <%= selectedRestaurant.getRestaurantName() %> />
                                <input type="hidden" name="restaurantAddress" value = <%= selectedRestaurant.getRestaurantAddress() %> />
                                <input type="hidden" name="restaurantType" value=<%= selectedRestaurant.getRestaurantType() %> />
                                <button type = "submit" class="btn btn-default btn-sm" name = "Dislike" value = "Dislike">
                                    <span class="glyphicon glyphicon-thumbs-down">Dislike</span>
                                    <span class="review-dislikes"><%=stats[1] %></span>
                                </button>
                            </form>
                        </div>
                    </div>
                <% } %>
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