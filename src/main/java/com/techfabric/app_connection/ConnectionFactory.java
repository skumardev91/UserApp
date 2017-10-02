package com.techfabric.app_connection;

import java.sql.Connection;
import java.sql.DriverManager;

import com.techfabric.app_constants.ConnectionMetaData;

public class ConnectionFactory {

	private static Connection _connection = null;

	private ConnectionFactory() {

	}

	static {

		try {

			Class.forName(ConnectionMetaData.DRIVER);
			
			String DB_URL = System.getProperty("JDBC_CONNECTION_STRING");
			_connection  = DriverManager.getConnection(DB_URL);
			
			if (_connection != null) {
				System.out.println("Connection to Databae is successful");
			} else {
				throw new RuntimeException("Could not connect to Database");
			}

		} catch (Exception e) {
			System.out.println("Error Occured while connecting to Database" + e);
		}
	}

	public static Connection getConnection() {
		return _connection;
	}

}
