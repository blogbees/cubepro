package com.cubepro.sms.action;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.classes.helper.ClassDetailHelper;
import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.cubepro.general.components.Log;
import com.cubepro.sms.form.AbsentSMSForm;
import com.cubepro.sms.form.FeesSMSForm;
import com.cubepro.student.StudentDetails;
import com.cubepro.student.attendance.StudentAttendanceDetails;
import com.cubepro.student.attendance.helper.StudentAttendanceHelper;
import com.cubepro.student.helper.StudentDetailHelper;
import com.cubepro.util.SendMessage;

public class FeesSMSAction extends TransactionAction {

	private static final long serialVersionUID = -7029152166145442005L;

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_LIST_OF_STUDENT = "getListOfStudents";
	
	private static final String ACTION_SEND_SMS = "getFeesSMS";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		FeesSMSForm feesSMSForm = (FeesSMSForm) form;
		ClassDetailHelper classAttendanceHelper = new ClassDetailHelper();
		try {
			StudentDetailHelper studentfeeHelper = new StudentDetailHelper();
			// get the action
			action = request.getParameter(PARAM_ACTION);

			if (action != null) {
				// validate action for user to login
				if (ACTION_LIST_OF_STUDENT.equals(action)) {
					List<StudentDetails> studentfeeList = studentfeeHelper.getFeesStudentsList(feesSMSForm.getSearchStudentDetails(), feesSMSForm.getFromDate(),feesSMSForm.getToDate(),session);
					feesSMSForm.setStudentFeeDetails(studentfeeList);
				}else if(ACTION_SEND_SMS.equals(action)){
					if(request.getSession(true).getAttribute(CubeProConstants.PORT_NAME)!=null){
						String selectedStudents[] = request.getParameterValues("selectStudentForSMS");
						studentfeeHelper.triggerSMS(feesSMSForm
							.getSearchStudentDetails(),feesSMSForm.getFromDate(),feesSMSForm.getToDate(),session, String.valueOf(request.getSession(true).getAttribute(CubeProConstants.PORT_NAME)), feesSMSForm.getSmsToBeSent(),selectedStudents);
						actionMessages.add("sms.success.process", new ActionMessage("sms.success.process"));
					}else{
						actionMessages.add("studentDetails.save.error", new ActionMessage("Error Occured in sending SMS. Please initialize Modem"));
					}
				}
			}
			forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
					.getPath());
		} catch (Exception e) {
			actionMessages.add("studentDetails.save.error", new ActionMessage(e
					.getMessage()));
			Log.error(this.getClass(), this, e);
		} finally {
			feesSMSForm.setClassList(classAttendanceHelper.findAll(session));
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}
	

}
