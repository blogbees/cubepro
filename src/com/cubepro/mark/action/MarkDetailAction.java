package com.cubepro.mark.action;

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
import com.cubepro.mark.form.MarkDetailForm;
import com.cubepro.mark.helper.MarkDetailHelper;
import com.cubepro.subject.helper.SubjectDetailHelper;

public class MarkDetailAction extends TransactionAction {

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_LIST_OF_MARKS = "getListOfMarks";

	private static final String ACTION_PERSIST_STUDENT_MARKS = "persistStudentMarks";
	
	private static final String ACTION_GET_TERMS = "getTerms";
	
	private static final String PARAM_STUDENT_ID = "markDetail[0].studentDetails.studentId";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		MarkDetailForm markDetailForm = (MarkDetailForm) form;
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
							.getMarkList(markDetailForm
									.getSearchStudentDetails(),Long.valueOf(markDetailForm.getSelectedExamId()).intValue(), session);
					markDetailForm
							.setMarkDetails(markList);
				} else if (ACTION_PERSIST_STUDENT_MARKS.equals(action)) {
					String[] studentIds = request.getParameterValues(PARAM_STUDENT_ID);
					String unSavedList = markDetailHelper
							.persistMark(markDetailForm
									.getMarkDetails(),studentIds, session, request);
					if (unSavedList != null && unSavedList.trim().length() > 0) {
						actionMessages.add("markDetails.save.error",
								new ActionMessage(unSavedList));
					} else {
						actionMessages
								.add("markDetails.save.success",
										new ActionMessage(
												"markDetails.save.success"));
					}
					List<List<MarkDetails>> markList = markDetailHelper
							.getMarkList(markDetailForm
									.getSearchStudentDetails(),Long.valueOf(markDetailForm.getSelectedExamId()).intValue(), session);
					markDetailForm
							.setMarkDetails(markList);

				}else if(ACTION_GET_TERMS.equals(action)){
					markDetailForm.setExamList(examDetailHelper.findByClassId(markDetailForm.getSearchStudentDetails().
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
			markDetailForm.setClassList(classDetailHelper
					.findAll(session));
			if(selectTerms == false){
				markDetailForm.setExamList(examDetailHelper.findByClassId(
						((ClassDetails) markDetailForm.getClassList().get(0))
								.getClassId().intValue(), session));	
			}
			// set the list of subjects based on the search fields
			markDetailForm.setSubjectList(subjectDetailHelper.findByClass(
					markDetailForm.getSearchStudentDetails().getClassDetails(),
					session));
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
