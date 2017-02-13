package com.cubepro.menu.action;

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
import com.cubepro.login.service.LoginService;
import com.cubepro.menu.form.PermissionForm;
import com.cubepro.menu.service.PermissionService;

public class PermissionAction extends TransactionAction {

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SAVE_MENU_PERMISSIONS = "saveMenuPermissions";

	private static final String ACTION_SET_MENU_PERMISSIONS = "setMenuPermissions";

	private static final String ACTION_DELETE_MENU_PERMISSIONS = "deleteMenuPermissions";

	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		PermissionForm menuPermissionsForm = (PermissionForm) form;
		PermissionService menuPermissionsService = new PermissionService();
		LoginService loginService = new LoginService();
		try {
			// get the action
			action = request.getParameter(PARAM_ACTION);
			if (action != null) {		
				if (action.equalsIgnoreCase(ACTION_SAVE_MENU_PERMISSIONS)) {
					menuPermissionsService.saveMenuPermissionsDetail(session,
							menuPermissionsForm.getMenuPermissions());
					actionMessages.add("save.success.all", new ActionMessage(
							"save.success.all"));

				} else if (action.equalsIgnoreCase(ACTION_SET_MENU_PERMISSIONS)) {
					String menuPermissionsId = request
							.getParameter("menuPermissionsId");
					if (menuPermissionsId != null) {
						menuPermissionsForm.setMenuPermissions(menuPermissionsService
								.findByMenuPermissionsId(Integer.valueOf(
										menuPermissionsId).intValue(), session));
					}
				} else if (action.equalsIgnoreCase(ACTION_DELETE_MENU_PERMISSIONS)) {
					String menuPermissionsId = request
							.getParameter("menuPermissionsId");
					if (menuPermissionsId != null) {
						menuPermissionsForm.setMenuPermissions(menuPermissionsService
								.findByMenuPermissionsId(Integer.valueOf(
										menuPermissionsId).intValue(), session));
						menuPermissionsService.deleteMenuPermissionsDetail(session,
								menuPermissionsForm.getMenuPermissions());
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
			menuPermissionsForm.setMenuPermissionsList(menuPermissionsService
					.findAllMenuPermissionss(session));
			menuPermissionsForm.setLoginDetailsList(loginService
					.findAll(session));
			menuPermissionsForm.setMenusList(menuPermissionsService
					.findAllMenus(session));
			request.setAttribute(ATTR_SEARCH_RESULT, menuPermissionsForm
					.getMenuPermissionsList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
