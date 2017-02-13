package com.cubepro.transaction.action;

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
import com.cubepro.transaction.form.TransactionMasterForm;
import com.cubepro.transaction.helper.TransactionMasterHelper;

public class TransactionMasterAction extends TransactionAction {

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SAVE_TERM = "saveTransDesc";

	private static final String ACTION_SET_TERM = "setTransDesc";

	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		TransactionMasterForm termDetailForm = (TransactionMasterForm) form;
		TransactionMasterHelper termDetailHelper = new TransactionMasterHelper();
		try {
			// get the action
			action = request.getParameter(PARAM_ACTION);
			if (action != null) {
				if (action.equalsIgnoreCase(ACTION_SAVE_TERM)) {
					termDetailHelper.saveTransactionMaster(termDetailForm
							.getTransactionMaster(), session);
					actionMessages.add("save.success.all", new ActionMessage(
							"save.success.all"));

				} else if (action.equalsIgnoreCase(ACTION_SET_TERM)) {
					String tid = request.getParameter("transMasterId");
					if (tid != null) {
						termDetailForm.setTransactionMaster(termDetailHelper
								.findByTransactionMasterId(Integer.valueOf(tid)
										.intValue(), session));
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
			termDetailForm
					.setTransMasterList(termDetailHelper.findAll(session));
			request.setAttribute(ATTR_SEARCH_RESULT, termDetailForm
					.getTransMasterList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}

}
