package com.cubepro.transaction.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.general.components.Log;
import com.cubepro.transaction.TransactionMaster;
import com.cubepro.transaction.dao.TransactionMasterDAO;

public class TransactionMasterService {

	@SuppressWarnings("unchecked")
	public List<TransactionMaster> findAll(Session session) throws HibernateException {
		List<TransactionMaster> subjectDetails = null;
		try {

			TransactionMasterDAO subjectDetailsDAO = new TransactionMasterDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}
	
	@SuppressWarnings("unchecked")
	public List<TransactionMaster> findTransDesc(String type, String subType, Session session) throws HibernateException {
		List<TransactionMaster> subjectDetails = null;
		try {

			TransactionMasterDAO subjectDetailsDAO = new TransactionMasterDAO(session);
			subjectDetails = subjectDetailsDAO.findTransDesc(type, subType);

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}
	
	@SuppressWarnings("unchecked")
	public List<TransactionMaster> findTransDesc(String subType, Session session) throws HibernateException {
		List<TransactionMaster> subjectDetails = null;
		try {

			TransactionMasterDAO subjectDetailsDAO = new TransactionMasterDAO(session);
			subjectDetails = subjectDetailsDAO.findTransDesc(subType);

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	
	public List<TransactionMaster> getTransDescForBudget(Session session, String subType) throws HibernateException {
		List<TransactionMaster> subjectDetails = null;
		try {

			TransactionMasterDAO subjectDetailsDAO = new TransactionMasterDAO(session);
			subjectDetails = subjectDetailsDAO.getTransDescForBudget(subType);

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveTransactionMasterDetail(Session session, TransactionMaster subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		TransactionMaster subjectDetailsMerged = null;
		try {
			transaction.begin();
			TransactionMasterDAO transactionDetailDAO = new TransactionMasterDAO(session);
			subjectDetailsMerged = (TransactionMaster) session.merge(subjectDetails);
			transactionDetailDAO.save(subjectDetailsMerged);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	/**
	 * @param session
	 * @param subjectDetails
	 * @return
	 * @throws HibernateException
	 */
	public boolean deleteTransactionMasterDetail(Session session, TransactionMaster subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			TransactionMasterDAO transactionDetailDAO = new TransactionMasterDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public TransactionMaster findByTransactionMasterId(int subjectId, Session session)
			throws HibernateException {
		TransactionMaster term = null;
		try {

			TransactionMasterDAO termDAO = new TransactionMasterDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}

}
