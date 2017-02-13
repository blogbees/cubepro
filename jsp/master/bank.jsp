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
				document.forms[0].action="<%=request.getContextPath()%>/EditBank.cp";
				document.forms[0].submit();
			}
			
			function saveForm(){
				var bankName = document.forms[0]['bankDetail.bankName'];
				var acc = document.forms[0]['bankDetail.account'];
					if(IfNullorEmpty(bankName.value)){
						alert("Enter bank name");
						bankName.focus();
					}else if(IfNullorEmpty(acc.value)){
						alert("Enter Account #");
						acc.focus();
					}else{
						document.forms[0].action="<%=request.getContextPath()%>/EditBank.cp?action=saveBank";
						document.forms[0].submit();
					}
			}
			
		
			function resetFilters(){
				document.forms[0]['bankDetail.id'].value = 0;
				document.forms[0]['bankDetail.account'].value = "";
				document.forms[0]['bankDetail.bankName'].value = "";
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
					key="nrega.home" /></a> &gt; <span>Bank Master</span></td>
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
				<td width="100%"><html:form action="EditBank" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">Bank Master </span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">

										<tr>
											<td class="form-row-text">Bank Name :</td>
											<td class="form-row-input"><html:text
												property="bankDetail.bankName" size="45"
												maxlength="45" styleId="searchProjectName"
												onkeyup="this.value=this.value.toUpperCase();"
												onfocus="this.value=this.value.toUpperCase();"
												onblur="this.value=this.value.toUpperCase();" />
												<html:hidden property="bankDetail.id" />
												</td>
											<td class="form-row-text">Account No:</td>
											<td class="form-row-input"><html:text
												property="bankDetail.account" size="20"
												maxlength="45" styleId="searchProjectName"
												onkeyup="this.value=this.value.toUpperCase();"
												onfocus="this.value=this.value.toUpperCase();"
												onblur="this.value=this.value.toUpperCase();" />
												</td>	
											<td class="form-row-text">Branch:</td>
											<td class="form-row-input"><html:text
												property="bankDetail.branch" size="20"
												maxlength="45" styleId="searchProjectName"
												onkeyup="this.value=this.value.toUpperCase();"
												onfocus="this.value=this.value.toUpperCase();"
												onblur="this.value=this.value.toUpperCase();" />
												</td>													
											<td class="form-row-text">Status:</td>
											<td class="form-row-input"><html:select
												property="bankDetail.status"
												style="width:100px;">
												<html:option value="ACTIVE">ACTIVE</html:option>
												<html:option value="IN-ACTIVE">IN-ACTIVE</html:option>
											</html:select></td>
												
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
										name="bankForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="bankList"
										name="bankForm">
										<bean:message key="no.search.projects" />
									</logic:empty> <logic:notEmpty property="bankList"
										name="bankForm">
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
													<td colspan="8"><display:table id="bankDetailId"
														name="searchResult" requestURI="EditBank.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="Bank Id" property="id"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Bank Name"
															property="bankName" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Status"
															property="status" style="width: 13%"
															sortable="true" headerClass="grid-heading-row" ></display:column>			
														<display:column title=""
															href="EditBank.cp?action=setBank&"
															paramId="id" paramProperty="id"
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