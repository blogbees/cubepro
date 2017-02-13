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
				document.forms[0].action="<%=request.getContextPath()%>/Book.cp";
				document.forms[0].submit();
			}
			
			function saveForm(){
				var termName = document.forms[0]['bookDetail.bookName'];
					if(IfNullorEmpty(termName.value)){
						alert("Enter name of the book");
						termName.focus();
					}else{
						document.forms[0].action="<%=request.getContextPath()%>/Book.cp?action=saveBook";
						document.forms[0].submit();
					}
			}
			
		
			function resetFilters(){
				document.forms[0]['bookDetail.bookId'].value = 0;
				document.forms[0]['bookDetail.bookName'].value = "";
				document.forms[0]['bookDetail.author'].value = "";
				document.forms[0]['bookDetail.notes'].value = "";
				document.forms[0]['bookDetail.stockCompanyName'].value = "";
				document.forms[0]['bookDetail.rating'].value = "*";
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
					key="nrega.home" /></a> &gt; <span>Book Information</span></td>
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
				<td width="100%"><html:form action="Book" method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">Book Information</span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">
										<tr>
											<td class="form-row-text">Name:</td>
											<td class="form-row-input"><html:text
												property="bookDetail.bookName" size="50"
												maxlength="45" styleId="searchProjectName" />
												<html:hidden property="bookDetail.bookId" />
											</td>
											<td class="form-row-text">Category:</td>
											<td class="form-row-input"><html:select
												property="bookDetail.category.categoryId" 
												styleId="searchProjectName" >
													<logic:iterate property="categoryList" name="bookForm" id="categoryDetailsId" indexId="i" type="com.cubepro.library.Category">
														<html:option value="<%=String.valueOf(categoryDetailsId.getCategoryId())%>" >
														<bean:write name="categoryDetailsId" property="categoryName" /> 
														</html:option>
													</logic:iterate>
												</html:select>
												
											</td>
											<td class="form-row-text">Author:</td>
											<td class="form-row-input"><html:text
												property="bookDetail.author" size="20"
												maxlength="145" styleId="searchProjectName" />
											</td>
										</tr>
										<tr>
											<td class="form-row-text">Notes:</td>
											<td class="form-row-input"><html:text
												property="bookDetail.notes" size="65"
												maxlength="200" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">Company Name:</td>
											<td class="form-row-input"><html:text
												property="bookDetail.stockCompanyName" size="20"
												maxlength="100" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">Rating:</td>
											<td class="form-row-input"><html:select
												property="bookDetail.rating" 
												styleId="searchProjectName" style="width:100px;">
												<html:option value="*">*</html:option>
												<html:option value="* *">* *</html:option>
												<html:option value="* * *">* * *</html:option>
												<html:option value="* * * *">* * * *</html:option>
												<html:option value="* * * * *">* * * * *</html:option>
												</html:select>
											</td>
										</tr>
										<tr>
											<td class="form-row-text">Accession No:</td>
											<td class="form-row-input"><html:text
												property="bookDetail.accessionNo" size="65"
												maxlength="200" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">Date Of Purchase:</td>
											<td class="form-row-input"><html:text
												property="bookDetail.dateOfPurchase" size="20"
												maxlength="100" styleId="searchProjectName" />
												
											</td>
											<td class="form-row-text">Cost:</td>
											<td class="form-row-input">
											<html:text
												property="bookDetail.cost" size="20"
												maxlength="100" styleId="searchProjectName" />
											</td>
										</tr>
										<tr>
											<td class="form-row-text">Total Pages:</td>
											<td class="form-row-input">
											<html:text
												property="bookDetail.totalPages" size="20"
												maxlength="100" styleId="searchProjectName" />
											</td>
											<td class="form-row-text">&nbsp;</td>
											<td class="form-row-text">&nbsp;</td>
											<td class="form-row-text">&nbsp;</td>
											<td class="form-row-text">&nbsp;</td>
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
										name="bookForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="bookList"
										name="bookForm">
										
									</logic:empty> <logic:notEmpty property="bookList"
										name="bookForm">
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
													<td colspan="8"><display:table id="bookId"
														name="searchResult" requestURI="Book.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="Book Id" property="bookId"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Category"
															property="category.categoryName" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Name"
															property="bookName" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Author"
															property="author" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title="Notes"
															property="notes" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Company"
															property="stockCompanyName" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Accession No"
															property="accessionNo" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Date Of Purchase"
															property="dateOfPurchase" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Total Pages"
															property="totalPages" style="width: 13%" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title=""
															href="Book.cp?action=setBook&"
															paramId="bookId" paramProperty="bookId"
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
<% if(request.getParameter("bookId")==null || request.getParameter("bookId")== ""){%>
	resetFilters();
<%}%>	
</script>
</html>