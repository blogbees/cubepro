package com.cubepro.components;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.general.TransactionBody;
import com.cubepro.general.TransactionManager;

/**
 * This class handles the transactions of the application. Creates connection
 * objects and manages commit & roll-back
 * 
 * 
 * 
 */
public abstract class TransactionAction extends AbstractAction implements TransactionBody<Map<String, Object>, CubeProActionForward> {

	private boolean transactionSuccess;
	/*
	 * (non-Javadoc)
	 * 
	 * @see gov.nrega.action.components.AbstractAction#processRequest(org.apache.struts.action.ActionMapping,
	 *      org.apache.struts.action.ActionForm,
	 *      javax.servlet.http.HttpServletRequest,
	 *      javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public ActionForward processRequest(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws HibernateException, GenericJDBCException {
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("mapping", mapping);
		paramsMap.put("form", form);
		paramsMap.put("request", request);
		paramsMap.put("response", response);
		TransactionManager manager = new SingleConnectionTransactionManager();
		return manager.execute(paramsMap, this);
	}
	
	
	/* (non-Javadoc)
	 * @see gov.nrega.business.components.TransactionBody#executeTransaction(java.lang.Object, org.hibernate.Session)
	 */
	public final CubeProActionForward executeTransaction(Map<String, Object> params, Session[] sessions) throws HibernateException, SQLException {
		ActionMapping mapping = (ActionMapping) params.get("mapping");  
		ActionForm form = (ActionForm) params.get("form");
		HttpServletRequest request = (HttpServletRequest) params.get("request"); 
		HttpServletResponse response = (HttpServletResponse)  params.get("response");
		boolean success = true;
		if((CubeProConstants.TRUE).equals(request.getParameter(CubeProConstants.PUBLIC_LOGIN))){
			//success = (new LoginHelper()).loginPublicUser(request, sessions[0]);
		}
		CubeProActionForward result = null;
		if(success){
			result = processRequest(mapping, form, request, response, sessions[0]);	
		} else {
			result = new CubeProActionForward();
			addMessage(request, "error.action.publiclogin");
			result.setSuccess(true);
			result.setPath(mapping.findForward("publicerror").getPath());
		}
		
		if (result != null) {
			transactionSuccess =  result.isSuccess();
		}
		return result;
	}

	/* (non-Javadoc)
	 * @see gov.nrega.business.components.TransactionBody#isTransactionSuccess()
	 */
	public final boolean isTransactionSuccess() {
		return transactionSuccess;
	}
	/**
	 * This method will hold the business logic and calls to the data layer to
	 * perform transactions.
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws HibernateException TODO
	 * @throws GenericJDBCException TODO
	 * @throws SQLException TODO
	 */
	protected abstract CubeProActionForward processRequest(
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException;

}