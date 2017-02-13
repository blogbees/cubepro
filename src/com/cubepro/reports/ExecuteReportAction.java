/**
 * 
 */
package com.cubepro.reports;

import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.rpc.ServiceException;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.jaspersoft.jasperserver.ws.scheduling.ReportSchedulerFacade;


public class ExecuteReportAction extends TransactionAction {
	
	private static final String URI = "uri";
	
	/* (non-Javadoc)
	 * @see gov.nrega.action.components.TransactionAction#processRequest(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, org.hibernate.Session)
	 */
	@Override
	protected CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward emusterAF = new CubeProActionForward();
		//ExecuteReportActionForm reportPerameterForm = (ExecuteReportActionForm)form;
		//request.getSession().setAttribute(CubeProConstants.SESSION_DISTRICTS, new RegionService().getDistricts(session));
		getJasperServerConnection(request.getSession(), request, response);
				 
		String currentUri = request.getParameter(URI);	  
		   if (currentUri == null || currentUri.length() ==0) {
			currentUri = "/";
		}
		   if (currentUri.length() > 1 && currentUri.endsWith("/")) {
			currentUri = currentUri.substring(0, currentUri.length()-1);
		}
		
		   request.setAttribute(URI, currentUri);
		
		emusterAF.setSuccess(true);
		emusterAF.setPath(mapping.findForward(CubeProConstants.SUCCESS)
				.getPath());
		return emusterAF;
	}

	/* (non-Javadoc)
	 * @see gov.nrega.action.components.AbstractAction#getPermission()
	 */
	
	private void getJasperServerConnection(HttpSession httpSession,
			HttpServletRequest request, HttpServletResponse response) {
		String username = "jasperadmin";
		String password = "jasperadmin";
		try {
			WSClient client = new WSClient(this.getServlet()
					.getServletContext().getInitParameter("webServiceUrl"),
					username, password);

			String reportSchedulingWebServiceUrl = getServlet()
					.getServletContext().getInitParameter(
							"reportSchedulingWebServiceUrl");

			ReportSchedulerFacade reportScheduler = new ReportSchedulerFacade(
					new URL(reportSchedulingWebServiceUrl), username, password);
			client.list(""); // Trick to check if the user is valid...
			if (httpSession == null) {
				httpSession = request.getSession(true);
			}
			httpSession.setAttribute("client", client);

			httpSession.setAttribute("ReportScheduler", reportScheduler);			

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
}
