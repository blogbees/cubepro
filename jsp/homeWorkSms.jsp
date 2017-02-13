<%-- Generic Includes--%>
<%@include file="/jsp/common/commonHeader.jsp"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<body onload="validate();">
	<!-- Sub menu js part is included -->
	<%@include file="/jsp/common/subMenuJs.jsp"%>

	<script language="JavaScript1.2"><!--
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
			   ToDate();
				document.forms[0].action="<%=request.getContextPath()%>/HomeWorkSMS.cp?action=getListOfStudents";
				document.forms[0].submit();
				//}
			}
			
			function submitAttendanceForm(){
				document.forms[0].action="<%=request.getContextPath()%>/HomeWorkSMS.cp?action=getHomeWorkSMS";
				document.forms[0].submit();
			}
			
			function resetFilters(){
				document.forms[0]['searchStudentDetails.studentName'].value = "";
				//document.forms[0]['searchStudentDetails.rollNo'].value = "";
				document.forms[0]['fromDate'].value = "";
				document.forms[0]['toDate'].value = "";
			}
			
			function validate()
			{
			  document.forms[0]['searchStudentDetails.studentName'].value = "";
			  document.forms[0]['searchStudentDetails.admissionNo'].value = "";
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
			
function ToDate()
{
 if((document.forms[0]['fromDate'].value=="" && document.forms[0]['toDate'].value!=""))
 {
  alert("Please Enter From Date");
 }
 else if((document.forms[0]['fromDate'].value!="" && document.forms[0]['toDate'].value ==""))
 {
  alert("Please Enter To Date");
 }
}
			
--></script>

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
							<span>HomeWork SMS</span>
						</td>
					</tr>
					<html:messages id="msg" message="true" />
						<logic:messagesPresent message="true">
							<tr>
								<td colspan="10" >
							<span class="success">
							<script language="javascript">
												alert('<bean:write name="msg" />');
												</script>
							<bean:write name="msg" />
							</span>
								</td>
							</tr>
						</logic:messagesPresent>
					
					<tr>
						<td width="100%">
							<html:form action="HomeWorkSMS" method="post">
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
														<table width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tr>
													<td class="form-row-text">
														HomeWork Assigned From Date:
														<span class="required">*</span>
													</td>
													<td class="form-row-input">
														<html:text property="fromDate"
															styleId="searchProjectName" size="10" />
														<a href="#" id="beneficiaryDOB" name="beneficiaryDOB">
																		<img src='images/calendar.gif'
																			onclick="calendar.select(document.forms[0]['fromDate'],'fromDate','dd/MM/yyyy');return false;" />
																	</a>															
													</td>
													<td class="form-row-text">
														HomeWork Assigned To Date:
														<span class="required">*</span>
													</td>
													<td class="form-row-input">
														<html:text property="toDate"
															styleId="searchProjectName" size="10" />
														<a href="#" id="beneficiaryDOB" name="beneficiaryDOB">
																		<img src='images/calendar.gif'
																			onclick="calendar.select(document.forms[0]['toDate'],'toDate','dd/MM/yyyy');return false;" />
																	</a>	
													</td>		
													
													<td class="form-row-text">
														<bean:message key="projectSearch.class" />
														:
													</td>
													<td class="form-row-input">
														<html:select
															property="searchStudentDetails.classDetails.classId"
															>
															<html:option value="-999" >All</html:option>
															<html:optionsCollection property="classList"
																label="classWithSectionName" value="classId" />
														</html:select>
													</td>														
													<td></td>
												</tr>
												<tr>
												<td class="form-row-text">
														<bean:message key="projectSearch.projectName" />
														:
													</td>
													<td class="form-row-input">
														<html:text property="searchStudentDetails.studentName"
															size="20" />
													</td>
													<td class="form-row-text">
														Admission No:
													</td>
													<td class="form-row-input">
														<html:text property="searchStudentDetails.admissionNo"
															size="10" />
													</td>
												</tr>
												
												</table></td></tr>
												<tr>
																<td align="right" class="form-row-text">
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
											<bean:define id="pageSizeList" name="homeWorkSMSForm"
												property="pageSizeList" toScope="page" />
											<logic:empty property="studentHomeWorkDetails" name="homeWorkSMSForm">
												<bean:message key="no.search.projects" />
											</logic:empty>
											<logic:notEmpty property="studentHomeWorkDetails"
												name="homeWorkSMSForm">
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
																	<table border="0" cellpadding="0" cellspacing="0" width="100%" class="padding-btm-ten form-border display-table-header">
																		<tr>
																			<th class="grid-heading-row">Admission No</th>
																			<th class="grid-heading-row">Student Name</th>
																			<th class="grid-heading-row">Class - Section</th>
																			<th class="grid-heading-row">Mobile #</th>
																			<th class="grid-heading-row">HomeWork</th>
																			<th class="grid-heading-row">Date Of Assignment</th>
																			<th class="grid-heading-row">Date Of Completion</th>
																			<th class="grid-heading-row">Check</th>																												
																		</tr>
								
																		<logic:iterate id="studentHomeWorkDetails" name="homeWorkSMSForm" property="studentHomeWorkDetails" indexId="i" type="com.cubepro.student.StudentDetails">
																		<tr>
																		<td class="grid-row" align="left" >
																			<bean:write name="studentHomeWorkDetails" property="admissionNo" />
																			<html:hidden name="studentHomeWorkDetails" property="studentId" indexed="true" />
																		</td>
																		<td class="grid-row" align="right" >
																			<bean:write name="studentHomeWorkDetails" property="studentName"  />
																		</td>
																		<td class="grid-row">
																			<bean:write name="studentHomeWorkDetails" property="classDetails.classWithSectionName"  />
																		</td>
																		<td class="grid-row">
																			<bean:write name="studentHomeWorkDetails" property="mobile"  />
																		</td>
																		<td class="grid-row">
																			<bean:write name="studentHomeWorkDetails" property="homeWorkDesc"  />
																		</td>
																		<td class="grid-row">
																			<bean:write name="studentHomeWorkDetails" property="homeWorkAssignedDate"  />
																		</td>
																		<td class="grid-row">
																			<bean:write name="studentHomeWorkDetails" property="homeWorkCompletionDate"  />
																		</td>
																		<td class="grid-row">
																			<input type="checkbox" name="selectStudentForSMS" value="<%=i %>" />
																		</td>
																		</tr>
																		</logic:iterate>
																	</table>
																	</td></tr><tr><td class="grid-row" >
																																	</td>
															</tr>
															<tr><td class="grid-row" colspan="2" >SMS Text&nbsp;<html:textarea property="smsToBeSent" cols="55" rows="5" ></html:textarea></td></tr>
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
																		onkeypress="if(event.keyCode == 32) {submitAttendanceForm();}">Send HomeWork SMS </a>
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