package com.cubepro.reports;



import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.components.CubeProActionForward;
import com.cubepro.components.CubeProConstants;
import com.cubepro.components.TransactionAction;

public class ExportReportAction extends TransactionAction {
	
	public static final String EXCEL = "excel";
	public static final String PDF = "pdf";
	public static final String CSV = "csv";
	public static final String XML = "xml";	
	public static final String EXPORT_TO = "exportTo";
	public static final String URI = "uri";
	public static final String JRXML_EXTN = ".jrxml";
	
	@Override
	protected CubeProActionForward  processRequest(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, Session session)
			throws HibernateException, GenericJDBCException, SQLException {
		
		String target = null;
		
		String exportTo = request.getParameter(EXPORT_TO);
		
		java.util.Enumeration enum_params = request.getParameterNames();
		Map hashMap = new java.util.HashMap();
		
		while (enum_params.hasMoreElements()) {
			String key = "" + enum_params.nextElement();			
			hashMap.put(key, request.getParameter(key));
		}
		
		if(exportTo!= null && exportTo.equals(EXCEL)){
			ReportExporterService.toExcel(hashMap, request, response);
		}else if(exportTo!= null && exportTo.equals(CSV)){
			ReportExporterService.toCsv(hashMap, request, response);
		}else if(exportTo!= null && exportTo.equals(XML)){
			ReportExporterService.toXml(hashMap, request, response);			
		}else {
			ReportExporterService.toPdf(hashMap, request, response);
		}
		
		target  = CubeProConstants.SUCCESS;

		CubeProActionForward  emusterAF = new CubeProActionForward ();
		emusterAF.setPath(mapping.findForward(target).getPath());
		return emusterAF;
	}

}
