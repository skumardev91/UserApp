<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
 	<center>
 	<br><br><br><br><br>
 	 
 	 <body bgcolor="Azure">
        <form method="post" action="Login">
            <center>
            <table border="0" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        <th colspan="2">User Login</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="userName" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                    	<td> </td>
                        <td><input type="submit" value="Login" /></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
        
        
        <%
        	String status = request.getParameter("status");
        	
        	if(status != null)
    	{
    		if(status.equalsIgnoreCase("failed")){
    			%>
    			
    			<p><font color="red"> UserLogin failed</font></p>
    			<%
    			
    		}
}
        
        
        %>
    </body>
    </center>
</html>