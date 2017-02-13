package com.cubepro.mark.helper;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;

import com.cubepro.exam.ExamDetails;
import com.cubepro.exam.helper.ExamDetailHelper;
import com.cubepro.general.components.Log;
import com.cubepro.general.database.CubeProDataSource;
import com.cubepro.mark.MarkDetails;
import com.cubepro.mark.StudentMarkSummary;
import com.cubepro.mark.dao.StudentMarkSummaryDAO;
import com.cubepro.mark.service.MarkDetailService;
import com.cubepro.registration.SchoolDetails;
import com.cubepro.registration.helper.SchoolDetailsHelper;
import com.cubepro.student.StudentDetails;
import com.cubepro.student.helper.StudentDetailHelper;
import com.cubepro.subject.SubjectDetails;
import com.cubepro.subject.helper.SubjectDetailHelper;
import com.cubepro.util.SendMessage;
import com.cubepro.util.StringUtils;

public class MarkDetailHelper {
	/**
	 * @param studentDetails
	 * @param attendanceDateString
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public List<List<MarkDetails>> getMarkList(StudentDetails studentDetails,
			final int selectedMarkId, Session session) throws Exception {
		List<List<MarkDetails>> markList = new ArrayList<List<MarkDetails>>();
		List<SubjectDetails> subjectList = null;
		List<MarkDetails> studentMarkList = null;
		StudentDetailHelper studentDetailHelper = new StudentDetailHelper();
		SubjectDetailHelper subjectHelper = new SubjectDetailHelper();
		ExamDetailHelper examDetailHelper = new ExamDetailHelper();
		MarkDetailService markDetailService = new MarkDetailService();
		StudentMarkSummaryDAO studentMarkSummaryDAO = new StudentMarkSummaryDAO(
				session);
		ExamDetails examDetails = examDetailHelper.findById(selectedMarkId,
				session);
		MarkDetails markDetails = null;
		subjectList = subjectHelper.findByClass(studentDetails
				.getClassDetails(), session);
		StudentDetails studentInformation = null;
		SubjectDetails subjectDetails = null;
		List<StudentDetails> studentList = studentDetailHelper.getStudentList(
				studentDetails, session);
		Iterator<StudentDetails> studentListIterator = studentList.iterator();
		while (studentListIterator.hasNext()) {
			studentInformation = studentListIterator.next();
			List<StudentMarkSummary> studentMarkSumList = studentMarkSummaryDAO
					.getMarkList(studentInformation, selectedMarkId);
			if (studentMarkSumList != null && studentMarkSumList.size() > 0) {
				StudentMarkSummary studentMarkSummary = studentMarkSumList
						.get(0);
				studentInformation.setTotal(studentMarkSummary.getTotal());
				studentInformation.setGrade(studentMarkSummary.getGrade());
				studentInformation.setPercenTage(studentMarkSummary
						.getPercentage());
			}
			Iterator<SubjectDetails> subjectListIterator = subjectList
					.iterator();
			// get the mark list
			studentMarkList = markDetailService.getMarkList(studentInformation,
					selectedMarkId, session);
			if (studentMarkList.isEmpty()) {
				studentMarkList = new ArrayList<MarkDetails>();
				// iterate each subject and fill in the mark
				while (subjectListIterator.hasNext()) {
					subjectDetails = (SubjectDetails) subjectListIterator
							.next();
					markDetails = new MarkDetails();
					markDetails.setStudentDetails(studentInformation);
					markDetails.setExamDetails(examDetails);
					markDetails.setSubjectDetails(subjectDetails);
					markDetails.setMaxMarks(String.valueOf(subjectDetails
							.getMaxMarks()));
					markDetails.setClassDetails(studentInformation
							.getClassDetails());
					studentMarkList.add(markDetails);
				}
			} else {
				if (subjectList.size() > studentMarkList.size()) {
					for (int k = studentMarkList.size(); k < subjectList.size(); k++) {
						subjectDetails = (SubjectDetails) subjectList.get(k);
						markDetails = new MarkDetails();
						markDetails.setStudentDetails(studentInformation);
						markDetails.setExamDetails(examDetails);
						markDetails.setSubjectDetails(subjectDetails);
						markDetails.setMaxMarks(String.valueOf(subjectDetails
								.getMaxMarks()));
						markDetails.setClassDetails(studentInformation
								.getClassDetails());
						studentMarkList.add(markDetails);
					}
				}

			}
			markList.add(studentMarkList);
		}

		return markList;
	}

	/**
	 * @param markDetailList
	 * @param studentIds
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public String persistMark(List<List<MarkDetails>> markDetailList,
			String[] studentIds, Session session, HttpServletRequest request)
			throws Exception {
		MarkDetailService markDetailService = new MarkDetailService();
		String unSavedList = markDetailService.persistMark(markDetailList,
				studentIds, session, request);
		if (markDetailList != null && markDetailList.size() > 0) {
			markDetailService.saveStudentMarkSummary(studentIds, markDetailList
					.get(0).get(0), session);
		}
		return unSavedList;
	}

	public boolean triggerSMS(StudentDetails studentDetails,
			final int selectedMarkId, String portName, String messageFromUI,
			Session session, String selectedStudents[]) throws Exception {
		List<MarkDetails> studentMarkList = null;
		StudentDetailHelper studentDetailHelper = new StudentDetailHelper();
		ExamDetailHelper examDetailHelper = new ExamDetailHelper();

		ExamDetails examDetails = examDetailHelper.findById(selectedMarkId,
				session);
		SchoolDetailsHelper schoolDetailsHelper = new SchoolDetailsHelper();
		SchoolDetails schoolDetails = schoolDetailsHelper.findAll(session);

		List<StudentDetails> studentList = studentDetailHelper.getStudentList(
				studentDetails, session);

		// get the mark list
		MarkThread p = new MarkThread(schoolDetails, studentList,
				studentMarkList, examDetails.getExamType(), portName,
				messageFromUI, selectedMarkId, session);
		p.start();

		return true;
	}

	class MarkThread extends Thread {
		List<MarkDetails> studentMarkList = null;
		String portName;
		String messageFromUI;
		String examType;
		SchoolDetails schoolDetails;
		List<StudentDetails> studentList;
		int selectedMarkId;
		Session session;
		MarkThread(SchoolDetails schoolDetails,
				List<StudentDetails> studentList,
				List<MarkDetails> studentMarkList, String examType,
				String portName, String messageFromUI,
				int selectedMarkId,Session session) throws Exception{
			this.schoolDetails = schoolDetails;
			this.studentList = studentList;
			this.studentMarkList = studentMarkList;
			this.portName = portName;
			this.messageFromUI = messageFromUI;
			this.examType = examType;
			this.selectedMarkId = selectedMarkId;
		}

		public void run() {
			Connection conn = null;
			try {
				Iterator<StudentDetails> studentListIterator = studentList
						.iterator();
				MarkDetailService markDetailService = new MarkDetailService();
				SendMessage sendMessage = new SendMessage();
				CubeProDataSource cubeProDataSource = new CubeProDataSource();
				conn = cubeProDataSource.getConnection();
				while (studentListIterator.hasNext()) {
					StudentDetails studentInformation = studentListIterator
							.next();
					List<MarkDetails> studentMarkList = null;
					studentMarkList = markDetailService.getMarkListForSMS(conn,
							studentInformation.getStudentId(), selectedMarkId);
					Iterator<MarkDetails> markListIterator = studentMarkList
							.iterator();
					String smsToBeSent = "Dear Parent, Mark Info from "
							+ schoolDetails.getSmsName() + ": NAME:"
							+ studentInformation.getStudentName();
					smsToBeSent += " exam :" + examType + " ";
					double total = 0;
					while (markListIterator.hasNext()) {
						MarkDetails markDetails = markListIterator.next();
						smsToBeSent += markDetails.getSubjectDetails()
								.getSubjectName()
								+ ": " + markDetails.getMarkObtained() + " ";
						if (StringUtils.isEmpty(markDetails.getMarkObtained()) == false) {
							total+=Double.valueOf(markDetails.getMarkObtained());
						}
					}
					smsToBeSent += "Total :"+total;
					if (messageFromUI != null
							&& messageFromUI.trim().length() > 0) {
						smsToBeSent += " Note: " + messageFromUI;
					}
					smsToBeSent += " Regards " + schoolDetails.getSmsName();
					sendMessage.sendSMS(portName, studentInformation
							.getMobile(), smsToBeSent);
				}
				sendMessage = null;
			} catch (Exception e) {
				Log.error(getClass(), "exception in sms sending", e);
			}finally{
				try{
				if(conn!=null){
					conn.close();
				}
				}catch(SQLException e){}
			}
		}
	}

}
