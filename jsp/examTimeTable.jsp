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
				document.forms[0].action="<%=request.getContextPath()%>/ExamTimeTable.cp?action=getExamTimeTable";
				document.forms[0].submit();
			}

			function validate(){
					var dob = document.forms[0]['examTimeTable.examDateString'];
					if(!IfNullorEmpty(dob.value)){
						if(isDate(dob.value, 'dd/MM/yyyy') == false){					
						jAlert(' <bean:message key="date.invalid"/> ! ')
						dob.focus();
						return false;
					}
				}
				return true;
			}			
			function saveForm(){
			  if(validate()){
				document.forms[0].action="<%=request.getContextPath()%>/ExamTimeTable.cp?action=saveExamTimeTable";
				document.forms[0].submit();
				}
			}
			
			function setValues(){
				document.forms[0].action="<%=request.getContextPath()%>/ExamTimeTable.cp?action=setDetails";
				document.forms[0].submit();
			}
			
			function setDetails(classId,examId,subjectId,examDate,timeFrom, timeTo, examTTId){
				document.forms[0]['examTimeTable.classDetails.classId'].value = classId;
				document.forms[0]['examTimeTable.examDetails.examId'].value = examId;
				document.forms[0]['examTimeTable.subjectDetails.subjectId'].value = subjectId;
				document.forms[0]['examTimeTable.examDateString'].value = examDate;
				document.forms[0]['examTimeTable.timeFrom'].value = timeFrom;
				document.forms[0]['examTimeTable.timeTo'].value = timeTo;
				document.forms[0]['examTimeTable.examTimeTableId'].value = examTTId; 
			}
			
			function resetFilters(){
				document.forms[0]['examTimeTable.examTimeTableId'].value = "";
				document.forms[0]['examTimeTable.examDateString'].value = "";
				document.forms[0]['examTimeTable.timeFrom'].value = "";
				document.forms[0]['examTimeTable.timeTo'].value = "";
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
				<td colspan="3" class="bread-crumb"><a
					href="<%=request.getContextPath()%>/Home.cp"><bean:message
					key="nrega.home" /></a> &gt; <span>Exam Time Table</span></td>
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
				<td width="100%"><html:form action="ExamTimeTable"
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
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">
										<td class="form-row-text"><bean:message
											key="staffDetails.class" /> :</td>
										<td class="form-row-input"><html:select
											property="examTimeTable.classDetails.classId"
											styleId="searchProjectName"
											onchange="javascript:setValues();">
											<html:optionsCollection property="classList"
												label="classWithSectionName" value="classId" />
										</html:select></td>
										<td class="form-row-text"><bean:message
											key="examtimetable.examDetail" /> :</td>
										<td class="form-row-input"><html:select
											property="examTimeTable.examDetails.examId"
											styleId="searchProjectName">
											<html:optionsCollection property="examList" label="examType"
												value="examId" />
										</html:select></td>
										<td class="form-row-text"><bean:message
											key="examtimetable.subjectDetail" /> :</td>
										<td class="form-row-input"><html:select
											property="examTimeTable.subjectDetails.subjectId"
											styleId="searchProjectName">
											<html:optionsCollection property="subjectList"
												label="subjectName" value="subjectId" />
										</html:select></td>
										</tr>
										<tr>
											<td class="form-row-text"><bean:message
												key="examtimetable.examDate" /> :</td>
											<td class="form-row-input"><html:text
												property="examTimeTable.examDateString" size="10"
												maxlength="10" styleId="searchProjectName" /> <a href="#"
												id="beneficiaryDOB" name="beneficiaryDOB"> <img
												src='images/calendar.gif'
												onclick="calendar.select(document.forms[0]['examTimeTable.examDateString'],'examTimeTable.examDateString','dd/MM/yyyy');return false;" />
											</a></td>
											<td class="form-row-text"><bean:message
												key="examtimetable.timeFrom" /> :</td>
											<td class="form-row-input"><html:text
												property="examTimeTable.timeFrom" size="5" maxlength="5"
												styleId="searchProjectName" /></td>
											<td class="form-row-text"><bean:message
												key="examtimetable.timeTo" /> :</td>
											<td class="form-row-input"><html:text
												property="examTimeTable.timeTo" size="5" maxlength="5"
												styleId="searchProjectName" /> <html:hidden
												property="examTimeTable.examTimeTableId" /></td>
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
										name="examTimeTableForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="examTimeTableList"
										name="examTimeTableForm">
										<bean:message key="no.search.projects" />
									</logic:empty> <logic:notEmpty property="examTimeTableList"
										name="examTimeTableForm">
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
													<td><display:table id="examTimeTableDetail"
														name="searchResult" requestURI="ExamTimeTable.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="Exam Time Table Id"
															property="examTimeTableId"
															style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Class"
															property="classDetails.classWithSectionName"
															style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Exam" property="examDetails.examType"
															style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Subject" property="subjectDetails.subjectName"
															style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Exam Date"
															property="examDateString" style="width: 13%"
															sortable="true" headerClass="grid-heading-row"></display:column>
														<display:column title="Time From" property="timeFrom"
															style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Time To" property="timeTo"
															style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title=""
															href="ExamTimeTable.cp?action=setExamTTDetails"
															paramId="examTTId" paramProperty="examTimeTableId"
															value="Edit" style="width: 13%" sortable="true"
															headerClass="grid-heading-row" class="padding link-color"></display:column>	
													</display:table></td>
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
<%@page import="com.cubepro.timetable.ExamTimeTable"%>
</html>
