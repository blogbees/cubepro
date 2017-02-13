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

public class TransactionDetailAction extends TransactionAction {

	private static final String ACTION_SAVE_TT_LIST = "saveTransaction";
	
	private static final String ACTION_REMITTANCE = "remittance";
	
	private static final String ACTION_WITHDWRAWAL = "withdrawal";
	
	private static final String ACTION_SET_TT_LIST = "setTransaction";
	
	private static final String ACTION_SET_TRANS_DESC="setTransDesc";
	
	private static final String ATTR_SEARCH_RESULT = "searchResult";

	private static final String PARAM_ACTION = "action";

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
					transactionDetailHelper.saveTransactionDetails(
							transactionDetailForm.getTransactionDetails(),
							session);
					actionMessages.add("transaction.save.success",
							new ActionMessage("transaction.save.success"));
				}else if(request.getParameter(PARAM_ACTION).equalsIgnoreCase(
						ACTION_SET_TT_LIST)){
					String id = (String)request.getParameter("transId");
					if(id!=null && id.trim().length()> 0){
						transactionDetailForm.setTransactionDetails(transactionDetailHelper.findById(session, id));	
					}
					
				}else if (request.getParameter(PARAM_ACTION).equalsIgnoreCase(
						ACTION_REMITTANCE)) {
					transactionDetailHelper.remittance(
							transactionDetailForm.getTransactionDetails(),
							session);
					actionMessages.add("transaction.save.success",
							new ActionMessage("transaction.save.success"));
				}else if (request.getParameter(PARAM_ACTION).equalsIgnoreCase(
						ACTION_WITHDWRAWAL)) {
					transactionDetailHelper.withdrawal(
							transactionDetailForm.getTransactionDetails(),
							session);
					actionMessages.add("transaction.save.success",
							new ActionMessage("transaction.save.success"));
				}
			}
		} catch (final Exception e) {
			Log.error(getClass(), this, e);
		} finally {
			try{
				transactionDetailForm.setTransMasterList(transactionDetailHelper
						.getTransDescList(transactionDetailForm.getTransactionDetails(),session));
				transactionDetailForm.setTransactionList(transactionDetailHelper
						.findAll(session));
				request.setAttribute(ATTR_SEARCH_RESULT, transactionDetailForm.getTransactionList());
				transactionDetailForm.setCashBalance(transactionDetailHelper
						.findCashBalance(transactionDetailForm.getTransactionDetails(),session));
				transactionDetailForm.setBankBalance(transactionDetailHelper
						.findBankBalance(transactionDetailForm.getTransactionDetails(),session));
			}catch(Exception e){
				Log.error(this.getClass()," exception occ e-",e);
			}
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
						.getPath());
		return forward;

	}

}
