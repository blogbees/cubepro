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
				document.forms[0].action="<%=request.getContextPath()%>/EditCWS.cp";
				document.forms[0].submit();
			}
			
			function saveForm(){
				var maxMarks = document.forms[0]['subjectDetail.maxMarks'];
					if(IfNullorEmpty(maxMarks.value)){
						alert("Enter max marks");
						maxMarks.focus();
					}else{
						document.forms[0].action="<%=request.getContextPath()%>/EditCWS.cp?action=saveSubject";
						document.forms[0].submit();
					}
			}
			
		
			function resetFilters(){
				document.forms[0]['subjectDetail.subjectId'].value = 0;
				document.forms[0]['subjectDetail.maxMarks'].value = "";
				document.forms[0]['subjectDetail.passMarks'].value = "";
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
					key="nrega.home" /></a> &gt; <span>Class Wise Subject Master</span></td>
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
				<td width="100%"><html:form action="EditCWS" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">Subject Master </span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">

										<tr>
											<td class="form-row-text">Subject Name :</td>
											<td class="form-row-input">
											<html:select
												property="subjectDetail.subjectName"
												style="width:100px;">
												<html:optionsCollection property="subjects"
													label="subjectName" value="subjectName" />
											</html:select>
											</td>
											<td class="form-row-text">Max Marks:</td>
											<td class="form-row-input"><html:text
												property="subjectDetail.maxMarks" size="5" maxlength="5"
												styleId="searchProjectName"
												onkeyup="this.value=this.value.toUpperCase();"
												onfocus="this.value=this.value.toUpperCase();"
												onblur="this.value=this.value.toUpperCase();" /> <html:hidden
												property="subjectDetail.subjectId" /></td>
											<td class="form-row-text">Pass Marks:</td>
											<td class="form-row-input"><html:text
												property="subjectDetail.passMarks" size="5" maxlength="5"
												styleId="searchProjectName"/>
											</td>		
											<td class="form-row-text">Class:</td>
											<td class="form-row-input"><html:select
												property="subjectDetail.classDetails.classId"
												style="width:100px;">
												<html:optionsCollection property="classList"
													label="classWithSectionName" value="classId" />
											</html:select></td>
											<td class="form-row-text">Status:</td>
											<td class="form-row-input"><html:select
												property="subjectDetail.status"
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
										name="subjectDetailForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="subjectList"
										name="subjectDetailForm">
										<bean:message key="no.search.projects" />
									</logic:empty> <logic:notEmpty property="subjectList"
										name="subjectDetailForm">
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
													<td colspan="8"><display:table id="subjectDetailId"
														name="searchResult" requestURI="EditCWS.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="Subject Id" property="subjectId"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Subject Name"
															property="subjectName" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Max Marks" property="maxMarks"
															style="width: 12%;" sortable="true"
															headerClass="grid-heading-row" class="padding link-color"></display:column>
														<display:column title="Pass Marks" property="passMarks"
															style="width: 12%;" sortable="true"
															headerClass="grid-heading-row" class="padding link-color"></display:column>	
														<display:column title="Class-Section" property="classDetails.classWithSectionName"
															style="width: 12%;" sortable="true"
															headerClass="grid-heading-row" class="padding link-color"></display:column>
														<display:column title="Status"
															property="status" style="width: 13%"
															sortable="true" headerClass="grid-heading-row" ></display:column>			
														<display:column title=""
															href="EditCWS.cp?action=setSubject&"
															paramId="subjectId" paramProperty="subjectId"
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