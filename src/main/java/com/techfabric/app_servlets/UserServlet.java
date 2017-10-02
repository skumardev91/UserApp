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
import com.techfabric.app_utils.UserUtil;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		String idUser = request.getParameter("id");
		int id = Integer.parseInt(idUser);
		UserDao dao = new UserDaoImpl();

		if (action.contains("delete")) {
			boolean isDeleted = dao.deleteUser(id);
			if (isDeleted) {
				response.sendRedirect("adminHome.jsp?status=deleted");
			} else
				response.sendRedirect("adminHome.jsp?status=notdeleted");

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		UserDao dao = new UserDaoImpl();

		if (action.contains("create")) {

			User usr = UserUtil.extractUserFromRequest(request);
			boolean allfieldsokay = UserUtil.checkAllFields(usr);
			if(allfieldsokay)
			{
			boolean isAdded = dao.insertUser(usr);
			if (isAdded) {
				response.sendRedirect("createUser.jsp?status=success");
			}
			else
				response.sendRedirect("createUser.jsp?status=failed");
			}else
				response.sendRedirect("createUser.jsp?status=failed");

		} else if (action.contains("edit")) {

			User usr = UserUtil.extractUserFromUpdateRequest(request);
			boolean isUpdated = dao.updateUser(usr);
			if (isUpdated) {
				User upadatedUser = dao.getUserById(usr.getIdUser());
				HttpSession session = request.getSession();
				session.setAttribute("user-session", upadatedUser);
				response.sendRedirect("updateProfile.jsp?status=updated");
			} else {
				response.sendRedirect("updateProfile.jsp?status=notupdated");
			}

		} else if (action.contains("chgpass")) {
			String idUser = request.getParameter("id");
			int id = Integer.parseInt(idUser);
			if (UserUtil.checkCurrentPassword(request)) {

				boolean changed = dao.changePassword(id, request.getParameter("newpass"));
				if (changed) {
					response.sendRedirect("changepasswd.jsp?status=changed");
				} else {
					response.sendRedirect("changepasswd.jsp?status=unchanged");
				}

			} else {
				response.sendRedirect("index.jsp?status=accessdenied");
			}
		}
	}
}
