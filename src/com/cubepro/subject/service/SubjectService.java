package com.cubepro.subject.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.classes.ClassDetails;
import com.cubepro.general.components.Log;
import com.cubepro.subject.Subject;
import com.cubepro.subject.dao.SubjectDAO;

public class SubjectService {

	public List<Subject> findByClass(ClassDetails classDetails,
			Session session) throws HibernateException {
		List<Subject> subjectDetailList = null;
		try {

			SubjectDAO subjectDetailsDAO = new SubjectDAO(session);
			subjectDetailList = subjectDetailsDAO.findByClass(classDetails);

		} catch (HibernateException e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}

		return subjectDetailList;
	}

	@SuppressWarnings("unchecked")
	public List<Subject> findAll(Session session)
			throws HibernateException {
		List<Subject> subjectDetails = null;
		try {

			SubjectDAO subjectDetailsDAO = new SubjectDAO(session);
			subjectDetails = subjectDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}

	public boolean saveSubjectDetail(Session session,
			Subject subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		Subject subjectDetailsMerged = null;
		try {
			transaction.begin();
			SubjectDAO transactionDetailDAO = new SubjectDAO(
					session);
			subjectDetailsMerged = (Subject) session
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
			Subject subjectDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			SubjectDAO transactionDetailDAO = new SubjectDAO(
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

	public Subject findBySubjectId(int subjectId, Session session)
			throws HibernateException {
		Subject subjectDetails = null;
		try {

			SubjectDAO subjectDetailsDAO = new SubjectDAO(session);
			subjectDetails = subjectDetailsDAO.findById(Integer
					.valueOf(subjectId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}


}
