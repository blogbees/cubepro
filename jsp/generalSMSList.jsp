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
				document.forms[0].action="<%=request.getContextPath()%>/GeneralSMS.cp?action=getListOfStudents";
				document.forms[0].submit();
			}
			
			function submitAttendanceForm(){
				document.forms[0].action="<%=request.getContextPath()%>/GeneralSMS.cp?action=smsGeneral";
				document.forms[0].submit();
			}
			
			function toggle_checkboxes() {
			    if (!document.getElementById){ return; }
			    if (!document.getElementsByTagName){ return; }
			    var inputs = document.getElementsByTagName("input");
			    for(var x=0; x < inputs.length; x++) {
			        if (inputs[x].type == 'checkbox'){
			            inputs[x].checked = !inputs[x].checked;
			        }
			    }
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
							<span>Student General SMS</span>
						</td>
					</tr>
					<html:messages id="msg" message="true" />
								<logic:messagesPresent message="true">
				<tr>
					<td colspan="10"><span class="success">
					<script language="javascript">
												alert('<bean:write name="msg" />');
												</script>
					<bean:write
						name="msg" /> </span></td>
				</tr>
			</logic:messagesPresent>
					<tr>
						<td width="100%">
							<html:form action="GeneralSMS" method="post">
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
													<td class="form-row-text">
														Name:
													</td>
													<td class="form-row-input">
														<html:text property="searchStudentDetails.studentName"
															onkeypress="SubmitOnEnter(event);"
															styleId="searchProjectName" size="30" />
													</td>
													<td class="form-row-text">
														Admission No:
													</td>
													<td class="form-row-input">
														<html:text property="searchStudentDetails.admissionNo"
															onkeypress="SubmitOnEnter(event);"
															styleId="searchProjectName" size="15" />
													</td>
													<td class="form-row-text">
														DOB:
													</td>
													<td class="form-row-input">
														<html:text property="searchStudentDetails.dobString"
															onkeypress="SubmitOnEnter(event);"
															styleId="searchProjectName" size="15" />
															<a href="#" id="beneficiaryDOB" name="beneficiaryDOB">
																		<img src='images/calendar.gif'
																			onclick="calendar.select(document.forms[0]['searchStudentDetails.dobString'],'searchStudentDetails.dobString','dd/MM/yyyy');return false;" />
																	</a>															
															
													</td>
													<td class="form-row-text">
													PTA:
													</td>
													<td class="form-row-input">
														<html:select property="searchStudentDetails.pta"
															styleId="searchProjectName" style="width:79px;" >
													<html:option value="">--Select--</html:option>
													 <html:option value="ACTIVE">Active</html:option>
													 <html:option value="IN-ACTIVE">In-Active</html:option>
														</html:select>
													</td>
													<td class="form-row-text">
														<bean:message key="projectSearch.class" />
														:
													</td>
													<td class="form-row-input">
														<html:select
															property="searchStudentDetails.classDetails.classId"
															styleId="searchProjectName" style="width:100px;">
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
											<bean:define id="pageSizeList" name="generalSMSForm"
												property="pageSizeList" toScope="page" />
											<logic:empty property="studentList" name="generalSMSForm">
												<bean:message key="no.search.projects" />
											</logic:empty>
											<logic:notEmpty property="studentList"
												name="generalSMSForm">
												<tr>
													<td class="padding-btm-ten">
														<table width="100%" border="0" cellspacing="1"
															cellpadding="0">
															<tr>
																<td colspan="5" align="right">
																<a href="javascript:toggle_checkboxes();" id="checksel">Check/UnCheck All</a>
																</td>
															</tr>
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
															<% int i = 0; %>
															<tr class="toggle-section1">
																<td>
																	<display:table id="studentListTableId" 
																		name="searchResult" 
																		requestURI="GeneralSMS.cp?action=getListOfStudents"
																		pagesize="10000" sort="list" defaultsort="2"
																		defaultorder="descending" excludedParams="action"
																		class="padding-btm-ten form-border display-table-header">
																		<display:column 
																			title="Admission No" 
																			property="admissionNo" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>																			
																		<display:column
																			titleKey="beneficiaryregisteration.beneficiarybarcodeid"
																			property="studentName"
																			href="StudentDetail.cp?action=getStudent&"
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
																		<display:column 
																			title="Check" 
																			 style="width: 13%"
																			sortable="true" headerClass="grid-heading-row">
																			 <input type="checkbox" name="selectStudentForSMS" value="<%=i %>" />
																		</display:column>
																		<% i++; %>
																	</display:table>
																	</td></tr><tr><td>

																</td>
															</tr>
														<tr><td class="grid-row" colspan="2" >SMS Text&nbsp;<html:textarea property="smsToBeSent" cols="55" rows="5" ></html:textarea></td></tr>
														</table>
											</logic:notEmpty>
										</td>
									</tr>
														<tr>
										<td align="right">
											<table>
												<tr>
													<td align="right">
														<div id="button">
															<ul>

																<li class="buttonrightcrnr submit"
																	onmouseover="this.className='buttonhighlight submit'"
																	onmouseout="this.className='buttonrightcrnr submit'"
																	title='<bean:message key = "studentDetails.updateStudent"/>'>
																	<a href="javascript:submitAttendanceForm();"
																		onkeypress="if(event.keyCode == 32) {submitAttendanceForm();}"><bean:message
																			key="general.sendGenralSMS" /> </a>
																</li>
																<li class="buttonrightcrnr reset"
																	onmouseover="this.className='buttonhighlight reset'"
																	onmouseout="this.className='buttonrightcrnr reset'"
																	title='<bean:message key = "nregs.reset"/>'>
																	<a href="javascript:resetFields();"
																		onkeypress="if(event.keyCode == 32) {resetFields();}"><bean:message
																			key="nregs.reset" /> </a>
																</li>
															</ul>
														</div>
													</td>
												</tr>
											</table>
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
