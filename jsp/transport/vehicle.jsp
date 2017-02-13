<%-- Generic Includes--%>
<%@include file="/jsp/common/commonHeader.jsp"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<body>
<!-- Sub menu js part is included -->
<%@include file="/jsp/common/subMenuJs.jsp"%>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

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
				document.forms[0].action="<%=request.getContextPath()%>/Vehicle.cp";
				document.forms[0].submit();
			}
			
			function saveForm(){
				var termName = document.forms[0]['vehicleDetail.regName'];
				var termName1 = document.forms[0]['vehicleDetail.regNo'];
					if(IfNullorEmpty(termName1.value)){
						alert("Enter registration no");
						termName1.focus();
					}else{
						document.forms[0].action="<%=request.getContextPath()%>/Vehicle.cp?action=saveVehicle";
						document.forms[0].submit();
					}
					
			}
			
		
			function resetFilters(){
				document.forms[0]['vehicleDetail.vehicleId'].value = "0";
				document.forms[0]['vehicleDetail.regName'].value = "";
				document.forms[0]['vehicleDetail.regDate'].value = "";
				document.forms[0]['vehicleDetail.regNo'].value = "";
				document.forms[0]['vehicleDetail.make'].value = "";
				document.forms[0]['vehicleDetail.model'].value = "";
				document.forms[0]['vehicleDetail.engineType'].value = "";
				document.forms[0]['vehicleDetail.insuredDate'].value = "";
				document.forms[0]['vehicleDetail.engineNo'].value = "";
				document.forms[0]['vehicleDetail.color'].value = "";
				document.forms[0]['vehicleDetail.insuredDate'].value = "";
				document.forms[0]['vehicleDetail.renewalDate'].value = "";
				document.forms[0]['vehicleDetail.totalSeats'].value = "";
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
					key="nrega.home" /></a> &gt; <span>Vehicle Master</span></td>
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
				<td width="100%"><html:form action="Vehicle" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">Vehicle Master </span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">
										<tr>
											<td class="form-row-text">Regr No:</td>
											<td class="form-row-input"><html:text
												property="vehicleDetail.regNo" size="20"
												maxlength="45" styleId="searchProjectName" />
												<html:hidden property="vehicleDetail.vehicleId" />
											</td>
											<td class="form-row-text">Regr Name:</td>
											<td class="form-row-input"><html:text
												property="vehicleDetail.regName" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">Regr Date:</td>
											<td class="form-row-input"><html:text
												property="vehicleDetail.regDate" size="20"
												maxlength="45" styleId="rangeA" />
												
											</td>
										</tr>
										<tr>
											<td class="form-row-text">Make:</td>
											<td class="form-row-input"><html:text
												property="vehicleDetail.make" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">Model:</td>
											<td class="form-row-input"><html:text
												property="vehicleDetail.model" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">Color:</td>
											<td class="form-row-input"><html:text
												property="vehicleDetail.color" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
										</tr>
										<tr>
											<td class="form-row-text">Engine Type:</td>
											<td class="form-row-input"><html:text
												property="vehicleDetail.engineType" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">Engine No:</td>
											<td class="form-row-input"><html:text
												property="vehicleDetail.engineNo" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">Insured Date:</td>
											<td class="form-row-input"><html:text
												property="vehicleDetail.insuredDate" size="20"
												maxlength="45" styleId="rangeB" />
												
											</td>
										</tr>
										<tr>
											<td class="form-row-text">Renewal Date:</td>
											<td class="form-row-input" nowrap><html:text
													property="vehicleDetail.renewalDate" maxlength="25"
													size="10" styleId="rangeC"></html:text>
													</td>
											<td class="form-row-text">Total No of Seats:</td>
											<td class="form-row-input"><html:text
												property="vehicleDetail.totalSeats" size="20"
												maxlength="45" styleId="searchProjectName" />
												<html:hidden property="vehicleDetail.vehicleId" />
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
										name="vehicleForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="vehicleList"
										name="vehicleForm">
										
									</logic:empty> <logic:notEmpty property="vehicleList"
										name="vehicleForm">
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
													<td colspan="8"><display:table id="vehicleId"
														name="searchResult" requestURI="Vehicle.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="Vehicle Id" property="vehicleId"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Regr Name"
															property="regName" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Regr No"
															property="regNo" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Regr Date"
															property="regDate" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Model"
															property="model" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Make"
															property="make" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Color"
															property="color" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Engine No"
															property="engineNo" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>				
														<display:column title="Engine Type"
															property="engineType" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Insured Date"
															property="insuredDate" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Renewal Date"
															property="renewalDate" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Total Seats"
															property="totalSeats" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title=""
															href="Vehicle.cp?action=setVehicle&"
															paramId="vehicleId" paramProperty="vehicleId"
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
<script language="javascript">
//resetFilters();
</script>
</html>