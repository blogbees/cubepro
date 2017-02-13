/**
 * 
 */
package com.cubepro.reports;

import java.io.OutputStream;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.SessionConstants;
import com.cubepro.components.TransactionAction;

/**
 * @author ratnavel.sundaramurt
 *
 */
public class RenderReportAction extends TransactionAction {
	
	private static final String SHOW = "show";
	private static final String REPORT_TYPE = "reportType";
	private static final String CLIENT = "client";
	private static final String URI = "uri";
	private static final String SIMPLE_DATE_FORMAT = "dd/MM/yyyy";
	private static final String GR_REPORT = "GRM";
	private static final String BENEFICIARY_REPORT = "Beneficiary";
	
	/* (non-Javadoc)
	 * @see gov.nrega.action.components.TransactionAction#processRequest(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, org.hibernate.Session)
	 */
	@SuppressWarnings("unchecked")
	@Override
	protected CubeProActionForward  processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		
		int pageNo = -1;	
		int totalNoOfPages;
		String header = null;
		String footer = null;
		String contextPath = request.getContextPath();
		HttpSession httpSession = request.getSession();
		String navigation = request.getParameter(SHOW);
		String reportContext = request.getParameter(REPORT_TYPE);

		WSClient client = (WSClient) request.getSession()
				.getAttribute(CLIENT);
		if(httpSession.getAttribute(SessionConstants.REPORTS_PAGE_NUMBER)!=null && "next".equals(navigation)){
			pageNo = (Integer)httpSession.getAttribute(SessionConstants.REPORTS_PAGE_NUMBER);
		}else if(httpSession.getAttribute(SessionConstants.REPORTS_PAGE_NUMBER)!=null && "previous".equals(navigation)){
			pageNo = (Integer)httpSession.getAttribute(SessionConstants.REPORTS_PAGE_NUMBER);
		}
		
		// When first entering in to the action set the page no as '0', this will display first page
		if(pageNo < 0) {
			pageNo = 0;
			setPageNoInSession(httpSession, pageNo);
		}
		String currentUri = request.getParameter(URI);
		if (currentUri == null || currentUri.length() == 0) {
			currentUri = "/";
		}
		if (currentUri.length() > 1 && currentUri.endsWith("/")) {
			currentUri = currentUri.substring(0, currentUri.length() - 1);
		}

		Enumeration enum_params = request.getParameterNames();

		Map hashMap = new HashMap();
		try {
			while (enum_params.hasMoreElements()) {
				String key = "" + enum_params.nextElement();
				//if (StringUtils.contains(request.getParameter(key), '/') && request.getParameter(key).length() == 10 && !key.equals("uri")){
				     //DateFormat formatter = new SimpleDateFormat(SIMPLE_DATE_FORMAT);
				     //Date date = formatter.parse(request.getParameter(key)); 
				     //long longDate = date.getTime();
				    // if("toDate".equals(key)){
				    //	 longDate += 86400000;
				     //}				    
				     hashMap.put(key, request.getParameter(key));
				//}else{
				//	 hashMap.put(key, request.getParameter(key));
				//	}
				if(GR_REPORT.equals(reportContext )){			    	
			    	 if("trackId".equals(key)){
			    		if(StringUtils.isEmpty(request.getParameter(key)) || "0".equals(request.getParameter(key))){
			    			hashMap.put(key, -1);
				   		 }			    				    		
			    	 }
			     }
			}
			
		String paramString = generateQueryString(hashMap, request);
		JasperPrint print;
		
			print = client.runReport(currentUri, hashMap);
			totalNoOfPages = print.getPages().size();
			if(navigation != null && navigation.equals(SessionConstants.REPORTS_PREVIOUS_PAGE)){
				previousPage(httpSession, totalNoOfPages);
			}else if(navigation != null && navigation.equals(SessionConstants.REPORTS_NEXT_PAGE)){
				nextPage(httpSession, totalNoOfPages);
			}
			pageNo = (Integer)httpSession.getAttribute(SessionConstants.REPORTS_PAGE_NUMBER);
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			OutputStream os = response.getOutputStream();
			header = buildHeader(contextPath, paramString);
			footer = buildFooter(contextPath, paramString, pageNo, totalNoOfPages);
			JRHtmlExporter exporter = new JRHtmlExporter();

			request.getSession().setAttribute(
							net.sf.jasperreports.j2ee.servlets.ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE,
							print);
			exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, os);
			exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING, "UTF-8");
			exporter.setParameter(JRExporterParameter.JASPER_PRINT, print);
			exporter.setParameter(JRExporterParameter.PAGE_INDEX, pageNo);
			exporter.setParameter(JRHtmlExporterParameter.HTML_HEADER, header);
			exporter.setParameter(JRHtmlExporterParameter.HTML_FOOTER, footer);
			exporter.exportReport();
			
		 }catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	private void setPageNoInSession(HttpSession httpSession, Integer pageNo) {
		httpSession.setAttribute(SessionConstants.REPORTS_PAGE_NUMBER, pageNo);
	}
	
	/**
	 * Gets the current page number from session, decrement it by one and set the new page number in session.
	 * @return
	 * "success" to display the requested page
	 */
	private void previousPage(HttpSession session, int totalNoOfPages) {
		Integer pageNo;
		// get page no from session
		pageNo = (Integer)session.getAttribute(SessionConstants.REPORTS_PAGE_NUMBER);
		
		// Navigate to last page of the report if 'Previous' link is clicked at the first page of the report 
		// else navigate to the corresponding page.
		if(pageNo>0) {
			pageNo--;
			setPageNoInSession(session, pageNo);
		}
		else {
			// pageNo = 0;
			pageNo = totalNoOfPages-1;
			setPageNoInSession(session, pageNo);
		}
	}
	
	/**
	 * Gets the current page number from session, increment it by one and set the new page number in session.
	 * @return
	 * "success" to display the requested page
	 */
	private void nextPage(HttpSession session, int totalNoOfPages) {
		Integer pageNo;
		// get page no from session
		pageNo = (Integer)session.getAttribute(SessionConstants.REPORTS_PAGE_NUMBER);
		// Navigate to first page of the report if 'next' link is clicked at the last page of the report 
		// else navigate to the corresponding page.
		if((pageNo+1)<=totalNoOfPages) {
			pageNo++;
			setPageNoInSession(session, pageNo);
		}
		else {
			setPageNoInSession(session, 0);
			pageNo = 0;
		}
	}
	
	private String buildHeader(String contextPath, String paramString){
		String header = "<html><body><link type='text/css' rel='stylesheet' href='"+contextPath+"/styles/style.css'>" +
		"<div id='header'> <img src='"+contextPath+"/images/logo.png' class='logo' width='770' height='62' /> "+
		"<p align='right'>" + "<a href = '"+contextPath+"/ExportToPDF.cp?exportTo=pdf&"+paramString+"'>" +
		"<img src = '"+contextPath+"/images/pdficon.gif' width='16px' height='16px'/></a>"
		+ "&nbsp" + "<a href='"+contextPath+"/ExportToExcel.cp?exportTo=excel&"+paramString+"'>" +
		 "<img src = '"+contextPath+"/images/excel.gif' width='16px' height='16px'/></a>" + 			
		 "&nbsp" + "<a href='"+contextPath+"/ExportToCsv.cp?exportTo=csv&"+paramString+"'>" +
		 "<img src='"+contextPath+"/images/csv.gif' width='16px' height='16px'/></a>" +
		 "&nbsp" + "<a href='"+contextPath+"/ExportToXml.cp?exportTo=xml&"+paramString+"'>" +
		 "<img src='"+contextPath+"/images/XML.png' width='16px' height='16px'/></a>"		 
		 + "&nbsp" + "<a href='javascript:print();'>" +
		 "<img src='"+contextPath+"/images/pdf.gif' width='16px' height='16px'/></a></div>";
		return header;
	}
	
	private String buildFooter(String contextPath, String paramString, int currentPageNo, int totalNoOfPages){
		StringBuffer footer = new StringBuffer();
		footer.append("<table align='center'><tr><td align='center'>");
		footer.append("<div id='button'>");
		footer.append("<ul>");
		if(currentPageNo > 0){
			footer.append("<li class='buttonrightcrnr previous' onmouseover='this.className=\"buttonhighlight previous\"' onmouseout='this.className=\"buttonrightcrnr previous\"'	title='Previous'>");
			footer.append("<a href='"+contextPath+"/ReportNavigation.cp?show=previous&"+paramString+"'>Previous</a>");
			footer.append("</li>");	
		}
		if((totalNoOfPages-1) > currentPageNo ){
			footer.append("<li class='buttonlefttcrnr next' onmouseover='this.className=\"buttonhighlight2 next\"' onmouseout='this.className=\"buttonlefttcrnr next\"'	title='Next'>");
			footer.append("<a href='"+contextPath+"/ReportNavigation.cp?show=next&"+paramString+"'>Next</a>");
			footer.append("</li>");	
		}		
		
		footer.append("</ul></div></td></tr></table>");
		return footer.toString();
	}
	
	private String generateQueryString(Map hashMap, HttpServletRequest request){
		StringBuffer queryStringBuffer = new StringBuffer();
		 Iterator iterator = hashMap.entrySet().iterator();
		 while (iterator.hasNext()) {
		        Map.Entry pairs = (Map.Entry)iterator.next();
		        queryStringBuffer.append(pairs.getKey());
				queryStringBuffer.append("=");
				queryStringBuffer.append(pairs.getValue());
				if(iterator.hasNext()){
					queryStringBuffer.append("&");
				}
				
		    }
		return queryStringBuffer.toString();
	}
}
