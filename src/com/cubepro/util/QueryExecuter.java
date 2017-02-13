package com.cubepro.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.cubepro.general.database.HibernateSessionFactory;

public class QueryExecuter {

	public static Map<String, String> executeQuery(final String queryString) throws Exception {
		Map<String, String> results = new HashMap<String, String>();
		try {
			DatabaseConnector dbConnector = new DatabaseConnector();
			Connection connection = HibernateSessionFactory.getSession().connection();
			PreparedStatement pstmt = null;
			ResultSet rst = null;
			try {

				pstmt = connection.prepareStatement(queryString);
				rst = pstmt.executeQuery();
				while (rst.next()) {
					results.put(rst.getString(1), rst.getString(2));
				}
			} catch (final SQLException e) {
				throw e;
			} finally {
				// close the dbconnection finally
				dbConnector.closeConnection(rst, pstmt, connection);
			}
		} catch (final SQLException e) {
			throw e;
		}

		return results;
	}

}
