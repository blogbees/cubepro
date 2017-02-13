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
				document.forms[0].action="<%=request.getContextPath()%>/Room.cp";
				document.forms[0].submit();
			}
			
			function saveForm(){
				var termName = document.forms[0]['roomDetail.roomNo'];
					if(IfNullorEmpty(termName.value)){
						alert("Enter the Room No");
						termName.focus();
					}else{
						document.forms[0].action="<%=request.getContextPath()%>/Room.cp?action=saveRoom";
						document.forms[0].submit();
					}
			}
			
		
			function resetFilters(){
				document.forms[0]['roomDetail.roomId'].value = 0;
				document.forms[0]['roomDetail.roomNo'].value = "";
				document.forms[0]['roomDetail.strength'].value = "";
				document.forms[0]['roomDetail.assets'].value = "";
				document.forms[0]['roomDetail.roomExtn'].value = "";
				document.forms[0]['roomDetail.bathroomAtt'].value = "";
				document.forms[0]['roomDetail.roomCost'].value = "";
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
					key="nrega.home" /></a> &gt; <span>Room Information</span></td>
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
				<td width="100%"><html:form action="Room" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">Room Information</span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">
										<tr>
										<td class="form-row-text">Building:</td>
											<td class="form-row-input">
											<html:select
															property="roomDetail.buildingInf.buildingId"
															>
															<html:optionsCollection property="buildingInfList"
																label="name" value="buildingId" />
														</html:select>	
											</td>
											<td class="form-row-text">Room No:</td>
											<td class="form-row-input"><html:text
												property="roomDetail.roomNo" size="20"
												maxlength="45" styleId="searchProjectName" />
												<html:hidden property="roomDetail.roomId" />
											</td>
											<td class="form-row-text">Room Strength:</td>
											<td class="form-row-input"><html:text
												property="roomDetail.strength" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
										</tr>
										<tr>
											<td class="form-row-text">Assets:</td>
											<td class="form-row-input"><html:text
												property="roomDetail.assets" size="50"
												maxlength="145" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">Room Extn:</td>
											<td class="form-row-input"><html:text
												property="roomDetail.roomExtn" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">Is BathRoom Attached:</td>
											<td class="form-row-input"><html:select
												property="roomDetail.bathroomAtt"  styleId="searchProjectName" >
													<html:option value="Yes">Yes</html:option>
													<html:option value="No">No</html:option>
												</html:select>
												
											</td>
										</tr>
										<tr>
											<td class="form-row-text">Room Cost:</td>
											<td class="form-row-input"><html:text
												property="roomDetail.roomCost" size="20"
												maxlength="45" styleId="searchProjectName" />
											</td>
											<td class="form-row-text"></td>
											<td class="form-row-input">
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
										name="roomForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="roomList"
										name="roomForm">
										
									</logic:empty> <logic:notEmpty property="roomList"
										name="roomForm">
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
													<td colspan="8"><display:table id="roomId"
														name="searchResult" requestURI="Room.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="Room Id" property="roomId"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Building Name"
															property="buildingInf.name" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Room No"
															property="roomNo" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Room Extn"
															property="roomExtn" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Room Strength"
															property="strength" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Assets"
															property="assets" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Is BathRoom Att"
															property="bathroomAtt" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Room Cost"
															property="roomCost" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>				
														<display:column title=""
															href="Room.cp?action=setRoom&"
															paramId="roomId" paramProperty="roomId"
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