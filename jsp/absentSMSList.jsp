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
				if(document.forms[0]['attendanceDateString'].value.length == 0){
					alert('<bean:message key="studentAttendance.attendanceDateReq" />');
					document.forms[0]['attendanceDateString'].focus();
				}else{
				document.forms[0].action="<%=request.getContextPath()%>/AbsentSMS.cp?action=getListOfStudents";
				document.forms[0].submit();
				}
			}
			
			function submitAttendanceForm(){
				document.forms[0].action="<%=request.getContextPath()%>/AbsentSMS.cp?action=getAbsentSMS";
				document.forms[0].submit();
			}
			
			function resetFilters(){
				document.forms[0]['searchStudentDetails.studentName'].value = "";
				document.forms[0]['searchStudentDetails.admissionNo'].value = "";
				document.forms[0]['attendanceDateString'].value = "";
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
							<span>Absent SMS</span>
						</td>
					</tr>
					<html:messages id="msg" message="true" />
						<logic:messagesPresent message="true">
							<tr>
								<td colspan="8" >
								<script language="javascript">
												alert('<bean:write name="msg" />');
												</script>
							<span class="success"><bean:write name="msg" />
							</span>
								</td>
							</tr>
						</logic:messagesPresent>
					
					<tr>
						<td width="100%">
							<html:form action="AbsentSMS" method="post">
								<table width="100%" border="0" align="center" cellpadding="0"
									cellspacing="1" class="form-border">
									<tr>
										<td valign="middle" class="padding-btm-ten">
											<table width="100%" border="0" cellspacing="1"
												cellpadding="0" class="form-border">
												<tr>
													<td colspan="8" class="form-heading">
														<span class="search-heading"><bean:message
																key="projectSearch.heading" /> </span>
													</td>
												</tr>
												<tr>
													<td class="form-row-text">
														<bean:message key="projectSearch.projectName" />
														:
													</td>
													<td class="form-row-input">
														<html:text property="searchStudentDetails.studentName"
															onkeypress="SubmitOnEnter(event);"
															styleId="searchProjectName" size="30" />
													</td>
													<td class="form-row-text">
														Admission No
														:
													</td>
													<td class="form-row-input">
														<html:text property="searchStudentDetails.admissionNo"
															onkeypress="SubmitOnEnter(event);"
															styleId="searchProjectName" size="15" />
													</td>
													<td class="form-row-text">
														<bean:message key="studentAttendance.attendanceDateString" />:
														<span class="required">*</span>
													</td>
													<td class="form-row-input">
														<html:text property="attendanceDateString"
															onkeypress="SubmitOnEnter(event);"
															styleId="searchProjectName" size="15" />
														<a href="#" id="beneficiaryDOB" name="beneficiaryDOB">
																		<img src='images/calendar.gif'
																			onclick="calendar.select(document.forms[0]['attendanceDateString'],'attendanceDateString','dd/MM/yyyy');return false;" />
																	</a>															
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
													<td colspan="8" class="form-row-text">
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
											<bean:define id="pageSizeList" name="absentSMSForm"
												property="pageSizeList" toScope="page" />
											<logic:empty property="studentAttendances" name="absentSMSForm">
												<bean:message key="no.search.projects" />
											</logic:empty>
											<logic:notEmpty property="studentAttendances"
												name="absentSMSForm">
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
															<tr class="toggle-section1">
																<td>
																<% int i = 0; %>
																		<display:table id="studentAttendanceListId" 
																		name="searchResult" 
																		requestURI="AbsentSMS.cp?action=getListOfStudents"
																		pagesize="10000" sort="list" defaultsort="2"
																		defaultorder="descending" excludedParams="action"
																		class="padding-btm-ten form-border display-table-header">
																		<display:column 
																			title="Book Reg No" 
																			property="studentDetails.bookSerialNo" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>
																		<display:column 
																			title="Admission No" 
																			property="studentDetails.admissionNo" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>																			
																		<display:column
																			title="Student Name"
																			property="studentDetails.studentName"
																			href="StudentDetail.cp?action=getStudent&"
																			paramId="studentDetails.studentId" paramProperty="studentDetails.studentId"
																			style="width: 12%;" sortable="true"
																			headerClass="grid-heading-row"
																			class="padding link-color"></display:column>
																			<display:column 
																			title="Last Name" 
																			property="studentDetails.lastName" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>
																		<display:column 
																			title="Class - Section" 
																			property="studentDetails.classDetails.classWithSectionName" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>	
																		<display:column 
																			title="Date Of Birth" 
																			property="studentDetails.dobString" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>
																		<display:column 
																			title="Mobile" 
																			property="studentDetails.mobile" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>
																		<display:column 
																			title="Absent Date" 
																			property="absentDateString" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>																																																																												
																		<display:column 
																			title="Status" 
																			property="attendanceStatus" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>
																		<display:column 
																			title="Reason" 
																			property="attendanceReason" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>
																			<display:column 
																			title="Check" 
																			 style="width: 13%"
																			sortable="true" headerClass="grid-heading-row">
																			 <input type="checkbox" name="selectStudentForSMS" value="<%=i %>" />
																			</display:column>	
																		<% i++; %>																																																																									
																	</display:table>
																		</td>
																		</tr>
																		
																	</table>
																	</td></tr><tr><td class="grid-row" >
																																	</td>
															</tr>
															<tr><td class="grid-row" colspan="2" >
															<!-- SMS Text&nbsp;<html:textarea property="smsToBeSent" cols="55" rows="5" >
															</html:textarea>-->
															</td></tr>
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
																	title='<bean:message key = "studentAttendance.absentSMS"/>'>
																	<a href="javascript:submitAttendanceForm();"
																		onkeypress="if(event.keyCode == 32) {submitAttendanceForm();}"><bean:message
																			key="studentAttendance.absentSMS" /> </a>
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
