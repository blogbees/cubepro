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
import com.cubepro.reports.dao.TransferCertDAO;
import com.cubepro.reports.form.TransferCertForm;

public class TransferCertAction extends TransactionAction {

	private static final String PARAM_ROLL_NO = "rollNo";
	private static final String PARAM_STANDARDS = "standards";
	private static final String PARAM_AC_NO = "acNo";

	@SuppressWarnings("deprecation")
	@Override
	public CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		TransferCertForm transferCertForm = (TransferCertForm) form;
		ActionMessages actionMessages = new ActionMessages();
		try {
			String rollNo = request.getParameter(PARAM_ROLL_NO);
			String acNo = request.getParameter(PARAM_AC_NO);
			String standards = request.getParameter(PARAM_STANDARDS);
			transferCertForm.setRollNo(rollNo);
			transferCertForm.setAcNo(acNo);
			transferCertForm.setStandards(standards);
			TransferCertDAO transferCertDAO = new TransferCertDAO(session);
			transferCertForm.setTransferCertList(transferCertDAO
					.getTransferCertDetails(rollNo));
			request.setAttribute("TRANSFERCERT", transferCertForm.getTransferCertList());
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
