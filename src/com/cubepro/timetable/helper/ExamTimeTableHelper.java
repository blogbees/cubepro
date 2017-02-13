package com.cubepro.timetable.helper;

import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.cubepro.general.components.Log;
import com.cubepro.timetable.ExamTimeTable;
import com.cubepro.timetable.service.ExamTimeTableService;

public class ExamTimeTableHelper {
	public List<ExamTimeTable> findAll(Session session) throws HibernateException {
		List<ExamTimeTable> examTimeTableDetails = null;
		try {
			ExamTimeTableService examTimeTableService = new ExamTimeTableService();
			examTimeTableDetails = examTimeTableService.findAll(session);
		} catch (HibernateException e) {
			Log.error(getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return examTimeTableDetails;
	}
	
	public ExamTimeTable findById(Integer examTTId, Session session) throws HibernateException {
		ExamTimeTable examTimeTableDetails = null;
		try {
			ExamTimeTableService examTimeTableService = new ExamTimeTableService();
			examTimeTableDetails = examTimeTableService.findById(examTTId, session); 
		} catch (HibernateException e) {
			Log.error(getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return examTimeTableDetails;
	}

	public boolean saveExamTimeTable(ExamTimeTable examTimeTable, Session session) throws HibernateException {
		ExamTimeTableService examTimeTableService = new ExamTimeTableService();
		examTimeTable.setCreateUserId(Integer.valueOf(1));
		examTimeTable.setCreateDate(new Date());
		examTimeTableService.saveExamTimeTable(session, examTimeTable);
		return true;
	}
		

}
