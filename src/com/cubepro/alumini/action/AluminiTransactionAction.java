package com.cubepro.alumini.action;

import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.alumini.form.AluminiDetailForm;
import com.cubepro.classes.helper.ClassDetailHelper;
import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.cubepro.general.components.Log;
import com.cubepro.student.helper.StudentDetailHelper;

public class AluminiTransactionAction extends TransactionAction {

	private static final long serialVersionUID = -7029152166145442005L;

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_UPDATE_ALL_STUDENTS = "updateStudents";
	
	private static final String ACTION_UPDATE_BY_ADMISSION_NO = "updateByAdmission";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		AluminiDetailForm studentDetailForm = (AluminiDetailForm) form;
		ClassDetailHelper classDetailHelper = new ClassDetailHelper();
		try {
			
			// get the action
			action = request.getParameter(PARAM_ACTION);
			if (action != null) {
				StudentDetailHelper studentDetailHelper = new StudentDetailHelper();
				// validate action for user to login
				if (ACTION_UPDATE_ALL_STUDENTS.equals(action)) {
					studentDetailHelper.updateAllStudentsClass(studentDetailForm.getFromClassId(), studentDetailForm.getToClassId(),session);
					int k=studentDetailHelper.getAllStudentsCount(studentDetailForm.getFromClassId(), session);
					request.setAttribute("Count", k);
					actionMessages.add("save.success.all",
							new ActionMessage("save.success.all"));
				}else if(ACTION_UPDATE_BY_ADMISSION_NO.equals(action)){
					studentDetailHelper.updateAllStudentsClass(studentDetailForm,session);
					actionMessages.add("save.success.all",
							new ActionMessage("save.success.all"));
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
