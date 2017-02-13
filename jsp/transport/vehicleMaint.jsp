<%-- Generic Includes--%>
<%@include file="/jsp/common/commonHeader.jsp"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<body>
<!-- Sub menu js part is included -->
<%@include file="/jsp/common/subMenuJs.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/ui.daterangepicker.css" type="text/css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/redmond/jquery-ui-1.7.1.custom.css" type="text/css" title="ui-theme" />
<script src="<%=request.getContextPath()%>/js/multifile.js"
	type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.7.1.custom.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/daterangepicker.jQuery.js"></script>

<script language="JavaScript1.2">
	mmLoadMenus();
			$(function(){
				  $('#rangeA').daterangepicker({
				  presetRanges: [
			{text: 'Today', dateStart: 'today', dateEnd: 'today' }],
			presets: {
			specificDate: 'Specific Date'},
				  arrows:false,dateFormat:'dd/mm/yy'});
			 });
		
	   function SubmitOnEnter(e) {
				var code;
				if (e.keyCode) code = e.keyCode;
				else if (e.which) code = e.which;
				if(code==13) {
					submitSearch();
				}
			}
			function submitSearch(){
				document.forms[0].action="<%=request.getContextPath()%>/VehicleMaint.cp";
				document.forms[0].submit();
			}
			
			function saveForm(){
				var termName = document.forms[0]['vehicleMaintDetail.dos'];
					if(IfNullorEmpty(termName.value)){
						alert("Enter Date of Service");
						termName.focus();
					}else{
						document.forms[0].action="<%=request.getContextPath()%>/VehicleMaint.cp?action=saveVehicleMaint";
						document.forms[0].submit();
					}
			}
			
		
			function resetFilters(){
				document.forms[0]['vehicleMaintDetail.dos'].value = "";
				document.forms[0]['vehicleMaintDetail.desc'].value = "";
				document.forms[0]['vehicleMaintDetail.amount'].value = "";
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
					key="nrega.home" /></a> &gt; <span>VehicleMaint Master</span></td>
			</tr>
			<html:messages id="msg" message="true" />
			<logic:messagesPresent message="true">
				<tr>
					<td colspan="8"><span class="success">
					<script language="javascript">
												alert('<bean:write name="msg" />');
												</script>
					<bean:write
						name="msg" /> </span></td>
				</tr>
			</logic:messagesPresent>

			<tr>
				<td width="100%"><html:form action="VehicleMaint" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">VehicleMaint Master </span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">

										<tr>
											<td class="form-row-text">Date of Service:</td>
											<td class="form-row-input">
											<html:text
												property="vehicleMaintDetail.dos" size="20"
												maxlength="45" styleId="rangeA" />
												<html:hidden property="vehicleMaintDetail.vehicleMaintId" />
											</td>
											<td class="form-row-text">Vehicle:</td>
											<td class="form-row-input">
											<html:select
												property="vehicleMaintDetail.vehicle.vehicleId"
													style="width:180px;">
												<html:optionsCollection property="vehicleList"
													label="regName" value="vehicleId" />
											</html:select>
											</td>
											<td class="form-row-text"></td>
											<td class="form-row-input">
											</td>
										</tr>
										<tr>
										<td class="form-row-text">Description:</td>
											<td class="form-row-input">
											<html:text
												property="vehicleMaintDetail.descr" size="100"
												maxlength="150" styleId="searchProjectName" />
											</td>
											<td class="form-row-text">Amount:</td>
											<td class="form-row-input">
											<html:text
												property="vehicleMaintDetail.amount" size="20"
												maxlength="45" styleId="searchProjectName" />
											</td>
											<td class="form-row-text"></td>
											<td class="form-row-input">
											</td>
										</tr>
									</table>
									</td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td align="right">
											<div id="button2">
											<ul>
												<li class="buttonrightcrnr reset"
													onmouseover="this.className='buttonhighlight reset'"
													onmouseout="this.className='buttonrightcrnr reset'"
													title="Reset"><a href="javascript:resetFilters();"><bean:message
													key="nregs.reset" /> </a></li>
												<li class="buttonrightcrnr search-but"
													onmouseover="this.className='buttonhighlight search-but'"
													onmouseout="this.className='buttonrightcrnr search-but'"
													onkeypress="saveForm();" title="Search Project"><a
													href="javascript:saveForm();"><bean:message
													key="button.save" /> </a></li>
											</ul>
											</div>
											</td>
										</tr>
									</table>
									</td>
								</tr>

								<tr class="toggle-section0">
									<td><bean:define id="pageSizeList"
										name="vehicleMaintForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="vehicleMaintList"
										name="vehicleMaintForm">
										<bean:message key="no.search.projects" />
									</logic:empty> <logic:notEmpty property="vehicleMaintList"
										name="vehicleMaintForm">
										<tr>
											<td class="padding-btm-ten">
											<table width="100%" border="0" cellspacing="1"
												cellpadding="0">
												<tr>
													<td colspan="5" class="form-sub-heading">
													<table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td align="left"><span class="search-sub"><bean:message
																key="projectManagement.searchResults" /> </span></td>
															<td align="right"><a href="#" class="toggle-link"
																toggleIndex="1" /></td>
														</tr>
													</table>
													</td>
												</tr>
												<tr class="toggle-section1">
													<td colspan="8"><display:table id="vehicleMaintId"
														name="searchResult" requestURI="VehicleMaint.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="VehicleMaint Id" property="vehicleMaintId"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Date Of Service"
															property="dos" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Description"
															property="descr" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Amount"
															property="amount" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title=""
															href="VehicleMaint.cp?action=setVehicleMaint&"
															paramId="vehicleMaintId" paramProperty="vehicleMaintId"
															value="Edit" style="width: 13%" sortable="true"
															headerClass="grid-heading-row" class="padding link-color"></display:column>
													</display:table></td>
												</tr>
												<tr>
													<td></td>
												</tr>
											</table>
									</logic:notEmpty></td>
								</tr>
							</table>
							</html:form></td>
						</tr>
					</table>
					<!-- Grid Part End --></td>
			</tr>
			<tr>
				<!-- Footer Part Start -->
				<td>&nbsp;</td>
				<!-- Footer Part End -->
			</tr>
		</table>
</body>
</html>