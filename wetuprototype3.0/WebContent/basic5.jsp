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




		</head>
	<body>

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
        <p>Welcome <%=session.getAttribute("sessid")%>
        </p>	
        
        	</div>
        	

<div class ="main">
  
  
    
  <input id="tab1" type="radio" name="tabs">
  <label for="tab1">Itinerary Details</label>
    
  <input id="tab2" type="radio" name="tabs"  checked>
  <label for="tab2">Accomodations</label>
    
  <input id="tab3" type="radio" name="tabs">
  <label for="tab3">Route Builder</label>
  
  <input id="tab4" type="radio" name="tabs">
  <label for="tab4">Planner</label>
  
  <input id="tab5" type="radio" name="tabs">
  <label for="tab5">Additional Details</label>
    
      
  <section id="content1">
    
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
          String QueryString = "select * from itinerary where itinsessid = '"+inq+"' ";
          rs = statement.executeQuery(QueryString);
          

%>




<table align="center">
    <%
    while (rs.next()) {
    %>
    <TR>
        <TH>ITINERARYID</TH>
        <TH>ITINERARYNAME</TH> 
        <TH>BRANDING</TH>
        <TH>ITINERARYTYPE</TH>
        <TH>LANGUAGE</TH>
        <TH>ITINSESSID</TH>
       

        
    </TR>
    <TR>
        <TD><%=rs.getInt(1)%></TD>
        <TD><%=rs.getString(2)%></TD>
        <TD><%=rs.getString(3)%></TD>
        <TD><%=rs.getString(4)%></TD>
        <TD><%=rs.getString(5)%></TD>
        <TD><%=rs.getString(6)%></TD>
       

        
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
  
  </section>
    
  <section id="content2">
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

<table class='altrowstable' align='center' id='alternatecolor' cellpadding='1' font-family='Glyphicons Halflings' >
    <%
    while (rs.next()) {
    %>
    <TR>
        <TH>ID</TH>
               <TH>HOTELNAME</TH>
               <TH>LOCATION</TH>            
               <TH>BASIS</TH>
               <TH>BEVERAGE</TH>
               <TH>DESLAYOUT</TH>
               <TH>NIGHTS</TH>
               <TH>ITINSESSID</TH>
               <TH>EDIT</TH>
               <TH>DELETE</TH>
               

        
    </TR>
    <TR>
        <TD><%=rs.getInt(1)%></TD>
        <TD><%=rs.getString(2)%></TD>
        <TD><%=rs.getString(3)%></TD>
        <TD><%=rs.getString(4)%></TD>
        <TD><%=rs.getString(5)%></TD>
        <TD><%=rs.getString(6)%></TD>
        <TD><%=rs.getInt(7)%></TD>
        <TD><%=rs.getString(8)%></TD>
        <td><a
			href="UserHandler?action=editaccom&itinaccomid=<%=rs.getInt(1)%>">Update</a></td>
		<td><a
			href="UserHandler?action=delete&itinaccomid=<%=rs.getInt(1)%>">Delete</a></td>
        
      

        
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
     		<div class="top">
    <a href="itinviewer.jsp" target="_blank">
    <button id="mybtn">view itin on browser</button>
    </a>
     		
   |
        <a href="accomodation.jsp" target="_blank">
<button id="mybtn">Add Accomodation</button>
</a>
        	
        
        	</div>
  </section>
  
    
  <section id="content3">
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
          String QueryString = "select * from itinrouteplanner where itinsessid = '"+inq+"' ";
          rs = statement.executeQuery(QueryString);
          

%>

<table class='altrowstable' align='center' id='alternatecolor' cellpadding='1' font-family='Glyphicons Halflings' >
    <%
    while (rs.next()) {
    %>
    <TR>
              <TH>PLANID</TH>
               <TH>START</TH>
               <TH>MODE</TH>
               <TH>MODETYPE</TH>
               <TH>MODETHEME</TH>
               <TH>DATE</TH>
               <TH>TIME</TH>
               <TH>END</TH>
               <TH>ITINSESSID</TH>

        
    </TR>
    <TR>
        <TD><%=rs.getInt(1)%></TD>
        <TD><%=rs.getString(2)%></TD>
        <TD><%=rs.getString(3)%></TD>
        <TD><%=rs.getString(4)%></TD>
        <TD><%=rs.getString(5)%></TD>
        <TD><%=rs.getString(6)%>/<%=rs.getString(7)%>/<%=rs.getString(8)%></TD>
        <TD><%=rs.getString(9)%>:<%=rs.getString(10)%>:<%=rs.getString(11)%></TD>       
        <TD><%=rs.getString(12)%></TD>
        <TD><%=rs.getString(13)%></TD>

        
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
     
     	<div class="top">
   |
      
        <a href="routeplanner.jsp">Add Route by Day</a>|
       
       
    
        	
        
        	</div>
    
  </section>
    
      <section id="content4">
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
          //Â Load JBBC driver "com.mysql.jdbc.Driver"
          Class.forName("com.mysql.jdbc.Driver").newInstance();

          /* Create a connection by using getConnection() method that takes parameters of string type connection url, user name and password to connect to database. */
          connection = DriverManager.getConnection(connectionURL, "root", "mjolnir1");

          /* createStatement() is used for create statement object that is used for sending sql statements
          to the specified database. */
          statement = connection.createStatement();

                  String inq = (String) session.getAttribute("testInq");


          // sql query to retrieve values from the secified table.z
          String QueryString = "select * from itinactivity where itinsessid = '"+inq+"' ";
          rs = statement.executeQuery(QueryString);
          

%>




	
		
<table class='altrowstable' align='center' id='alternatecolor' cellpadding='1' font-family='Glyphicons Halflings' >


 <%
    while (rs.next()) {
    %>

 <TR>
        <TH>ACTIVITYID</TH>
               <TH>ACCOMODATION</TH>
               <TH>ACTIVITY</TH>
               <TH>DATE</TH>
               <TH>ITINSESSID</TH>

        
    </TR>
    <TR>
        <TD><%=rs.getInt(1)%></TD>
        <TD><%=rs.getString(2)%></TD>
        <TD><%=rs.getString(3)%></TD>
        
        <TD><%=rs.getString(4)%>/<%=rs.getString(5)%>/<%=rs.getString(6)%></TD>
        <TD><%=rs.getString(7)%></TD>
   
        
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
         
         	<div class="top">
   |

        <a href="dayplanner.jsp">Add Plan</a>|
    
        	
        
        	</div>
    
  </section>
  
  <section id="content5">


<%
      try {
          /* Create string of connection url within specified format with machine name, port number and database name. Here machine name id localhost and database name is student. */
          String connectionURL = "jdbc:mysql://localhost:3306/jsptutorials";

          // declare a connection by using Connection interface
          Connection connection = null;

          // declare object of Statement interface that is used for executing sql statements.
          Statement statement = null;

          // declare a resultset that uses as a table for output data from tha table.
          ResultSet rs = null;
        		  
          //Â Load JBBC driver "com.mysql.jdbc.Driver"
          Class.forName("com.mysql.jdbc.Driver").newInstance();

          /* Create a connection by using getConnection() method that takes parameters of string type connection url, user name and password to connect to database. */
          connection = DriverManager.getConnection(connectionURL, "root", "mjolnir1");

          /* createStatement() is used for create statement object that is used for sending sql statements
          to the specified database. */
          statement = connection.createStatement();

                  String inq = (String) session.getAttribute("testInq");


          // sql query to retrieve values from the secified table.z
          String QueryString = "select * from usersaccom where sessid = '"+inq+"' ";
          rs = statement.executeQuery(QueryString);
       
    


%>



		  <div class="content">  
			  <div id="content1">
				</br>
			
<table class='altrowstable' align='center' id='alternatecolor' cellpadding='1' font-family='Glyphicons Halflings' >

 <%
    while (rs.next()) {
    %>
       
 <TR>

        <TH>DESTINATION</TH>
        <TH>NIGHT</TH>
       
        <TH>ADULTS</TH>
        <TH>CHILDREN</TH>

        
    </TR>
    <TR>

        <TD><%=rs.getString(2)%></TD>
        <TD><%=rs.getString(5)%></TD>

        <TD><%=rs.getString(7)%></TD>
        <TD><%=rs.getString(8)%></TD>
   </TR>
   
   

            <TR>
            <TH>TOTAL PRICE</TH>
            </TR>

            <TR>
            <TD colspan='6' align='right'> 
                                    <%      
        int totalPrice = 0;
        int totalPricea = 0;


        
        //int ae = rs.getInt(5);
        //int ad = rs.getInt(7);
        //int ac = rs.getInt(9);
        
        Integer ae= rs.getInt("nights");
        Integer ad= rs.getInt("adults");
        Integer ac= rs.getInt("children");




       
        totalPrice += (ad + ac);
        totalPricea +=(ae * totalPrice);
        
        
      
    %>
            <%=totalPricea%></TD>
            </TR>


           <%   }    %>
     
      
    <%
   
    // close all the connections.
  
    rs.close();
    statement.close();
    connection.close();
} catch (Exception ex) {
  
                out.println("Problem Getting Data Try Again Later.");
            }
        %>
     </table>
     
          	<div>

        <a href="itinviewer.jsp">view itin on browser</a>
    
        	
        
        	</div>
     
     	<div class="top">

        <a href="end.jsp">Finish</a>
    
        	
        
        	</div>
  </section>
  
    
</div>

	</body>
</html>

