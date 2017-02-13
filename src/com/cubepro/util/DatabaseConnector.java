package com.cubepro.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseConnector {
	private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/";

	private static final String DATABASE_DBNAME = "sreeiyap_cubepro";

	private static final String DATABASE_USERNAME = "sreeiyap_cubepro";

	private static final String DATABASE_PASSWORD = "9841152904";

	private static final String MYSQLCLASSNAME = "com.mysql.jdbc.Driver";

	
	public Connection getConnection() throws Exception {
		Connection connection = null;
		connection = DriverManager.getConnection(
				DATABASE_URL + DATABASE_DBNAME, DATABASE_USERNAME,
				DATABASE_PASSWORD);

		return connection;
	}

	public void closeConnection(Connection conn) throws SQLException {
		conn.close();
	}

	public void closeConnection(ResultSet rst, PreparedStatement pstmt,
			Connection conn) throws SQLException {
		if (rst != null)
			rst.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}

	public void closeConnection(PreparedStatement pstmt, Connection conn)
			throws SQLException {
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}

}
