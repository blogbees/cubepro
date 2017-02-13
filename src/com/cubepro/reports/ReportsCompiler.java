package com.cubepro.reports;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

import com.cubepro.general.ApplicationProperties;

public class ReportsCompiler {
	
	public static final String JRXML_EXTN = ".jrxml";
	public static final String JASPER_EXTN = ".jasper";
	
	private static JasperReport jasperReport;
	
	public static JasperReport getCompliedReport(HttpServletRequest request, String fileName) {
		String sourceFileName = getJRTemplatePath(request, fileName);
		String destFileName = getJasperPath(request, fileName) ;
			try {
				if(jasperReport == null) {
					JasperCompileManager.compileReportToFile(sourceFileName, destFileName);					
				}
				jasperReport = (JasperReport)JRLoader.loadObject(destFileName);
			}catch (JRException e) {
				e.printStackTrace();
			}
			return jasperReport;
		}
	
	/**
	 * Function to frame the .jrxml path
	 * @param request
	 * @param fileName
	 * @return
	 */
	public static String getJRTemplatePath(HttpServletRequest request, String fileName) {
		String serverPath = getServerPath(request);
		return serverPath + ApplicationProperties.getProperty("folder.reports.jrxml") + fileName + JRXML_EXTN;
	}
	
	/**
	 * Function to frame the .jasper file path
	 * @param request
	 * @param fileName
	 * @return
	 */
	public static String getJasperPath(HttpServletRequest request, String fileName) {
		String serverPath = getServerPath(request);
		String jasperFolder = serverPath + ApplicationProperties.getProperty("folder.reports.jasper");
		new File(jasperFolder).mkdirs();
		return jasperFolder + fileName + JASPER_EXTN;
	}
	
	/**
	 * Function to frame the actual server path
	 * @param request
	 * @return
	 */
	public static String getServerPath(HttpServletRequest request) {
		return request.getSession().getServletContext().getRealPath("/");
	}
}
