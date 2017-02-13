package com.cubepro.subject.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.classes.ClassDetails;
import com.cubepro.classes.ClassDetailsDAO;
import com.cubepro.general.components.Log;
import com.cubepro.subject.SubjectDetails;
import com.cubepro.subject.dao.SubjectDetailsDAO;

public class SubjectDetailService {

	public List<SubjectDetails> findByClass(ClassDetails classDetails,
			Session session) throws HibernateException {
		List<SubjectDetails> subjectDetailList = null;
		try {

			SubjectDetailsDAO subjectDetailsDAO = new SubjectDetailsDAO(session);
			subjectDetailList = subjectDetailsDAO.findByClass(classDetails);

		} catch (HibernateException e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}

		return subjectDetailList;
	}

	@SuppressWarnings("unchecked")
	public List<SubjectDetails> findAll(Session session)
			throws HibernateException {
		List<SubjectDetails> subjectDetails = null;
		try {

			SubjectDetailsDAO subjectDetailsDAO = new SubjectDetailsDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveSubjectDetail(Session session,
			SubjectDetails subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		SubjectDetails subjectDetailsMerged = null;
		try {
			transaction.begin();
			SubjectDetailsDAO transactionDetailDAO = new SubjectDetailsDAO(
					session);
			subjectDetailsMerged = (SubjectDetails) session
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
	public boolean deleteSubjectDetail(Session session,
			SubjectDetails subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			SubjectDetailsDAO transactionDetailDAO = new SubjectDetailsDAO(
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

	public SubjectDetails findBySubjectId(int subjectId, Session session)
			throws HibernateException {
		SubjectDetails subjectDetails = null;
		try {

			SubjectDetailsDAO subjectDetailsDAO = new SubjectDetailsDAO(session);
			subjectDetails = subjectDetailsDAO.findById(Integer
					.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

}
