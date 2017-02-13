package com.cubepro.student.action;

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
import com.cubepro.general.components.Log;
import com.cubepro.homework.service.HomeWorkService;
import com.cubepro.student.form.StudentHomeWorkForm;
import com.cubepro.student.service.StudentDetailService;

public class StudentHomeWorkAction extends TransactionAction {

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SAVE_HOMEWORK = "saveStudentHomeWork";

	private static final String ACTION_SET_HOMEWORK = "setStudentHomeWork";

	private static final String ACTION_DELETE_HOMEWORK = "deleteStudentHomeWork";

	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		StudentHomeWorkForm studentHomeWorkForm = (StudentHomeWorkForm) form;
		StudentDetailService studentHomeWorkService = new StudentDetailService();
		HomeWorkService homeWorkService = new HomeWorkService();
		ClassDetailHelper classDetailHelper = new ClassDetailHelper();
		try {
			// get the action
			action = request.getParameter(PARAM_ACTION);
			if (action != null) {
				if (action.equalsIgnoreCase(ACTION_SAVE_HOMEWORK)) {
					studentHomeWorkService.saveStudentHomeWorkDetail(session, studentHomeWorkForm
							.getStudentHomeWorkDetail());
					actionMessages.add("save.success.all", new ActionMessage(
							"save.success.all"));

				} else if (action.equalsIgnoreCase(ACTION_SET_HOMEWORK)) {
					String StudentHomeWorkId = request.getParameter("studentHomeWorkId");
					if (StudentHomeWorkId != null) {
						studentHomeWorkForm.setStudentHomeWorkDetail(studentHomeWorkService
								.findByStudentHomeWorkId(Integer.valueOf(StudentHomeWorkId)
										.intValue(), session));
					}
				} else if (action.equalsIgnoreCase(ACTION_DELETE_HOMEWORK)) {
					String StudentHomeWorkId = request.getParameter("studentHomeWorkId");
					if (StudentHomeWorkId != null) {
						studentHomeWorkForm.setStudentHomeWorkDetail(studentHomeWorkService
								.findByStudentHomeWorkId(Integer.valueOf(StudentHomeWorkId)
										.intValue(), session));
						studentHomeWorkService.deleteStudentHomeWorkDetail(session, studentHomeWorkForm
								.getStudentHomeWorkDetail());
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
			studentHomeWorkForm.setStudentHomeWorkList(studentHomeWorkService.findAllStudentHomeWorks(session));
			studentHomeWorkForm.setClassDetails(classDetailHelper.findAll(session));
			studentHomeWorkForm.setHomeWorkDetails(homeWorkService.findAllHomeWorks(session));
			request.setAttribute(ATTR_SEARCH_RESULT, studentHomeWorkForm.getStudentHomeWorkList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
