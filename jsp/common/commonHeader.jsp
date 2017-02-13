<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="/struts-bean" prefix="bean"%>
<%@ taglib uri="/struts-html" prefix="html"%>
<%@ taglib uri="/struts-logic" prefix="logic"%>
<%@page import="com.cubepro.menu.Menu,com.cubepro.menu.MenuDetails,java.util.Map,java.util.List,java.util.Iterator"%>
<%@page import="org.apache.struts.Globals"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><bean:message key="title.nrega"/></title>
	<%--Styles --%>
	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath() %>/css/jquery-alerts.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="<%=request.getContextPath() %>/css/overlay-minimal.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet" type="text/css"  media="print" />	
	<%-- jQuery Core Scripts--%>
	<script src="<%=request.getContextPath() %>/js/jquery/jquery-1-3-2.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath() %>/js/jquery/jquery-ui-core-1-7-2.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath() %>/js/jquery/jquery.form.js" type="text/javascript" ></script>

	<!-- jQuery Draggable files -->
	<script src="<%=request.getContextPath() %>/js/jquery/jquery-dragdrop-1-7-2.js" type="text/javascript"></script>

	<!-- jQuery Alert-->
	<script src="<%=request.getContextPath() %>/js/jquery/jquery-alerts.js" type="text/javascript"></script>

	<!-- jQuery textarea maxlength validation -->
	<script src="<%=request.getContextPath() %>/js/jquery/jquery.maxlength.js" type="text/javascript"></script>
	<%--DWR Scripts--%>
	<script src='<%=request.getContextPath()%>/dwr/engine.js' type=""></script>
	<script src='<%=request.getContextPath()%>/dwr/util.js' type=""></script>

	<script src="<%=request.getContextPath() %>/js/cubeproutil.js" type="text/javascript" ></script>	
	<%-- Global scripts --%> 
	<script language="JavaScript" type="text/javascript">
		$.alerts.okButton = '<bean:message key="button.ok" />';
		$.alerts.cancelButton = '<bean:message key="button.cancel" />';
		$.fn.maxlength.defaultSettings.statusText = '<bean:message key="message.maxlength.charsleft" />';
		$.fn.maxlength.defaultSettings.errorText = '<bean:message key="message.maxlength.errortext" />';
		$.fn.maxlength.defaultSettings.errorTitle = '<bean:message key="message.maxlength.errortitle" />';
		
		<%--- Script to open a report pop-up ---%>
		function openReport(){
			var url = '<%=request.getContextPath()%>/RunReport.do?uri=/Beneficiary/BeneficiaryReport';
			window.open(url, 'viewReport', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=1,screenX=0,screenY=0,width=999,height=800');
		}
	</script>
		<%-- Menu Scripts--%>
	<script language="JavaScript" src="<%=request.getContextPath() %>/scripts/mm_menu.js" type=""></script>
	<script language="JavaScript" src="<%=request.getContextPath() %>/js/CalendarPopup.js" type="text/javascript"></script>	
	<script language="javascript" type="text/javascript" >
		var calendar = new CalendarPopup();
		calendar.setYearSelectStartOffset(50); 
		calendar.showNavigationDropdowns();

	<%-- Show/Hide scripts --%>

		var collapsedGif = '<img src="images/collapseall.gif" alt="<bean:message key='collapse' />" border="0" title="<bean:message key='collapse' />" status="collapsed"/>';
		var expandedGif = '<img src="images/expandall.gif" alt="<bean:message key='admin.expand.all' />" border="0" title="<bean:message key='admin.expand.all' />" status="expanded"/>';
		$(document).ready(function() {
			$('a.toggle-link').html(collapsedGif);
			$('a.toggle-link').live('click', function() {
				var collapse = ($(this).find('img').attr('status') == 'collapsed');
				$(this).html((collapse)? expandedGif : collapsedGif);
				var toggleIndex = $(this).attr('toggleIndex');
				$('.toggle-section' + toggleIndex).toggle();
			});
		});
		function dwrErrorHandler(errMsg) {
			jAlert(errMsg, '<bean:message key="alert" />', function(isConfirmed) {return false;});
		}

</script>	
</head>
<!-- AJAX Loader image.... -->
<div id="ajaxLoader" style="display:none">
	<div align="center" >
		<img src="images/ajax-loader.gif" alt="Loading...." border="0" />
		<p><bean:message key='ajax.loading' />......</p>
	</div>
</div>