package com.cubepro.timetable.classes.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.timetable.TimeTableDetails;
import com.cubepro.timetable.TimeTableDetailsDAO;

public class ClassTimeTableService {

	public List<TimeTableDetails> findByClassAndYear(Session session,
			int classId, int selectedYear) throws HibernateException {
		List<TimeTableDetails> timeTableDetails = null;
		try {

			TimeTableDetailsDAO timeTableDetailsDAO = new TimeTableDetailsDAO(
					session);
			timeTableDetails = timeTableDetailsDAO.findByClassAndYear(classId,
					selectedYear);

		} catch (HibernateException e) {
			throw e;
		}
		return timeTableDetails;
	}

	public boolean saveTimeTableRecord(Session session,
			TimeTableDetails timeTableRecord) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		TimeTableDetails timeTableDetails = null;
		try {
			transaction.begin();
			TimeTableDetailsDAO timeTableDetailsDAO = new TimeTableDetailsDAO(
					session);
			timeTableDetails = (TimeTableDetails)session.merge(timeTableRecord);
			timeTableDetailsDAO.save(timeTableDetails);
			transaction.commit();
			session.clear();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}

}
