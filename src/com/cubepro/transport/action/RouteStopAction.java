package com.cubepro.transport.action;

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
import com.cubepro.transport.form.RouteStopForm;
import com.cubepro.transport.service.TransportService;

public class RouteStopAction extends TransactionAction{

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SAVE_TERM = "saveRouteStop";
	
	private static final String ACTION_SET_TERM = "setRouteStop";
	
	private static final String ACTION_DELETE_TERM = "deleteRouteStop";
	
	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		RouteStopForm routeStopForm = (RouteStopForm) form;
		TransportService transportService = new TransportService();
		try {
			// get the action
			action = request.getParameter(PARAM_ACTION);
			if (action != null) {
				if (action.equalsIgnoreCase(
						ACTION_SAVE_TERM)) {
					transportService.saveRouteStopDetail(session, routeStopForm
							.getRouteStopDetail());
					actionMessages.add("save.success.all",
							new ActionMessage("save.success.all"));

				}else if(action.equalsIgnoreCase(
						ACTION_SET_TERM)){
					String routeStopId = request.getParameter("routeStopId");
					if (routeStopId != null) {
						routeStopForm.setRouteStopDetail(transportService
								.findByRouteStopId(Integer.valueOf(routeStopId)
										.intValue(), session));
					}
				}else if(action.equalsIgnoreCase(
						ACTION_DELETE_TERM)){
					String routeStopId = request.getParameter("routeStopId");
					if (routeStopId != null) {
						routeStopForm.setRouteStopDetail(transportService
								.findByRouteStopId(Integer.valueOf(routeStopId)
										.intValue(), session));
						transportService.deleteRouteStopDetail(session, routeStopForm.getRouteStopDetail());
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
			routeStopForm.setRouteStopList(transportService.findAllRouteStops(session));
			routeStopForm.setRouteList(transportService.findAllRoutes(session));
			routeStopForm.setStopList(transportService.findAllStops(session));
			request.setAttribute(ATTR_SEARCH_RESULT, routeStopForm.getRouteStopList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}




}
