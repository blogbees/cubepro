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
				document.forms[0].action="<%=request.getContextPath()%>/StudentHomeWork.cp";
				document.forms[0].submit();
			}
			
			function saveForm(){
				var termName = document.forms[0]['studentHomeWorkDetail.dateOfAssignment'];
					if(IfNullorEmpty(termName.value)){
						alert("Enter the HomeWork Assigned date");
						termName.focus();
					}else{
						document.forms[0].action="<%=request.getContextPath()%>/StudentHomeWork.cp?action=saveStudentHomeWork";
						document.forms[0].submit();
					}
			}
			
		
			function resetFilters(){
				document.forms[0]['studentHomeWorkDetail.studentHomeWorkId'].value = 0;
				document.forms[0]['studentHomeWorkDetail.dateOfAssignment'].value = "";
				document.forms[0]['studentHomeWorkDetail.generalComments'].value = "";
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
					key="nrega.home" /></a> &gt; <span>StudentHomeWork Information</span></td>
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
				<td width="100%"><html:form action="StudentHomeWork" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">StudentHomeWork Information</span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">
										<tr>
											<td class="form-row-text">Class:</td>
											<td class="form-row-input">
											<html:select
													property="studentHomeWorkDetail.classDetail.classId"
													styleId="searchProjectName" 
													style="width:100px;" >															
															<html:optionsCollection property="classDetails"
																label="classWithSectionName" value="classId" />
											</html:select>
												<html:hidden property="studentHomeWorkDetail.studentHomeWorkId" />
											</td>
											<td class="form-row-text">
											Admission No:</td>
											<td class="form-row-input">
												<html:text
												property="studentHomeWorkDetail.admissionNo" size="20"
												maxlength="45" styleId="searchProjectName" />
											</td>
										</tr>
										<tr>
											<td class="form-row-text">Date Of Assignment:</td>
											<td class="form-row-input">
											<html:text
												property="studentHomeWorkDetail.dateOfAssignment" size="15"
												maxlength="11" styleId="searchProjectName" />
												<a href="#" id="doaId" name="doaId">
													<img src='images/calendar.gif'
														onclick="calendar.select(document.forms[0]['studentHomeWorkDetail.dateOfAssignment'],'studentHomeWorkDetail.dateOfAssignment','dd/MM/yyyy');return false;" />
												</a>
											</td>
											<td class="form-row-text">Date To Complete:</td>
											<td class="form-row-input">
											<html:text
												property="studentHomeWorkDetail.dateToComplete" size="15"
												maxlength="11" styleId="searchProjectName" />
												<a href="#" id="doaId" name="doaId">
													<img src='images/calendar.gif'
														onclicsk="calendar.select(document.forms[0]['studentHomeWorkDetail.dateToComplete'],'studentHomeWorkDetail.dateToComplete','dd/MM/yyyy');return false;" />
												</a>
											</td>
										</tr>
										<tr>
											<%--<td class="form-row-text">HomeWork Name-Desc:</td>
											<td class="form-row-input">
												<html:select
													property="studentHomeWorkDetail.homework.homeWorkId"
													styleId="searchProjectName" 
													style="width:200px;" >															
															<html:optionsCollection property="homeWorkDetails"
																label="homeWorkNameWithDesc" value="homeWorkId" />
											</html:select>
											</td> --%>
										<td class="form-row-text" >
										HomeWork Details:
										</td>
										<td align="left" class="form-row-input" colspan="3">
										<html:textarea
												property="studentHomeWorkDetail.generalComments" rows="10" cols="10"
												 style="width:500px;" />
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
										name="studentHomeWorkForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="studentHomeWorkList"
										name="studentHomeWorkForm">
										
									</logic:empty> <logic:notEmpty property="studentHomeWorkList"
										name="studentHomeWorkForm">
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
													<td colspan="8"><display:table id="studentHomeWorkId"
														name="searchResult" requestURI="StudentHomeWork.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="StudentHomeWork Id" property="studentHomeWorkId"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Class"
															property="classDetail.classWithSectionName" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Student Admission #"
															property="admissionNo" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<%--<display:column title="HomeWork Name"
															property="homework.homeWorkName" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="HomeWork Desc"
															property="homework.homeWorkDesc" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>--%>
														<display:column title="Date Of Assignment"
															property="dateOfAssignment" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
															<display:column title="Date To Complete"
															property="dateToComplete" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Comments"
															property="generalComments" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title=""
															href="StudentHomeWork.cp?action=setStudentHomeWork&"
															paramId="studentHomeWorkId" paramProperty="studentHomeWorkId"
															value="Edit" style="width: 13%" sortable="true"
															headerClass="grid-heading-row" class="padding link-color"></display:column>	
														<display:column title=""
															href="StudentHomeWork.cp?action=deleteStudentHomeWork&"
															paramId="studentHomeWorkId" paramProperty="studentHomeWorkId"
															value="Delete" style="width: 13%" sortable="true"
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