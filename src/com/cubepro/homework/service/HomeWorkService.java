package com.cubepro.homework.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.general.components.Log;
import com.cubepro.homework.HomeWork;
import com.cubepro.homework.dao.HomeWorkDAO;

public class HomeWorkService {

	

	@SuppressWarnings("unchecked")
	public List<HomeWork> findAllHomeWorks(Session session) throws HibernateException {
		List<HomeWork> subjectDetails = null;
		try {

			HomeWorkDAO subjectDetailsDAO = new HomeWorkDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveHomeWorkDetail(Session session, HomeWork subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		HomeWork subjectDetailsMerged = null;
		try {
			transaction.begin();
			HomeWorkDAO transactionDetailDAO = new HomeWorkDAO(session);
			subjectDetailsMerged = (HomeWork) session.merge(subjectDetails);
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
	public boolean deleteHomeWorkDetail(Session session, HomeWork subjectDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			HomeWorkDAO transactionDetailDAO = new HomeWorkDAO(session);
			transactionDetailDAO.delete(subjectDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public HomeWork findByHomeWorkId(int subjectId, Session session)
			throws HibernateException {
		HomeWork term = null;
		try {

			HomeWorkDAO termDAO = new HomeWorkDAO(session);
			term = termDAO.findById(Integer.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return term;
	}
}
