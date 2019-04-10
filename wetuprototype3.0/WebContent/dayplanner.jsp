<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

  <title></title>
  <meta name="author" content="Robbert Matasa">

  <link rel="stylesheet" type="text/css" media="all" href="css/styles.css">
  <link rel="stylesheet" type="text/css" media="all" href="css/switchery.min.css">
  <script type="text/javascript" src="js/switchery.min.js"></script>
</head>

<body>



  <%
    if (session != null) {
      if (session.getAttribute("user") != null) {
        String name = (String) session.getAttribute("user");
        out.print("Hello, " + name + "  Profile");
      } else {
        response.sendRedirect("login.html");
      }
    }
  %>



  
  <div id="wrapper">
  
  <h1>Day Planner</h1>
  
 <form method="POST" action='UserHandler' name="frmAddUser"><input
	type="hidden" name="action" value="insertdayplanner"  />
	
	
	
	  <div class="col-2">
     <label>
      HOTEL
      <select name="activityaccom" tabindex="1">
      <%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/wetuprototype?user=root&password=mjolnir1");

       Statement statement = connection.createStatement() ;
       
       String inq = (String) session.getAttribute("testInq");


       resultset =statement.executeQuery("select hotelname from itinaccom where itinsessid = '"+inq+"' ") ;
%>

<option value="">- Select Hotel -</option>
					
	        <%  while(resultset.next()){ %>
            <option value="<%= resultset.getString(1)%>"><%= resultset.getString(1)%></option>
              <% } %>  
        </select>
    </label>
  </div>
  <%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
  
 
	
	
	
	
	
  <div class="col-2">
     <label>
      Select Activity
      <select name="activity" tabindex="1">
      <%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/hotelprototype2?user=root&password=theblackpearl");

       Statement statement = connection.createStatement() ;
       
       String inq = (String) session.getAttribute("testInq");


       resultset =statement.executeQuery("select activities from hotelreserve ") ;
%>

<option value="">- Select Plan -</option>
					<option value="Check in">- Check in-</option>
					<option value="Check out">- Check out -</option>
					
	        <%  while(resultset.next()){ %>
            <option value="<%= resultset.getString(1)%>"><%= resultset.getString(1)%></option>
              <% } %>  
        </select>
    </label>
  </div>
  <%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
  
  
 


  
<div class="col-2">   
    <label>
   Date
<select name='activitydate' id='Date' >
<option value=''>select Date</option>
<option value='01'>1</option>
<option value='02'>2</option>
<option value='03'>3</option>
<option value='04'>4</option>
<option value='05'>5</option>
<option value='06'>6</option>
<option value='07'>7</option>
<option value='08'>8</option>
<option value='09'>9</option>
<option value='10'>10</option>
<option value='11'>11</option>
<option value='12'>12</option>
<option value='13'>13</option>
<option value='14'>14</option>
<option value='15'>15</option>
<option value='16'>16</option>
<option value='17'>17</option>
<option value='18'>18</option>
<option value='19'>19</option>
<option value='20'>20</option>
<option value='21'>21</option>
<option value='22'>22</option>
<option value='23'>23</option>
<option value='24'>24</option>
<option value='25'>25</option>
<option value='26'>26</option>
<option value='27'>27</option>
<option value='28'>28</option>
<option value='29'>29</option>
<option value='30'>30</option>
<option value='31'>31</option>

</select>

<select name='activitymonth' id='Month'>
<option value=''>select Month</option>
<option value='January'>January</option>
<option value='February'>February</option>
<option value='March'>March</option>
<option value='April'>April</option>
<option value='May'>May</option>
<option value='June'>June</option>
<option value='July'>July</option>
<option value='August'>August</option>
<option value='September'>September</option>
<option value='October'>October</option>
<option value='November'>November</option>
<option value='December'>December</option>


</select>

<select name='activityyear' id='Year' >
<option value=''>Select Year</option>
<option value='2018'>2018</option>
<option value='2019'>2019</option>
<option value='2020'>2020</option>




</select>
</label>
  </div>
  
  

  
  <div class="col-4">
    <label>
   
      <input type="hidden" name="itinsessid" tabindex="6" value="${testInq}">
    </label>
  </div>
 
  
  <div class="col-submit">
    <button type="submit" class="submitbtn">Next</button>
  </div>
  
  </form>
  </div>
<script type="text/javascript">
var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));

elems.forEach(function(html) {
  var switchery = new Switchery(html);
});
</script>



</body>
</html>