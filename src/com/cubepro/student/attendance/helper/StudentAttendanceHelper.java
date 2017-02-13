package com.cubepro.student.attendance.helper;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;

import com.cubepro.components.CubeProConstants;
import com.cubepro.general.components.Log;
import com.cubepro.registration.SchoolDetails;
import com.cubepro.registration.helper.SchoolDetailsHelper;
import com.cubepro.student.StudentDetails;
import com.cubepro.student.attendance.StudentAttendanceDetails;
import com.cubepro.student.attendance.service.StudentAttendanceService;
import com.cubepro.student.helper.StudentDetailHelper;
import com.cubepro.util.SendMessage;

public class StudentAttendanceHelper {
	/**
	 * @param studentDetails
	 * @param attendanceDateString
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public List<StudentAttendanceDetails> getStudentAttendanceList(
			StudentDetails studentDetails, String attendanceDateString,
			Session session) throws Exception {
		List<StudentAttendanceDetails> studentAttendanceDetailList = null;
		StudentAttendanceService studentDetailService = new StudentAttendanceService();
		StudentDetailHelper studentDetailHelper = new StudentDetailHelper();
		studentAttendanceDetailList = studentDetailService
				.getStudentAttendanceList(studentDetails, attendanceDateString,
						session);
		// if student attendance is empty fill a list with empty object and show
		// it to the user.
		if (studentAttendanceDetailList.isEmpty()) {
			StudentDetails studentInformation = null;
			StudentAttendanceDetails studentAttendanceDetails = null;
			List<StudentDetails> studentList = studentDetailHelper
					.getStudentList(studentDetails, session);
			Iterator<StudentDetails> studentListIterator = studentList
					.iterator();
			while (studentListIterator.hasNext()) {
				studentInformation = studentListIterator.next();
				studentAttendanceDetails = new StudentAttendanceDetails();
				studentAttendanceDetails.setStudentDetails(studentInformation);
				studentAttendanceDetails
						.setAbsentDateString(attendanceDateString);
				studentAttendanceDetailList.add(studentAttendanceDetails);
			}
		}
		return studentAttendanceDetailList;
	}

	public List<StudentAttendanceDetails> getAbsentStudentsList(
			StudentDetails studentDetails, String attendanceDateString,
			Session session) throws Exception {
		List<StudentAttendanceDetails> studentAttendanceDetailList = null;
		StudentAttendanceService studentDetailService = new StudentAttendanceService();
		studentAttendanceDetailList = studentDetailService
				.getAbsentStudentsList(studentDetails, attendanceDateString,
						session);
		return studentAttendanceDetailList;
	}

	public List<StudentAttendanceDetails> getFeesStudentsList(
			StudentDetails studentDetails, String attendanceDateString,
			Session session) throws Exception {
		List<StudentAttendanceDetails> studentAttendanceDetailList = null;
		StudentAttendanceService studentDetailService = new StudentAttendanceService();
		studentAttendanceDetailList = studentDetailService.getFeesStudentsList(
				studentDetails, attendanceDateString, session);
		return studentAttendanceDetailList;
	}

	/**
	 * @param studentAttendanceList
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public String persistStudentAttendances(
			List<StudentAttendanceDetails> studentAttendanceList,
			Session session) throws Exception {
		StudentAttendanceService studentDetailService = new StudentAttendanceService();
		String unSavedList = studentDetailService.persistStudentAttendance(
				studentAttendanceList, session);
		return unSavedList;
	}

	public boolean triggerSMS(StudentDetails studentDetails,
			String attendanceDateString, Session session, String portName,
			String messageFromUI, String[] selectedStudents) throws Exception {

		SchoolDetailsHelper schoolDetailsHelper = new SchoolDetailsHelper();
		SchoolDetails schoolDetails = schoolDetailsHelper.findAll(session);
		List<StudentAttendanceDetails> studentAttendanceList = getAbsentStudentsList(
				studentDetails, attendanceDateString, session);
		// trigger sms in thread
		PrimeThread p = new PrimeThread(schoolDetails, studentAttendanceList,
				portName, messageFromUI, selectedStudents);
		p.start();
		return true;
	}

	class PrimeThread extends Thread {
		List<StudentAttendanceDetails> studentAttendanceList;
		String portName;
		String messageFromUI;
		SchoolDetails schoolDetails;
		String[] selectedStudents;

		PrimeThread(SchoolDetails schoolDetails,
				List<StudentAttendanceDetails> studentAttendanceList,
				String portName, String messageFromUI, String[] selectedStudents) {
			this.studentAttendanceList = studentAttendanceList;
			this.portName = portName;
			this.messageFromUI = messageFromUI;
			this.schoolDetails = schoolDetails;
			this.selectedStudents = selectedStudents;
		}

		public void run() {
			try {
				//Info From MCCHS School, Sir/Madam, Your Child s was Absent On 11/09/2001 Due to fever
				SendMessage sendMessage = new SendMessage();
				for (String selectedStudent : selectedStudents) {
					StudentAttendanceDetails studentAttendanceDetails = studentAttendanceList
							.get(Integer.parseInt(selectedStudent));
					String smsToBeSent = "Dear Parent, Info From "
						+ schoolDetails.getSmsName()
						+ ", Sir/Madam, Your Child "
						+ studentAttendanceDetails.getStudentDetails()
								.getStudentName() + " was Absent On "
						+ studentAttendanceDetails.getAbsentDateString()
						+ " Due to "
						+ studentAttendanceDetails.getAttendanceReason()
						+ ". Regards "
						+ schoolDetails.getSmsName();
				if (messageFromUI != null
						&& messageFromUI.trim().length() > 0) {
					smsToBeSent += " Note: " + messageFromUI;
				}
				sendMessage.sendSMS(portName, studentAttendanceDetails
						.getStudentDetails().getMobile(), smsToBeSent);
				smsToBeSent = null;
				}
			} catch (Exception e) {
				Log.error(getClass(), "exception in sms sending", e);
			}
		}
	}

}
