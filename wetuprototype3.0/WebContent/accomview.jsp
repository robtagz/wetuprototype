







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
  <a href="itinviewer.jsp" >OVERVIEW</a>
  <a href="destination.jsp" >DESTINATION</a>
  <a href="accomview.jsp" class="active">ACCOMMODATION</a>
  <a href="dailyinfoview.jsp">DAILY INFORMATION</a>
    <a href="information.jsp">INFORMATION</a> 
        <a href="aboutus.jsp">ABOUT US</a>  
     
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
          connection = DriverManager.getConnection(connectionURL, "root", "theblackpearl");

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

 <div class="containerdestination">
<table >
    <TR>
      
               <TH>HOTELNAME</TH>
               <TH>NIGHTS</TH> 
               <TH>BASIS</TH>  
               <TH>DESCRIPTION</TH>          
    
    </TR>

    <%
    while (rs.next()) {
    %>

    <TR>
    <TD><%=rs.getString(2)%></TD>
    <TD><%=rs.getString(7)%></TD>
    <TD><%=rs.getString(4)%></TD>
    

   <%
    
      try {
          /* Create string of connection url within specified format with machine name, port number and database name. Here machine name id localhost and database name is student. */
          String connectionURLo = "jdbc:mysql://localhost:3306/hotelprototype2";

          // declare a connection by using Connection interface
          Connection connectiono = null;

          // declare object of Statement interface that is used for executing sql statements.
          Statement statemento = null;

          // declare a resultset that uses as a table for output data from tha table.
          ResultSet rso = null;
          // Load JBBC driver "com.mysql.jdbc.Driver"
          Class.forName("com.mysql.jdbc.Driver").newInstance();

          /* Create a connection by using getConnection() method that takes parameters of string type connection url, user name and password to connect to database. */
          connectiono = DriverManager.getConnection(connectionURLo, "root", "theblackpearl");

          /* createStatement() is used for create statement object that is used for sending sql statements
          to the specified database. */
          statemento = connectiono.createStatement();

                  String inqo = rs.getString(2) ;


          // sql query to retrieve values from the secified table.z
          String QueryStringo = "select description from hotelreserve where hotelname = '"+inqo+"' ";
          rso = statemento.executeQuery(QueryStringo);
          
          

%>


  <%
    while (rso.next()) {
    %>



    <TD class="center"  ><%= rso.getString("description")%></TD>
    
    
    
        
    <%   }    %>
    <%
    // close all the connections.
    rso.close();
    statemento.close();
    connectiono.close();
} catch (Exception ex) {
    %>
    
        <%
                out.println("Problem Getting Dest description +.");
            }
        %>
       
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


</div>

        	
        
        	
 
  
      	
<div class="containera">
	
</br>
funfacts of the itinerary.......
</br>

</div>
	</body>
</html>

