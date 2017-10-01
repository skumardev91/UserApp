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
<title>Change Password</title>
</head>
<body>

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
<h1>Change Password</h1>
<br>
<a href="userHome.jsp">Home</a> | <a href="updateProfile.jsp?id=<%=user.getIdUser()%>"> Update Profile</a> | <a href="logout.jsp">Logout</a>
<br><br><br><br><br>
<form name ="chgpass" method="post" action="UserServlet?action=chgpass&id=<%=user.getIdUser()%>">
			<table>
				<thead>
					<tr>
						<th colspan="2">Enter Information Here</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Current password</td>
						<td><input type="password" name="currentpass" value=""/></td>
					</tr>
					<tr>
						<td>New password</td>
						<td><input type="password" name="newpass" value="" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Submit" /></td>
					</tr>
				</tbody>
			</table>
		</form>
		
  <%
        	String status = request.getParameter("status");
        	
        	if(status != null)
    	{
    		if(status.equalsIgnoreCase("unchanged")){
    			%>
    			<p><font color="red"> Some problem changed password please contact admin</font></p>
    			<%
    		}
    		else
    		{
    			%>
    			<p><font color="green"> password succefully changed</font>
    			<% 
    		}
    	}
        
        
        %>
</center>
</body>
</html>