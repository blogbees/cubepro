package com.cubepro.reports.action;

import java.sql.SQLException;

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
import com.cubepro.reports.dao.BalanceSheetDAO;
import com.cubepro.reports.form.BalanceSheetForm;

public class BalanceSheetAction extends TransactionAction {

	private static final String PARAM_FROM_DATE = "fromDate";

	private static final String PARAM_TO_DATE = "toDate";

	@SuppressWarnings("deprecation")
	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		BalanceSheetForm balanceSheetForm = (BalanceSheetForm) form;
		ActionMessages actionMessages = new ActionMessages();
		try {
			String fromDate = request.getParameter(PARAM_FROM_DATE);
			String toDate = request.getParameter(PARAM_TO_DATE);
			balanceSheetForm.setFromDate(fromDate);
			balanceSheetForm.setToDate(toDate);
			BalanceSheetDAO balanceSheetDAO = new BalanceSheetDAO(session);
			balanceSheetForm.setBalanceSheetAssList(balanceSheetDAO
					.getBalanceSheetAssDetails(fromDate, toDate));
			request.setAttribute("BALANCESHEET", balanceSheetForm.getBalanceSheetAssList());
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
