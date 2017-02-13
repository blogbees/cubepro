package com.cubepro.reports.action;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessages;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.cubepro.general.components.Log;
import com.cubepro.reports.dao.AccountBudgetDAO;
import com.cubepro.reports.form.AccountBudgetForm;

public class AccountBudgetAction extends TransactionAction {

	private static final String PARAM_FROM_DATE = "fromDate";

	private static final String PARAM_TO_DATE = "toDate";
	
	private static final String PARAM_ACC_BUDGET = "accBudget";
	
	private Map accBudgetType = new HashMap(); 

	@SuppressWarnings("deprecation")
	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		AccountBudgetForm accountBudgetForm = (AccountBudgetForm) form;
		ActionMessages actionMessages = new ActionMessages();
		try {
			accBudgetType.put(1, "MANAGEMENT A/C");
			accBudgetType.put(2, "SIF A/C");
			accBudgetType.put(3, "COMPUTER A/C");
			accBudgetType.put(4, "GENERAL FUND A/C");
			accBudgetType.put(5, "AMENITY FUND A/C");
			accBudgetType.put(6, "SPECIAL FEE A/C");
			accBudgetType.put(7, "PTA A/C");
			String fromDate = request.getParameter(PARAM_FROM_DATE);
			String toDate = request.getParameter(PARAM_TO_DATE);
			String accBudget = request.getParameter(PARAM_ACC_BUDGET);
			String accType = (String)accBudgetType.get(Integer.valueOf(accBudget));
			accountBudgetForm.setFromDate(fromDate);
			accountBudgetForm.setToDate(toDate);
			accountBudgetForm.setAccType(accType);
			AccountBudgetDAO accountBudgetDAO = new AccountBudgetDAO(session);
			accountBudgetDAO.getAccountBudgetAssDetails(accountBudgetForm);
			request.setAttribute("ACCBUDGET", accountBudgetForm.getAccountBudgetAssList());
		} catch (Exception e) {
			Log.error(this.getClass(), this, e);
		} finally {
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		forward
				.setPath(mapping.findForward(CubeProConstants.SUCCESS)
						.getPath());
		return forward;
	}

}
