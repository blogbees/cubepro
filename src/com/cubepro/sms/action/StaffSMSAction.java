package com.cubepro.sms.action;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.classes.helper.ClassDetailHelper;
import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.cubepro.general.components.Log;
import com.cubepro.sms.form.GeneralSMSForm;
import com.cubepro.staff.StaffDetails;
import com.cubepro.staff.helper.StaffDetailHelper;

public class StaffSMSAction extends TransactionAction{

	private String action;
	
	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SMS_LIST_OF_STAFF = "smsGeneral";
	
	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		GeneralSMSForm generalSMSForm = (GeneralSMSForm) form;
		ClassDetailHelper classDetailHelper = new ClassDetailHelper();
		try {
			StaffDetailHelper staffDetailHelper = new StaffDetailHelper();

			// get the action
			action = request.getParameter(PARAM_ACTION);

			if (action != null) {
				// validate action for user to login
					List<StaffDetails> staffList = staffDetailHelper
					.getStaffList(generalSMSForm
							.getSearchStaffDetails(), session);
					generalSMSForm.setStaffList(staffList);
					request.setAttribute(ATTR_SEARCH_RESULT, staffList);
					if(ACTION_SMS_LIST_OF_STAFF.equals(action)){
					if(request.getSession(true).getAttribute(CubeProConstants.PORT_NAME)!=null){
						String selectedStaffs[] = request.getParameterValues("selectStaffForSMS");
						staffDetailHelper.triggerSMS(generalSMSForm
								.getSearchStaffDetails(), session, String.valueOf(request.getSession(true).getAttribute(CubeProConstants.PORT_NAME)), generalSMSForm.getSmsToBeSent(),selectedStaffs);
						actionMessages.add("sms.success.process", new ActionMessage("sms.success.process"));
					}
				}
			}
			forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
					.getPath());
		} catch (Exception e) {
			Log.error(this.getClass(), this, e);
		} finally {
			generalSMSForm.setClassList(classDetailHelper.findAll(session));
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
