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
<link rel="stylesheet" type="text/css" href="tabcssdestination.css">

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
  <a href="#home" class="active">OVERVIEW</a>
  <a href="destination.jsp">DESTINATION</a>
  <a href="accomview.jsp">ACCOMMODATION</a>
  <a href="#about">DAILY INFORMATION</a>
    <a href="#about">INFORMATION</a> 
        <a href="#about">CONTACT US</a>  
     
  <a href="basic5.jsp"><</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">&#9776;</a>
</div>
	


     <%
    
      try {
          /* Create string of connection url within specified format with machine name, port number and database name. Here machine name id localhost and database name is student. */
          String connectionURL = "jdbc:mysql://localhost:3306/wetuprototype";

          // declare a connection by using Connection interface
          Connection connection = null;

          // declare object of Statement interface that is used for executing sql statements.
          Statement statement = null;

          // declare a resultset that uses as a table for output data from tha table.
          ResultSet rs = null;
          // Load JBBC driver "com.mysql.jdbc.Driver"
          Class.forName("com.mysql.jdbc.Driver").newInstance();

          /* Create a connection by using getConnection() method that takes parameters of string type connection url, user name and password to connect to database. */
          connection = DriverManager.getConnection(connectionURL, "root", "mjolnir1");

          /* createStatement() is used for create statement object that is used for sending sql statements
          to the specified database. */
          statement = connection.createStatement();

                  String inq = (String) session.getAttribute("testInq");


          // sql query to retrieve values from the secified table.z
          String QueryString = "select * from itinaccom where itinsessid = '"+inq+"' ";
          rs = statement.executeQuery(QueryString);
          

%>
</br>
  <div class="maincontainer">  

 <div class="containerc">
<table >
    <TR>
      
               <TH>HOTELNAME</TH>
               <TH>NIGHTS</TH>            
    
    </TR>

    <%
    
    float totalextrasB =0f;
    while (rs.next()) {
    %>

    <TR>
    <TD><%=rs.getString(2)%></TD>
    <TD><%=rs.getInt(7)%></TD>
      
     </TR> 
     
    
       
  
    <%   }    %>
    <%
    // close all the connections.
    rs.close();
    statement.close();
    connection.close();
} catch (Exception ex) {
    %>
    
        <%
                out.println("Problem Getting Data Try Again Later.");
            }
        %>
    

    
    
     </table>
   
     		
  </div>

<div class="containerb">
<div id="map_canvas"></div>
maps
  
       

</div>
</div>

        	
        
        	
 
  
      	
<div class="containera">
	
</br>
funfacts of the itinerary.......
</br>

<div class="containerimg">
</br>
</div>


</div>
	</body>
</html>

