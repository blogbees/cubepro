package com.cubepro.reports.helper;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JRRuntimeException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRPdfExporterParameter;
import net.sf.jasperreports.engine.export.JRXmlExporter;
import net.sf.jasperreports.engine.export.JRXmlExporterParameter;
import net.sf.jasperreports.engine.export.JRRtfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.util.JRLoader;

import org.hibernate.Session;

import com.cubepro.general.components.Log;
import com.cubepro.general.database.HibernateSessionFactory;
import com.cubepro.reports.ReportCategory;
import com.cubepro.reports.service.ReportService;
import com.cubepro.util.DatabaseConnector;

public class ReportHelper {

	private static final String TASK_FILL = "fill";

	private static final String TASK_PRINT = "print";

	private static final String TASK_PDF = "pdf";

	private static final String TASK_XML = "xml";

	private static final String TASK_XML_EMBED = "xmlEmbed";

	private static final String TASK_HTML = "html";

	private static final String TASK_RTF = "rtf";

	private static final String TASK_XLS = "xls";

	private static final String TASK_JXL = "jxl";

	private static final String TASK_CSV = "csv";

	private static final String TASK_ODT = "odt";

	private static final String TASK_RUN = "run";

	private static final String PARAM_EXPORT = "export";

	private static final String PARAM_JRPRINTFILE = "prtF";

	public List<ReportCategory> getReportCategories(Session session)
			throws SQLException {
		ReportService reportService = new ReportService();
		return reportService.getReportCategories(session);
	}

	public List getListOfReports(Session session) throws SQLException {
		ReportService reportService = new ReportService();
		return reportService.getListOfReports(session);
	}

	// overridded method from CubeProAction for action of reports
	public String exportReport(String jrprintFile, HttpServletRequest request) throws Exception {
		try {
			String exportParam = null;
			if (request.getParameter(PARAM_EXPORT) != null) {
				
				exportParam = request.getParameter(PARAM_EXPORT);
				if (TASK_PDF.equals(exportParam)) {
					// jasperPrintList.add(JRLoader.loadObjectFromLocation(request.getRealPath("/reports/"
					// + jrprintFile)));
					try {
						JRPdfExporter exporter = new JRPdfExporter();
						exporter.setParameter(JRExporterParameter.JASPER_PRINT,
								request.getSession()
										.getAttribute("JASPERPRINT"));
						exporter.setParameter(
								JRExporterParameter.OUTPUT_FILE_NAME, request
										.getRealPath("/reports/" + jrprintFile
												+ ".pdf"));
						exporter
								.setParameter(
										JRPdfExporterParameter.IS_CREATING_BATCH_MODE_BOOKMARKS,
										Boolean.TRUE);

						exporter.exportReport();
					} catch (Exception e) {
						// bypass pdf exception
					}
					return "exportPDF";
				} else if (TASK_XLS.equals(exportParam)) {
					try {
						JRXlsExporter exporter = new JRXlsExporter();
						exporter.setParameter(JRExporterParameter.JASPER_PRINT,
								request.getSession()
										.getAttribute("JASPERPRINT"));
						exporter.setParameter(
								JRExporterParameter.OUTPUT_FILE_NAME, request
										.getRealPath("/reports/" + jrprintFile
												+ ".xls"));
						exporter.setParameter(
								JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET,
								Boolean.FALSE);
						exporter.exportReport();

					} catch (Exception e) {
						// bypass xl exception
					}
					return "exportXLS";
				} else if (TASK_RTF.equals(exportParam)) {
					try {
						JRRtfExporter exporter = new JRRtfExporter();
						exporter.setParameter(JRExporterParameter.JASPER_PRINT,
								request.getSession()
										.getAttribute("JASPERPRINT"));
						exporter.setParameter(
								JRExporterParameter.OUTPUT_FILE_NAME, request
										.getRealPath("/reports/" + jrprintFile
												+ ".rtf"));
						exporter.exportReport();

					} catch (Exception e) {

					}
					return "exportXML";
				} else if (TASK_XML.equals(exportParam)) {
					try {
						JRXmlExporter exporter = new JRXmlExporter();
						exporter.setParameter(JRExporterParameter.JASPER_PRINT,
								request.getSession()
										.getAttribute("JASPERPRINT"));
						exporter.setParameter(
								JRExporterParameter.OUTPUT_FILE_NAME, request
										.getRealPath("/reports/" + jrprintFile
												+ ".xml"));
						exporter.exportReport();

					} catch (Exception e) {

					}
					return "exportXML";					
				} else if (TASK_PRINT.equals(exportParam)) {
					JasperPrintManager.printReport(
							request.getRealPath("/reports/" + jrprintFile
									+ ".jrprint"), true);
					return null;
				}

			}

		} catch (final Exception e) {
			Log.error(getClass(),"Exception occured in Reports Action e-",e);
			throw e;
		}
		return "success";
	}
	
	public String studentDetailReport(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Connection conn = HibernateSessionFactory.getSession().connection();
		try {
			String classListDetails = request.getParameter("classList");
			int classId = 0;
			if(classListDetails!=null && classListDetails.trim().length() > 0)
			classId = Integer.parseInt(classListDetails);
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String reportFileName = request
					.getRealPath("/reports/StudentDetailReport.jasper");

			File reportFile = new File(reportFileName);

			if (!reportFile.exists())
				throw new JRRuntimeException(
						"File student_details_report.jasper not found. The report design must be compiled first.");

			JasperReport jasperReport = (JasperReport) JRLoader
					.loadObject(reportFile.getPath());

			Map parameters = new HashMap();
			parameters.put("classId", classId);
			
			JasperPrint jasperPrint = JasperFillManager.fillReport(
					jasperReport, parameters, conn);
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
			Log.error(getClass(),"Error Occured e-", e);
			return "executeReport";
		}finally{
			if(conn!=null)
				conn.close();
		}

		return "executeReport";
	}

}
