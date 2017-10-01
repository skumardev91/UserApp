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
<title>Update Profile</title>
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
<br><br><br>
<h1>Update Your Profile</h1>
<br>
<a href="userHome.jsp">Home</a> | <a href="updateProfile.jsp?id=<%=user.getIdUser()%>"> Update Profile</a> | <a href="logout.jsp">Logout</a>

<form method="post" action="UserServlet?action=edit">
			<table>
				<thead>
					<tr>
						<th colspan="2">Enter Information Here</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>ID</td>
						<td><input type="text" name="id" value="<%=user.getIdUser()%>" readonly="readonly"/></td>
					</tr>
					<tr>
						<td>First Name</td>
						<td><input type="text" name="firstName" value="<%=user.getFirstName()%>" /></td>
					</tr>
					<tr>
						<td>Last Name</td>
						<td><input type="text" name="lastName" value="<%=user.getLastName()%>" /></td>
					</tr>
					<tr>
						<td>Age</td>
						<td><input type="text" name="age" value="<%=user.getAge()%>" /></td>
					</tr>
				
					<tr>
						<td><input type="submit" value="Submit" /></td>
						<td><a href="changepasswd.jsp?id=<%=user.getIdUser()%>">change password</a>
					</tr>

				</tbody>
			</table>
		</form>
		
		
		<%
        	String status = request.getParameter("status");
        	
        	if(status != null)
    	{
    		if(status.equalsIgnoreCase("updated")){
    			%>
    			<p><font color="green"> User updated</font></p>
    			<%
    		}
    		else
    		{
    			%>
    			<p><font color="red"> User not updated</font>
    			<% 
    		}
    	}
   %>
</center>
</body>
</html>