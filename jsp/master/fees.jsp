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
				document.forms[0].action="<%=request.getContextPath()%>/EditFees.cp";
				document.forms[0].submit();
			}
			
			function saveForm(){
			var saveStatus = true;
			if(IfNullorEmpty(document.forms[0]['feesMaster.feesType'].value)){
						alert("Enter Fees Type");
						saveStatus = false;
						document.forms[0]['feesMaster.feesType'].focus();
			}else if(IfNullorEmpty(document.forms[0]['feesMaster.feesName'].value)){
						alert("Enter Fees Name");
						saveStatus = false;
						document.forms[0]['feesMaster.feesName'].focus();
			}else if(IfNullorEmpty(document.forms[0]['feesMaster.feesAmt'].value)){
						alert("Enter Fees Amt");
						saveStatus = false;
						document.forms[0]['feesMaster.feesAmt'].focus();
			}
			if(saveStatus == true){
					document.forms[0].action="<%=request.getContextPath()%>/EditFees.cp?action=saveFees";
					document.forms[0].submit();
				}
			}
			
		
			function resetFilters(){
				document.forms[0]['feesMaster.id'].value = 0;
				document.forms[0]['feesMaster.feesType'].value = "";
				document.forms[0]['feesMaster.feesName'].value = "";
				document.forms[0]['feesMaster.feesAmt'].value = 0.0;
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
				<td colspan="3" class="bread-crumb"><a
					href="<%=request.getContextPath()%>/Home.cp"><bean:message
					key="nrega.home" /></a> &gt; <span>Fees Master</span></td>
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
				<td width="100%"><html:form action="EditFees" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">Fees Master </span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">

										<tr>
											<td class="form-row-text">Class:</td>
											<td class="form-row-input"><html:select
												property="feesMaster.classDetails.classId"
												styleId="searchProjectName">
												<html:optionsCollection property="classList"
													label="classWithSectionName" value="classId" />
											</html:select></td>

											<td class="form-row-text" nowrap>Fees Head Type :</td>
											<td class="form-row-input"><html:text
												property="feesMaster.feesType" size="20" maxlength="45"
												styleId="searchProjectName"
												onkeyup="this.value=this.value.toUpperCase();"
												onfocus="this.value=this.value.toUpperCase();"
												onblur="this.value=this.value.toUpperCase();" /></td>
											<td class="form-row-text" nowrap>Fees Name :</td>
											<td class="form-row-input"><html:text
												property="feesMaster.feesName" size="20" maxlength="45"
												styleId="searchProjectName"
												onkeyup="this.value=this.value.toUpperCase();"
												onfocus="this.value=this.value.toUpperCase();"
												onblur="this.value=this.value.toUpperCase();" /></td>
												</tr>
												<tr>
											<td class="form-row-text" nowrap>Fees Amount:</td>
											<td class="form-row-input"><html:text
												property="feesMaster.feesAmt" size="20" maxlength="45"
												styleId="searchProjectName"
												onkeyup="this.value=this.value.toUpperCase();"
												onfocus="this.value=this.value.toUpperCase();"
												onblur="this.value=this.value.toUpperCase();" /> <html:hidden
												property="feesMaster.id" /></td>
											<td class="form-row-text" nowrap>Status:</td>
											<td class="form-row-input"><html:select
												property="feesMaster.status" style="width:100px;">
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
									<td><bean:define id="pageSizeList" name="feesForm"
										property="pageSizeList" toScope="page" /> <logic:empty
										property="feesMasterList" name="feesForm">
										<bean:message key="no.search.projects" />
									</logic:empty> <logic:notEmpty property="feesMasterList" name="feesForm">
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
													<td colspan="8"><display:table id="feesMasterId"
														name="searchResult" requestURI="EditFees.cp" pagesize="10"
														sort="list" defaultsort="1" defaultorder="descending" excludedParams="action" excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="Fees Id" property="id"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
															<display:column title="Class-Section" property="classDetails.classWithSectionName"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Fees Type" property="feesType"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Fees Name" property="feesName"
															style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Fees Amount" property="feesAmt"
															style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Status" property="status"
															style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title=""
															href="EditFees.cp?action=setFees&" paramId="id"
															paramProperty="id" value="Edit" style="width: 13%"
															sortable="true" headerClass="grid-heading-row"
															class="padding link-color"></display:column>
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