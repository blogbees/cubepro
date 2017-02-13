package com.cubepro.general;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.hibernate.Session;


/**
 * Data access object (DAO) for domain model
 * @author MyEclipse Persistence Tools
 */
public class BaseHibernateDAO {
	protected Session session = null;
	private static final String SQL_LAST_INSERT_SQL = "SELECT LAST_INSERT_ID() lid";
	public BaseHibernateDAO(){
		//this.session = HibernateSessionFactory.getSession();
	}
	
	public BaseHibernateDAO(Session session){
		this.session = session;
	}
	
	public Integer getLastInsertedId() throws SQLException{
		Integer lastInsertedId = Integer.valueOf(0);
		Connection conn = null;
		Statement s= null;
		ResultSet rst= null;
		try{
		if(session!=null){
			conn = session.connection();
			s = conn.createStatement();
			rst = s.executeQuery(SQL_LAST_INSERT_SQL);
			while(rst.next()){
				lastInsertedId = rst.getInt("lid");
			}
		}
		}finally{
			rst.close();
			s.close();
			conn.close();
		}
		return lastInsertedId;
	}
	
}