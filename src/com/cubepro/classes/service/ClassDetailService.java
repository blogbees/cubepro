package com.cubepro.classes.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.classes.ClassDetails;
import com.cubepro.classes.ClassDetailsDAO;
import com.cubepro.general.components.Log;
import com.cubepro.general.database.HibernateSessionFactory;
import com.cubepro.invoice.InvoiceDetails;
import com.cubepro.invoice.dao.InvoiceDetailsDAO;

public class ClassDetailService {

	public List<ClassDetails> findAll(Session session)
			throws HibernateException {
		return findAll(session, false);
	}
	
	public List<ClassDetails> findAll(Session session, boolean isAll)
	throws HibernateException {
		List<ClassDetails> classDetails = null;
		try {
			ClassDetailsDAO classDetailsDAO = new ClassDetailsDAO(session);
			//if(isAll == false)
			//	classDetails = classDetailsDAO.getActiveClasses();
			//else
				classDetails = classDetailsDAO.findAll();
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return classDetails;
	}

	public ClassDetails findByClassId(int classId, Session session)
			throws HibernateException {
		ClassDetails classDetails = null;
		try {

			ClassDetailsDAO classDetailsDAO = new ClassDetailsDAO(session);
			classDetails = classDetailsDAO.findById(Integer.valueOf(classId));
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return classDetails;
	}

	public boolean saveClassDetail(Session session, ClassDetails classDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		ClassDetails classDetailsMerged = null;
		try {
			transaction.begin();
			ClassDetailsDAO transactionDetailDAO = new ClassDetailsDAO(session);
			classDetailsMerged = (ClassDetails) session.merge(classDetails);
			transactionDetailDAO.save(classDetailsMerged);
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
	 * @param classDetails
	 * @return
	 * @throws HibernateException
	 */
	public boolean deleteClassDetail(Session session, ClassDetails classDetails)
			throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		try {
			transaction.begin();
			ClassDetailsDAO transactionDetailDAO = new ClassDetailsDAO(session);
			transactionDetailDAO.delete(classDetails);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

}
