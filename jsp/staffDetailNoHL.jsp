<%-- Generic Includes--%>
<%@include file="/jsp/common/commonHeader.jsp"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<body>
	<!-- Sub menu js part is included -->
	<%@include file="/jsp/common/subMenuJs.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/ui.daterangepicker.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/redmond/jquery-ui-1.7.1.custom.css"
	type="text/css" title="ui-theme" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.3.1.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-ui-1.7.1.custom.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/daterangepicker.jQuery.js"></script>

	<script language="JavaScript1.2">
	mmLoadMenus();	
		$(function(){
			  $('#rangeA').daterangepicker({
				  presetRanges: [
			{text: 'Today', dateStart: 'today', dateEnd: 'today' }],
			presets: {
			specificDate: 'Specific Date'},
				  arrows:false,dateFormat:'dd/mm/yy',datepickerOptions: {
				 		changeMonth: true,
				 		changeYear: true
				 	}
				  
				  });
				  
			 });
	
	   function SubmitOnEnter(e) {
				var code;
				if (e.keyCode) code = e.keyCode;
				else if (e.which) code = e.which;
				if(code==13) {
					submitSearch();
				}
			}
			function validate(){
				var dob = document.forms[0]['searchStaffDetails.dobString'];
				if(!IfNullorEmpty(dob.value)){
					if(isDate(dob.value, 'dd/MM/yyyy') == false){					
						jAlert(' <bean:message key="date.invalid"/> ! ');
						dob.focus();
						return false;
					}
				}
				return true;
			}
			function submitSearch(){
			if(validate()){
				document.forms[0].action="<%=request.getContextPath()%>/ListOfStaffsNoHL.cp?action=getListOfStaffs";
				document.forms[0].submit();
				}
			}
			function resetFilters(){
				document.forms[0]['searchStaffDetails.firstName'].value = "";
				document.forms[0]['searchStaffDetails.staffNo'].value = "";
				document.forms[0]['searchStaffDetails.dobString'].value = "";
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
							<span>Staff</span>
						</td>
					</tr>
					<tr>
						<td width="100%">
							<html:form action="ListOfStaffsNoHL" method="post">
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
														<bean:message key="projectSearch.dateOfBirth" />
														:
													</td>
													<td class="form-row-input">
														<html:text property="searchStaffDetails.dobString"
															onkeypress="SubmitOnEnter(event);"
															styleId="rangeA" size="15" />
													<a	href="#" id="beneficiaryDOB" name="beneficiaryDOB"> <img
													src='images/calendar.gif'
													onclick="calendar.select(document.forms[0]['searchStaffDetails.dobString'],'searchStaffDetails.dobString','dd/MM/yyyy');return false;" />
														</a>	
															
													</td>
													<td class="form-row-text">
														Department:
													</td>
													<td class="form-row-input">
														<html:text property="searchStaffDetails.dept"
															onkeypress="SubmitOnEnter(event);"
															styleId="searchProjectName" size="15" />
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
											<bean:define id="pageSizeList" name="staffDetailForm"
												property="pageSizeList" toScope="page" />
											<logic:empty property="staffList" name="staffDetailForm">
												<bean:message key="no.search.staffs" />
											</logic:empty>
											<logic:notEmpty property="staffList"
												name="staffDetailForm">
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
																	<display:table id="staffListTableId" 
																		name="searchResult" 
																		requestURI="ListOfStaffsNoHL.cp?action=getListOfStaffs"
																		pagesize="10" sort="list" defaultsort="1"
																		defaultorder="descending" excludedParams="action"
																		class="padding-btm-ten form-border display-table-header">
																		<display:column 
																			titleKey="staffDetails.staffNo" 
																			property="staffNo" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>																			
																		<display:column 
																			titleKey="staffDetails.firstName" 
																			property="firstName" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>
																			<display:column 
																			titleKey="staffDetails.secondName" 
																			property="secondName" style="width: 5%"
																			sortable="true" headerClass="grid-heading-row"></display:column>
																		<display:column 
																			title="Department" 
																			property="dept" style="width: 13%"
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
																			titleKey="staffDetails.fatherName" 
																			property="fatherName" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>
																		<display:column 
																			titleKey="staffDetails.qualification" 
																			property="qualification" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>																																																																												
																		<display:column 
																			titleKey="staffDetails.designation" 
																			property="designation" style="width: 13%"
																			sortable="true" headerClass="grid-heading-row"></display:column>																																																																												
																		<display:column 
																			titleKey="staffDetails.mobile" 
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