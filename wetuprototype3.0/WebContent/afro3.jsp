<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/style_tut.css" rel="stylesheet" type="text/css">
<script src="js/alert_tut.js"></script> 


 
   <title>Home</title>
</head>
<body>
<a href="itinviewer.jsp">start</a>

<%



		if (session != null) {
			if (session.getAttribute("user") != null) {
				String name = (String) session.getAttribute("user");
				out.print("Hello, " + name + "  Welcome to ur Profile");
			} else {
				response.sendRedirect("login.html");
			}
		}

	%>


<div class="containerslider">
<div id="slider">
<img src="/Images/portfolio/img1.jpg" id="image" >
<div class="left_hold"><img onClick="photo(-1)" class="left" src="Images/arrow_left.png"></div>
<div class="right_hold"><img onClick="photo(1)" class="right" src="Images/arrow_right.png"></div>
</div>
</div>



</body>
</html>