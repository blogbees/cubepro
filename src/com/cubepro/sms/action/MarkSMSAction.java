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

import com.cubepro.classes.ClassDetails;
import com.cubepro.classes.helper.ClassDetailHelper;
import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.cubepro.exam.helper.ExamDetailHelper;
import com.cubepro.general.components.Log;
import com.cubepro.mark.MarkDetails;
import com.cubepro.mark.helper.MarkDetailHelper;
import com.cubepro.sms.form.MarkSMSForm;
import com.cubepro.subject.helper.SubjectDetailHelper;

public class MarkSMSAction extends TransactionAction{

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_LIST_OF_MARKS = "getListOfMarks";

	private static final String ACTION_SMS_STUDENT_MARKS = "smsStudentMarks";
	
	private static final String ACTION_GET_TERMS = "getTerms";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		MarkSMSForm markSMSForm = (MarkSMSForm) form;
		ClassDetailHelper classDetailHelper = new ClassDetailHelper();
		SubjectDetailHelper subjectDetailHelper = new SubjectDetailHelper();
		ExamDetailHelper examDetailHelper = new ExamDetailHelper();
		boolean selectTerms = false;
		try {
			MarkDetailHelper markDetailHelper = new MarkDetailHelper();
			// get the action
			action = request.getParameter(PARAM_ACTION);

			if (action != null) {
				// validate action for user to login
				if (ACTION_LIST_OF_MARKS.equals(action)) {
					List <List<MarkDetails>> markList = markDetailHelper
							.getMarkList(markSMSForm
									.getSearchStudentDetails(),Long.valueOf(markSMSForm.getSelectedExamId()).intValue(), session);
					markSMSForm
							.setMarkDetails(markList);
				}else if(ACTION_SMS_STUDENT_MARKS.equals(action)){
					if(request.getSession(true).getAttribute(CubeProConstants.PORT_NAME)!=null){
						String selectedStudents[] = request.getParameterValues("selectStudentForSMS");
						markDetailHelper.triggerSMS(markSMSForm
								.getSearchStudentDetails(),Long.valueOf(markSMSForm.getSelectedExamId()).intValue(), String.valueOf(request.getSession(true).getAttribute(CubeProConstants.PORT_NAME)), markSMSForm.getSmsToBeSent(),session,selectedStudents);
						actionMessages.add("sms.success.process", new ActionMessage("sms.success.process"));
						}
					}else if(ACTION_GET_TERMS.equals(action)){
						markSMSForm.setExamList(examDetailHelper.findByClassId(markSMSForm.getSearchStudentDetails().
								getClassDetails().getClassId().intValue()
								, session));
						selectTerms = true;
					}
			}
			forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
					.getPath());
		} catch (Exception e) {
			actionMessages.add("studentDetails.mark.error", new ActionMessage(e
					.getMessage()));
			Log.error(this.getClass(), this, e);
		} finally {
			markSMSForm.setClassList(classDetailHelper
					.findAll(session));
			if(selectTerms == false){
				markSMSForm.setExamList(examDetailHelper.findByClassId(
						((ClassDetails) markSMSForm.getClassList().get(0))
								.getClassId().intValue(), session));	
			}
			// set the list of subjects based on the search fields
			markSMSForm.setSubjectList(subjectDetailHelper.findByClass(
					markSMSForm.getSearchStudentDetails().getClassDetails(),
					session));
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}


}
