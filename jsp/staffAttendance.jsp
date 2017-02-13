<%-- Generic Includes--%>
<%@include file="/jsp/common/commonHeader.jsp"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<% response.setHeader("Cache-Control","no-cache");%>
<%response.setDateHeader ("Expires", 0); //prevents caching at the proxy server%>
<body onload="validate();">
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
				document.forms[0].action="<%=request.getContextPath()%>/StaffAttendance.cp?action=getListOfStaff";
				document.forms[0].submit();
				}
			}
			function validate()
			{
			    document.forms[0]['searchStaffDetails.firstName'].value = "";
				document.forms[0]['searchStaffDetails.staffNo'].value = "";
				document.forms[0]['attendanceDateString'].value = "";
				
			}
			
			function submitAttendanceForm(){
				document.forms[0].action="<%=request.getContextPath()%>/StaffAttendance.cp?action=persistStaffAttendance";
				document.forms[0].submit();
			}
			
			function resetFilters(){
			    document.forms[0]['searchStaffDetails.firstName'].value = "";
				document.forms[0]['searchStaffDetails.staffNo'].value = "";
				document.forms[0]['attendanceDateString'].value = "";
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
							<span>Staff Attendance</span>
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
							<html:form action="StaffAttendance" method="post" enctype="multipart/form-data">
								<table width="100%" border="0" align="center" cellpadding="0"
									cellspacing="1" class="form-border">
									<tr>
										<td valign="middle" class="padding-btm-ten">
											<table width="100%" border="0" cellspacing="1"
												cellpadding="0" class="form-border">
												<tr>
													<td colspan="8" class="form-heading">
														<span class="search-heading"><bean:message
																key="staffDetails.heading" /> </span>
													</td>
												</tr>
												<tr>
													<td class="form-row-text">
														<bean:message key="staffDetails.firstName" />
														:
													</td>
													<td class="form-row-input">
														<html:text property="searchStaffDetails.firstName"
															onkeypress="SubmitOnEnter(event);"
															styleId="searchProjectName" size="30" />
													</td>
													<td class="form-row-text">
														<bean:message key="staffDetails.staffNo" />
														:
													</td>
													<td class="form-row-input">
														<html:text property="searchStaffDetails.staffNo"
															onkeypress="SubmitOnEnter(event);"
															styleId="searchProjectName" size="15" />
													</td>
													<td class="form-row-text">
														Attendance Date:
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
														Department:
													</td>
													<td class="form-row-input">
														<html:text
															property="searchStaffDetails.dept"
															size="25" maxlength="45" />
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
																						key="staffDetails.heading" /> </a>
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
											<bean:define id="pageSizeList" name="staffAttendanceForm"
												property="pageSizeList" toScope="page" />
											<logic:empty property="staffAttendances" name="staffAttendanceForm">
												<bean:message key="no.search.staffs" />
											</logic:empty>
											<logic:notEmpty property="staffAttendances"
												name="staffAttendanceForm">
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
																			<th class="grid-heading-row">Staff No</th>
																			<th class="grid-heading-row">Staff Name</th>
																			<th class="grid-heading-row">Department</th>
																			<th class="grid-heading-row">Attendance Date</th>																			
																			<th class="grid-heading-row">Attendance Status</th>									
																			<th class="grid-heading-row">Attendance Reason</th>
																			<th class="grid-heading-row">Approve?</th>																												
																		</tr>
																		<logic:iterate id="staffAttendance" name="staffAttendanceForm" property="staffAttendances" indexId="i" >
																		<tr>
																		<td class="grid-row" align="left" >
																			<bean:write name="staffAttendance" property="staffDetails.staffNo" />
																			<html:hidden name="staffAttendance" property="staffDetails.staffId" indexed="true" />
																		</td>
																		<td class="grid-row" align="left" >
																			<bean:write name="staffAttendance" property="staffDetails.firstName"  />
																		</td>
																		<td class="grid-row">
																			<bean:write name="staffAttendance" property="staffDetails.dept"  />
																		</td>
																		<td class="grid-row">
																			<bean:write name="staffAttendance" property="attendanceDateString" />
																			<html:hidden name="staffAttendance" property="attendanceDateString" indexed="true" />
																		</td>
																		<td class="grid-row">
																			<html:select name="staffAttendance" property="attendanceStatus" indexed="true" style="width:150px;">
																				<html:option value="Present">Present</html:option>
																				<html:option value="Absent">Absent</html:option>
																				<html:option value="Half-Day">Half Day</html:option>
																				<html:option value="Others">Others</html:option>
																			</html:select>
																		</td>
																		<td class="grid-row">
																			<html:text name="staffAttendance" property="attendanceReason" indexed="true" maxlength="45" size="25" />
																			<html:hidden name="staffAttendance" property="attendanceId" indexed="true" />
																		</td>
																		<td class="grid-row">
																			<html:select name="staffAttendance" property="isApproved" indexed="true" style="width:60px;">
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
																	title='<bean:message key = "staffDetails.updateStaff"/>'>
																	<a href="javascript:submitAttendanceForm();"
																		onkeypress="if(event.keyCode == 32) {submitAttendanceForm();}">Update </a>
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
