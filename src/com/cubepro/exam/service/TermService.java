package com.cubepro.exam.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.classes.ClassDetails;
import com.cubepro.exam.Term;
import com.cubepro.exam.dao.TermDAO;
import com.cubepro.general.components.Log;

public class TermService {

	@SuppressWarnings("unchecked")
	public List<Term> findAll(Session session)
			throws HibernateException {
		List<Term> subjectDetails = null;
		try {

			TermDAO subjectDetailsDAO = new TermDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveTermDetail(Session session,
			Term subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		Term subjectDetailsMerged = null;
		try {
			transaction.begin();
			TermDAO transactionDetailDAO = new TermDAO(
					session);
			subjectDetailsMerged = (Term) session
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
	public boolean deleteTermDetail(Session session,
			Term subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			TermDAO transactionDetailDAO = new TermDAO(
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

	public Term findByTermId(int subjectId, Session session)
			throws HibernateException {
		Term term = null;
		try {

			TermDAO termDAO = new TermDAO(session);
			term = termDAO.findById(Integer
					.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}



}
