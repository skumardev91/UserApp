package com.techfabric.app_daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.techfabric.app_connection.ConnectionFactory;
import com.techfabric.app_constants.Sql;
import com.techfabric.app_dao.UserDao;
import com.techfabric.app_model.User;

public class UserDaoImpl implements UserDao{

	public boolean insertUser(User user) {

		boolean isAdded = false;

		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement ps = conn.prepareStatement(Sql.INSERT_USER);

			ps.setString(1, user.getFirstName());
			ps.setString(2, user.getLastName());
			ps.setString(3, user.getAge());
			ps.setString(4, user.getUserName());
			ps.setString(5, user.getPassword());
			ps.setString(6, user.getRole());

			int i = ps.executeUpdate();

			if (i >= 0) {
				System.out.println("User has been created, count " + i);
				isAdded = true;
			} else {
				System.out.println("Problem occured during creation ");
			}

		} catch (SQLException e) {
			System.out.println("Wrong Sql Syntax" + e);
		}
		return isAdded;
	}

	public User checkForUser(String username, String password) {
		
		User user = null;

		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement ps = conn.prepareStatement(Sql.GET_USERNAME_PASSWORD);

			ps.setString(1, username);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs != null) {
			
				while (rs.next()) {
					
					user = new User();
					
					user.setIdUser(rs.getInt(1));
					user.setFirstName(rs.getString(2));
					user.setLastName(rs.getString(3));
					user.setAge(rs.getString(4));
					user.setUserName(username);
					user.setPassword(password);
					user.setRole(rs.getString(7));

				}
			} else {
				System.out.println("No Records found ");
			}

		} catch (SQLException e) {
			System.out.println("Wrong Sql Syntax" + e);
		}

		return user;
	}
	
	public List<User> getUsers() {
		List<User> usrList = new ArrayList<User>();
		
		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement ps = conn.prepareStatement(Sql.GET_ALL_USERS);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs != null)
			{
				while(rs.next())
				{
					User usr = new User();
					
					usr.setIdUser(rs.getInt(1));
					usr.setFirstName(rs.getString(2));
					usr.setLastName(rs.getString(3));
					usr.setAge(rs.getString(4));
					usr.setUserName(rs.getString(5));
					usr.setPassword(rs.getString(6));
					usr.setRole(rs.getString(7));
					
					usrList.add(usr);
				}
			}
			else {
				System.out.println("No records in the table");
			}

		} catch (SQLException e) {
			System.out.println("Wrong Sql Syntax" + e);
		}
		return usrList;
}


	public boolean deleteUser(int id) {
		boolean isDeleted = false;

		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement ps = conn.prepareStatement(Sql.DELETE_USER);

			ps.setInt(1, id);

			int i = ps.executeUpdate();

			if (i >= 0) {
				System.out.println("User has been deleted, count " + i);
				isDeleted = true;
			} else {
				System.out.println("Problem occured during creation ");
			}

		} catch (SQLException e) {
			System.out.println("Wrong Sql Syntax" + e);
		}
		return isDeleted;
	}

	public boolean updateUser(User usr) {
		boolean isUpdated = false;

		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement ps = conn.prepareStatement(Sql.UPDATE_USER);

			ps.setString(1,usr.getFirstName());
			ps.setString(2, usr.getLastName());
			ps.setString(3, usr.getAge());
			ps.setInt(4, usr.getIdUser());

			int i = ps.executeUpdate();

			if (i >= 0) {
				System.out.println("User has been updated, count " + i);
				isUpdated = true;
			} else {
				System.out.println("Problem occured during creation ");
			}

		} catch (SQLException e) {
			System.out.println("Wrong Sql Syntax" + e);
		}
		return isUpdated;
	}

	public User getUserById(int id) {
		User user = null;

		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement ps = conn.prepareStatement(Sql.GET_USER_BY_ID);

			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			if (rs != null) {
			
				while (rs.next()) {
					
					user = new User();
					
					user.setIdUser(rs.getInt(1));
					user.setFirstName(rs.getString(2));
					user.setLastName(rs.getString(3));
					user.setAge(rs.getString(4));
					user.setUserName(rs.getString(5));
					user.setPassword(rs.getString(6));
					user.setRole(rs.getString(7));

				}
			} else {
				System.out.println("No Records found ");
			}

		} catch (SQLException e) {
			System.out.println("Wrong Sql Syntax" + e);
		}

		return user;
	}

	public boolean changePassword(int id, String password) {
		boolean changed = false;

		try {
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement ps = conn.prepareStatement(Sql.CHANGE_PASSWORD);
			
			ps.setString(1, password);
			ps.setInt(2, id);
			
			int i = ps.executeUpdate();

			if (i >= 0) {
				System.out.println("User password is changed, count " + i);
				changed = true;
			} else {
				System.out.println("Problem occured during creation ");
			}

		} catch (SQLException e) {
			System.out.println("Wrong Sql Syntax" + e);
		}
		return changed;
	}
	}

