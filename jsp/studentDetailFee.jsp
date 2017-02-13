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
				document.forms[0].action="<%=request.getContextPath()%>/StudentFeeSearch.cp?action=getListOfStudents";
				document.forms[0].submit();
			}
			
			function resetFilters(){
				document.forms[0]['searchStudentDetails.studentName'].value = "";
				document.forms[0]['searchStudentDetails.rollNo'].value = "";
				document.forms[0]['searchStudentDetails.admissionNo'].value = "";
				document.forms[0]['searchStudentDetails.dobString'].value = "";
			}
</script>

	<table width="999" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<!-- Header Part Start -->
		<tr>
			<td>
				<%@include file="/jsp/common/headerLinks.jsp"%>
			</td>
		</tr>
		<!-- Header Part End -->
		<tr>

			<!-- Menu Part Start -->
			<td class="menu-bg">
				<%@include file="/jsp/common/menu.jsp"%>
			</td>
			<!-- Menu Part End -->
		</tr>
		<tr>
			<td class="padding">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="3" class="bread-crumb">
							<a href="<%=request.getContextPath()%>/Home.cp"><bean:message key="nrega.home" /></a> &gt;
							<span>Student Fees</span>
						</td>
					</tr>
					<tr>
						<td width="100%">
							<html:form action="StudentFeeSearch" method="post">
								<table width="100%" border="0" align="center" cellpadding="0"
									cellspacing="1" class="form-border">
									<tr>
										<td valign="middle" class="padding-btm-ten">
											<table width="100%" border="0" cellspacing="1"
												cellpadding="0" class="form-border">
												<tr>
													<td colspan="10" class="form-heading">
														<span class="search-heading"><bean:message
																key="projectSearch.heading" /> </span>
													</td>
												</tr>
												<tr>
													<td class="form-row-text" nowrap>
														<bean:message key="projectSearch.projectName" />
														:
													</td>
													<td class="form-row-input" nowrap>
														<html:text property="searchStudentDetails.studentName"
															onkeypress="SubmitOnEnter(event);"
															styleId="searchProjectName" size="20" />
													</td>
													<td class="form-row-text" nowrap>
														Admission No:
													</td>
													<td class="form-row-input" nowrap>
														<html:text property="searchStudentDetails.admissionNo"
															onkeypress="SubmitOnEnter(event);"
															styleId="searchProjectName" size="15" />
													</td>
													<td class="form-row-text" nowrap>
														<bean:message key="projectSearch.rollNo" />
														:
													</td>
													<td class="form-row-input" nowrap>
														<html:text property="searchStudentDetails.rollNo"
															onkeypress="SubmitOnEnter(event);"
															styleId="searchProjectName" size="15" />
													</td>
													<td class="form-row-text" nowrap>
														<bean:message key="projectSearch.dateOfBirth" />
														:
													</td>
													<td class="form-row-input" nowrap>
														<html:text property="searchStudentDetails.dobString"
															onkeypress="SubmitOnEnter(event);"
															styleId="searchProjectName" size="10" />
														<a	href="#" id="beneficiaryDOB" name="beneficiaryDOB"> <img
													src='images/calendar.gif'
													onclick="calendar.select(document.forms[0]['searchStudentDetails.dobString'],'searchStudentDetails.dobString','dd/MM/yyyy');return false;" />
														</a>	
													</td>
													<td class="form-row-text" nowrap>
														<bean:message key="projectSearch.class" />
														:
													</td>
													<td class="form-row-input">
														<html:select
															property="searchStudentDetails.classDetails.classId"
															style="width:80px;">
															<html:option value="-999" >All</html:option>
															<html:optionsCollection property="classList"
																label="classWithSectionName" value="classId" />
														</html:select>
													</td>
												</tr>
												<tr>
													<td colspan="10" class="form-row-text">
														<table width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tr>
																<td align="right">
																	<div id="button2">
																		<ul>
																			<li class="buttonrightcrnr reset"
																				onmouseover="this.className='buttonhighlight reset'"
																				onmouseout="this.className='buttonrightcrnr reset'"
																				title="Reset">
																				<a href="javascript:resetFilters();"><bean:message
																						key="nregs.reset" /> </a>
																			</li>
																			<li class="buttonrightcrnr search-but"
																				onmouseover="this.className='buttonhighlight search-but'"
																				onmouseout="this.className='buttonrightcrnr search-but'"
																				onkeypress="SubmitOnEnter(event);"
																				title="Search Project">
																				<a href="javascript:submitSearch();"><bean:message
																						key="projectSearch.button.searchProject" /> </a>
																			</li>
																		</ul>
																	</div>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr class="toggle-section0">
										<td>
											<bean:define id="pageSizeList" name="studentDetailForm"
												property="pageSizeList" toScope="page" />
											<logic:empty property="studentList" name="studentDetailForm">
												<bean:message key="no.search.projects" />
											</logic:empty>
											<logic:notEmpty property="studentList"
												name="studentDetailForm">
												<tr>
													<td class="padding-btm-ten">
														<table width="100%" border="0" cellspacing="1"
															cellpadding="0">
															<tr>
																<td colspan="5" class="form-sub-heading">
																	<table width="100%" border="0" cellspacing="0"
																		cellpadding="0">
																		<tr>
																			<td align="left">
																				<span class="search-sub"><bean:message
																						key="projectManagement.searchResults" />
																				</span>
																			</td>
																			<td align="right">
																				<a href="#" class="toggle-link" toggleIndex="1" />
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>
															<tr class="toggle-section1">
																<td>
																	<display:table id="studentListTableId" 
																		name="searchResult" 
																		requestURI="StudentFeeSearch.cp?action=getListOfStudents"
																		pagesize="10" sort="list" defaultsort="1"
																		defaultorder="descending" excludedParams="action"
																		class="padding-btm-ten form-border display-table-header">
																		<display:column 
																			title="Reg Serial No" 
																			property="bookSerialNo" 
																			href="InvoiceDetail.cp?action=getFees&"
																			property="studentId" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>
																		<display:column 
																			titleKey="beneficiaryregisteration.firstname" 
																			property="admissionNo" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>																			
																		<display:column
																			titleKey="beneficiaryregisteration.beneficiarybarcodeid"
																			property="studentName"
																			href="InvoiceDetail.cp?action=getFees&"
																			paramId="studentId" paramProperty="studentId"
																			style="width: 12%;" sortable="true"
																			headerClass="grid-heading-row"
																			class="padding link-color"></display:column>
																			<display:column 
																			title="Last Name" 
																			property="lastName" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>	
																		<display:column 
																			title="Class - Section" 
																			property="classDetails.classWithSectionName" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>	
																		<display:column 
																			title="Date Of Birth" 
																			property="dobString" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>
																		<display:column 
																			title="Date Of Joining" 
																			property="dojString" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>
																		<display:column 
																			titleKey="beneficiaryregisteration.firstname" 
																			property="fatherName" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>
																		<display:column 
																			titleKey="beneficiaryregisteration.firstname" 
																			property="motherName" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>																																																																												
																		<display:column 
																			titleKey="beneficiaryregisteration.firstname" 
																			property="guardianName" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>																																																																												
																		<display:column 
																			titleKey="beneficiaryregisteration.firstname" 
																			property="mobile" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>																																																																												

																	</display:table>
																	</td></tr><tr><td>

																</td>
															</tr>
														</table>
											</logic:notEmpty>
										</td>
									</tr>
								</table>
							</html:form>
						</td>
					</tr>
				</table>
				<!-- Grid Part End -->
			</td>
		</tr>
		<tr>
			<!-- Footer Part Start -->
			<td>
				&nbsp;
			</td>
			<!-- Footer Part End -->
		</tr>
	</table>
</body>
</html>
