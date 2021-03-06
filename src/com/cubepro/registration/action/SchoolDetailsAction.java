package com.cubepro.registration.action;

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
import com.cubepro.registration.form.SchoolDetailsForm;
import com.cubepro.registration.helper.SchoolDetailsHelper;
import com.cubepro.subject.helper.SubjectDetailHelper;

public class SchoolDetailsAction  extends TransactionAction{
	
	private static final String ACTION_SAVE_SCHOOL = "saveSchoolDetails";
	
	private static final String PARAM_ACTION = "action";

	@Override
	protected CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		SchoolDetailsForm schoolDetailsForm = (SchoolDetailsForm) form;
		SchoolDetailsHelper schoolDetailsHelper = new SchoolDetailsHelper();
		try {
			if (request.getParameter(PARAM_ACTION) != null) {
				if (request.getParameter(PARAM_ACTION).equalsIgnoreCase(
						ACTION_SAVE_SCHOOL)) {
					schoolDetailsHelper.persistSchoolImage(request.getRealPath(CubeProConstants.STUDENT_PHOTO_PATH),schoolDetailsForm.getSchoolPhoto(),schoolDetailsForm.getSchoolDetails());
					schoolDetailsHelper.saveSchoolDetails(schoolDetailsForm.getSchoolDetails(), session);
					actionMessages.add("school.save.success",
							new ActionMessage("school.save.success"));
				}
			}	
			schoolDetailsForm.setSchoolDetails(schoolDetailsHelper.findAll(session));
			
		}catch(final Exception e){
			Log.error(this.getClass(), this, e);
		}finally{
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
				.getPath());
		return forward;
	}


}
