package com.cubepro.exam.action;

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

import com.cubepro.classes.helper.ClassDetailHelper;
import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.cubepro.exam.form.ExamDetailForm;
import com.cubepro.exam.helper.ExamDetailHelper;
import com.cubepro.exam.helper.TermHelper;
import com.cubepro.general.components.Log;

public class ExamDetailAction extends TransactionAction{

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SAVE_EXAM = "saveExam";
	
	private static final String ACTION_SET_EXAM = "setExam";
	
	private static final String ACTION_DELETE_EXAM = "deleteExam";
	
	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		ExamDetailForm examDetailForm = (ExamDetailForm) form;
		ExamDetailHelper examDetailHelper = new ExamDetailHelper();
		TermHelper subjectHelper = new TermHelper();
		ClassDetailHelper classDetailHelper = new ClassDetailHelper();
		try {
			// get the action
			action = request.getParameter(PARAM_ACTION);
			if (action != null) {
				if (action.equalsIgnoreCase(
						ACTION_SAVE_EXAM)) {
					examDetailHelper.saveExamDetail(examDetailForm
							.getExamDetail(), session);
					actionMessages.add("save.success.all",
							new ActionMessage("save.success.all"));

				}else if(action.equalsIgnoreCase(
						ACTION_SET_EXAM)){
					String subjectId = request.getParameter("examId");
					if (subjectId != null) {
						examDetailForm.setExamDetail(examDetailHelper
								.findByExamId(Integer.valueOf(subjectId)
										.intValue(), session));
					}
				}else if(action.equalsIgnoreCase(
						ACTION_DELETE_EXAM)){
					String subjectId = request.getParameter("examId");
					if (subjectId != null) {
						examDetailHelper.deleteExamDetail(subjectId, session);
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
			examDetailForm.setExamList(examDetailHelper.findAll(session));
			examDetailForm.setClassList(classDetailHelper.findAll(session));
			examDetailForm.setTerms(subjectHelper.findAll(session));
			request.setAttribute(ATTR_SEARCH_RESULT, examDetailForm.getExamList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}



}
