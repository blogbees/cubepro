<%-- Generic Includes--%>
<%@include file="/jsp/common/commonHeader.jsp"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<body>
<!-- Sub menu js part is included -->
<%@include file="/jsp/common/subMenuJs.jsp"%>

<script language="JavaScript1.2">
	mmLoadMenus();	
	   function SubmitOnEnter(e) {
				var code;
				if (e.keyCode) code = e.keyCode;
				else if (e.which) code = e.which;
				if(code==13) {
					submitSearch();
				}
			}
			function submitSearch(){
				document.forms[0].action="<%=request.getContextPath()%>/RouteStop.cp";
				document.forms[0].submit();
			}
			
			function saveForm(){
				var termName = document.forms[0]['routeStopDetail.stopFees'];
					if(IfNullorEmpty(termName.value)){
						alert("Enter stopFees");
						termName.focus();
					}else{
						document.forms[0].action="<%=request.getContextPath()%>/RouteStop.cp?action=saveRouteStop";
						document.forms[0].submit();
					}
			}
			
		
			function resetFilters(){
				document.forms[0]['routeStopDetail.routeStopId'].value = 0;
				document.forms[0]['routeStopDetail.stopFees'].value = "";
				document.forms[0]['routeStopDetail.stopOrder'].value = "";
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
					key="nrega.home" /></a> &gt; <span>RouteStop Master</span></td>
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
				<td width="100%"><html:form action="RouteStop" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">RouteStop Master </span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">

										<tr>
											<td class="form-row-text">Route</td>
											<td class="form-row-input">
												<html:select
												property="routeStopDetail.route.routeId"
													style="width:180px;">
												<html:optionsCollection property="routeList"
													label="routeName" value="routeId" />
												</html:select>	
												<html:hidden property="routeStopDetail.routeStopId" />
												</td>
											<td class="form-row-text">Stop</td>
											<td class="form-row-input">
											<html:select
												property="routeStopDetail.stop.stopId"
													style="width:180px;">
												<html:optionsCollection property="stopList"
													label="stopName" value="stopId" />
												</html:select>
											</td>
										</tr>
										<tr>
											<td class="form-row-text">Stop Fees</td>
											<td class="form-row-input">
											<html:text
												property="routeStopDetail.stopFees" size="20"
												maxlength="45" styleId="searchProjectName" />
											</td>
											<td class="form-row-text">Stop Order</td>
											<td class="form-row-input">
											<html:text
												property="routeStopDetail.stopOrder" size="10"
												maxlength="45" styleId="searchProjectName" />
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
										name="routeStopForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="routeStopList"
										name="routeStopForm">
										<bean:message key="no.search.projects" />
									</logic:empty> <logic:notEmpty property="routeStopList"
										name="routeStopForm">
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
													<td colspan="8"><display:table id="routeStopId"
														name="searchResult" requestURI="RouteStop.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="RouteStop Id" property="routeStopId"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Route Name"
															property="route.routeName" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Stop Name"
															property="stop.stopName" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Stop Fees"
															property="stopFees" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Stop Order"
															property="stopOrder" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title=""
															href="RouteStop.cp?action=setRouteStop&"
															paramId="routeStopId" paramProperty="routeStopId"
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