<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="system.bean.UserBean"%>
<%@ page import="system.dao.UserDao"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All User</title>
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

<%
	//UserBean user = new UserBean();
	UserDao dao = new UserDao();
	List<UserBean> userList = dao.getAllUsers();
	//Iterator<UserBean> itr = userList.iterator();
%>


	
	
	
<table border="1">
	<tr>
		<th>Id</th>
		<th>First Name</th>
		<th>Last Name</th>
	</tr>
	<tr>
		<%
			/*while(itr.hasNext())
			 {
			 System.out.println(user.getId());*/
			for (UserBean user : userList) {
		%>
		<td><%=user.getId()%></td>
		<td><%=user.getfName()%></td>
		<td><%=user.getlName()%></td>
		<td><a
			href="UserHandler?action=editform&userId=<%=user.getId()%>">Update</a></td>
		<td><a
			href="UserHandler?action=delete&userId=<%=user.getId()%>">Delete</a></td>

	</tr>
	<%
		}
		//}
	%>
</table>
<p><a href="UserHandler?action=insert">Add User</a></p>
</body>
</html>