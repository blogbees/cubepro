package com.cubepro.student.helper;

import java.util.List;

import org.apache.struts.upload.FormFile;
import org.hibernate.Session;

import com.cubepro.alumini.form.AluminiDetailForm;
import com.cubepro.general.components.Log;
import com.cubepro.registration.SchoolDetails;
import com.cubepro.registration.helper.SchoolDetailsHelper;
import com.cubepro.student.StudentDetails;
import com.cubepro.student.dao.StudentDetailsDAO;
import com.cubepro.student.service.StudentDetailService;
import com.cubepro.util.FileUtils;
import com.cubepro.util.SendMessage;

public class StudentDetailHelper {
	public List<StudentDetails> getStudentList(StudentDetails studentDetails,
			Session session) throws Exception {
		List<StudentDetails> studentDetailList = null;
		StudentDetailService studentDetailService = new StudentDetailService();
		studentDetailList = studentDetailService.getStudentList(studentDetails,
				session);
		return studentDetailList;
	}

	public StudentDetails getStudentDetail(Integer studentId, Session session)
			throws Exception {
		StudentDetails studentDetail = null;
		StudentDetailService studentDetailService = new StudentDetailService();
		studentDetail = studentDetailService.getStudentDetail(studentId,
				session);
		return studentDetail;
	}

	public void updateAllStudentsClass(Long fromClassId, Long toClassId,
			Session session) throws Exception {

		StudentDetailService studentDetailService = new StudentDetailService();
		studentDetailService.updateAllStudentsClass(fromClassId, toClassId,
				session);
	}

	public int getAllStudentsCount(Long fromClassId, Session session)
			throws Exception {

		StudentDetailService studentDetailService = new StudentDetailService();
		int k = studentDetailService.getAllStudentsCount(fromClassId, session);
		return k;
	};

	public void updateAllStudentsClass(AluminiDetailForm aluminiDetailForm,
			Session session) throws Exception {

		StudentDetailService studentDetailService = new StudentDetailService();
		studentDetailService.updateAllStudentsClass(aluminiDetailForm
				.getFromAdmClassId(), aluminiDetailForm.getToAdmClassId(),
				aluminiDetailForm.getAdmissionNo(), session);
	}

	public Integer persistStudentDetail(StudentDetails studentDetails,
			Session session) throws Exception {
		StudentDetailService studentDetailService = new StudentDetailService();
		Integer studentId = studentDetailService.persistStudentDetail(
				studentDetails, session);
		return studentId;
	}

	public List<StudentDetails> getFeesStudentsList(
			StudentDetails studentDetails, String fromDate, String toDate,
			Session session) throws Exception {
		List<StudentDetails> studentFeeDetailList = null;
		StudentDetailService studentFeeDetailService = new StudentDetailService();
		studentFeeDetailList = studentFeeDetailService.getFeesStudentsList(
				studentDetails, fromDate, toDate, session);
		return studentFeeDetailList;
	}

	public List<StudentDetails> getHomeWorkStudentsList(
			StudentDetails studentDetails, String fromDate, String toDate,
			Session session) throws Exception {
		List<StudentDetails> studentFeeDetailList = null;
		StudentDetailService studentFeeDetailService = new StudentDetailService();
		studentFeeDetailList = studentFeeDetailService.getHomeWorkStudentsList(
				studentDetails, fromDate, toDate, session);
		return studentFeeDetailList;
	}

	public boolean persistStudentImage(String rootPath, FormFile studentPhoto,
			StudentDetails studentDetails, Session session) throws Exception {
		Log.debug(this.getClass(), "contentType -"
				+ studentPhoto.getContentType() + "fileName ="
				+ studentPhoto.getFileName() + "fileSize ="
				+ studentPhoto.getFileSize() + " rootPath-" + rootPath);
		// convert the image stream to file and save
		String filePath = rootPath + "/" + studentDetails.getRollNo() + ".jpg";
		studentDetails.setPhoto("/CubePro/photos/" + studentDetails.getRollNo()
				+ ".jpg");
		FileUtils.convertFormFileToFile(filePath, studentPhoto, false);
		return true;
	}

	public boolean triggerSMS(StudentDetails studentDetails, String fromDate,
			String toDate, Session session, String portName,
			String messageFromUI, String[] selectedStudents) throws Exception {
		List<StudentDetails> studentDetailsList = getFeesStudentsList(
				studentDetails, fromDate, toDate, session);
		SchoolDetailsHelper schoolDetailsHelper = new SchoolDetailsHelper();
		SchoolDetails schoolDetails = schoolDetailsHelper.findAll(session);
		FeesSMSThread p = new FeesSMSThread(schoolDetails, studentDetailsList,
				portName, messageFromUI, selectedStudents);
		p.start();
		return true;
	}

	public boolean triggerHomeWorkSMS(StudentDetails studentDetails,
			String fromDate, String toDate, Session session, String portName,
			String messageFromUI, String[] selectedStudents) throws Exception {
		List<StudentDetails> studentDetailsList = getHomeWorkStudentsList(
				studentDetails, fromDate, toDate, session);
		SchoolDetailsHelper schoolDetailsHelper = new SchoolDetailsHelper();
		SchoolDetails schoolDetails = schoolDetailsHelper.findAll(session);
		HomeWorkSMSThread p = new HomeWorkSMSThread(schoolDetails,
				studentDetailsList, portName, messageFromUI, selectedStudents);
		p.start();
		return true;
	}

	public boolean triggerSMS(StudentDetails studentDetails, Session session,
			String portName, String messageFromUI, String[] selectedStudents)
			throws Exception {
		List<StudentDetails> studentDetailsList = getStudentList(
				studentDetails, session);
		SchoolDetailsHelper schoolDetailsHelper = new SchoolDetailsHelper();
		SchoolDetails schoolDetails = schoolDetailsHelper.findAll(session);
		SMSThread p = new SMSThread(schoolDetails, studentDetailsList,
				portName, messageFromUI, selectedStudents);
		p.start();
		return true;
	}

	class FeesSMSThread extends Thread {
		List<StudentDetails> studentDetailsList = null;
		String portName;
		String messageFromUI;
		SchoolDetails schoolDetails;
		String[] selectedStudents;

		FeesSMSThread(SchoolDetails schoolDetails,
				List<StudentDetails> studentDetailsList, String portName,
				String messageFromUI, String[] selectedStudents) {
			this.studentDetailsList = studentDetailsList;
			this.portName = portName;
			this.messageFromUI = messageFromUI;
			this.schoolDetails = schoolDetails;
			this.selectedStudents = selectedStudents;
		}

		public void run() {
			try {
				SendMessage sendMessage = new SendMessage();
				for (String selectedStudent : selectedStudents) {
					StudentDetails studentDetails = studentDetailsList
							.get(Integer.parseInt(selectedStudent));
					String smsToBeSent = "Dear Parent, Your Child "
							+ studentDetails.getStudentName()
							+ " fees is Pending for Payments.";
					if (messageFromUI != null
							&& messageFromUI.trim().length() > 0) {
						smsToBeSent += messageFromUI;
						
					}
					smsToBeSent+=" Regards "+schoolDetails.getSmsName();
					sendMessage.sendSMS(portName, studentDetails
							.getMobile(), smsToBeSent);
					sleep(5000);
				}
				sendMessage = null;
			} catch (Exception e) {
				Log.error(getClass(), "exception in sms sending", e);
			}
		}
	}

	class SMSThread extends Thread {
		List<StudentDetails> studentDetailsList = null;
		String portName;
		String messageFromUI;
		SchoolDetails schoolDetails;
		String[] selectedStudents;

		SMSThread(SchoolDetails schoolDetails,
				List<StudentDetails> studentDetailsList, String portName,
				String messageFromUI, String[] selectedStudents) {
			this.studentDetailsList = studentDetailsList;
			this.portName = portName;
			this.messageFromUI = messageFromUI;
			this.schoolDetails = schoolDetails;
			this.selectedStudents = selectedStudents;
		}

		public void run() {
			try {
				String mobileNos = "";
				SendMessage sendMessage = new SendMessage();
				for (String selectedStudent : selectedStudents) {
					StudentDetails studentDetails = studentDetailsList
							.get(Integer.parseInt(selectedStudent));
					mobileNos += studentDetails.getMobile() + ",";
				}
				mobileNos = mobileNos.substring(0, mobileNos.length() - 1);
				String smsToBeSent = "Dear Parent, ";
				if (messageFromUI != null && messageFromUI.trim().length() > 0) {
					smsToBeSent += messageFromUI;
					smsToBeSent+=" Regards "+schoolDetails.getSmsName();
					sendMessage.sendSMS(portName, mobileNos, smsToBeSent,
							"Bulk");
					sleep(5000);

				}
				sendMessage = null;
			} catch (Exception e) {
				Log.error(getClass(), "exception in sms sending", e);
			}
		}
	}

	class HomeWorkSMSThread extends Thread {
		List<StudentDetails> studentDetailsList = null;
		String portName;
		String messageFromUI;
		SchoolDetails schoolDetails;
		String[] selectedStudents;

		HomeWorkSMSThread(SchoolDetails schoolDetails,
				List<StudentDetails> studentDetailsList, String portName,
				String messageFromUI, String[] selectedStudents) {
			this.studentDetailsList = studentDetailsList;
			this.portName = portName;
			this.messageFromUI = messageFromUI;
			this.schoolDetails = schoolDetails;
			this.selectedStudents = selectedStudents;
		}

		public void run() {
			try {
				SendMessage sendMessage = new SendMessage();
				for (String selectedStudent : selectedStudents) {
					StudentDetails studentDetails = studentDetailsList
							.get(Integer.parseInt(selectedStudent));
					if (studentDetails.getAdmissionNo() != null
							&& studentDetails.getAdmissionNo() != "") {
						String smsToBeSent = "Dear Parent, HomeWork info from "
								+ schoolDetails.getSmsName()
								+ ": Your Child is assigned to do HomeWork "
								+ studentDetails.getHomeWorkDesc() + " on "
								+ studentDetails.getHomeWorkAssignedDate()
								+ ".Please have it complete on/before "
								+ studentDetails.getHomeWorkCompletionDate()
								;
						if (messageFromUI != null
								&& messageFromUI.trim().length() > 0) {
							smsToBeSent += " Note: " + messageFromUI;
						}
						smsToBeSent+=" Regards "+schoolDetails.getSmsName();
						sendMessage.sendSMS(portName, studentDetails
								.getMobile(), smsToBeSent);
					} else {
						StudentDetailsDAO studentDetailsDAO = new StudentDetailsDAO();
						List<StudentDetails> allStudents = studentDetailsDAO
								.getAllStudents(studentDetails
										.getClassDetails().getClassId());
						for (StudentDetails studentDetails2 : allStudents) {
							String smsToBeSent = "Dear Parent, HomeWork info from "
									+ schoolDetails.getSmsName()
									+ ": Your Child is assigned to do HomeWork "
									+ studentDetails.getHomeWorkDesc()
									+ " on "
									+ studentDetails.getHomeWorkAssignedDate()
									+ ".Please have it complete on/before "
									+ studentDetails
											.getHomeWorkCompletionDate()
									+ ".Regards " + schoolDetails.getSmsName();
							if (messageFromUI != null
									&& messageFromUI.trim().length() > 0) {
								smsToBeSent += " Note: " + messageFromUI;
							}
							smsToBeSent+=" Regards "+schoolDetails.getSmsName();
							sendMessage.sendSMS(portName, studentDetails2
									.getMobile(), smsToBeSent);
						}
					}
				}
				sleep(5000);
				sendMessage = null;
			} catch (Exception e) {
				Log.error(getClass(), "exception in sms sending", e);
			}
		}
	}

}
