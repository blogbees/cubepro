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
				document.forms[0].action="<%=request.getContextPath()%>/EditCWT.cp";
				document.forms[0].submit();
			}
			
			function saveForm(){
				
				document.forms[0].action="<%=request.getContextPath()%>/EditCWT.cp?action=saveExam";
				document.forms[0].submit();
			}
			
		
			function resetFilters(){
				document.forms[0]['examDetail.examId'].value = 0;
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
					key="nrega.home" /></a> &gt; <span>Class Wise Term Master</span></td>
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
				<td width="100%"><html:form action="EditCWT" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">Class Wise Term Master </span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">

										<tr>
											<td class="form-row-text">Class:</td>
											<td class="form-row-input"><html:select
												property="examDetail.classDetails.classId"
												style="width:100px;">
												<html:optionsCollection property="classList"
													label="classWithSectionName" value="classId" />
											</html:select></td>
											<td class="form-row-text">Term :</td>
											<td class="form-row-input">
											<html:select
												property="examDetail.examType"
												style="width:100px;">
												<html:optionsCollection property="terms"
													label="termName" value="termName" />
											</html:select>
											<html:hidden property="examDetail.examId" />
											</td>
											
											<td class="form-row-text">Status:</td>
											<td class="form-row-input"><html:select
												property="examDetail.status"
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
										name="examDetailForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="examList"
										name="examDetailForm">
										<bean:message key="no.search.projects" />
									</logic:empty> <logic:notEmpty property="examList"
										name="examDetailForm">
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
													<td colspan="8"><display:table id="examDetailId"
														name="searchResult" requestURI="EditCWT.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="Exam Id" property="examId"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Exam"
															property="examType" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Class-Section" property="classDetails.classWithSectionName"
															style="width: 12%;" sortable="true"
															headerClass="grid-heading-row" class="padding link-color"></display:column>
														<display:column title="Status"
															property="status" style="width: 13%"
															sortable="true" headerClass="grid-heading-row" ></display:column>			
														<display:column title=""
															href="EditCWT.cp?action=setExam&"
															paramId="examId" paramProperty="examId"
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