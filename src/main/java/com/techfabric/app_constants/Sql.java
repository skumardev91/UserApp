package com.techfabric.app_constants;

public interface Sql {
	
	String INSERT_USER  = "INSERT INTO user  (firstName, lastName, age, userName, password, role) VALUES (?,?,?,?,?,?)";
	String GET_ALL_USERS  = "SELECT * FROM user";
	String GET_USERNAME_PASSWORD = "SELECT * FROM user WHERE userName = ? and password =?"; 
	String DELETE_USER = "DELETE FROM user WHERE idUser = ?";
	String UPDATE_USER = "UPDATE user SET firstName = ?, lastName =?, age= ? WHERE idUser = ? ";
	String GET_USER_BY_ID = "SELECT * FROM user WHERE idUser = ?";
	String CHANGE_PASSWORD = "UPDATE user SET password=? WHERE idUser = ?";
	
}
