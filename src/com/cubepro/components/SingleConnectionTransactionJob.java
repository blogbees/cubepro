package com.cubepro.components;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.cubepro.general.TransactionBody;
import com.cubepro.general.TransactionManager;

/**
 * Transaction handler class for job.
 * Handles single connection. 
 * 
 * @author sajeev.sreekantan
 *
 */
public abstract class SingleConnectionTransactionJob implements Job, TransactionBody<Map<String, Object>, Boolean>{

	private boolean transactionSuccess = true;

	/* (non-Javadoc)
	 * @see org.quartz.Job#execute(org.quartz.JobExecutionContext)
	 */
	public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("jobContext", jobExecutionContext);
		TransactionManager manager = new SingleConnectionTransactionManager();
		try {
			manager.execute(paramsMap, this);
		}catch(Throwable t) {
			if (t.getCause() instanceof JobExecutionException) {
				throw (JobExecutionException) t.getCause();
			}
		}

	}

	/* (non-Javadoc)
	 * @see gov.nrega.general.components.TransactionBody#executeTransaction(java.lang.Object, org.hibernate.Session[])
	 */
	public Boolean executeTransaction(Map<String, Object> params, Session[] sessions) throws HibernateException, SQLException {
		JobExecutionContext jobExecutionContext = (JobExecutionContext) params.get("jobContext");
		try {
			return executeTransaction(jobExecutionContext, sessions[0]);
		} catch (JobExecutionException e) {
			throw new RuntimeException(e);
		}
	}
	
	/* (non-Javadoc)
	 * @see gov.nrega.general.components.TransactionBody#isTransactionSuccess()
	 */
	public boolean isTransactionSuccess() {
		return transactionSuccess;
	}

	/**
	 * Method to process the transaction
	 * 
	 * @param jobExecutionContext
	 * @param session
	 * @return true/false
	 * @throws HibernateException
	 * @throws SQLException
	 */
	protected abstract boolean executeTransaction(JobExecutionContext jobExecutionContext, Session session) throws HibernateException, SQLException, JobExecutionException;
}