package com.cubepro.staff.attendance.helper;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;

import com.cubepro.staff.StaffDetails;
import com.cubepro.staff.attendance.StaffAttendanceDetails;
import com.cubepro.staff.attendance.service.StaffAttendanceService;
import com.cubepro.staff.helper.StaffDetailHelper;

public class StaffAttendanceHelper {
	/**
	 * @param staffDetails
	 * @param attendanceDateString
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public List<StaffAttendanceDetails> getStaffAttendanceList(
			StaffDetails staffDetails, String attendanceDateString,
			Session session) throws Exception {
		List<StaffAttendanceDetails> staffAttendanceDetailList = null;
		StaffAttendanceService staffDetailService = new StaffAttendanceService();
		StaffDetailHelper studentDetailHelper = new StaffDetailHelper();
		staffAttendanceDetailList = staffDetailService
				.getStaffAttendanceList(staffDetails, attendanceDateString,
						session);
		// if staff attendance is empty fill a list with empty object and show
		// it to the user.
		if (staffAttendanceDetailList.isEmpty()) {
			StaffDetails studentInformation = null;
			StaffAttendanceDetails staffAttendanceDetails = null;
			List<StaffDetails> studentList = studentDetailHelper
					.getStaffList(staffDetails, session);
			Iterator<StaffDetails> studentListIterator = studentList
					.iterator();
			while (studentListIterator.hasNext()) {
				studentInformation = studentListIterator.next();
				staffAttendanceDetails = new StaffAttendanceDetails();
				staffAttendanceDetails.setStaffDetails(studentInformation);
				staffAttendanceDetails.setAttendanceDateString(attendanceDateString);
				staffAttendanceDetailList.add(staffAttendanceDetails);
			}
		}
		return staffAttendanceDetailList;
	}

	/**
	 * @param studentAttendanceList
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public String persistStaffAttendances(
			List<StaffAttendanceDetails> staffAttendanceList,
			Session session) throws Exception {
		StaffAttendanceService staffDetailService = new StaffAttendanceService();
		String unSavedList = staffDetailService.persistStaffAttendance(staffAttendanceList, session);
		return unSavedList;
	}

}
