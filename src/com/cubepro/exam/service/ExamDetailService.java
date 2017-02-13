package com.cubepro.exam.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.exam.ExamDetails;
import com.cubepro.exam.dao.ExamDetailsDAO;
import com.cubepro.general.components.Log;

public class ExamDetailService {
	
	/**
	 * @param session
	 * @return
	 * @throws HibernateException
	 */
	public List<ExamDetails> findAll(Session session) throws HibernateException {
		List<ExamDetails> examDetails = null;
		try {

			ExamDetailsDAO examDetailsDAO = new ExamDetailsDAO(session);
			examDetails = examDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return examDetails;
	}

	/**
	 * @param examId
	 * @param session
	 * @return
	 * @throws HibernateException
	 */
	public ExamDetails findById(final Integer examId, Session session) throws HibernateException {
		ExamDetails examDetails = null;
		try {

			ExamDetailsDAO examDetailsDAO = new ExamDetailsDAO(session);
			examDetails = examDetailsDAO.findById(examId);

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return examDetails;
	}
	
	public List<ExamDetails> findByClassId(final Integer classId, Session session) throws HibernateException {
		List<ExamDetails> examDetails = null;
		try {

			ExamDetailsDAO examDetailsDAO = new ExamDetailsDAO(session);
			examDetails = examDetailsDAO.findByClassId(classId);

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return examDetails;
	}

	
	public boolean saveExamDetail(Session session,
			ExamDetails examDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		ExamDetails examDetailsMerged = null;
		try {
			transaction.begin();
			ExamDetailsDAO transactionDetailDAO = new ExamDetailsDAO(
					session);
			examDetailsMerged = (ExamDetails) session
					.merge(examDetails);
			transactionDetailDAO.save(examDetailsMerged);
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
	 * @param examDetails
	 * @return
	 * @throws HibernateException
	 */
	public boolean deleteExamDetail(Session session,
			ExamDetails examDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			ExamDetailsDAO transactionDetailDAO = new ExamDetailsDAO(
					session);
			transactionDetailDAO.delete(examDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

	public ExamDetails findByExamId(int subjectId, Session session)
			throws HibernateException {
		ExamDetails examDetails = null;
		try {

			ExamDetailsDAO examDetailsDAO = new ExamDetailsDAO(session);
			examDetails = examDetailsDAO.findById(Integer
					.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return examDetails;
	}

	
}
