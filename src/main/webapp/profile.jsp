<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.techfabric.app_dao.*" %>
    <%@ page import="com.techfabric.app_daoImpl.*" %>
    <%@ page import="com.techfabric.app_model.*" %>
    <%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>
</head>
<body bgcolor="Azure">

<center>
<%
	//Check for session first
	
	session = request.getSession();
	Object obj = session.getAttribute("user-session");
	User user = new User();
	try{
	user = (User) obj;
	if (user == null) {
		response.sendRedirect("index.jsp?status=accessdenied");
	}
	}
	catch(Exception e){
		response.sendRedirect("index.jsp?status=accessdenied");
	}
%>

<h2>Your Profile</h2><br><br>

<a href="createUser.jsp">Create User</a> | <a href="adminHome.jsp"> View Users</a> | <a href="profile.jsp">Profile</a>  | <a href="logout.jsp">Logout</a>

<br><br><br>

<table border="1" width="30%" cellpadding="3">


  <tr>
  	<td>FisrtName:</td>
    <td><%=user.getFirstName()%></td>
  </tr>
	
	<tr>
  	<td>lastName:</td>
    <td><%=user.getLastName()%></td>
  	</tr>
  <tr>
  	<td>Age:</td>
    <td><%=user.getAge()%></td>
  </tr>
  <tr>
  	<td>UserName:</td>
    <td><%=user.getUserName()%></td>
  </tr>
  
  <tr>
  	<td>Role:</td>
    <td><%=user.getRole()%></td>
  </tr>
</table>
</center>
</body>
</html>