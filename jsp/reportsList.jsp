<%-- Generic Includes--%>
<%@include file="/jsp/common/commonHeader.jsp"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/dwr/interface/ReportParameter.js"> </script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/dwr/interface/ReportCategory.js"> </script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/dwr/interface/TransactionDetailHelper.js"> </script>	
<script type="text/javascript"
	src="<%=request.getContextPath() %>/dwr/engine.js"> </script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/dwr/util.js"> </script>	
<body>
<!-- Sub menu js part is included -->
<%@include file="/jsp/common/subMenuJs.jsp"%>

<script language="JavaScript1.2">
	mmLoadMenus();	

/*function runReport(reportPath){
	var pageURL = "<%--=request.getContextPath()--%>/ReportList.cp?function=runReports&report="+reportPath+"&export=print&classList="+document.forms[0].classList.value;
//	var WinSettings = "center:yes;resizable:yes;height:650px;width:900px,scrollbars=yes"
	//var MyArgs = new Array();
	window.open(pageURL, "CUBEPROREPORTS",WinSettings);
}
*/

function runReport(reportUri) {
		var url = "<%= request.getContextPath()%>/GenerateReport.cp?uri="+reportUri;
		window.open('about:blank', 'ReportViewer', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=1,screenX=0,screenY=0,width=999,height=800');
		document.forms[0].action = url;
		document.forms[0].target = 'ReportViewer';
		document.forms[0].submit();
		document.forms[0].target = "";
}

function runAction(reportUri) {
		var url = "<%= request.getContextPath()%>/"+reportUri;
		window.open('about:blank', 'ReportViewer', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=1,screenX=0,screenY=0,width=999,height=800');
		document.forms[0].action = url;
		document.forms[0].target = 'ReportViewer';
		document.forms[0].submit();
		document.forms[0].target = "";
}

function loadReportParameters(reportId){
               ReportParameter.getParameterAsHTMLString(reportId, fillReportParameters);
}

function getTransSubType(obj){
               TransactionDetailHelper.getTransDescList(obj.options[obj.selectedIndex].text, populateTransList);
}

function populateTransList(objArray){
	dwr.util.removeAllOptions("subType");
	dwr.util.addOptions("subType", objArray.split("~"));
}

function loadReports(reportCategoryId){
               ReportCategory.getReportsAsHTMLString(reportCategoryId, fillReports);
}

function fillReports(str) {
			document.getElementById("reports").innerHTML = str;
}
              
function fillReportParameters(str) {
			document.getElementById("reportParameters").innerHTML = str;
}

function submitAction(actionPath){
	//alert(actionPath);
	//var myArguments = window.showModalDialog(actionPath,myArguments,"width:550px;height:440px;");
	document.forms[0].action = actionPath;
	document.forms[0].submit();
}

</script>
<table width="999" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<!-- Header Part Start -->
	<tr>
		<td><%@include file="/jsp/common/headerLinks.jsp"%>
		</td>
	</tr>
	<!-- Header Part End -->
	<tr>

		<!-- Menu Part Start -->
		<td class="menu-bg"><%@include file="/jsp/common/menu.jsp"%>
		</td>
		<!-- Menu Part End -->
	</tr>
	<tr>
		<td class="padding">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="3" class="bread-crumb"><a href="<%=request.getContextPath()%>/Home.cp"><bean:message
					key="nrega.home" /></a> &gt; <span>Reports</span></td>
			</tr>
			<tr>
				<td width="100%"><html:form action="ReportList" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td colspan="10" class="form-heading"><span
								class="beneficiary"> <bean:message
								key="report.categories" /> </span></td>
						</tr>
						<tr>
						<td class="form-row-input">
						<table><tr>
							<logic:iterate id="reportCategoryListId" name="reportListForm"
								property="reportCategoryList" indexId="i"
								type="com.cubepro.reports.ReportCategory">
								<td class="form-row-input"><a
									href="javascript:loadReports('<bean:write name="reportCategoryListId" property="categoryId" />');"><bean:write
									name="reportCategoryListId" property="categoryName" /></a></td>
							</logic:iterate>
							</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td class="form-row-input">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="10" class="form-heading"><span
								class="beneficiary"> <bean:message key="reports" /> </span></td>
						</tr>
						<tr>
							<td class="form-row-input"><div id="reports"></div></td>
						</tr>
						<tr>
							<td class="form-row-input">&nbsp;</td>
						</tr>

						<tr>
							<td colspan="10" class="form-heading"><span
								class="beneficiary"> <bean:message
								key="report.parameters" /> </span></td>
						</tr>
						<tr>
							<td class="form-row-input"><div id="reportParameters"></div></td>
						</tr>

						<tr>
							<!-- Footer Part Start -->
							<td>&nbsp;</td>
							<!-- Footer Part End -->
						</tr>
					</table>
				</html:form>
</body>
</html>
