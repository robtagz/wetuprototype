<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New User</title>
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
	
	<%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/hotelprototype2?user=root&password=theblackpearl");

       Statement statement = connection.createStatement() ;

       resultset =statement.executeQuery("select hotelname from hotelreserve") ;
%>
	
	
<form method="POST" action='UserHandler' name="frmAddUser"><input
	type="hidden" name="action" value="insert" />
<p><b>Add New Record</b></p>
<table>
	<tr>
		<td>User ID</td>
		<td><input type="text" name="userid" /></td>
	</tr>
	<tr>
		<td>
		 
	        <select name="hotelName">
	        <%  while(resultset.next()){ %>
            <option value="<%= resultset.getString(1)%>"><%= resultset.getString(1)%></option>
        <% } %>
        </select>
         
        </td>
	</tr>
	
	<tr>
		<td>First Name</td>
		<td><input type="text" name="firstName" /></td>
	</tr>
	<tr>
		<td>Last Name</td>
		<td><input type="text" name="lastName" /></td>
	</tr>
	<tr>
		
	
		<td><input type="hidden" name="sessid" value="${testInq}" /></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Submit" /></td>
	</tr>
</table>
</form>
<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
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