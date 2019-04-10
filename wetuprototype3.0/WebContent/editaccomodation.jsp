<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="system.bean.UserBean"%>
<%@ page import="system.dao.UserDao"%>
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
<div id="wrapper">
  
  <h1>Edit Accomodation</h1>


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
	
	
	
	<%
	UserBean user = new UserBean();
%>
<%
	UserDao dao = new UserDao();
%>
	
	
	
	<%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/hotelprototype2?user=root&password=mjolnir1");

       Statement statement = connection.createStatement() ;

       resultset =statement.executeQuery("select hotelname from hotelreserve") ;
%>
	
	
<form method="POST" action='UserHandler' name="frmEditAccom"><input
	type="hidden" name="action" value="editaccom"  />
	<%
 	String uid = request.getParameter("itinaccomid");
 		int id = Integer.parseInt(uid);
 		user = dao.getAccomById(id);
 %>
  <div class="col-2">
     <label>
      Hotel Name
       <select name="hotelName" tabindex="1">
               <option value="<%=user.getHotelName()%>"><%=user.getHotelName()%></option>
       
	        <%  while(resultset.next()){ %>
	        

            <option value="<%= resultset.getString(1)%>"><%= resultset.getString(1)%></option>
        <% } %>
        <%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
        
        </select>
    </label>
  </div>
   <div class="col-2">
    <label>
      Location
      <input type="text" value="<%=user.getLocation()%>"  name="location" tabindex="1">
    </label>
  </div>
  
  <div class="col-2">
    <label>
      Basis
<select tabindex="1" name="basis">
        <option value="<%=user.getBasis()%>"><%=user.getBasis()%></option>
        <option value="Dinner Bed and Breakfast">Dinner Bed and Breakfast</option>
        <option value="Bed and Breakfast">Bed and Breakfast</option>
        <option value="Dinner Lunch Bed and Breakfast">Dinner Lunch Bed and Breakfast</option>
        
      </select>    </label>
  </div>
  <div class="col-2">
    <label>
      Beverage
<select tabindex="1" name="beverage">
        <option value="<%=user.getBeverage()%>"><%=user.getBeverage()%></option>
        <option value="no drinks">No Drink</option>
        <option value="drink">Drink</option>
        
      </select>    </label>
  </div>
  
  <div class="col-2">
    <label>
      Destination Layout
<select tabindex="1" name="deslayout">
        <option value="<%=user.getDesLayout()%>"><%=user.getDesLayout()%></option>
        <option value="day by day">Day by day</option>
        <option value="by destination">By Destination</option>
      </select>    </label>
  </div>
  <div class="col-2">
    <label>
      Nights
      <input type="number" value="<%=user.getnIghts()%>"  name="nights" tabindex="1">
    </label>
  </div>
  
  
  

 
   
      <input type="hidden" name="itinsessid" tabindex="6" value="<%=user.getItinsessId()%>">
   
  
  <div class="col-submit">
    <button type="submit" class="submitbtn">Update</button>
  </div>
  
  </form>
  </div>
<script type="text/javascript">
var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));

elems.forEach(function(html) {
  var switchery = new Switchery(html);
});
</script>

<%request.getAttribute("fstname");
	String fst = (String) session.getAttribute("user");
	out.print(fst);
	%>

	<%session.getAttribute("user");
	String jina = (String) session.getAttribute("user");
	out.print(jina);
	%>
	<%session.getAttribute("testInq");
	String inq = (String) session.getAttribute("testInq");
	out.print(inq);
	%>

<p><a href="UserHandler?action=listUser">View-All-Records</a></p>
</body>
</html>