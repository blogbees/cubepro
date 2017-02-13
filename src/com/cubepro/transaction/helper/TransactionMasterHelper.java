package com.cubepro.transaction.helper;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.cubepro.general.components.Log;
import com.cubepro.transaction.TransactionMaster;
import com.cubepro.transaction.service.TransactionMasterService;

public class TransactionMasterHelper {
	public boolean saveTransactionMaster(TransactionMaster subjectDetails,
			Session session) throws HibernateException {
		TransactionMasterService termService = new TransactionMasterService();
		termService.saveTransactionMasterDetail(session, subjectDetails);
		return true;
	}

	public TransactionMaster findByTransactionMasterId(int subjectId, Session session)
			throws HibernateException {
		TransactionMaster subjectDetails = null;
		try {

			TransactionMasterService termService = new TransactionMasterService();
			subjectDetails = termService.findByTransactionMasterId(Integer
					.valueOf(subjectId), session);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}
	
	public List<TransactionMaster> findAll(Session session) throws HibernateException {
		List<TransactionMaster> subjectDetails = null;
		try {
			TransactionMasterService termService = new TransactionMasterService();
			subjectDetails = termService.findAll(session);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "exception occured e-", e);
			throw e;
		}
		return subjectDetails;
	}



}
