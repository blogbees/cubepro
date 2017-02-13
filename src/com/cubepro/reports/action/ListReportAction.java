package com.cubepro.reports.action;

import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.rpc.ServiceException;

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
import com.cubepro.reports.ReportSchedulerFacade;
import com.cubepro.reports.WSClient;
import com.cubepro.reports.form.ReportListForm;
import com.cubepro.reports.helper.ReportHelper;

public class ListReportAction extends TransactionAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 823698142262083693L;

	private static final String PARAM_REPORT = "report";

	private static final String PARAM_FUNCTION = "function";

	private static final String PARAM_RUN_REPORT = "runReports";

	private static final String URI = "uri";
	private static final String JASPERSERVER_USERNAME = "jasperServerUsername";
	private static final String JASPERSERVER_PASSWORD = "jasperServerPassword";
	private static final String WEBSERVICE_URL = "webServiceUrl";
	private static final String REPORTSCHEDULING_WEBSERVICE_URL = "reportSchedulingWebServiceUrl";
	private static final String CLIENT = "client";
	private static final String REPORTSCHEDULER = "ReportScheduler";
	private static final String DELIMITER_BACK_SLASH = "/";

	@Override
	protected CubeProActionForward processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		CubeProActionForward forward = new CubeProActionForward();
		ActionMessages actionMessages = new ActionMessages();
		ReportListForm reportListForm = (ReportListForm) form;
		ReportHelper reportHelper = new ReportHelper();

		HttpSession httpSession = request.getSession(true);
		getJasperServerConnection(httpSession, request, response);

		String currentUri = request.getParameter(URI);
		if (currentUri == null || currentUri.length() == 0) {
			currentUri = DELIMITER_BACK_SLASH;
		}
		if (currentUri.length() > 1
				&& currentUri.endsWith(DELIMITER_BACK_SLASH)) {
			currentUri = currentUri.substring(0, currentUri.length() - 1);
		}

		request.setAttribute(URI, currentUri);

		try {
			String function = request.getParameter(PARAM_FUNCTION);
			if (function != null && function.trim().length() > 0) {

				if (PARAM_RUN_REPORT.equals(function)) {
					String reportName = request.getParameter(PARAM_REPORT);
					String forwardPath = reportHelper.studentDetailReport(
							request, response);
					forward.setPath(mapping.findForward(forwardPath).getPath());

				} else {
					forward.setPath(mapping.findForward(
							CubeProConstants.SUCCESS).getPath());

				}

			} else {
				forward.setPath(mapping.findForward(CubeProConstants.SUCCESS)
						.getPath());
			}
		} catch (Exception e) {
			Log.error(this.getClass(), this, e);
		} finally {
			reportListForm.setReportCategoryList(reportHelper
					.getReportCategories(session));
			reportListForm
					.setReportList(reportHelper.getListOfReports(session));
			saveMessages(request, actionMessages);
			saveErrors(request, actionMessages);
		}
		// TODO Auto-generated method stub
		return forward;
	}

	public void getJasperServerConnection(HttpSession httpSession,
			HttpServletRequest request, HttpServletResponse response) {

		String username = getServlet().getServletContext().getInitParameter(
				JASPERSERVER_USERNAME);
		;
		String password = getServlet().getServletContext().getInitParameter(
				JASPERSERVER_PASSWORD);
		;

		try {
			WSClient client = new WSClient(this.getServlet()
					.getServletContext().getInitParameter(WEBSERVICE_URL),
					username, password);

			String reportSchedulingWebServiceUrl = getServlet()
					.getServletContext().getInitParameter(
							REPORTSCHEDULING_WEBSERVICE_URL);

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
