package com.cubepro.bank.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.bank.Bank;
import com.cubepro.bank.dao.BankDAO;
import com.cubepro.general.components.Log;

public class BankService {

	@SuppressWarnings("unchecked")
	public List<Bank> findAll(Session session)
			throws HibernateException {
		List<Bank> subjectDetails = null;
		try {

			BankDAO subjectDetailsDAO = new BankDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveBankDetail(Session session,
			Bank subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		Bank subjectDetailsMerged = null;
		try {
			transaction.begin();
			BankDAO transactionDetailDAO = new BankDAO(
					session);
			subjectDetailsMerged = (Bank) session
					.merge(subjectDetails);
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
	public boolean deleteBankDetail(Session session,
			Bank subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			BankDAO transactionDetailDAO = new BankDAO(
					session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public Bank findByBankId(int subjectId, Session session)
			throws HibernateException {
		Bank subjectDetails = null;
		try {

			BankDAO subjectDetailsDAO = new BankDAO(session);
			subjectDetails = subjectDetailsDAO.findById(Integer
					.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}


}
