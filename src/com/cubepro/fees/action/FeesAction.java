package com.cubepro.fees.action;

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

import com.cubepro.classes.helper.ClassDetailHelper;
import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.cubepro.fees.form.FeesForm;
import com.cubepro.fees.helper.FeesHelper;
import com.cubepro.general.components.Log;

public class FeesAction extends TransactionAction{

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SAVE_FEES = "saveFees";
	
	private static final String ACTION_SET_FEES = "setFees";
	
	private static final String ACTION_DELETE_FEES = "deleteFees";
	
	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		FeesForm feesForm = (FeesForm) form;
		FeesHelper subjectDetailHelper = new FeesHelper();
		ClassDetailHelper classAttendanceHelper = new ClassDetailHelper();
		try {
			// get the action
			action = request.getParameter(PARAM_ACTION);
			if (action != null) {
				if (action.equalsIgnoreCase(
						ACTION_SAVE_FEES)) {
					subjectDetailHelper.saveFeesMasterDetail(feesForm
							.getFeesMaster(), session);
					actionMessages.add("save.success.all",
							new ActionMessage("save.success.all"));

				}else if(action.equalsIgnoreCase(
						ACTION_SET_FEES)){
					String subjectId = request.getParameter("id");
					if (subjectId != null) {
						feesForm.setFeesMaster(subjectDetailHelper
								.findByFeesMasterId(Integer.valueOf(subjectId)
										.intValue(), session));
					}
				}else if(action.equalsIgnoreCase(
						ACTION_DELETE_FEES)){
					String subjectId = request.getParameter("id");
					if (subjectId != null) {
						subjectDetailHelper.deleteFeesMasterDetail(subjectId, session);
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
			feesForm.setFeesMasterList(subjectDetailHelper.findAll(session));
			feesForm.setClassList(classAttendanceHelper
					.findAll(session));
			request.setAttribute(ATTR_SEARCH_RESULT, feesForm.getFeesMasterList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}




}
