package com.cubepro.subject.action;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.cubepro.general.components.Log;
import com.cubepro.subject.form.SubjectForm;
import com.cubepro.subject.helper.SubjectHelper;

public class SubjectAction extends TransactionAction{

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SAVE_SUBJECT = "saveSubject";
	
	private static final String ACTION_SET_SUBJECT = "setSubject";
	
	private static final String ACTION_DELETE_SUBJECT = "deleteSubject";
	
	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		SubjectForm subjectDetailForm = (SubjectForm) form;
		SubjectHelper subjectDetailHelper = new SubjectHelper();
		try {
			// get the action
			action = request.getParameter(PARAM_ACTION);
			if (action != null) {
				if (action.equalsIgnoreCase(
						ACTION_SAVE_SUBJECT)) {
					subjectDetailHelper.saveSubjectDetail(subjectDetailForm
							.getSubjectDetail(), session);
					actionMessages.add("save.success.all",
							new ActionMessage("save.success.all"));

				}else if(action.equalsIgnoreCase(
						ACTION_SET_SUBJECT)){
					String subjectId = request.getParameter("id");
					if (subjectId != null) {
						subjectDetailForm.setSubjectDetail(subjectDetailHelper
								.findBySubjectId(Integer.valueOf(subjectId)
										.intValue(), session));
					}
				}else if(action.equalsIgnoreCase(
						ACTION_DELETE_SUBJECT)){
					String subjectId = request.getParameter("id");
					if (subjectId != null) {
						subjectDetailHelper.deleteSubjectDetail(subjectId, session);
						actionMessages.add("save.success.delete",
								new ActionMessage("save.success.delete"));
					}
				}
			}

				// validate action for user to login
			forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
					.getPath());
		} catch (Exception e) {
			actionMessages.add("studentDetails.mark.error", new ActionMessage(e
					.getMessage()));
			Log.error(this.getClass(), this, e);
		} finally {
			subjectDetailForm.setSubjectList(subjectDetailHelper.findAll(session));
			request.setAttribute(ATTR_SEARCH_RESULT, subjectDetailForm.getSubjectList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}



}
