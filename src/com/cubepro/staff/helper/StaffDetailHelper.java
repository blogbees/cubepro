package com.cubepro.staff.helper;

import java.util.Iterator;
import java.util.List;

import org.apache.struts.upload.FormFile;
import org.hibernate.Session;

import com.cubepro.general.components.Log;
import com.cubepro.registration.SchoolDetails;
import com.cubepro.registration.helper.SchoolDetailsHelper;
import com.cubepro.staff.StaffDetails;
import com.cubepro.staff.service.StaffDetailService;
import com.cubepro.student.StudentDetails;
import com.cubepro.util.FileUtils;
import com.cubepro.util.SendMessage;

public class StaffDetailHelper {
	public List<StaffDetails> getStaffList(StaffDetails StaffDetails,
			Session session) throws Exception {
		List<StaffDetails> staffDetailList = null;
		StaffDetailService staffDetailservice = new StaffDetailService();
		staffDetailList = staffDetailservice
				.getStaffList(StaffDetails, session);
		return staffDetailList;
	}

	public StaffDetails getStaffDetail(Integer staffId, Session session)
			throws Exception {
		StaffDetails staffDetail = null;
		StaffDetailService staffDetailservice = new StaffDetailService();
		staffDetail = staffDetailservice.getStaffDetail(staffId, session);
		return staffDetail;
	}

	public boolean persistStaffDetail(StaffDetails StaffDetails, Session session)
			throws Exception {
		StaffDetailService staffDetailservice = new StaffDetailService();
		boolean savedStatus = staffDetailservice.persistStaffDetail(
				StaffDetails, session);
		return savedStatus;
	}

	public boolean persistStaffImage(String rootPath, FormFile staffPhoto,
			StaffDetails staffDetails, Session session) throws Exception {
		Log.debug(this.getClass(), "contentType -"
				+ staffPhoto.getContentType() + "fileName ="
				+ staffPhoto.getFileName() + "fileSize ="
				+ staffPhoto.getFileSize() + " rootPath-" + rootPath);
		// convert the image stream to file and save
		String filePath = rootPath + "/" + staffDetails.getStaffNo() + ".jpg";
		staffDetails.setPhoto("/CubePro/photos/" + staffDetails.getStaffNo()
				+ ".jpg");
		FileUtils.convertFormFileToFile(filePath, staffPhoto, false);
		return true;
	}
	
	public boolean triggerSMS(StaffDetails staffDetails, Session session,
			String portName, String messageFromUI, String[] selectedStaffs)
			throws Exception {
		List<StaffDetails> studentDetailsList = getStaffList(
				staffDetails, session);
		SchoolDetailsHelper schoolDetailsHelper = new SchoolDetailsHelper();
		SchoolDetails schoolDetails = schoolDetailsHelper.findAll(session);
		StaffSMSThread p = new StaffSMSThread(schoolDetails, studentDetailsList,
				portName, messageFromUI, selectedStaffs);
		p.start();
		return true;
	}

	
	class StaffSMSThread extends Thread {
		List<StaffDetails> staffDetailsList = null;
		String portName;
		String messageFromUI;
		SchoolDetails schoolDetails;
		String[] selectedStaffs;
		StaffSMSThread(SchoolDetails schoolDetails,List<StaffDetails> staffDetailsList, String portName,
				String messageFromUI,String[] selectedStaffs) {
			this.staffDetailsList = staffDetailsList;
			this.portName = portName;
			this.messageFromUI = messageFromUI;
			this.schoolDetails = schoolDetails;
			this.selectedStaffs = selectedStaffs; 
		}

		public void run() {
			try {
				
				SendMessage sendMessage = new SendMessage();
				for (String selectedStaff : selectedStaffs) {
					StaffDetails staffDetails = staffDetailsList
							.get(Integer.parseInt(selectedStaff));
					String smsToBeSent = "Dear Staff, ";
					if (messageFromUI != null
							&& messageFromUI.trim().length() > 0) {
						smsToBeSent += messageFromUI;
					}
				smsToBeSent +=" Regards "+schoolDetails.getSmsName();
					sendMessage.sendSMS(portName, staffDetails
							.getMobile(), smsToBeSent);
					sleep(5000);
				}
				sendMessage = null;
			} catch (Exception e) {
				Log.error(getClass(), "exception in sms sending", e);
			}
		}
	}

}
