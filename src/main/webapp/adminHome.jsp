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
<title>Admin Home</title>
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

<h1> User Management System  </h1><br>
<% 
if(user != null)
{
%>
Welcome <%=user.getFirstName()%>
<%
}
%>
<br><br>


<a href="createUser.jsp">Create User</a> | <a href="adminHome.jsp"> View Users</a> | <a href="profile.jsp">Profile</a>  | <a href="logout.jsp">Logout</a>

<br><br><br>


<%

UserDao dao = new UserDaoImpl();
List<User> usrList = dao.getUsers();

if(usrList.size() > 0)
{

%>

<table border="1" width="30%" cellpadding="3">
  <tr>
  	<th>Id </th>
    <th>User </th>
    <th>Role </th>
    <th>Delete </th>
 	
  </tr>
  <%
  for(User u : usrList)
 {
  %>
  <tr>
  	<td><%=u.getIdUser()%></td>
    <td><%=u.getFirstName()%></td>
    <td><%=u.getRole()%></td>
    <td><a href="UserServlet?action=delete&id=<%=u.getIdUser()%>">Delete</a></td>
  </tr>
<%
}
%>
</table>
<%
}
else{
%>
<h4>There is no record found in the database</h4>

<%	
}
%>

<%
        	String status = request.getParameter("status");
        	
        	if(status != null)
    	{
    		if(status.equalsIgnoreCase("deleted")){
    			%>
    			<p><font color="green"> User deleted</font></p>
    			<%
    		}
    		else
    		{
    			%>
    			<p><font color="red"> User not deleted</font>
    			<% 
    		}
    	}
   %>
</center>
</body>
</html>