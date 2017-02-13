package com.cubepro.bank.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.bank.BankDetails;
import com.cubepro.bank.dao.BankDetailsDAO;
import com.cubepro.general.components.Log;

public class BankDetailService {

	@SuppressWarnings("unchecked")
	public List<BankDetails> findAll(Session session)
			throws HibernateException {
		List<BankDetails> bankDetails = null;
		try {

			BankDetailsDAO bankDetailsDAO = new BankDetailsDAO(session);
			bankDetails = bankDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return bankDetails;
	}

	public boolean saveBankDetail(Session session,
			BankDetails bankDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		BankDetails bankDetailsMerged = null;
		try {
			transaction.begin();
			BankDetailsDAO transactionDetailDAO = new BankDetailsDAO(
					session);
			bankDetailsMerged = (BankDetails) session
					.merge(bankDetails);
			transactionDetailDAO.save(bankDetailsMerged);
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
	 * @param bankDetails
	 * @return
	 * @throws HibernateException
	 */
	public boolean deleteBankDetail(Session session,
			BankDetails bankDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			BankDetailsDAO transactionDetailDAO = new BankDetailsDAO(
					session);
			transactionDetailDAO.delete(bankDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public BankDetails findByBankId(int bankId, Session session)
			throws HibernateException {
		BankDetails bankDetails = null;
		try {

			BankDetailsDAO bankDetailsDAO = new BankDetailsDAO(session);
			bankDetails = bankDetailsDAO.findById(Integer
					.valueOf(bankId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return bankDetails;
	}

}
