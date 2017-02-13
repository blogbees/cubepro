package com.cubepro.general;

import java.util.ArrayList;
import java.util.List;

import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRPdfExporterParameter;
import net.sf.jasperreports.engine.export.JRRtfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;

import org.apache.log4j.Logger;

public abstract class CubeProReportAction  {
	/**
	 * 
	 */
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

	private static Logger log = Logger.getLogger(CubeProReportAction.class);


}
