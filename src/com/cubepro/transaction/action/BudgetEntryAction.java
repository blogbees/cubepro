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
import com.cubepro.transaction.form.TransactionDetailForm;
import com.cubepro.transaction.helper.TransactionDetailHelper;

public class BudgetEntryAction extends TransactionAction{

	private static final String ACTION_SAVE_TT_LIST = "saveTransaction";

	private static final String PARAM_ACTION = "action";
	
	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	protected CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		TransactionDetailForm transactionDetailForm = (TransactionDetailForm) form;
		TransactionDetailHelper transactionDetailHelper = new TransactionDetailHelper();
		try {
			if (request.getParameter(PARAM_ACTION) != null) {
				if (request.getParameter(PARAM_ACTION).equalsIgnoreCase(
						ACTION_SAVE_TT_LIST)) {
					//transactionDetailHelper.saveBudgetDetails(
					//		transactionDetailForm.getBudgetEntry(),
					//		session);
					actionMessages.add("transaction.save.success",
							new ActionMessage("transaction.save.success"));
				}
			}
			transactionDetailForm.setBudgetDetailList(transactionDetailHelper
					.findAssetandLiability(session));
			request.setAttribute(ATTR_SEARCH_RESULT, transactionDetailForm.getBudgetDetailsList());
		} catch (final Exception e) {
			Log.error(getClass(), this, e);
		} finally {
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
			transactionDetailForm.setTransMasterList(transactionDetailHelper
					.getTransDescForBudget(transactionDetailForm.getTransactionDetails(),session));
		}
		forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
						.getPath());
		return forward;

	}
}
