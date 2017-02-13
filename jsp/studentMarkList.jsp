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
				document.forms[0].action="<%=request.getContextPath()%>/MarkList.cp?action=getListOfMarks";
				document.forms[0].submit();
			}
			
			function submitAttendanceForm(){
				document.forms[0].action="<%=request.getContextPath()%>/MarkList.cp?action=persistStudentMarks";
				document.forms[0].submit();
			}
			
			function getExams(){
				document.forms[0].action="<%=request.getContextPath()%>/MarkList.cp?action=getTerms";
				document.forms[0].submit();
			}
			
			function resetFilters(){
				document.forms[0]['searchStudentDetails.studentName'].value = "";
				document.forms[0]['searchStudentDetails.rollNo'].value = "";
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
							<span>Mark List</span>
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
							<html:form action="MarkList" method="post">
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
														<bean:message key="projectSearch.projectName" />:
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
														<bean:message key="projectSearch.class" />:
													</td>
													<td class="form-row-input">
														<html:select
															property="searchStudentDetails.classDetails.classId"
															styleId="searchProjectName" 
															onchange="javascript:getExams();" style="width:100px;" >															
															<html:optionsCollection property="classList"
																label="classWithSectionName" value="classId" />
														</html:select>
													</td>
													
													<td class="form-row-text">
														Term:<span class="required">*</span>
													</td>
													<td class="form-row-input">
													<html:select
															property="selectedExamId"
															styleId="searchProjectName" style="width:120px;">
															<html:optionsCollection property="examList"
																label="examType" value="examId" />
														</html:select>
													</td>
													<td class="form-row-text">
														OrderBy:
													</td>
													<td class="form-row-input">
														<html:select property="searchStudentDetails.orderBy"
															onkeypress="SubmitOnEnter(event);"
															styleId="searchProjectName" style="width:120px;">
															<html:option value="">--Select--</html:option>
															<html:option value="model.bookSerialNo asc">Book Reg No Asc</html:option>
															<html:option value="model.bookSerialNo desc">Book Reg No Desc</html:option>
															<html:option value="model.admissionNo asc">Admission Asc</html:option>
															<html:option value="model.admissionNo desc">Admission Desc</html:option>
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
											<bean:define id="pageSizeList" name="markDetailForm"
												property="pageSizeList" toScope="page" />
											<logic:empty property="markDetails" name="markDetailForm">
												<bean:message key="no.search.projects" />
											</logic:empty>
											<logic:notEmpty property="markDetails"
												name="markDetailForm">
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
																			<th class="grid-heading-row">Book Reg No</th>
																			<th class="grid-heading-row">Student Name</th>
																			<th class="grid-heading-row">Last Name</th>
																			<th class="grid-heading-row">Admission No</th>
																			<th class="grid-heading-row">Class - Section</th>
																			<th class="grid-heading-row">Total</th>
																			<logic:iterate id="subjectDetail" name="markDetailForm" property="subjectList" indexId="i" >
																				<th class="grid-heading-row"><bean:write name="subjectDetail" property="subjectName"/></th>	
																			</logic:iterate>
																																						
																		</tr>
																		<logic:iterate id="subjectWiseMark" name="markDetailForm" property="markDetails" type="java.util.ArrayList" indexId="i" >
																			<tr>
																			<logic:iterate id="markDetail" name="subjectWiseMark" indexId="j" >
																				<% if(j==0){%>
																				<td class="grid-row"><bean:write name="markDetail" property="studentDetails.bookSerialNo"/></td>		
																				<td class="grid-row"><bean:write name="markDetail" property="studentDetails.studentName"/></td>
																				<td class="grid-row"><bean:write name="markDetail" property="studentDetails.lastName"/></td>
																				<td class="grid-row"><bean:write name="markDetail" property="studentDetails.admissionNo"/></td>
																				<td class="grid-row"><bean:write name="markDetail" property="studentDetails.classDetails.classWithSectionName"/></td>
																				<td class="grid-row"><bean:write name="markDetail" property="studentDetails.total"/></td>
																				<html:hidden name="markDetail" property="studentDetails.studentId" indexed="true" />
																				<html:hidden name="markDetail" property="studentDetails.classDetails.classId" indexed="true" />
																				<%}%>
																				<td class="grid-row">
																					<html:hidden name="markDetail" property="markId" indexed="true" />
																					<html:hidden name="markDetail" property="examDetails.examId" indexed="true" />
																					<html:hidden name="markDetail" property="classDetails.classId" indexed="true" />
																					<html:text name="markDetail" property="markObtained" size="5" maxlength="6" indexed="true"/>
																				</td>
																				
																			</logic:iterate>	
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
																			key="markDetail.updateMark" /> </a>
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
