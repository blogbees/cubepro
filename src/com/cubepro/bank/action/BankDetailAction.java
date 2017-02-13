package com.cubepro.bank.action;

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

import com.cubepro.bank.form.BankDetailForm;
import com.cubepro.bank.helper.BankDetailHelper;
import com.cubepro.bank.helper.BankHelper;
import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.cubepro.general.components.Log;

public class BankDetailAction extends TransactionAction{

	private String action;

	private static final String PARAM_ACTION = "action";

	private static final String ACTION_SAVE_BANK = "saveBank";
	
	private static final String ACTION_SET_BANK = "setBank";
	
	private static final String ACTION_DELETE_BANK = "deleteBank";
	
	private static final String ATTR_SEARCH_RESULT = "searchResult";

	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		BankDetailForm bankDetailForm = (BankDetailForm) form;
		BankDetailHelper bankDetailHelper = new BankDetailHelper();
		BankHelper bankHelper = new BankHelper();
		try {
			// get the action
			action = request.getParameter(PARAM_ACTION);
			if (action != null) {
				if (action.equalsIgnoreCase(
						ACTION_SAVE_BANK)) {
					bankDetailHelper.saveBankDetail(bankDetailForm
							.getBankDetail(), session);
					actionMessages.add("save.success.all",
							new ActionMessage("save.success.all"));

				}else if(action.equalsIgnoreCase(
						ACTION_SET_BANK)){
					String subjectId = request.getParameter("subjectId");
					if (subjectId != null) {
						bankDetailForm.setBankDetail(bankDetailHelper
								.findByBankId(Integer.valueOf(subjectId)
										.intValue(), session));
					}
				}else if(action.equalsIgnoreCase(
						ACTION_DELETE_BANK)){
					String subjectId = request.getParameter("subjectId");
					if (subjectId != null) {
						bankDetailHelper.deleteBankDetail(subjectId, session);
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
			bankDetailForm.setBankList(bankDetailHelper.findAll(session));
			bankDetailForm.setBankNameList(bankHelper.findAll(session));
			request.setAttribute(ATTR_SEARCH_RESULT, bankDetailForm.getBankList());
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		return forward;
	}


}
