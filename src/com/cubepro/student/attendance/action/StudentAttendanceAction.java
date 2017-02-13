package com.cubepro.student.attendance.action;

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
import com.cubepro.student.attendance.StudentAttendanceDetails;
import com.cubepro.student.attendance.form.StudentAttendanceForm;
import com.cubepro.student.attendance.helper.StudentAttendanceHelper;

public class StudentAttendanceAction extends TransactionAction {

	private static final long serialVersionUID = -7029152166145442005L;

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_LIST_OF_STUDENT = "getListOfStudents";

	private static final String ACTION_PERSIST_STUDENT_ATTENDANCE = "persistStudentAttendance";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		StudentAttendanceForm studentAttendanceForm = (StudentAttendanceForm) form;
		ClassDetailHelper classAttendanceHelper = new ClassDetailHelper();
		try {
			StudentAttendanceHelper studentAttendanceHelper = new StudentAttendanceHelper();
			// get the action
			action = request.getParameter(PARAM_ACTION);

			if (action != null) {
				// validate action for user to login
				if (ACTION_LIST_OF_STUDENT.equals(action)) {
					List<StudentAttendanceDetails> studentAttendanceList = studentAttendanceHelper
							.getStudentAttendanceList(studentAttendanceForm
									.getSearchStudentDetails(),
									studentAttendanceForm
											.getAttendanceDateString(), session);
					studentAttendanceForm
							.setStudentAttendances(studentAttendanceList);
				} else if (ACTION_PERSIST_STUDENT_ATTENDANCE.equals(action)) {
					String unSavedList = studentAttendanceHelper
							.persistStudentAttendances(studentAttendanceForm
									.getStudentAttendances(), session);
					if (unSavedList != null && unSavedList.trim().length() > 0) {
						actionMessages.add("studentDetails.save.error",
								new ActionMessage(unSavedList));
					} else {
						actionMessages
								.add("studentDetails.save.success",
										new ActionMessage(
												"studentDetails.save.success"));
					}
					List<StudentAttendanceDetails> studentAttendanceList = studentAttendanceHelper
							.getStudentAttendanceList(studentAttendanceForm
									.getSearchStudentDetails(),
									studentAttendanceForm
											.getAttendanceDateString(), session);
					studentAttendanceForm
							.setStudentAttendances(studentAttendanceList);

				}
			}
			forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
					.getPath());
		} catch (Exception e) {
			actionMessages.add("studentDetails.save.error", new ActionMessage(e
					.getMessage()));
			Log.error(this.getClass(), this, e);
		} finally {
			studentAttendanceForm.setClassList(classAttendanceHelper
					.findAll(session));
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
