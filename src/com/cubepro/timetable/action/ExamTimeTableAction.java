package com.cubepro.timetable.action;

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

import com.cubepro.classes.ClassDetails;
import com.cubepro.classes.helper.ClassDetailHelper;
import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.cubepro.exam.helper.ExamDetailHelper;
import com.cubepro.general.components.Log;
import com.cubepro.subject.helper.SubjectDetailHelper;
import com.cubepro.timetable.form.ExamTimeTableForm;
import com.cubepro.timetable.helper.ExamTimeTableHelper;

public class ExamTimeTableAction extends TransactionAction {

	private static final String ACTION_SAVE_EXAM_TT_LIST = "saveExamTimeTable";

	private static final String ACTION_SET_DETAILS = "setDetails";

	private static final String ACTION_SET_TT_DETAILS = "setExamTTDetails";

	private static final String PARAM_ACTION = "action";

	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	protected CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		ExamTimeTableForm examTTForm = (ExamTimeTableForm) form;
		ExamTimeTableHelper ettHelper = new ExamTimeTableHelper();
		ExamDetailHelper examDetailHelper = new ExamDetailHelper();
		ClassDetailHelper classDetailHelper = new ClassDetailHelper();
		SubjectDetailHelper subjectDetailHelper = new SubjectDetailHelper();
		try {
			if (request.getParameter(PARAM_ACTION) != null) {
				if (request.getParameter(PARAM_ACTION).equalsIgnoreCase(
						ACTION_SAVE_EXAM_TT_LIST)) {
					ettHelper.saveExamTimeTable(examTTForm.getExamTimeTable(),
							session);
					actionMessages.add("examtimetable.save.success",
							new ActionMessage("examtimetable.save.success"));
				} else if (request.getParameter(PARAM_ACTION).equalsIgnoreCase(
						ACTION_SET_DETAILS)) {
					examTTForm.setExamList(examDetailHelper.findByClassId(
							examTTForm.getExamTimeTable().getClassDetails()
									.getClassId().intValue(), session));
					examTTForm.setSubjectList(subjectDetailHelper.findByClass(
							examTTForm.getExamTimeTable().getClassDetails(),
							session));
				} else if (request.getParameter(PARAM_ACTION).equalsIgnoreCase(
						ACTION_SET_TT_DETAILS)) {
					String examId = request.getParameter("examTTId");
					examTTForm.setExamTimeTable(ettHelper.findById(Integer
							.valueOf(examId), session));
				}
			}
			examTTForm.setExamTimeTableList(ettHelper.findAll(session));

		} catch (final Exception e) {
			Log.error(this.getClass(), this, e);
		} finally {
			examTTForm.setClassList(classDetailHelper.findAll(session));
			// set the subject list based on the class
			if (examTTForm.getExamTimeTable().getClassDetails().getClassId() == null
					|| examTTForm.getExamTimeTable().getClassDetails()
							.getClassId().intValue() == 0) {
				examTTForm.getExamTimeTable().setClassDetails(
						examTTForm.getClassList().get(0));
			}
			if (examTTForm.getSubjectList() == null
					|| examTTForm.getSubjectList().isEmpty() == true) {
				examTTForm.setSubjectList(subjectDetailHelper.findByClass(
						examTTForm.getExamTimeTable().getClassDetails(),
						session));
			}
			if (examTTForm.getExamList() == null
					|| examTTForm.getExamList().isEmpty() == true) {
				examTTForm.setExamList(examDetailHelper.findByClassId(
						((ClassDetails) examTTForm.getClassList().get(0))
								.getClassId().intValue(), session));
			}
			request.setAttribute(ATTR_SEARCH_RESULT, examTTForm
					.getExamTimeTableList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		forward
				.setPath(mapping.findForward(CubeProConstants.SUCCESS)
						.getPath());
		return forward;
	}

}
