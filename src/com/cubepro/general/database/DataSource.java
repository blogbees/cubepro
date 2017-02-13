package com.cubepro.general.database;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Interface for datasources in the the application
 * 
 * @author prabakar.marimuthu
 *
 */
public interface DataSource {
	
	/**
	 * Creates a connection from a data source
	 * 
	 * @return
	 */
	public Connection getConnection () throws SQLException;
}
