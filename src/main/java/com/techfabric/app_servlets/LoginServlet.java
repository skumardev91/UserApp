package com.techfabric.app_servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techfabric.app_dao.UserDao;
import com.techfabric.app_daoImpl.UserDaoImpl;
import com.techfabric.app_model.User;

/**
 * Servlet implementation class UserLoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		
		UserDao usrDao = new UserDaoImpl();
		User gotUser = usrDao.checkForUser(userName, password);
		
		
		if(gotUser != null)
		{	
			//user is valid
			//set the session
			
			HttpSession session = request.getSession();
			session.setAttribute("user-session", gotUser);
			 
			if(gotUser.getRole().equalsIgnoreCase("Admin"))
			{	
				//User is Admin
				response.sendRedirect("adminHome.jsp");
			}
			else
			{	
				//User is Agent
				response.sendRedirect("userHome.jsp");
			}
		}
		else
		{
			response.sendRedirect("index.jsp?status=failed");
		}
		
	}
		
	}


