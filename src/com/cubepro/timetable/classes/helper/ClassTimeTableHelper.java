package com.cubepro.timetable.classes.helper;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.cubepro.classes.helper.ClassDetailHelper;
import com.cubepro.classes.service.ClassDetailService;
import com.cubepro.components.CubeProConstants;
import com.cubepro.staff.StaffDetails;
import com.cubepro.timetable.TimeTableDetails;
import com.cubepro.timetable.classes.service.ClassTimeTableService;

public class ClassTimeTableHelper {
	private static final Log LOG = LogFactory.getLog(ClassDetailHelper.class);

	private static final int MAX_TIME_TABLE_PERIODS = 8;

	private static final int MAX_TIME_TABLE_DAYS = 6;

	public List<TimeTableDetails> findAll(Session session, int classId, int year)
			throws HibernateException {
		List<TimeTableDetails> timeTableDetails = null;
		try {
			ClassTimeTableService classTimeTableService = new ClassTimeTableService();
			ClassDetailService classDetailService = new ClassDetailService();
			
			timeTableDetails = classTimeTableService.findByClassAndYear(
					session, classId, year);
			if (timeTableDetails.isEmpty() == true) {
				// timetable is empty for the class and respective year 
				for (int i = 1; i <= MAX_TIME_TABLE_DAYS; i++) {
					for (int j = 1; j <= MAX_TIME_TABLE_PERIODS; j++) {
						TimeTableDetails timetable = new TimeTableDetails();
						timetable.setClassDetails(classDetailService.findByClassId(classId, session));
						timetable.setPeriods(CubeProConstants.PERIODS+j);
						timetable.setYear(year);
						timetable.setDay(Integer.valueOf(i));
						timetable.setStaffDetailsByStaffId(new StaffDetails());
						timetable.setCreateDate(new Date());
						timetable.setCreateUserId(1);
						timeTableDetails.add(timetable);
					}
				}

			}
		} catch (HibernateException e) {
			LOG.error("EXCEption occured ...", e);
			throw e;
		}
		return timeTableDetails;
	}

	
	public boolean saveTimeTableRecords(List<TimeTableDetails> timeTableDetails, Session session){
		ClassTimeTableService classTimeTableService = new ClassTimeTableService();
		TimeTableDetails timeTableRecord = null;
		if (timeTableDetails.isEmpty() == false) {
			Iterator<TimeTableDetails> classTTIterator = timeTableDetails.iterator();
			while(classTTIterator.hasNext()){
				timeTableRecord = classTTIterator.next();
				if(timeTableRecord.getCreateDate()==null){
					timeTableRecord.setCreateDate(new Date());
				}
				classTimeTableService.saveTimeTableRecord(session, timeTableRecord);
				session.clear();
			}
		}
		return true;
	}
}
