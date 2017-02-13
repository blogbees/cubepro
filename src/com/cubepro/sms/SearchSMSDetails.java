/*******************************************************************************
 * COPYRIGHT, 2009, Cubicle Technologies
 * *******************************************************************************
 * 
 * CONFIDENTIAL - Cubicle Technologies , Inc. (www.cubicletech.com)
 * 
 * This is an unpublished work, which is a trade secret, created in 2009.
 * Cubicle Technologies owns all rights to this work and intends to maintain it
 * in confidence to preserve its trade secret status. Cubicle Technologies
 * reserves the right to protect this work as an unpublished copyrighted work in
 * the event of an inadvertent or deliberate unauthorized publication. Cubicle
 * Technologies also reserves its rights under the copyright laws to protect
 * this work as a published work. Those having access to this work may not copy
 * it, use it, or disclose the information contained in it without the written
 * authorization of Cubicle Technologies.
 * 
 * *******************************************************************************
 * NAME: SMSDetails.java LOCATION: Cubicle Technologies, BUSINESS OWNERS:
 * PRIMARY PROJECT CONTACT: DEVELOPED BY: CubePro J2EE Team
 * 
 * DESCRIPTION: NOTES: DEPENDENCIES: $Log:$
 */

package com.cubepro.sms;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cubepro.classes.ClassDetails;
import com.cubepro.general.CommonConstants;

public class SearchSMSDetails  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2535057518706924250L;

	private int classId;

	private String sectionName;

	private String studentName;

	private List studentList;

	private int termId;

	private List<ClassDetails> classList;

//	private List<TermDetail> termList;

	private static final String ACTION_SEARCH_FOR_ABSENT_STUDENTS = "getAbsentLists";

	private static final String ACTION_CHECK_MODEM_STATUS = "checkModemStatus";

	private static final String ACTION_SEARCH_FOR_MARK_LIST = "getMarkLists";

	private static final String ACTION_SEARCH_FOR_GENERAL = "getGeneralLists";

	private static final String ACTION_SEND_ABSENT_SMS = "sendAbsentSMS";
	
	private static final String ACTION_SEND_FEES_SMS = "sendFeesSMS";

	private static final String PARAM_ACTION = "searchMode";

	private String dateOfAbsent;

	private String messageToBeSent;

	private List subjectList;

	private List cwsList;

	private String modemStatus = CommonConstants.MODEM_STATUS_NEED_TO_BE_TESTED;

	private String modemStatusImagePath = CommonConstants.IMAGE_MODEM_NOT_TESTED;

	public String actionExecute(HttpServletRequest request,
			HttpServletResponse respose) throws Exception {
/*
		// set the class details
		ClassDetailsDAO classDetailsDAO = new ClassDetailsDAO();
		setClassList(classDetailsDAO.getAllClassDetails());
		// set the term details
		TermDetailDAO termDetailDAO = new TermDetailDAO();
		setTermList(termDetailDAO.getAllTermDetails());
		// set the subject details
		SubjectDetailDAO subjectDetailDAO = new SubjectDetailDAO();
		setSubjectList(subjectDetailDAO.getAllSubjectDetails());
		// action perform
		if (request.getParameter(PARAM_ACTION) != null) {
			SearchSMSDAO searchSMS = new SearchSMSDAO();
			if (request.getParameter(PARAM_ACTION).equalsIgnoreCase(
					ACTION_SEARCH_FOR_ABSENT_STUDENTS)) {
				setStudentList(searchSMS.getAbsentDetails(this));
				setMessageToBeSent(CommonConstants.DEFAULT_TEMPLATE_MESSAGE_FOR_ABSENT_SMS);
			} else if (request.getParameter(PARAM_ACTION).equalsIgnoreCase(
					ACTION_SEARCH_FOR_MARK_LIST)) {
				setStudentList(searchSMS.getMarkListDetails(this));
				// set the class wise subject details
				//CWSDAO cwsDAO = new CWSDAO();
				//setCwsList(cwsDAO.getCWSDetails(classId));
				setMessageToBeSent(CommonConstants.DEFAULT_TEMPLATE_MESSAGE_FOR_MARKLIST_SMS);
			} else if (request.getParameter(PARAM_ACTION).equalsIgnoreCase(
					ACTION_SEARCH_FOR_GENERAL)) {
				setMessageToBeSent(CommonConstants.DEFAULT_TEMPLATE_MESSAGE_FOR_GENERAL_SMS);
			} else if (request.getParameter(PARAM_ACTION).equalsIgnoreCase(
					ACTION_CHECK_MODEM_STATUS)) {
				// set the modem status
				CommPortTester commPortTester = new CommPortTester();
				String status = commPortTester.testAndQualifyPort();
				if (CommonConstants.MODEM_STATUS_ERROR.equalsIgnoreCase(status) == false) {
					request.getSession(true)
							.setAttribute("portName", status);
					setModemStatusImagePath(CommonConstants.IMAGE_MODEM_STATUS_OK);
				}
			} else if (request.getParameter(PARAM_ACTION).equalsIgnoreCase(
					ACTION_SEND_ABSENT_SMS)) {
				setStudentList(searchSMS.getMarkListDetails(this));
				// set the class wise subject details
				CWSDAO cwsDAO = new CWSDAO();
				setCwsList(cwsDAO.getCWSDetails(classId));
				setMessageToBeSent(CommonConstants.DEFAULT_TEMPLATE_MESSAGE_FOR_MARKLIST_SMS);
			}
		}
		*/
		return "";
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public String getSectionName() {
		return sectionName;
	}

	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

	public List getStudentList() {
		return studentList;
	}

	public void setStudentList(List studentList) {
		this.studentList = studentList;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public List<ClassDetails> getClassList() {
		return classList;
	}

	public void setClassList(List<ClassDetails> classList) {
		this.classList = classList;
	}

	public String getDateOfAbsent() {
		return dateOfAbsent;
	}

	public void setDateOfAbsent(String dateOfAbsent) {
		this.dateOfAbsent = dateOfAbsent;
	}

	public String getMessageToBeSent() {
		return messageToBeSent;
	}

	public void setMessageToBeSent(String messageToBeSent) {
		this.messageToBeSent = messageToBeSent;
	}

	public String getModemStatus() {
		return modemStatus;
	}

	public void setModemStatus(String modemStatus) {
		this.modemStatus = modemStatus;
	}

	public String getModemStatusImagePath() {
		return modemStatusImagePath;
	}

	public void setModemStatusImagePath(String modemStatusImagePath) {
		this.modemStatusImagePath = modemStatusImagePath;
	}

/*	public List<TermDetail> getTermList() {
		return termList;
	}

	public void setTermList(List<TermDetail> termList) {
		this.termList = termList;
	}
*/
	public int getTermId() {
		return termId;
	}

	public void setTermId(int termId) {
		this.termId = termId;
	}

	public List getSubjectList() {
		return subjectList;
	}

	public void setSubjectList(List subjectList) {
		this.subjectList = subjectList;
	}

	public List getCwsList() {
		return cwsList;
	}

	public void setCwsList(List cwsList) {
		this.cwsList = cwsList;
	}

}