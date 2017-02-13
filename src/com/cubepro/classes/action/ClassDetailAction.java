package com.cubepro.classes.action;

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
import com.cubepro.classes.form.ClassDetailForm;
import com.cubepro.classes.helper.ClassDetailHelper;
import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.cubepro.general.components.Log;

public class ClassDetailAction extends TransactionAction {

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SAVE_CLASS = "saveClass";
	
	private static final String ACTION_SET_CLASS = "setClass";
	
	private static final String ACTION_DELETE_CLASS = "deleteClass";
	
	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		ClassDetailForm classDetailForm = (ClassDetailForm) form;
		ClassDetailHelper classDetailHelper = new ClassDetailHelper();
		try {
			// get the action
			action = request.getParameter(PARAM_ACTION);
			if (action != null) {
				if (action.equalsIgnoreCase(
						ACTION_SAVE_CLASS)) {
					classDetailHelper.saveClassDetail(classDetailForm
							.getClassDetail(), session);
					actionMessages.add("save.success.all",
							new ActionMessage("save.success.all"));

				}else if(action.equalsIgnoreCase(
						ACTION_SET_CLASS)){
					String classId = request.getParameter("classId");
					if (classId != null) {
						classDetailForm.setClassDetail(classDetailHelper
								.findByClassId(Integer.valueOf(classId)
										.intValue(), session));
					}
				}else if(action.equalsIgnoreCase(
						ACTION_DELETE_CLASS)){
					String classId = request.getParameter("classId");
					if (classId != null) {
						classDetailHelper.deleteClassDetail(classId, session);
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
			classDetailForm.setClassList(classDetailHelper.findAll(session, true));
			request.setAttribute(ATTR_SEARCH_RESULT, classDetailForm.getClassList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
