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
				document.forms[0].action="<%=request.getContextPath()%>/MenuPermissions.cp";
				document.forms[0].submit();
			}
			
			function saveForm(){
						document.forms[0].action="<%=request.getContextPath()%>/MenuPermissions.cp?action=saveMenuPermissions";
						document.forms[0].submit();
			}
				
		
			function resetFilters(){
				document.forms[0]['menuPermissions.menuPermissionsId'].value = 0;
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
					key="nrega.home" /></a> &gt; <span>MenuPermissions Information</span></td>
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
				<td width="100%"><html:form action="MenuPermissions" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">MenuPermissions Information</span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">
										<tr>
											<td class="form-row-text">Login Name:</td>
											<td class="form-row-input">
											<html:select
												property="menuPermissions.loginDetails.userId" 
												styleId="searchProjectName" >
													<logic:iterate property="loginDetailsList" name="menuPermissionsForm" id="loginDetailsId" indexId="i" type="com.cubepro.login.entity.LoginDetails">
														<html:option value="<%=String.valueOf(loginDetailsId.getUserId())%>" >
														<bean:write name="loginDetailsId" property="userName" /> 
														</html:option>
													</logic:iterate>
												</html:select>
												
												<html:hidden property="menuPermissions.menuPermissionsId" />
											</td>
											<td class="form-row-text">Menu Permitted:</td>
											<td class="form-row-input"><html:select
												property="menuPermissions.menus.menuId" 
												styleId="searchProjectName" >
													<logic:iterate property="menusList" name="menuPermissionsForm" id="menussId" indexId="i" type="com.cubepro.menu.Menus">
														<html:option value="<%=String.valueOf(menussId.getMenuId())%>" >
														<bean:write name="menussId" property="menuName" /> 
														</html:option>
													</logic:iterate>
												</html:select>
												
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
										name="menuPermissionsForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="menuPermissionsList"
										name="menuPermissionsForm">
										
									</logic:empty> <logic:notEmpty property="menuPermissionsList"
										name="menuPermissionsForm">
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
													<td colspan="8"><display:table id="menuPermissionsId"
														name="searchResult" requestURI="MenuPermissions.cp"
														pagesize="12" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="Id" property="menuPermissionsId"
															style="width: 2%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="User Name"
															property="loginDetails.userName" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Menu Name"
															property="menus.menuName" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title=""
															href="MenuPermissions.cp?action=setMenuPermissions&"
															paramId="menuPermissionsId" paramProperty="menuPermissionsId"
															value="Edit" style="width: 3%" sortable="true"
															headerClass="grid-heading-row" class="padding link-color"></display:column>
														<display:column title=""
															href="MenuPermissions.cp?action=deleteMenuPermissions&"
															paramId="menuPermissionsId" paramProperty="menuPermissionsId"
															value="Delete" style="width: 3%" sortable="true"
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
<% if(request.getParameter("menuPermissionsId")==null || request.getParameter("menuPermissionsId")== ""){%>
	resetFilters();
<%}%>	
</script>
</html>