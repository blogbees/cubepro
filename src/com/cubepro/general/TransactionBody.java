package com.cubepro.general;

import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 * The classes which needs connection should implement this interface.
 * 
 * @author sajeev.sreekantan
 *
 */
public interface TransactionBody<ParamType, ReturnType> {

	/**
	 * Method to execute the session related transaction
	 * 
	 * @param params
	 * @param sessions
	 * @return ReturnType
	 * @throws HibernateException
	 * @throws SQLException
	 */
	public ReturnType executeTransaction(ParamType params, Session[] sessions) throws HibernateException, SQLException;
	
	/**
	 * This will indicate whether the transaction is successful or not based on which transaction rollback/commit happens
	 * 
	 * @return true/false
	 */
	public boolean isTransactionSuccess();
}
