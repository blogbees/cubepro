package com.cubepro.hostel.action;

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
import com.cubepro.hostel.form.VisitorForm;
import com.cubepro.hostel.service.HostelService;

public class VisitorAction  extends TransactionAction {

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SAVE_VISITOR = "saveVisitor";

	private static final String ACTION_SET_VISITOR = "setVisitor";

	private static final String ACTION_DELETE_VISITOR = "deleteVisitor";

	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		VisitorForm visitorForm = (VisitorForm) form;
		HostelService hostelService = new HostelService();
		try {
			// get the action
			action = request.getParameter(PARAM_ACTION);
			if (action != null) {
				if (action.equalsIgnoreCase(ACTION_SAVE_VISITOR)) {
					hostelService.saveVisitorDetail(session, visitorForm
							.getVisitorDetail());
					actionMessages.add("save.success.all", new ActionMessage(
							"save.success.all"));

				} else if (action.equalsIgnoreCase(ACTION_SET_VISITOR)) {
					String visitorId = request.getParameter("visitorId");
					if (visitorId != null) {
						visitorForm.setVisitorDetail(hostelService
								.findByVisitorId(Integer.valueOf(visitorId)
										.intValue(), session));
					}
				} else if (action.equalsIgnoreCase(ACTION_DELETE_VISITOR)) {
					String visitorId = request.getParameter("visitorId");
					if (visitorId != null) {
						visitorForm.setVisitorDetail(hostelService
								.findByVisitorId(Integer.valueOf(visitorId)
										.intValue(), session));
						hostelService.deleteVisitorDetail(session, visitorForm
								.getVisitorDetail());
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
			visitorForm.setRoomList(hostelService
					.findAllRooms(session));
			visitorForm.setVisitorList(hostelService.findAllVisitors(session));
			request.setAttribute(ATTR_SEARCH_RESULT, visitorForm.getVisitorList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}


}
