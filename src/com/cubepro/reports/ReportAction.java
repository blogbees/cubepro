/**
 * 
 */
package com.cubepro.reports;

import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
import com.cubepro.util.DateUtils;

/**
 * @author 
 *
 */
public class ReportAction extends TransactionAction {
	
	private static final String URI = "uri";
	private static final String JASPERSERVER_USERNAME = "jasperServerUsername";
	private static final String JASPERSERVER_PASSWORD = "jasperServerPassword";
	private static final String WEBSERVICE_URL = "webServiceUrl";
	private static final String REPORTSCHEDULING_WEBSERVICE_URL = "reportSchedulingWebServiceUrl";
	private static final String CLIENT = "client";
	private static final String REPORTSCHEDULER = "ReportScheduler";
	private static final String DELIMITER_BACK_SLASH = "/";
	
	@Override
	protected CubeProActionForward  processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward  emusterAF = new CubeProActionForward ();
		//ExecuteReportActionForm reportPerameterForm = (ExecuteReportActionForm)form;
		HttpSession httpSession = request.getSession(true);
		//httpSession.setAttribute(BeneficiaryConstants.SESSION_DISTRICTS, new RegionService().getDistricts(session));
		getJasperServerConnection(httpSession, request, response);
		
		String currentUri = request.getParameter(URI);	  
		   if (currentUri == null || currentUri.length() ==0) {
			currentUri = DELIMITER_BACK_SLASH;
		}
		   if (currentUri.length() > 1 && currentUri.endsWith(DELIMITER_BACK_SLASH)) {
			currentUri = currentUri.substring(0, currentUri.length()-1);
		}
		   
		// assign list of financial years in session if it is not available.
			if(httpSession.getAttribute("financialYrList") == null) {
				List<String> financialYrList = DateUtils.getListOfFinancialYears();
				httpSession.setAttribute("financialYrList", financialYrList);
			}
		   
		   
		Map<String, List<ReportResourceDTO>> reportUnitsByCategory = new ReportMenuHandler().getReportUnitsByCategory(session);
			
		//reportPerameterForm.setReportUnitsByCategory(reportUnitsByCategory);
		request.setAttribute(URI, currentUri);
		
		emusterAF.setSuccess(true);
		emusterAF.setPath(mapping.findForward(CubeProConstants.SUCCESS).getPath());
		return emusterAF;
	}

	

	private void getJasperServerConnection(HttpSession httpSession,
			HttpServletRequest request, HttpServletResponse response) {
		
		String username = getServlet().getServletContext().getInitParameter(JASPERSERVER_USERNAME);;
		String password = getServlet().getServletContext().getInitParameter(JASPERSERVER_PASSWORD);;
		
		try {
			WSClient client = new WSClient(this.getServlet()
					.getServletContext().getInitParameter(WEBSERVICE_URL),
					username, password);

			String reportSchedulingWebServiceUrl = getServlet().getServletContext().getInitParameter(REPORTSCHEDULING_WEBSERVICE_URL);

			ReportSchedulerFacade reportScheduler = new ReportSchedulerFacade(
					new URL(reportSchedulingWebServiceUrl), username, password);
			
			client.list(""); // Trick to check if the user is valid...
			if (httpSession == null) {
				httpSession = request.getSession(true);
			}
			
			httpSession.setAttribute(CLIENT, client);
			httpSession.setAttribute(REPORTSCHEDULER, reportScheduler);			

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
