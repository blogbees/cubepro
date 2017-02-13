package com.cubepro.general.database;

import com.cubepro.general.ApplicationProperties;
import com.cubepro.general.components.Log;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 * EMuster data source to connect to DB2 database
 * 
 * @author prabakar.marimuthu
 * 
 */
public class CubeProDataSource implements DataSource {

	private String dataSourceName = null;
	
	//default
	public CubeProDataSource(){
		try{
			this.dataSourceName = ApplicationProperties.getProperty("datasource.jndi.name");
		}catch(java.util.MissingResourceException e){
			//Let dataSourceName be null
		}
	}
	
	public CubeProDataSource(String dataSourceName){
		this.dataSourceName = dataSourceName;
	}
		
	/*
	 * (non-Javadoc)
	 * 
	 * @see gov.nrega.general.database.DataSource#getConnection()
	 */
	public Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context initContext = new InitialContext();

			javax.sql.DataSource ds = (javax.sql.DataSource) initContext
					.lookup("java:comp/env/" + dataSourceName);

			if (ds != null) {
				conn = ds.getConnection();
			}
			return conn;
		} catch (SQLException e) {
			Log.error(getClass(), "SQL Error in getting connection", e);
			throw e;
		} catch (NamingException e) {
			Log.error(getClass(), "Naming Error in getting connection", e);
			throw new SQLException(e.getMessage());
		} catch (Exception e) {
			Log.error(getClass(), "Error in getting connection", e);
			throw new SQLException(e.getMessage());
		}
	}


	public String getDataSourceName() {
		return dataSourceName;
	}


	public void setDataSourceName(String dataSourceName) {
		this.dataSourceName = dataSourceName;
	}
}
