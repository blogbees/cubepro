package com.cubepro.sms.action;

import java.sql.SQLException;
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
import com.cubepro.sms.form.GeneralSMSForm;
import com.cubepro.student.StudentDetails;
import com.cubepro.student.helper.StudentDetailHelper;

public class GeneralSMSAction extends TransactionAction{
	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_LIST_OF_STUDENT = "getListOfStudents";
	
	private static final String ACTION_SMS_LIST_OF_STUDENT = "smsGeneral";
	
	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		GeneralSMSForm generalSMSForm = (GeneralSMSForm) form;
		ClassDetailHelper classDetailHelper = new ClassDetailHelper();
		try {
			StudentDetailHelper studentDetailHelper = new StudentDetailHelper();

			// get the action
			action = request.getParameter(PARAM_ACTION);

			if (action != null) {
				// validate action for user to login
					List<StudentDetails> studentList = studentDetailHelper
					.getStudentList(generalSMSForm
							.getSearchStudentDetails(), session);
					generalSMSForm.setStudentList(studentList);
					request.setAttribute(ATTR_SEARCH_RESULT, studentList);
					if(ACTION_SMS_LIST_OF_STUDENT.equals(action)){
					if(request.getSession(true).getAttribute(CubeProConstants.PORT_NAME)!=null){
						String selectedStudents[] = request.getParameterValues("selectStudentForSMS"); 
						studentDetailHelper.triggerSMS(generalSMSForm
								.getSearchStudentDetails(), session, String.valueOf(request.getSession(true).getAttribute(CubeProConstants.PORT_NAME)), generalSMSForm.getSmsToBeSent(), selectedStudents);
						actionMessages.add("sms.success.process", new ActionMessage("sms.success.process"));
					}
				}
			}
			forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
					.getPath());
		} catch (Exception e) {
			Log.error(this.getClass(), this, e);
		} finally {
			generalSMSForm.setClassList(classDetailHelper.findAll(session));
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
