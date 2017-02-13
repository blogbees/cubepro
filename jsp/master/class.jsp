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
				document.forms[0].action="<%=request.getContextPath()%>/EditClass.cp";
				document.forms[0].submit();
			}
			
			function validate(){
				var className = document.forms[0]['classDetail.className'];
				var sectionName = document.forms[0]['classDetail.sectionName'];
					if(IfNullorEmpty(className.value)){
						alert("Enter class name");
						className.focus();
						return false;
					}
					
					if(IfNullorEmpty(sectionName.value)){
						alert("Enter section name");
						sectionName.focus();
						return false;
					}
					return true;
			}
			
			function saveForm(){
			  if(validate()){
				document.forms[0].action="<%=request.getContextPath()%>/EditClass.cp?action=saveClass";
				document.forms[0].submit();
				}
			}
			
			function setDetails(classId,className,sectionName,staffInCharge,noOfStudents){
				document.forms[0]['classDetail.classId'].value = classId;
				document.forms[0]['classDetail.className'].value = className;
				document.forms[0]['classDetail.sectionName'].value = sectionName;
				document.forms[0]['classDetail.noOfStudents'].value = staffInCharge;
				document.forms[0]['classDetail.staffInChargeId'].value = noOfStudents;
			}
			
			function resetFilters(){
				document.forms[0]['classDetail.classId'].value = 0;
				document.forms[0]['classDetail.className'].value = "";
				document.forms[0]['classDetail.sectionName'].value = "";
				document.forms[0]['classDetail.noOfStudents'].value = "";
				document.forms[0]['classDetail.staffInChargeId'].value = "";
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
					key="nrega.home" /></a> &gt; <span>Class Master</span></td>
			</tr>
			<html:messages id="msg" message="true" />
			<logic:messagesPresent message="true">
				<tr>
					<td colspan="8">
					<script language="javascript">
												alert('<bean:write name="msg" />');
												</script>
					<span class="success"><bean:write
						name="msg" /> </span></td>
				</tr>
			</logic:messagesPresent>

			<tr>
				<td width="100%"><html:form action="EditClass" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">Class Master </span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">

										<tr>
											<td class="form-row-text">Class Name :</td>
											<td class="form-row-input"><html:text
												property="classDetail.className" size="10" maxlength="10"
												styleId="searchProjectName" onkeyup="this.value=this.value.toUpperCase();"
												onfocus="this.value=this.value.toUpperCase();"
												onblur="this.value=this.value.toUpperCase();"
												/></td>
											<td class="form-row-text">Section Name:</td>
											<td class="form-row-input"><html:text
												property="classDetail.sectionName" size="6" maxlength="10"
												styleId="searchProjectName" onkeyup="this.value=this.value.toUpperCase();"
												onfocus="this.value=this.value.toUpperCase();"
												onblur="this.value=this.value.toUpperCase();"/></td>
											<td class="form-row-text">Type:</td>
											<td class="form-row-input"><html:select
												property="classDetail.classType" 
												styleId="searchProjectName" >
												<html:option value="Class">Class</html:option>
												<html:option value="Batch">Batch</html:option>
												<html:option value="Others">Others</html:option>
												</html:select> 
											</td>
											</tr>
											<tr>
											<td class="form-row-text">Class Strength:</td>
											<td class="form-row-input"><html:text
												property="classDetail.noOfStudents" size="5" maxlength="5"
												styleId="searchProjectName" /> <html:hidden
												property="classDetail.classId" /></td>
											<td class="form-row-text">Staff In Charge:</td>
											<td class="form-row-input"><html:text
												property="classDetail.staffInChargeId"
												size="30" />
												</td>	
											<td class="form-row-text">Status:</td>
											<td class="form-row-input"><html:select
												property="classDetail.status"
												style="width:100px;">
												<html:option value="ACTIVE">ACTIVE</html:option>
												<html:option value="IN-ACTIVE">IN-ACTIVE</html:option>
											</html:select></td>
										</tr>
										
										<tr>
											<td class="form-row-text">Class Code:</td>
											<td class="form-row-input"><html:text
												property="classDetail.classCode" size="20" maxlength="45"
												styleId="searchProjectName" /> </td>
											<td class="form-row-text">Class Detail Name:</td>
											<td class="form-row-input"><html:text
												property="classDetail.classDetailName"
												size="30" maxlength="100" />
												</td>	
											<td class="form-row-text"></td>
											<td class="form-row-input"></td>
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
									<td><bean:define id="pageSizeList" name="classDetailForm"
										property="pageSizeList" toScope="page" /> <logic:empty
										property="classList" name="classDetailForm">
										<bean:message key="no.search.projects" />
									</logic:empty> <logic:notEmpty property="classList" name="classDetailForm">
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
													<td colspan="8"><display:table id="classDetailId"
														name="searchResult"
														requestURI="EditClass.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action" style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header" >
														<display:column titleKey="class.classId" 
															property="classId" style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column titleKey="class.className"
															property="className" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column titleKey="class.sectionName"
															property="sectionName" style="width: 12%;"
															sortable="true" headerClass="grid-heading-row"
															class="padding link-color"></display:column>
														<display:column titleKey="class.noOfStudents"
															property="noOfStudents" style="width: 13%"
															sortable="true" headerClass="grid-heading-row"></display:column>
														<display:column titleKey="class.staffInCharge"
															property="staffInChargeId" style="width: 13%"
															sortable="true" headerClass="grid-heading-row" ></display:column>
														<display:column title="Status"
															property="status" style="width: 13%"
															sortable="true" headerClass="grid-heading-row" ></display:column>			
														<display:column title="" href="EditClass.cp?action=setClass&"
															paramId="classId" paramProperty="classId"  
															value="Edit" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"
															class="padding link-color"></display:column>
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
<%@page import="com.cubepro.timetable.ExamTimeTable"%>
</html>