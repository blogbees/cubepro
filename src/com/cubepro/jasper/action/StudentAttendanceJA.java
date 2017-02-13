package com.cubepro.jasper.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JRRuntimeException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.util.JRLoader;

import org.apache.log4j.Logger;

import com.cubepro.util.DatabaseConnector;

public class StudentAttendanceJA  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6232745171591988545L;

	/** List to use as our JasperReports dataSource. */
	private static Logger log = Logger.getLogger(StudentAttendanceJA.class);

	String fromDate;

	String toDate;

	int classId;

	List studentList;

	public String actionExecute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			fromDate = request.getParameter("fromDate");
			toDate = request.getParameter("toDate");
			classId = Integer.parseInt(request.getParameter("classList"));
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String reportFileName = request
					.getRealPath("/reports/student_attn_det_rpt.jasper");

			File reportFile = new File(reportFileName);

			if (!reportFile.exists())
				throw new JRRuntimeException(
						"File student_details_report.jasper not found. The report design must be compiled first.");

			JasperReport jasperReport = (JasperReport) JRLoader
					.loadObject(reportFile.getPath());

			Map parameters = new HashMap();
			parameters.put("classId", classId);
			parameters.put("fromDate", fromDate);
			parameters.put("toDate", toDate);

			DatabaseConnector dbConn = new DatabaseConnector();
			JasperPrint jasperPrint = JasperFillManager.fillReport(
					jasperReport, parameters, dbConn.getConnection());
			JRHtmlExporter exporter = new JRHtmlExporter();
			exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
			exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);
			request.getSession().setAttribute("JASPERPRINT", jasperPrint);
			out.println("<html>");
			out.println("<head>");
			out.println("<title>JasperReports</title>");
			out.println("<script language='javascript'>");
			out.println("function submitAction(action){");
			out.println("document.forms[0].action = '"+request.getContextPath()+"/studentAttendanceJT.cp?export='+action+'&prtF=student_attn_det_rpt';");
			out.println("document.forms[0].submit();");
			out.println("}");
			out.println("</script>");
			out.println("</head>");
			out.println("<body>");
			out.println("<form method='POST'>");
			out.println("<table><tr>");
			out.println("<td align='right'><image src='"+request.getContextPath()+"/images/export/print.jpg'  onclick='javascript:submitAction(\"print\");' style='cursor:hand;' alt='Print Report' /></td>" );
			out.println("<td align='right'><image src='"+request.getContextPath()+"/images/export/pdf.gif'  onclick = 'javascript:submitAction(\"pdf\");' style='cursor:hand;' alt='Export to Pdf File' /></td>" );
			out.println("<td align='right'><image src='"+request.getContextPath()+"/images/export/xlsicon.gif'  onclick='javascript:submitAction(\"xls\");' style='cursor:hand;' alt='Export to Excel File' /></td>" );
			out.println("<td align='right'><image src='"+request.getContextPath()+"/images/export/rtf.jpg'  onclick='javascript:submitAction(\"rtf\");' style='cursor:hand;' alt='Export to RTF File' /></td>" );
			out.println("</tr></table>");
			exporter.exportReport();
			out.println("</form>");
			out.println("</body>");
			out.println("</html>");

		} catch (Exception e) {
			log.error("Error Occured e-", e);
			return "";
		}

		return "";
	}

	public List getStudentList() {
		return studentList;
	}

	public void setStudentList(List studentList) {
		this.studentList = studentList;
	}
}
