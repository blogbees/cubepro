package com.cubepro.staff.attendance.service;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.general.components.Log;
import com.cubepro.staff.StaffDetails;
import com.cubepro.staff.attendance.StaffAttendanceDetails;
import com.cubepro.staff.attendance.dao.StaffAttendanceDetailsDAO;

public class StaffAttendanceService {
	/**
	 * @param searchDetails
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public List<StaffAttendanceDetails> getStaffAttendanceList(
			StaffDetails searchDetails, String attendanceDateString,
			Session session) throws Exception {
		List<StaffAttendanceDetails> staffAttendanceDetailList = null;
		try {

			StaffAttendanceDetailsDAO staffAttendanceDetailsDAO = new StaffAttendanceDetailsDAO(
					session);
			staffAttendanceDetailList = staffAttendanceDetailsDAO
					.getStaffAttendanceList(searchDetails,
							attendanceDateString);

		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}

		return staffAttendanceDetailList;
	}

	public String persistStaffAttendance(
			List<StaffAttendanceDetails> staffAttendanceList,
			Session session) throws Exception {
		StaffAttendanceDetailsDAO staffAttendanceDetailsDAO = new StaffAttendanceDetailsDAO(
				session);
		String unSavedList = "";
		try {
			Iterator<StaffAttendanceDetails> staffListIterator = staffAttendanceList
					.iterator();
			while (staffListIterator.hasNext()) {
				StaffAttendanceDetails staffAttendanceDetails = staffListIterator
						.next();
				
				Transaction transaction = session.beginTransaction();
				try {
					transaction.begin();
					staffAttendanceDetails.setCreateDate(new Date());
					staffAttendanceDetails.setCreateUserId(Integer.valueOf(1));
					staffAttendanceDetailsDAO
							.save((StaffAttendanceDetails) session
									.merge(staffAttendanceDetails));
					transaction.commit();
					session.clear();
				} catch (final Exception e) {
					transaction.rollback();
					Log.error(this.getClass(), "Exception in SA", e);
					unSavedList += " Staff "
							+ staffAttendanceDetails.getStaffDetails()
									.getFirstName() + " not saved ";
				}
			}
		} catch (Exception e) {
			Log.error(getClass(), "Exception occured ...", e);
			throw e;
		}
		return unSavedList;
	}

}
