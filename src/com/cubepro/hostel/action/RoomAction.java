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
import com.cubepro.hostel.form.RoomForm;
import com.cubepro.hostel.service.HostelService;

public class RoomAction extends TransactionAction {

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SAVE_ROOM = "saveRoom";

	private static final String ACTION_SET_ROOM = "setRoom";

	private static final String ACTION_DELETE_ROOM = "deleteRoom";

	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		RoomForm roomForm = (RoomForm) form;
		HostelService hostelService = new HostelService();
		try {
			// get the action
			action = request.getParameter(PARAM_ACTION);
			if (action != null) {
				if (action.equalsIgnoreCase(ACTION_SAVE_ROOM)) {
					hostelService.saveRoomDetail(session, roomForm
							.getRoomDetail());
					actionMessages.add("save.success.all", new ActionMessage(
							"save.success.all"));

				} else if (action.equalsIgnoreCase(ACTION_SET_ROOM)) {
					String roomId = request.getParameter("roomId");
					if (roomId != null) {
						roomForm.setRoomDetail(hostelService
								.findByRoomId(Integer.valueOf(roomId)
										.intValue(), session));
					}
				} else if (action.equalsIgnoreCase(ACTION_DELETE_ROOM)) {
					String roomId = request.getParameter("roomId");
					if (roomId != null) {
						roomForm.setRoomDetail(hostelService
								.findByRoomId(Integer.valueOf(roomId)
										.intValue(), session));
						hostelService.deleteRoomDetail(session, roomForm
								.getRoomDetail());
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
			roomForm.setBuildingInfList(hostelService
					.findAllBuildingInfs(session));
			roomForm.setRoomList(hostelService.findAllRooms(session));
			request.setAttribute(ATTR_SEARCH_RESULT, roomForm.getRoomList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
