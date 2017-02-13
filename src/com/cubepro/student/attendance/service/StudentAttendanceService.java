package com.cubepro.student.attendance.service;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.general.components.Log;
import com.cubepro.student.StudentDetails;
import com.cubepro.student.attendance.StudentAttendanceDetails;
import com.cubepro.student.attendance.dao.StudentAttendanceDetailsDAO;

public class StudentAttendanceService {
	/**
	 * @param searchDetails
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public List<StudentAttendanceDetails> getStudentAttendanceList(
			StudentDetails searchDetails, String attendanceDateString,
			Session session) throws Exception {
		List<StudentAttendanceDetails> studentAttendanceDetailList = null;
		try {

			StudentAttendanceDetailsDAO studentAttendanceDetailsDAO = new StudentAttendanceDetailsDAO(
					session);
			studentAttendanceDetailList = studentAttendanceDetailsDAO
					.getStudentAttendanceList(searchDetails,
							attendanceDateString);

		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}

		return studentAttendanceDetailList;
	}

	public String persistStudentAttendance(
			List<StudentAttendanceDetails> studentAttendanceList,
			Session session) throws Exception {
		StudentAttendanceDetailsDAO studentAttendanceDetailsDAO = new StudentAttendanceDetailsDAO(
				session);
		String unSavedList = "";
		try {
			Iterator<StudentAttendanceDetails> studentListIterator = studentAttendanceList
					.iterator();
			while (studentListIterator.hasNext()) {
				StudentAttendanceDetails studentAttendanceDetails = studentListIterator
						.next();
				
				Transaction transaction = session.beginTransaction();
				try {
					transaction.begin();
					studentAttendanceDetails.setCreateDate(new Date());
					studentAttendanceDetails.setCreateUserId(Integer.valueOf(1));
					studentAttendanceDetailsDAO
							.save((StudentAttendanceDetails) session
									.merge(studentAttendanceDetails));
					transaction.commit();
					session.clear();
				} catch (final Exception e) {
					transaction.rollback();
					Log.error(this.getClass(), "Exception in SA", e);
					unSavedList += " Student "
							+ studentAttendanceDetails.getStudentDetails()
									.getStudentName() + " not saved ";
				}
			}
		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}
		return unSavedList;
	}
	
	public List<StudentAttendanceDetails> getAbsentStudentsList(
			StudentDetails searchDetails, String attendanceDateString,
			Session session) throws Exception {
		List<StudentAttendanceDetails> studentAttendanceDetailList = null;
		try {

			StudentAttendanceDetailsDAO studentAttendanceDetailsDAO = new StudentAttendanceDetailsDAO(
					session);
			studentAttendanceDetailList = studentAttendanceDetailsDAO
					.getAbsentStudentsList(searchDetails,
							attendanceDateString);

		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}
		return studentAttendanceDetailList;
	}
		public List<StudentAttendanceDetails> getFeesStudentsList(
				StudentDetails searchDetails, String attendanceDateString,
				Session session) throws Exception {
			List<StudentAttendanceDetails> studentAttendanceDetailList = null;
			try {

				StudentAttendanceDetailsDAO studentAttendanceDetailsDAO = new StudentAttendanceDetailsDAO(
						session);
				studentAttendanceDetailList = studentAttendanceDetailsDAO.getStudentFeesList(searchDetails,
								attendanceDateString);

			} catch (Exception e) {
				Log.error(getClass(), "Exception occured ...", e);
				throw e;
			}

		return studentAttendanceDetailList;
	}

}
