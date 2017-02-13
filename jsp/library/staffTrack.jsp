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
				document.forms[0].action="<%=request.getContextPath()%>/StaffTrack.cp";
				document.forms[0].submit();
			}
			
			function loadBooks(){
				document.forms[0].action="<%=request.getContextPath()%>/StaffTrack.cp?action=findBooksByCategory";
				document.forms[0].submit();
			}
			
			function saveForm(){
				var termName = document.forms[0]['lendDetailsDetail.status'];
					if(IfNullorEmpty(termName.value)){
						alert("Enter status of the Staff Lend Details");
						termName.focus();
					}else{
						document.forms[0].action="<%=request.getContextPath()%>/StaffTrack.cp?action=saveStaffLendDetails";
						document.forms[0].submit();
					}
			}
			
		
			function resetFilters(){
				document.forms[0]['lendDetailsDetail.staffLendDetailsId'].value = 0;
				document.forms[0]['lendDetailsDetail.status'].value = "";
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
					key="nrega.home" /></a> &gt; <span>Staff Issue/Return Tracker</span></td>
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
				<td width="100%"><html:form action="StaffTrack" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">Staff Issue/Return Tracker</span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">
										<tr>
											<td class="form-row-text">Staff Name:</td>
											<td class="form-row-input">
												<bean:write name="staffLendDetailsForm" property="staffDetails.firstName" />
											</td>
											<td class="form-row-text">Designation:</td>
											<td class="form-row-input">
											<bean:write name="staffLendDetailsForm" property="staffDetails.designation" />
											</td>
											<td class="form-row-text">
											<html:hidden name="staffLendDetailsForm" property="staffId" />
											</td>
											<td class="form-row-input">
											</td>
										</tr>
										<tr>
										<td class="form-row-text">Category:</td>
											<td class="form-row-input"><html:select
												property="categoryId" 
												styleId="searchProjectName" onchange="javascript:loadBooks();">
													<logic:iterate property="categoryList" name="staffLendDetailsForm" id="categoryDetailsId" indexId="i" type="com.cubepro.library.Category">
														<html:option value="<%=String.valueOf(categoryDetailsId.getCategoryId())%>" >
														<bean:write name="categoryDetailsId" property="categoryId" />-
														<bean:write name="categoryDetailsId" property="categoryName" /> 
														</html:option>
													</logic:iterate>
												</html:select>
											</td>
											<td class="form-row-text">Book:</td>
											<td class="form-row-input"><html:select
												property="lendDetailsDetail.bookDetails.bookId" 
												styleId="searchProjectName" >
													<logic:iterate property="bookList" name="staffLendDetailsForm" id="bookDetailsId" indexId="i" type="com.cubepro.library.Book">
														<html:option value="<%=String.valueOf(bookDetailsId.getBookId())%>" >
														<bean:write name="bookDetailsId" property="bookId" />-
														<bean:write name="bookDetailsId" property="bookName" /> 
														</html:option>
													</logic:iterate>
												</html:select>
											</td>
											<td class="form-row-text">Status:</td>
											<td class="form-row-input"><html:select
												property="lendDetailsDetail.status" 
												styleId="searchProjectName" >
												<html:option value=""></html:option>
												<html:option value="ISSUED">ISSUED</html:option>
												<html:option value="RETURNED">RETURNED</html:option>
												<html:option value="REJECTED">REJECTED</html:option>
												<html:option value="LOST">LOST</html:option>
												<html:option value="FINED">FINED</html:option>
												</html:select>
											</td>
											<td class="form-row-text"></td>
											<td class="form-row-input">&nbsp;</td>
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
										name="staffLendDetailsForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="lendDetailsList"
										name="staffLendDetailsForm">
										
									</logic:empty> <logic:notEmpty property="lendDetailsList"
										name="staffLendDetailsForm">
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
													<td colspan="8"><display:table id="staffLendDetailsId"
														name="searchResult" requestURI="StaffTrack.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="Id" property="staffLendDetailsId"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Book Name"
															property="bookDetails.bookName" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Status"
															property="status" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Lend Date"
															property="lendDate" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Return Date"
															property="returnDate" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>		
														<display:column title=""
															href="StaffTrack.cp?action=setStaffLendDetails&"
															paramId="staffLendDetailsId" paramProperty="staffLendDetailsId"
															value="Edit" style="width: 13%" sortable="true"
															headerClass="grid-heading-row" class="padding link-color"></display:column>	
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
<script language="javascript">
<% if(request.getParameter("staffLendDetailsId")==null || request.getParameter("staffLendDetailsId")== ""){%>
	resetFilters();
<%}%>	
</script>
</html>