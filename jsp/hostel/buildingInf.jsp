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
				document.forms[0].action="<%=request.getContextPath()%>/BuildingInf.cp";
				document.forms[0].submit();
			}
			
			function saveForm(){
				var termName = document.forms[0]['buildingInfDetail.name'];
					if(IfNullorEmpty(termName.value)){
						alert("Enter name of the building");
						termName.focus();
					}else{
						document.forms[0].action="<%=request.getContextPath()%>/BuildingInf.cp?action=saveBuildingInf";
						document.forms[0].submit();
					}
			}
			
		
			function resetFilters(){
				document.forms[0]['buildingInfDetail.buildingId'].value = 0;
				document.forms[0]['buildingInfDetail.name'].value = "";
				document.forms[0]['buildingInfDetail.type'].value = "";
				document.forms[0]['buildingInfDetail.addr'].value = "";
				document.forms[0]['buildingInfDetail.phone1'].value = "";
				document.forms[0]['buildingInfDetail.phone2'].value = "";
				document.forms[0]['buildingInfDetail.mailId'].value = "";
				document.forms[0]['buildingInfDetail.messAmt'].value = "";
				document.forms[0]['buildingInfDetail.noOfBlocks'].value = "";
				document.forms[0]['buildingInfDetail.noOfRooms'].value = "";
				document.forms[0]['buildingInfDetail.maintCharge'].value = "";
				document.forms[0]['buildingInfDetail.repairAmt'].value = "";
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
					key="nrega.home" /></a> &gt; <span>Building Information</span></td>
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
				<td width="100%"><html:form action="BuildingInf" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">Building Information</span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">
										<tr>
											<td class="form-row-text">Name:</td>
											<td class="form-row-input"><html:text
												property="buildingInfDetail.name" size="20"
												maxlength="45" styleId="searchProjectName" />
												<html:hidden property="buildingInfDetail.buildingId" />
											</td>
											<td class="form-row-text">Type:</td>
											<td class="form-row-input"><html:text
												property="buildingInfDetail.type" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">Warden:</td>
											<td class="form-row-input"><html:select
												property="buildingInfDetail.staffDetails.staffId" 
												styleId="searchProjectName" >
													<logic:iterate property="staffDetails" name="buildingInfForm" id="staffDetailsId" indexId="i" type="com.cubepro.staff.StaffDetails">
														<html:option value="<%=String.valueOf(staffDetailsId.getStaffId())%>" >
														<bean:write name="staffDetailsId" property="firstName" /> 
														</html:option>
													</logic:iterate>
												</html:select>												
											</td>
										</tr>
										<tr>
											<td class="form-row-text">Addr:</td>
											<td class="form-row-input"><html:text
												property="buildingInfDetail.addr" size="50"
												maxlength="145" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">Phone1:</td>
											<td class="form-row-input"><html:text
												property="buildingInfDetail.phone1" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">Phone2:</td>
											<td class="form-row-input"><html:text
												property="buildingInfDetail.phone2" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
										</tr>
										<tr>
											<td class="form-row-text">EMail:</td>
											<td class="form-row-input"><html:text
												property="buildingInfDetail.mailId" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">No of Blocks:</td>
											<td class="form-row-input"><html:text
												property="buildingInfDetail.noOfBlocks" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">No of Rooms:</td>
											<td class="form-row-input"><html:text
												property="buildingInfDetail.noOfRooms" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
										</tr>
										<tr>
											<td class="form-row-text">Mess Amt:</td>
											<td class="form-row-input"><html:text
												property="buildingInfDetail.messAmt" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">Maint Charge:</td>
											<td class="form-row-input"><html:text
												property="buildingInfDetail.maintCharge" size="20"
												maxlength="45" styleId="searchProjectName" />
											</td>
											<td class="form-row-text">Repair Amt</td>
											<td class="form-row-input">
											<html:text
												property="buildingInfDetail.repairAmt" size="20"
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
										name="buildingInfForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="buildingInfList"
										name="buildingInfForm">
										
									</logic:empty> <logic:notEmpty property="buildingInfList"
										name="buildingInfForm">
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
													<td colspan="8"><display:table id="buildingId"
														name="searchResult" requestURI="BuildingInf.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="BuildingInf Id" property="buildingId"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Name"
															property="name" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Type"
															property="type" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Phone1"
															property="phone1" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Phone2"
															property="phone2" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="EMail"
															property="mailId" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="No of Blocks"
															property="noOfBlocks" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="No of Rooms"
															property="noOfRooms" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>				
														<display:column title="Mess Amt"
															property="messAmt" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Repair Amt"
															property="repairAmt" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Maint Charge"
															property="maintCharge" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title=""
															href="BuildingInf.cp?action=setBuildingInf&"
															paramId="buildingInfId" paramProperty="buildingId"
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
<% if(request.getParameter("buildingInfId")==null || request.getParameter("buildingInfId")== ""){%>
	resetFilters();
<%}%>	
</script>
</html>