package com.cubepro.student.action;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessages;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.classes.helper.ClassDetailHelper;
import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.cubepro.general.components.Log;
import com.cubepro.student.StudentDetails;
import com.cubepro.student.form.StudentDetailForm;
import com.cubepro.student.helper.StudentDetailHelper;

public class StudentDetailAction extends TransactionAction {

	private static final long serialVersionUID = -7029152166145442005L;

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_LIST_OF_STUDENT = "getListOfStudents";
	
	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		StudentDetailForm studentDetailForm = (StudentDetailForm) form;
		ClassDetailHelper classDetailHelper = new ClassDetailHelper();
		try {
			StudentDetailHelper studentDetailHelper = new StudentDetailHelper();

			// get the action
			action = request.getParameter(PARAM_ACTION);

			if (action != null) {
				// validate action for user to login
				if (ACTION_LIST_OF_STUDENT.equals(action)) {
					List<StudentDetails> studentList = studentDetailHelper
					.getStudentList(studentDetailForm
							.getSearchStudentDetails(), session);
					studentDetailForm.setStudentList(studentList);
					request.setAttribute(ATTR_SEARCH_RESULT, studentList);
				}
			}
			forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
					.getPath());
		} catch (Exception e) {
			Log.error(this.getClass(), this, e);
		} finally {
			studentDetailForm.setClassList(classDetailHelper.findAll(session));
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
