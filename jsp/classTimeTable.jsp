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
			
			function validate(){
				if(IfNullorEmpty(document.forms[0].yearOfTimeTable.value)){
					alert("Enter year of time table");
					document.forms[0].yearOfTimeTable.focus();
					return false;
				}
					return true;
			}
			
			function submitSearch(){
				if(validate()){
					document.forms[0].action="<%=request.getContextPath()%>/ClassTimeTable.cp?action=getClassTimeTable";
					document.forms[0].submit();
				}
			}
			
			function saveForm(){
				if(validate()){
					document.forms[0].action="<%=request.getContextPath()%>/ClassTimeTable.cp?action=saveClassTimeTable";
					document.forms[0].submit();
				}
			}
			
			function resetFilters(){
				document.forms[0].yearOfTimeTable.value = "";
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
					key="nrega.home" /></a> &gt; <span>Class Time Table</span></td>
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
				<td width="100%"><html:form action="ClassTimeTable"
					method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading"><bean:message
										key="projectSearch.heading" /> </span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="50%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">
										<td class="form-row-text"><bean:message
											key="staffDetails.class" /> :</td>
										<td class="form-row-input"><html:select
											property="classId" styleId="searchProjectName">
											<html:optionsCollection property="classList"
												label="classWithSectionName" value="classId" />
										</html:select></td>
										<td class="form-row-text"><bean:message
											key="classtimetable.year" /><span class="required">*</span> :</td>
										<td class="form-row-input"><html:text
											property="yearOfTimeTable" maxlength="4" size="5" altKey="Y"></html:text>
										</td>
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
													onkeypress="SubmitOnEnter(event);" title="Search Project">
												<a href="javascript:submitSearch();"><bean:message
													key="buttonSearch" /> </a></li>
											</ul>
											</div>
											</td>
										</tr>
									</table>
									</td>
								</tr>

								<tr class="toggle-section0">
									<td>
									<bean:define id="pageSizeList"
										name="classTimeTableForm" property="pageSizeList"
										toScope="page" /> <logic:empty
										property="classTimeTableDetails" name="classTimeTableForm">
										<bean:message key="no.search.projects" />
									</logic:empty> <logic:notEmpty property="classTimeTableDetails"
										name="classTimeTableForm">
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
													<td>
													<table border="0" cellpadding="0" cellspacing="0"
														width="100%"
														class="padding-btm-ten form-border display-table-header">
														<%
															int day = 0;
														%>
														<tr>
															<th class="grid-heading-row">Day/Period</th>
															<th class="grid-heading-row">Period 1<br />
															Staff<br />
															Subject</th>
															<th class="grid-heading-row">Period 2<br />
															Staff<br />
															Subject</th>
															<th class="grid-heading-row">Period 3<br />
															Staff<br />
															Subject</th>
															<th class="grid-heading-row">Period 4<br />
															Staff<br />
															Subject</th>
															<th class="grid-heading-row">Period 5<br />
															Staff<br />
															Subject</th>
															<th class="grid-heading-row">Period 6<br />
															Staff<br />
															Subject</th>
															<th class="grid-heading-row">Period 7<br />
															Staff<br />
															Subject</th>
															<th class="grid-heading-row">Period 8<br />
															Staff<br />
															Subject</th>

														</tr>
														<logic:iterate id="classTimeTableDetail" name="classTimeTableForm"
															property="classTimeTableDetails"
															type="com.cubepro.timetable.TimeTableDetails" indexId="i">
															<%
																if (day == 0 || day != classTimeTableDetail.getDay().intValue()) {
															%>
															<%
																if (day != 0) {
															%>
															</tr>
															<%
																}
															%>
															<tr>
																<td class="grid-row" align="center"><b><bean:write
																	name="classTimeTableDetail" property="dayValue" /></b></td>
																<%
																	}
																%>
																<td class="grid-row"><html:select name="classTimeTableDetail"
																	property="staffDetailsByStaffId.staffId" indexed="true"
																	style="width:80px;">
																	<html:optionsCollection property="staffList"
																		label="firstName" value="staffId" />
																</html:select> <html:select name="classTimeTableDetail"
																	property="subjectDetails.subjectId" indexed="true"
																	style="width:80px;">
																	<html:optionsCollection property="subjectList"
																		label="subjectName" value="subjectId" />
																</html:select></td>
																<%
																	day = classTimeTableDetail.getDay().intValue();
																%>
																<html:hidden name="classTimeTableDetail" property="timeTableDetailId" indexed="true"/>
																<html:hidden name="classTimeTableDetail" property="day" indexed="true"/>
																<html:hidden name="classTimeTableDetail" property="year" indexed="true"/>
																<html:hidden name="classTimeTableDetail" property="classDetails.classId" indexed="true"/>
																<html:hidden name="classTimeTableDetail" property="createUserId" indexed="true"/>
														</logic:iterate>
													</table>
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
																<a href="javascript:saveForm();"
																	onkeypress="if(event.keyCode == 32) {saveForm();}"><bean:message
																	key="classtimetable.savetimetable" /> </a></li>
															</ul>
															</div>
															</td>
														</tr>
													</table>
													</td>
												</tr>
											</table>
									</logic:notEmpty></td>
								</tr>

							</table>
							</html:form>
							</td>
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
<%@page import="com.cubepro.timetable.TimeTableDetails"%>
</html>
