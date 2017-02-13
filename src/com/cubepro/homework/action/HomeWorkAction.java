package com.cubepro.homework.action;

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
import com.cubepro.homework.form.HomeWorkForm;
import com.cubepro.homework.service.HomeWorkService;

public class HomeWorkAction extends TransactionAction {

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SAVE_HOMEWORK = "saveHomeWork";

	private static final String ACTION_SET_HOMEWORK = "setHomeWork";

	private static final String ACTION_DELETE_HOMEWORK = "deleteHomeWork";

	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		HomeWorkForm homeWorkForm = (HomeWorkForm) form;
		HomeWorkService homeWorkService = new HomeWorkService();
		try {
			// get the action
			action = request.getParameter(PARAM_ACTION);
			if (action != null) {
				if (action.equalsIgnoreCase(ACTION_SAVE_HOMEWORK)) {
					homeWorkService.saveHomeWorkDetail(session, homeWorkForm
							.getHomeWorkDetail());
					actionMessages.add("save.success.all", new ActionMessage(
							"save.success.all"));

				} else if (action.equalsIgnoreCase(ACTION_SET_HOMEWORK)) {
					String HomeWorkId = request.getParameter("homeWorkId");
					if (HomeWorkId != null) {
						homeWorkForm.setHomeWorkDetail(homeWorkService
								.findByHomeWorkId(Integer.valueOf(HomeWorkId)
										.intValue(), session));
					}
				} else if (action.equalsIgnoreCase(ACTION_DELETE_HOMEWORK)) {
					String HomeWorkId = request.getParameter("homeWorkId");
					if (HomeWorkId != null) {
						homeWorkForm.setHomeWorkDetail(homeWorkService
								.findByHomeWorkId(Integer.valueOf(HomeWorkId)
										.intValue(), session));
						homeWorkService.deleteHomeWorkDetail(session, homeWorkForm
								.getHomeWorkDetail());
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
			homeWorkForm.setHomeWorkList(homeWorkService.findAllHomeWorks(session));
			request.setAttribute(ATTR_SEARCH_RESULT, homeWorkForm.getHomeWorkList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
