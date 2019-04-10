<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd"> 

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<HTML>
<HEAD>
    <TITLE>joins of two tables through jsp</TITLE>
</HEAD>

<BODY bgcolor="#6E6E6E">
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
<font size="+3" color="#F6CECE"><br>Welcome in www.roseindia.net !</font>
<br>
<font size="+1" color="#F2F2F2"><br>Joins of two tables</font>

<%          int current = 0;

            // declare a connection by using Connection interface 
            Connection connection = null;

            /* Create string of connection url within specified format with machine 
			name, port number and database name. Here machine name id localhost 
			and database name is usermaster. */

            String connectionURL = "jdbc:mysql://localhost:3306/jsptutorials";

            /*declare a resultSet that works as a table resulted by execute a specified 
			sql query. */
            ResultSet rs = null;
%>
<FORM NAME="form1" ACTION="table_joins_jsp.jsp" METHOD="GET"><%
            if (request.getParameter("hidden") != null) {
                current = Integer.parseInt(request.getParameter("hidden"));
            }

            // Declare statement.
            Statement statement = null;
            try {

                // Load JDBC driver "com.mysql.jdbc.Driver" by newInstance() method. 
                Class.forName("com.mysql.jdbc.Driver").newInstance();

                /* Create a connection by using getConnection() method that takes 
				parameters of string type connection url, user name and password to 
				connect to database. */
                connection = DriverManager.getConnection(connectionURL, "root", "theblackpearl");

                /* createStatement() is used for create statement object that is 
				used for sending sql statements to the specified database. */
                statement = connection.createStatement();

						  String inq = (String) session.getAttribute("testInq");


				          // sql query to retrieve values from the secified table.
				        //  String QueryString = "select * from usersaccom where sessid = '"+inq+"' ";
				       //   rs = statement.executeQuery(QueryString);
						
						
                // executeQuery() method execute specified sql query. 
                rs = statement.executeQuery("select hotelname,basis from users, useraccom where sessid = '"+inq+"'");

                for (int i = 0; i < current; i++) {
                    rs.next();
                }
                if (!rs.next()) {
%>
<FONT size="+2" color="red"></b>
<%
        out.println("Sorry ! found some problems with database.");
    } else {
%>

<TABLE style="background-color: #D8D8D8;" WIDTH="30%">
    
    <TR><TH width="50%">ID</TH><TD width="50%"> <%= rs.getInt(1)%> </TD></tr>
    <TR><TH>Name</TH><TD> <%= rs.getString(2)%> </TD></tr>
    <TR><TH>City</TH><TD> <%= rs.getString(3)%> </TD></tr>
    <TR><TH>Phone</TH><TD> <%= rs.getString(4)%> </TD></tr>
    <TR><TH>Name</TH><TD> <%= rs.getString(5)%> </TD></tr>
    <TR><TH>City</TH><TD> <%= rs.getString(6)%> </TD></tr>
    <TR><TH>Phone</TH><TD> <%= rs.getString(7)%> </TD></tr>
    <TR><TH>Name</TH><TD> <%= rs.getInt(8)%> </TD></tr>
    <TR><TH>City</TH><TD> <%= rs.getString(9)%> </TD></tr>
    <TR><TH>Phone</TH><TD> <%= rs.getString(10)%> </TD></tr>
	
</TABLE>
<BR>
<INPUT TYPE="hidden" NAME="hidden" VALUE="<%=current + 1%>">
<INPUT TYPE="submit" VALUE="next record">
</FORM>
<%
    }
} 
catch (Exception ex) {
%>
<FONT size="+3" color="red"></b>
    <%
                out.println("Unable to connect to database.");
            } finally {
                // close all the connections.
                rs.close();
                statement.close();
                connection.close();
            }
    %>
</FONT>
</FORM>
</body> 
</html>