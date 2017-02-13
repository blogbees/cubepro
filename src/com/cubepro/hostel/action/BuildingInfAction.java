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
import com.cubepro.hostel.form.BuildingInfForm;
import com.cubepro.hostel.service.HostelService;
import com.cubepro.staff.StaffDetails;
import com.cubepro.staff.service.StaffDetailService;

public class BuildingInfAction extends TransactionAction {

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SAVE_BUILDING_INF = "saveBuildingInf";

	private static final String ACTION_SET_BUILDING_INF = "setBuildingInf";

	private static final String ACTION_DELETE_BUILDING_INF = "deleteBuildingInf";

	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		BuildingInfForm buildingInfForm = (BuildingInfForm) form;
		StaffDetails staffDetails = new StaffDetails();
		staffDetails.setDesignation(CubeProConstants.STAFF_TYPE_WARDEN);
		StaffDetailService staffDetailService = new StaffDetailService();
		HostelService hostelService = new HostelService();
		try {
			// get the action
			action = request.getParameter(PARAM_ACTION);
			if (action != null) {
				if (action.equalsIgnoreCase(ACTION_SAVE_BUILDING_INF)) {
					hostelService.saveBuildingInfDetail(session,
							buildingInfForm.getBuildingInfDetail());
					actionMessages.add("save.success.all", new ActionMessage(
							"save.success.all"));

				} else if (action.equalsIgnoreCase(ACTION_SET_BUILDING_INF)) {
					String buildingInfId = request
							.getParameter("buildingInfId");
					if (buildingInfId != null) {
						buildingInfForm.setBuildingInfDetail(hostelService
								.findByBuildingInfId(Integer.valueOf(
										buildingInfId).intValue(), session));
					}
				} else if (action.equalsIgnoreCase(ACTION_DELETE_BUILDING_INF)) {
					String buildingInfId = request
							.getParameter("buildingInfId");
					if (buildingInfId != null) {
						buildingInfForm.setBuildingInfDetail(hostelService
								.findByBuildingInfId(Integer.valueOf(
										buildingInfId).intValue(), session));
						hostelService.deleteBuildingInfDetail(session,
								buildingInfForm.getBuildingInfDetail());
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
			try {
				buildingInfForm.setStaffDetails(staffDetailService
						.getStaffList(staffDetails, session));
			} catch (Exception e) {
				Log.error(this.getClass(), "exp occ ", e);
			}
			buildingInfForm.setBuildingInfList(hostelService
					.findAllBuildingInfs(session));
			request.setAttribute(ATTR_SEARCH_RESULT, buildingInfForm
					.getBuildingInfList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
