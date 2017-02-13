package com.cubepro.reports;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.cubepro.general.CommonConstants;
import com.cubepro.general.database.HibernateSessionFactory;
import com.cubepro.reports.dao.ReportListDAO;
import com.cubepro.util.QueryExecuter;

public class ReportParameter {

	private int reportParameterId;

	private Report report;

	private String parameterType;

	private int parameterSize;

	private int parameterMaxLength;

	private String parameterJSScriptOnClick;

	private String parameterQuery;

	private int parameterisCombo;

	private String parameterName;

	private int parameterPosition;

	private String parameterValue;

	public String getParameterName() {
		return parameterName;
	}

	public void setParameterName(String parameterName) {
		this.parameterName = parameterName;
	}

	public int getParameterisCombo() {
		return parameterisCombo;
	}

	public void setParameterisCombo(int parameterisCombo) {
		this.parameterisCombo = parameterisCombo;
	}

	public String getParameterJSScriptOnClick() {
		return parameterJSScriptOnClick;
	}

	public void setParameterJSScriptOnClick(String parameterJSScriptOnClick) {
		this.parameterJSScriptOnClick = parameterJSScriptOnClick;
	}

	public int getParameterMaxLength() {
		return parameterMaxLength;
	}

	public void setParameterMaxLength(int parameterMaxLength) {
		this.parameterMaxLength = parameterMaxLength;
	}

	public int getParameterPosition() {
		return parameterPosition;
	}

	public void setParameterPosition(int parameterPosition) {
		this.parameterPosition = parameterPosition;
	}

	public String getParameterQuery() {
		return parameterQuery;
	}

	public void setParameterQuery(String parameterQuery) {
		this.parameterQuery = parameterQuery;
	}

	public int getParameterSize() {
		return parameterSize;
	}

	public void setParameterSize(int parameterSize) {
		this.parameterSize = parameterSize;
	}

	public String getParameterType() {
		return parameterType;
	}

	public void setParameterType(String parameterType) {
		this.parameterType = parameterType;
	}

	public Report getReport() {
		return report;
	}

	public void setReport(Report report) {
		this.report = report;
	}

	public int getReportParameterId() {
		return reportParameterId;
	}

	public void setReportParameterId(int reportParameterId) {
		this.reportParameterId = reportParameterId;
	}

	public String getParameterAsHTMLString(int reportId) throws Exception {
		StringBuffer htmlAsString = new StringBuffer();
		int tdBreakUp = 0;
		try {
			List<ReportParameter> reportParameterList = null;
			ReportListDAO reportListDAO = new ReportListDAO(HibernateSessionFactory.getSession());
			ReportParameter reportParameter = null;
			reportParameterList = reportListDAO
					.getListOfReportParameters(reportId);
			Iterator<ReportParameter> rptPmIterator = reportParameterList.iterator();
			//htmlAsString.append("<form name='submit' >");
			htmlAsString.append("<table class='form-row-input' cellpadding='0' cellspacing='0' border='0' align= 'center' width='100%' >");
			htmlAsString.append("<tr><th colspan='4' align='center' class='headerFont' >"+((ReportParameter)reportParameterList.get(0)).getReport().getReportName()+" - "+((ReportParameter)reportParameterList.get(0)).getReport().getReportDesc()+"</th></tr>");
			htmlAsString.append("<tr><td colspan='4' align='center' >&nbsp;</td></tr>");
			htmlAsString.append("<tr><td colspan='4' align='center' >&nbsp;</td></tr>");
			int position = 1;
			while (rptPmIterator.hasNext()) {
				reportParameter = (ReportParameter) rptPmIterator.next();
				if(reportParameter.getParameterPosition() != position){
					htmlAsString.append("</tr>");
					tdBreakUp = 0;
				}
				if(tdBreakUp == 0)
					htmlAsString.append("<tr>");
				
				if (CommonConstants.RPT_TYPE_TEXTBOX
						.equalsIgnoreCase(reportParameter.getParameterType()) == true) {
					htmlAsString.append("<td class='form-row-input' >"+ reportParameter.getParameterName() + "</td>");
					htmlAsString.append("<td><input type='text' class='form-row-input' ");
					htmlAsString.append(" name='"+ reportParameter.getParameterValue() + "' ");
					htmlAsString.append(" size='"+ reportParameter.getParameterSize() + "' ");
					htmlAsString.append(" maxlength='"+ reportParameter.getParameterMaxLength() + "' ");
					if(reportParameter.getParameterJSScriptOnClick() != null && reportParameter.getParameterJSScriptOnClick().length() > 0 )					
					htmlAsString.append(" onclick='javascript:"+ reportParameter.getParameterJSScriptOnClick() + "' ");
					htmlAsString.append(" /></td>");
				} else if (CommonConstants.RPT_TYPE_DATEBOX
						.equalsIgnoreCase(reportParameter.getParameterType()) == true) {
					htmlAsString.append("<td class='form-row-input'>"+ reportParameter.getParameterName() + "</td>");
					htmlAsString.append("<td><input type='text' class='form-row-input' ");
					htmlAsString.append(" name='"+ reportParameter.getParameterValue() + "' ");
					htmlAsString.append(" size='"+ reportParameter.getParameterSize() + "' ");
					htmlAsString.append(" maxlength='"+ reportParameter.getParameterMaxLength() + "' ");
					if(reportParameter.getParameterJSScriptOnClick() != null && reportParameter.getParameterJSScriptOnClick().length() > 0 )
						htmlAsString.append(" onclick='javascript:"+ reportParameter.getParameterJSScriptOnClick() + "' ");
					htmlAsString.append(" onblur='Datevalidateformatonblur(this.value,this);' onfocus='Datevalidateformatonfocus(this.value,this);' ");
					htmlAsString.append(" />");
					htmlAsString.append("<img src='images/calendar.gif'	onclick=\"calendar.select(document.forms[0]."+reportParameter.getParameterValue()+",'"+reportParameter.getParameterValue()+"','dd/MM/yyyy');return false;\" />");
					htmlAsString.append("</td>");
				} else if (CommonConstants.RPT_TYPE_RADIOBUTTON
						.equalsIgnoreCase(reportParameter.getParameterType()) == true) {
					htmlAsString.append("<td class='form-row-input'><input type='radio' class='form-row-input' ");
					htmlAsString.append(" name='"+ reportParameter.getParameterValue() + "' ");
					if(reportParameter.getParameterJSScriptOnClick() != null && reportParameter.getParameterJSScriptOnClick().length() > 0 )
						htmlAsString.append(" onclick='javascript:"+ reportParameter.getParameterJSScriptOnClick() + "' ");
					htmlAsString.append(" value='"+reportParameter.getParameterValue()+"' ");					
					htmlAsString.append(" /></td>");
				} else if (CommonConstants.RPT_TYPE_CHECKBOX
						.equalsIgnoreCase(reportParameter.getParameterType()) == true) {
					htmlAsString.append("<td class='form-row-input'><input type='checkbox' class='form-row-input' ");
					htmlAsString.append(" name='"+ reportParameter.getParameterValue() + "' ");
					if(reportParameter.getParameterJSScriptOnClick() != null && reportParameter.getParameterJSScriptOnClick().length() > 0 )
						htmlAsString.append(" onclick='javascript:"+ reportParameter.getParameterJSScriptOnClick() + "' ");
					htmlAsString.append(" value='"+reportParameter.getParameterValue()+"' ");					
					htmlAsString.append(" /></td>");
				} else if (CommonConstants.RPT_TYPE_COMBOBOX.equalsIgnoreCase(
						reportParameter.getParameterType())) {
					// execute the query from the parameter
					Map<String, String> results = QueryExecuter.executeQuery(reportParameter.getParameterQuery());
					// iterate through the result keys
					Iterator<String> keySet = results.keySet().iterator(); 
					htmlAsString.append("<td class='form-row-input'>"+reportParameter.getParameterName()+"</td>");
					htmlAsString.append("<td >");
					htmlAsString.append("<select name='"+reportParameter.getParameterValue()+"' id='"+reportParameter.getParameterValue()+"' ");
					if(reportParameter.getParameterJSScriptOnClick() != null && reportParameter.getParameterJSScriptOnClick().length() > 0 )
						htmlAsString.append(" onchange='javascript:"+ reportParameter.getParameterJSScriptOnClick() + "' >");
					else
						htmlAsString.append(" >");
					String keyValue;
					// form a combo box 
					while(keySet.hasNext()){
						keyValue = (keySet.next());
						htmlAsString.append(" <option value='"+keyValue+"' >");
						htmlAsString.append(results.get(keyValue));
						htmlAsString.append("</option>");
					}
					htmlAsString.append("</select>");
					htmlAsString.append("</td>");
				} else if (CommonConstants.RPT_TYPE_BUTTON
						.equalsIgnoreCase(reportParameter.getParameterType()) == true) {
					//TODO: need to implement the button functionality
				}
				position = reportParameter.getParameterPosition();
				tdBreakUp = tdBreakUp + 1;
				if(tdBreakUp == 2){
					htmlAsString.append("</tr>");
					tdBreakUp = 0;
				}
			}
			for(int i = tdBreakUp; i < (tdBreakUp*2); i++){
				htmlAsString.append("<td>&nbsp;</td>");	
			}
			htmlAsString.append("</tr>");
			htmlAsString.append("<tr><td colspan='4' align='center' >&nbsp;</td></tr>");
			htmlAsString.append("<tr><td colspan='4' align='center' >&nbsp;</td></tr>");
			
			htmlAsString.append(" <tr><td colspan='8' class='form-row-text'>");
			htmlAsString.append(" <table width='100%' border='0' cellspacing='0' cellpadding='0'>");
			htmlAsString.append(" <tr><td align='right'><div id='button2'><ul>");
			htmlAsString.append(" <li class='buttonrightcrnr reset' onmouseover=\"this.className='buttonhighlight reset'\"	onmouseout=\"this.className='buttonrightcrnr reset'\"");
			htmlAsString.append(" title='Reset'><a href='#'>Reset</a></li>");
			htmlAsString.append(" <li class='buttonrightcrnr search-but' onmouseover=\"this.className='buttonhighlight search-but'\"");							
			htmlAsString.append(" onmouseout=\"this.className='buttonrightcrnr search-but'\"");
			if(((ReportParameter)reportParameterList.get(0)).getReport().getReportAction().endsWith(".cp")){
				htmlAsString.append(" onkeypress=\"javascript:runAction('"+((ReportParameter)reportParameterList.get(0)).getReport().getReportAction()+"');\" title='Generate Report'>");
				htmlAsString.append("<a href= \"javascript:runAction('"+((ReportParameter)reportParameterList.get(0)).getReport().getReportAction()+"');\">");
			}else{
				htmlAsString.append(" onkeypress=\"javascript:runReport('"+((ReportParameter)reportParameterList.get(0)).getReport().getReportAction()+"');\" title='Generate Report'>");
				htmlAsString.append("<a href= \"javascript:runReport('"+((ReportParameter)reportParameterList.get(0)).getReport().getReportAction()+"');\">");
			}
			htmlAsString.append("Generate Report</a></li>");
			htmlAsString.append("</ul>");
			htmlAsString.append("</div>");
			htmlAsString.append("</td>");
			htmlAsString.append("</tr>");
			htmlAsString.append("</table>");
			htmlAsString.append("</td>");
			htmlAsString.append("</tr>");
			htmlAsString.append("</table>");
			//htmlAsString.append("</form>");
		} catch (Exception e) {
			throw e;
		}
		return htmlAsString.toString();
	}

	public String getParameterValue() {
		return parameterValue;
	}

	public void setParameterValue(String parameterValue) {
		this.parameterValue = parameterValue;
	}
}
