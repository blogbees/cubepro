package com.cubepro.staff.action;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessages;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.classes.helper.ClassDetailHelper;
import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.cubepro.general.components.Log;
import com.cubepro.staff.StaffDetails;
import com.cubepro.staff.form.StaffDetailForm;
import com.cubepro.staff.helper.StaffDetailHelper;

public class StaffDetailAction extends TransactionAction {

	private static final long serialVersionUID = -7029152166145442005L;

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_LIST_OF_STAFF = "getListOfStaffs";
	
	private static final String ATTR_SEARCH_RESULT = "searchResult";
	
	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		StaffDetailForm staffDetailForm = (StaffDetailForm) form;
		ClassDetailHelper classDetailHelper = new ClassDetailHelper();
		try {
			StaffDetailHelper studentDetailHelper = new StaffDetailHelper();

			// get the action
			action = request.getParameter(PARAM_ACTION);

			if (action != null) {
				// validate action for user to login
				if (ACTION_LIST_OF_STAFF.equals(action)) {
					System.out.println("StaffDetails List ");
					List<StaffDetails> staffList = studentDetailHelper
					.getStaffList(staffDetailForm
							.getSearchStaffDetails(), session);
					staffDetailForm.setStaffList(staffList);
					request.setAttribute(ATTR_SEARCH_RESULT, staffList);
				}
			}
			forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
					.getPath());
		} catch (Exception e) {
			Log.error(this.getClass(), this, e);
		} finally {
			staffDetailForm.setClassList(classDetailHelper.findAll(session));
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
