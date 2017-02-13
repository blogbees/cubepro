package com.cubepro.components;

import java.io.FileNotFoundException;

import org.hibernate.Session;

import com.cubepro.general.TransactionBody;
import com.cubepro.general.TransactionHelper;
import com.cubepro.general.TransactionManager;
import com.cubepro.general.components.Log;
import com.cubepro.general.database.HibernateSessionFactory;

/**
 * Implementation of transaction manager with one session
 * 
 * @author sajeev.sreekantan
 * 
 */
public final class SingleConnectionTransactionManager implements TransactionManager {

	/*
	 * (non-Javadoc)
	 * 
	 * @see gov.nrega.business.components.TransactionManager#execute()
	 */
	public <ParamType, ReturnType> ReturnType execute(ParamType params, TransactionBody<ParamType, ReturnType> transInstance) {
		ReturnType result = null;
		try {
			Session session = HibernateSessionFactory.getSession();
			TransactionHelper transactionHelper = new TransactionHelper(new Session[]{session});
			result = transactionHelper.handleTransaction(params, transInstance);
		} catch (FileNotFoundException fileNotFoundException) {
			Log.error(getClass(), " Error fileNotFoundException:", fileNotFoundException);
		} finally {
			HibernateSessionFactory.closeSession();
		}
		return result;
	}
}