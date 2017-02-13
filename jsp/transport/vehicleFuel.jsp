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
				document.forms[0].action="<%=request.getContextPath()%>/VehicleFuel.cp";
				document.forms[0].submit();
			}
			
			function saveForm(){
				var termName = document.forms[0]['vehicleFuelDetail.dof'];
					if(IfNullorEmpty(termName.value)){
						alert("Enter Date of Fueling");
						termName.focus();
					}else{
						document.forms[0].action="<%=request.getContextPath()%>/VehicleFuel.cp?action=saveVehicleFuel";
						document.forms[0].submit();
					}
			}
			
		
			function resetFilters(){
				document.forms[0]['vehicleFuelDetail.dof'].value = "";
				document.forms[0]['vehicleFuelDetail.litres'].value = "";
				document.forms[0]['vehicleFuelDetail.totalKms'].value = "";
				document.forms[0]['vehicleFuelDetail.amount'].value = "";
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
					key="nrega.home" /></a> &gt; <span>VehicleFuel Master</span></td>
			</tr>
			<html:messages id="msg" message="true" />
			<logic:messagesPresent message="true">
				<tr>
					<td colspan="8">
					<script language="javascript">
												alert('<bean:write name="msg" />');
												</script>
					<span class="success"><bean:write
						name="msg" /> </span></td>
				</tr>
			</logic:messagesPresent>

			<tr>
				<td width="100%"><html:form action="VehicleFuel" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">VehicleFuel Master </span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">

										<tr>
											<td class="form-row-text">Date of Fueling:</td>
											<td class="form-row-input">
											<html:text
												property="vehicleFuelDetail.dof" size="20"
												maxlength="45" styleId="rangeA" />
												<html:hidden property="vehicleFuelDetail.vehicleFuelId" />
											</td>
											<td class="form-row-text">Vehicle:</td>
											<td class="form-row-input">
											<html:select
												property="vehicleFuelDetail.vehicle.vehicleId"
													style="width:180px;">
												<html:optionsCollection property="vehicleList"
													label="regName" value="vehicleId" />
											</html:select>
											</td>
											<td class="form-row-text">Total Litres:</td>
											<td class="form-row-input">
											<html:text
												property="vehicleFuelDetail.litres" size="20"
												maxlength="45" styleId="searchProjectName" />
											</td>
										</tr>
										<tr>
											<td class="form-row-text">Total Kms:</td>
											<td class="form-row-input">
											<html:text
												property="vehicleFuelDetail.totalKms" size="20"
												maxlength="45" styleId="searchProjectName" />
											</td>
											<td class="form-row-text">Amount:</td>
											<td class="form-row-input">
											<html:text
												property="vehicleFuelDetail.amount" size="20"
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
										name="vehicleFuelForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="vehicleFuelList"
										name="vehicleFuelForm">
										<bean:message key="no.search.projects" />
									</logic:empty> <logic:notEmpty property="vehicleFuelList"
										name="vehicleFuelForm">
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
													<td colspan="8"><display:table id="vehicleFuelId"
														name="searchResult" requestURI="VehicleFuel.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="VehicleFuel Id" property="vehicleFuelId"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Date of Fueling"
															property="dof" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Fuel Litres"
															property="litres" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Total Kms"
															property="totalKms" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Amount"
															property="amount" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title=""
															href="VehicleFuel.cp?action=setVehicleFuel&"
															paramId="vehicleFuelId" paramProperty="vehicleFuelId"
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