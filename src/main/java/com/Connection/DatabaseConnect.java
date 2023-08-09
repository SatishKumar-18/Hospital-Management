package com.Connection;

import java.sql.*;

public class DatabaseConnect {
	private static Connection conn;
	
	public static Connection getConnect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "AdminHospital", "admin");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
}
