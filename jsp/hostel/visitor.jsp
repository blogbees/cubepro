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
				document.forms[0].action="<%=request.getContextPath()%>/Visitor.cp";
				document.forms[0].submit();
			}
			
			function saveForm(){
				var termName = document.forms[0]['visitorDetail.visitorName'];
					if(IfNullorEmpty(termName.value)){
						alert("Enter the Visitor Name");
						termName.focus();
					}else{
						document.forms[0].action="<%=request.getContextPath()%>/Visitor.cp?action=saveVisitor";
						document.forms[0].submit();
					}
			}
			
		
			function resetFilters(){
				document.forms[0]['visitorDetail.visitorId'].value = 0;
				document.forms[0]['visitorDetail.visitorName'].value = "";
				document.forms[0]['visitorDetail.relation'].value = "";
				document.forms[0]['visitorDetail.inDate'].value = "";
				document.forms[0]['visitorDetail.inTime'].value = "";
				document.forms[0]['visitorDetail.whotosee'].value = "";
				document.forms[0]['visitorDetail.seetype'].value = "";
				document.forms[0]['visitorDetail.outTime'].value = "";
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
					key="nrega.home" /></a> &gt; <span>Visitor Information</span></td>
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
				<td width="100%"><html:form action="Visitor" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">Visitor Information</span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">
										<tr>
										<td class="form-row-text">Room No:</td>
											<td class="form-row-input">
											<html:select property="visitorDetail.room.roomId">
															<html:optionsCollection property="roomList"
																label="roomNo" value="roomId" />
														</html:select>	
											</td>
											<td class="form-row-text">Visitor Name:</td>
											<td class="form-row-input"><html:text
												property="visitorDetail.visitorName" size="20"
												maxlength="45" styleId="searchProjectName" />
												<html:hidden property="visitorDetail.visitorId" />
											</td>
											<td class="form-row-text">Visitor Relation:</td>
											<td class="form-row-input"><html:text
												property="visitorDetail.relation" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
										</tr>
										<tr>
											<td class="form-row-text">In Date:</td>
											<td class="form-row-input"><html:text
												property="visitorDetail.inDate" size="50"
												maxlength="145" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">In Time:</td>
											<td class="form-row-input"><html:text
												property="visitorDetail.inTime" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">Visitee Name:</td>
											<td class="form-row-input"><html:text
												property="visitorDetail.whotosee" size="20"
												maxlength="45" styleId="searchProjectName" />
												
											</td>
										</tr>
										<tr>
										<td class="form-row-text">Visitee Type</td>
											<td class="form-row-input">
											<html:select
												property="visitorDetail.seetype"  styleId="searchProjectName" >
													<html:option value="Student">Student</html:option>
													<html:option value="Staff">Staff</html:option>
													<html:option value="Others">Others</html:option>
												</html:select>
											</td>
											<td class="form-row-text">Out Time:</td>
											<td class="form-row-input"><html:text
												property="visitorDetail.outTime" size="20"
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
										name="visitorForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="visitorList"
										name="visitorForm">
										
									</logic:empty> <logic:notEmpty property="visitorList"
										name="visitorForm">
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
													<td colspan="8"><display:table id="visitorId"
														name="searchResult" requestURI="Visitor.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="Visitor Id" property="visitorId"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Room No"
															property="room.roomNo" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Visitor Name"
															property="visitorName" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Visitor Relation"
															property="relation" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="In Date"
															property="inDate" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="In Time"
															property="inTime" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Out Time"
															property="outTime" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
															<display:column title="To See"
															property="whotosee" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
															<display:column title="Type"
															property="seetype" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>				
														<display:column title=""
															href="Visitor.cp?action=setVisitor&"
															paramId="visitorId" paramProperty="visitorId"
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