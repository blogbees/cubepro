package com.cubepro.general;


import java.sql.SQLException;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.general.components.Log;

/**
 * Handles the transaction related activities
 * 
 * @author sajeev.sreekantan
 *
 */
public final class TransactionHelper {

	private Session[] sessions;

	private Transaction[] transactions;

	public TransactionHelper(Session[] sessions) {
		//Sanity check
		if (sessions == null || sessions.length < 1) {
			throw new IllegalArgumentException("Atleast one session is required....");
		}
		this.sessions = sessions;
		transactions = new Transaction[sessions.length];
	}

	/**
	 * Method to handle the transaction.
	 * Will log the exceptions as well.
	 * 
	 * @param <ParamType>
	 * @param <ReturnType>
	 * @param params
	 * @param transInstance
	 * @return ReturnType
	 */
	public <ParamType, ReturnType> ReturnType handleTransaction(ParamType params, TransactionBody<ParamType, ReturnType> transInstance) {
		//Start the transaction
		beginTransaction();
		ReturnType result = null;
		try {
			result = transInstance.executeTransaction(params, sessions);
			endTransaction(transInstance.isTransactionSuccess());
		} catch (GenericJDBCException genericJDBCException) {
			Log.error(getClass(), " Error genericJDBCException:", genericJDBCException);
			endTransaction(false);
		} catch (HibernateException hibernateException) {
			Log.error(getClass(), " Error hibernateException:", hibernateException);
			endTransaction(false);
		} catch (SQLException sqlException) {
			Log.error(getClass(), " Error sqlException:", sqlException);
			endTransaction(false);
		}
		return result;
	}

	//Local method to begin a transaction
	private void beginTransaction() {
		int transIndex = 0;
		for (Session session : sessions) {
			if (session == null || !session.isOpen()) {
				throw new RuntimeException("Could not retrieve a valid session");
			}
			transactions[transIndex++] = session.beginTransaction();
		}
	}

	//Local method to end transactions
	private void endTransaction(boolean isSuccess) {
		for (Transaction transaction : transactions) {
			if (transaction != null) {
				if (isSuccess) {
					//transaction.commit();
				} else {
					//transaction.rollback();
				}
			}
		}
	}
}
