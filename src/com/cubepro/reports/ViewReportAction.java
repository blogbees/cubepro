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
import org.hibernate.Session;

import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;
import com.jaspersoft.jasperserver.ws.scheduling.ReportSchedulerFacade;

public class ViewReportAction extends TransactionAction {

	private static final long serialVersionUID = 1L;
	public static final String HTML_EXTN = ".html";
	private static final String WS_CLIENT_SESSION_NAME = "client";
	private static final String INVALID_SESSION_REDIRECT = "/index.jsp";
	private static final int BUFFER_SIZE = 65536;

	@Override
	protected CubeProActionForward  processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session hibernateSession)
			throws SQLException {
		CubeProActionForward  emusterAF = new CubeProActionForward ();
		HttpSession httpSession = request.getSession(false);
		
		getJasperServerConnection(httpSession, request, response);
		
		emusterAF.setSuccess(true);
		emusterAF.setPath(mapping.findForward(CubeProConstants.SUCCESS)
				.getPath());
		return emusterAF;
	}

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
