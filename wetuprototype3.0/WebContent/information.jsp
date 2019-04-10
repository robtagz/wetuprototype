<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="tabcss22.css">

<script type="text/javascript">
function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}
</script>
    <script src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
    <script>
        jQuery(window).ready(function(){
          jQuery("#findLocationBtn").click(initiate_geolocation);
        });
        
        function initiate_geolocation() {
            navigator.geolocation.getCurrentPosition(handle_geolocation_query,handle_errors);
        }
        function handle_errors(error)
        {
            switch(error.code)
            {
                case error.PERMISSION_DENIED: alert("user did not share geolocation data");
                break;
                case error.POSITION_UNAVAILABLE: alert("could not detect current position");
                break;
                case error.TIMEOUT: alert("retrieving position timed out");
                break;
                default: alert("unknown error");
                break;
            }
        }
        function handle_geolocation_query(position)
        {
            var google_tile = "http://maps.google.com/maps/api/staticmap?sensor=false&center=" + position.coords.latitude + "," +
                            position.coords.longitude + "&zoom=14&size=300x400&markers=color:blue|label:U|" +
                            position.coords.latitude + ',' + position.coords.longitude;
            var canvas = document.getElementById("myCanvas");
            var context = canvas.getContext("2d");   
            var imageObj = new Image();
            imageObj.src = google_tile;
            
            imageObj.onload = function(){
              context.drawImage(imageObj, 0, 0);
            }
        }
 


</script>




		</head>
	<body>
	
	
<div class="containerlogo">
<img src="AFROLINK.png" alt="afrolink" align="left" height="100px" width="120px">

</div>
	
	
	

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
		

        	
        	<div class="top2">
        <p>Welcome <%=session.getAttribute("itinsessid")%>
        </p>	
        
        	</div>
        	
        		
	<div class="topnav" id="myTopnav">
   <a href="accomview.jsp" >OVERVIEW</a>
  <a href="destination.jsp">DESTINATION</a>
  <a href="accomview.jsp">ACCOMMODATION</a>
   <a href="dailyinfoview.jsp">DAILY INFORMATION</a>
    <a href="information.jsp" class="active">INFORMATION</a> 
        <a href="aboutus.jsp">ABOUT US</a>   
     
  <a href="basic5.jsp"><</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">&#9776;</a>
</div>
	


   
	</body>
</html>

