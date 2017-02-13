<%-- Generic Includes--%>
<%@include file="/jsp/common/commonHeader.jsp"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<% response.setHeader("Cache-Control","no-cache");%>
<%response.setDateHeader ("Expires", 0); //prevents caching at the proxy server%>

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
					alert("Attendance Date is Required. Please enter attendance date");
					document.forms[0]['attendanceDateString'].focus();
				}else{
				document.forms[0].action="<%=request.getContextPath()%>/StudentAttendance.cp?action=getListOfStudents";
				document.forms[0].submit();
				}
			}
			
			function submitAttendanceForm(){
				document.forms[0].action="<%=request.getContextPath()%>/StudentAttendance.cp?action=persistStudentAttendance";
				document.forms[0].submit();
			}
			
			function resetFilters(){
				document.forms[0]['searchStudentDetails.studentName'].value = "";
				document.forms[0]['searchStudentDetails.rollNo'].value = "";
				document.forms[0]['studentAttendance.attendanceDateString'].value = "";
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
							<span>Student Attendance</span>
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
							<html:form  action="StudentAttendance" method="post">
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
														<bean:message key="projectSearch.projectName" />
														:
													</td>
													<td class="form-row-input">
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
														<bean:message key="studentAttendance.attendanceDateString" />:
														<span class="required">*</span>
													</td>
													<td class="form-row-input" nowrap>
														<html:text property="attendanceDateString"
															onkeypress="SubmitOnEnter(event);"
															styleId="searchProjectName" size="15" />
																		<img src='images/calendar.gif'
																			onclick="calendar.select(document.forms[0]['attendanceDateString'],'attendanceDateString','dd/MM/yyyy');return false;" />
																	</a>
													</td>
													<td class="form-row-text" nowrap>
														<bean:message key="projectSearch.class" />
														:
													</td>
													<td class="form-row-input" nowrap>
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
											<bean:define id="pageSizeList" name="studentAttendanceForm"
												property="pageSizeList" toScope="page" />
											<logic:empty property="studentAttendances" name="studentAttendanceForm">
												<bean:message key="no.search.projects" />
											</logic:empty>
											<logic:notEmpty property="studentAttendances"
												name="studentAttendanceForm">
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
																	<table border="0" cellpadding="0" cellspacing="0" width="100%" class="padding-btm-ten form-border display-table-header">
																		<tr>
																			<th class="grid-heading-row">Admission No</th>
																			<th class="grid-heading-row">First Name</th>
																			<th class="grid-heading-row">Last Name</th>
																			<th class="grid-heading-row">Class - Section</th>
																			<th class="grid-heading-row">Attendance Date</th>																			
																			<th class="grid-heading-row">Attendance Status</th>									
																			<th class="grid-heading-row">Attendance Reason</th>
																			<th class="grid-heading-row">Approve?</th>																												
																		</tr>
																		<logic:iterate id="studentAttendance" name="studentAttendanceForm" property="studentAttendances" indexId="i" >
																		<tr>
																		<td class="grid-row" align="left" >
																			<bean:write name="studentAttendance" property="studentDetails.admissionNo" />
																			<html:hidden name="studentAttendance" property="studentDetails.studentId" indexed="true" />
																		</td>
																		<td class="grid-row" align="left" >
																			<bean:write name="studentAttendance" property="studentDetails.studentName"  />
																		</td>
																		<td class="grid-row" align="left" >
																			<bean:write name="studentAttendance" property="studentDetails.lastName"  />
																		</td>
																		<td class="grid-row" width="15%">
																			<bean:write name="studentAttendance" property="studentDetails.classDetails.classWithSectionName"  />
																		</td>
																		<td class="grid-row">
																			<bean:write name="studentAttendance" property="absentDateString" />
																			<html:hidden name="studentAttendance" property="absentDateString" indexed="true" />
																		</td>
																		<td class="grid-row">
																			<html:select name="studentAttendance" property="attendanceStatus" indexed="true" style="width:150px;">
																				<html:option value="Present">Present</html:option>
																				<html:option value="Absent">Absent</html:option>
																				<html:option value="Half-Day">Half Day</html:option>
																				<html:option value="Others">Others</html:option>
																			</html:select>
																		</td>
																		<td class="grid-row">
																			<html:text name="studentAttendance" property="attendanceReason" indexed="true" maxlength="45" size="25" />
																			<html:hidden name="studentAttendance" property="attendanceId" indexed="true" />
																		</td>
																		<td class="grid-row">
																			<html:select name="studentAttendance" property="isApproved" indexed="true" style="width:60px;">
																				<html:option value="No">No</html:option>
																				<html:option value="Yes">Yes</html:option>
																				<html:option value="Pending">Pending</html:option>
																			</html:select>
																		</td>
																		</tr>
																		</logic:iterate>
																	</table>
																	</td></tr><tr><td>

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
																			key="studentAttendance.updateStudent" /> </a>
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
