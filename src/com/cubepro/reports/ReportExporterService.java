/**
 * 
 */
package com.cubepro.reports;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JExcelApiExporter;
import net.sf.jasperreports.engine.export.JRCsvExporter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRXmlExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;

public class ReportExporterService {
	
	public static void toPdf(Map hashMap,HttpServletRequest request, HttpServletResponse response) {
		WSClient client = (WSClient) request.getSession().getAttribute("client");
		String currentUri = request.getParameter("uri");
			JasperPrint jasperPrint;
			
			try {
				jasperPrint = client.runReport(currentUri, hashMap);
				
				String reportfilename = generateFileName(currentUri) + ".pdf";
				JRPdfExporter exporter = new JRPdfExporter();
				
		        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
		        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, response.getOutputStream());
		        response.setHeader("Content-Disposition", "attachment;filename=" + reportfilename);
		        response.setContentType("application/pdf");
		        exporter.exportReport();

			} catch (IOException e) {
				e.printStackTrace();
			}catch (JRException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
				
		public static void toExcel(Map hashMap,HttpServletRequest request, HttpServletResponse response) {
			
			WSClient client = (WSClient) request.getSession().getAttribute("client");
			String currentUri = request.getParameter("uri");
			JasperPrint jasperPrint;
			
			try {
				jasperPrint = client.runReport(currentUri, hashMap);
				
				String reportfilename = generateFileName(currentUri) + ".xls";
				JExcelApiExporter exporterXLS = new JExcelApiExporter();

				exporterXLS.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
				exporterXLS.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
				exporterXLS.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
				exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
				exporterXLS.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, response.getOutputStream());
				response.setHeader("Content-Disposition", "attachment;filename=" + reportfilename);
				response.setContentType("application/vnd.ms-excel");

				exporterXLS.exportReport();
				
			} catch (IOException e) {
				e.printStackTrace();
			}catch (JRException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	public static void toCsv(Map hashMap,HttpServletRequest request, HttpServletResponse response) {
			
			WSClient client = (WSClient) request.getSession().getAttribute("client");
			String currentUri = request.getParameter("uri");
			JasperPrint jasperPrint;
			String reportfilename = generateFileName(currentUri) + ".csv";
			try {
				jasperPrint = client.runReport(currentUri, hashMap);

				JRCsvExporter exporter = new JRCsvExporter();
		        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
		        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, response.getOutputStream());
		        response.setHeader("Content-Disposition", "attachment;filename=" + reportfilename);
		        exporter.exportReport();

			} catch (IOException e) {
				e.printStackTrace();
			}catch (JRException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	public static void toXml(Map hashMap,HttpServletRequest request, HttpServletResponse response) {
		WSClient client = (WSClient) request.getSession().getAttribute("client");
		String currentUri = request.getParameter("uri");
			JasperPrint jasperPrint;
			
			try {
				jasperPrint = client.runReport(currentUri, hashMap);
				
				String reportfilename = generateFileName(currentUri) + ".xml";
				JRXmlExporter exporter = new JRXmlExporter();
				
		        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
		        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, response.getOutputStream());
		        response.setHeader("Content-Disposition", "attachment;filename=" + reportfilename);
		        response.setContentType("application/xml");
		        exporter.exportReport();

			} catch (IOException e) {
				e.printStackTrace();
			}catch (JRException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}	
	
	private static String generateFileName(String currentUri){
			return "CubeProReport";
	}
	
	
}
