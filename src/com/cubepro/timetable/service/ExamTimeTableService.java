package com.cubepro.timetable.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.general.components.Log;
import com.cubepro.timetable.ExamTimeTable;
import com.cubepro.timetable.dao.ExamTimeTableDAO;

public class ExamTimeTableService {
	public List<ExamTimeTable> findAll(Session session)
			throws HibernateException {
		List<ExamTimeTable> examTimeTableDetails = null;
		try {

			ExamTimeTableDAO examDetailsDAO = new ExamTimeTableDAO(session);
			examTimeTableDetails = examDetailsDAO.findAll();

		} catch (HibernateException e) {
			Log.error(getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return examTimeTableDetails;
	}

	public ExamTimeTable findById(Integer examTTId, Session session)
			throws HibernateException {
		ExamTimeTable examTimeTableDetails = null;
		try {

			ExamTimeTableDAO examDetailsDAO = new ExamTimeTableDAO(session);
			examTimeTableDetails = examDetailsDAO.findById(examTTId);

		} catch (HibernateException e) {
			Log.error(getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return examTimeTableDetails;
	}

	public boolean saveExamTimeTable(Session session,
			ExamTimeTable examTimeTable) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		ExamTimeTable examTimeTableMerged = null;
		try {
			transaction.begin();
			ExamTimeTableDAO examDetailsDAO = new ExamTimeTableDAO(session);
			examTimeTableMerged = (ExamTimeTable) session.merge(examTimeTable);
			examDetailsDAO.save(examTimeTableMerged);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

}
