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
<title>Insert title here</title>
</head>
<body bgcolor="Azure">

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

<center>
<h1> Your Profile</h1>
<br>

<a href="userHome.jsp">Home</a> | <a href="updateProfile.jsp?id=<%=user.getIdUser()%>"> Update Profile</a> | <a href="logout.jsp">Logout</a>

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