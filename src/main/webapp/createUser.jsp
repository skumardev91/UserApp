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
<title>Create User</title>
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

<br><br>


<a href="createUser.jsp">Create User</a> | <a href="adminHome.jsp"> View Users</a> | <a href="profile.jsp">Profile</a>  | <a href="logout.jsp">Logout</a>

<br>
		<h2>Creating User</h2>
		<br>
		<form method="post" action="UserServlet?action=create">
			<table>
				<thead>
					<tr>
						<th colspan="2">Enter Information Here</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>First Name</td>
						<td><input type="text" name="firstName" value="" /></td>
					</tr>
					<tr>
						<td>Last Name</td>
						<td><input type="text" name="lastName" value="" /></td>
					</tr>
					<tr>
						<td>Age</td>
						<td><input type="text" name="age" value="" /></td>
					</tr>
					<tr>
						<td>User Name</td>
						<td><input type="text" name="userName" value="" /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password" value="" /></td>
					</tr>
					<tr>
						<td>Role</td>
						<td><select name="role">
								<option value="Admin">Admin</option>
								<option value="Agent">Agent</option>
						</select></td>
					</tr>
					<tr>
						<td><input type="submit" value="Submit" /></td>
					</tr>

				</tbody>
			</table>
		</form>
		
		        <%
        	String status = request.getParameter("status");
        	
        	if(status != null)
    	{
    		if(status.equalsIgnoreCase("failed")){
    			%>
    			<p><font color="red"> UserName exits already or Some fields are missing</font></p>
    			<%
    		}
    		else
    		{
    			%>
    			<p><font color="green"> User created</font>
    			<% 
    		}
    	}
        
        
        %>
	</center>
</body>

</html>