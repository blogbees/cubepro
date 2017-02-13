package com.cubepro.login.action;

import java.sql.SQLException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.Globals;
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
import com.cubepro.login.LoginHelper;
import com.cubepro.login.form.LoginForm;
import com.cubepro.util.DateUtils;

public class LoginAction extends TransactionAction {

	private static final long serialVersionUID = -7029152166145442005L;

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_VALIDATE_USER_AND_LOGIN = "validateUserAndLogin";
	
	private static final String SAVE_LOGIN = "saveLogin";
	
	private static final String GET_LOGIN = "getLogin";
	
	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		LoginHelper loginHelper = new LoginHelper();
		LoginForm loginForm = (LoginForm) form;
		try {

			boolean isValidUser = false;
			// get the action
			action = request.getParameter(PARAM_ACTION);

			if (action != null) {
				// validate action for user to login
				if (ACTION_VALIDATE_USER_AND_LOGIN.equals(action) == true) {
					if (DateUtils.compareDates(DateUtils.getCurrentSysDate(),
							CubeProConstants.CUBEPRO_VALID_TILL_DATE) == false) {
						forward.setPath(mapping.findForward(
								CubeProConstants.FAILURE).getPath());
						ActionMessage message = new ActionMessage("product.expired");
						actionMessages.add(ActionMessages.GLOBAL_MESSAGE, message);
					}else{
						isValidUser = loginHelper.isValidUser(loginForm
								.getLoginDetails().getUserName(), loginForm
								.getLoginDetails().getPassword(), request, session);
						request.getSession(true).setAttribute(Globals.LOCALE_KEY, 
								new Locale(loginForm.getLocaleCode()));
						if (isValidUser) {
							forward.setPath(mapping.findForward(
									CubeProConstants.VALID_USER).getPath());
							//CommPortTester commPortTester = new CommPortTester();
							//commPortTester.testAndQualifyPort();
							//if(portName!=null && portName.trim().length()>0)
								request.getSession(true).setAttribute(CubeProConstants.PORT_NAME, 
										CubeProConstants.COM_1);
						} else {
							forward.setPath(mapping.findForward(
									CubeProConstants.FAILURE).getPath());
							ActionMessage message = new ActionMessage("login.invaliduser");
							actionMessages.add(ActionMessages.GLOBAL_MESSAGE, message);
						}
					}
				}else if(GET_LOGIN.equals(action)){
					String loginId = request.getParameter("id");
					if (loginId != null) {
						loginForm.setLoginDetails(loginHelper
								.findByLoginId(Integer.valueOf(loginId)
										.intValue(), session));
						loginForm.getLoginDetails().setPassword("");
						forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
								.getPath());
					}
				}else if(SAVE_LOGIN.equals(action)){
					loginHelper.saveLoginDetail(loginForm
							.getLoginDetails(), session);
					actionMessages.add("save.success.all",
							new ActionMessage("save.success.all"));
					forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
							.getPath());
				}
					
			} else {
				forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
						.getPath());
			}
		} catch (Exception e) {
			Log.error(this.getClass(), this, e);
		} finally {
			loginForm.setLoginDetailsList(loginHelper.findAll(session));
			request.setAttribute(ATTR_SEARCH_RESULT, loginForm.getLoginDetailsList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
