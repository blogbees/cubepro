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
				document.forms[0].action="<%=request.getContextPath()%>/EditBankAccount.cp?action=getBank";
				document.forms[0].submit();
			}
			
			function saveForm(){
				document.forms[0].action="<%=request.getContextPath()%>/EditBankAccount.cp?action=saveBank";
				document.forms[0].submit();
			}
			
			function resetFilters(){
				document.forms[0]['bankDetail.id'].value = 0;
				document.forms[0]['bankDetail.remarks'].value = "";
				document.forms[0]['bankDetail.dwDate'].value = "";
				document.forms[0]['bankDetail.amt'].value = "0.0";
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
					key="nrega.home" /></a> &gt; <span>Bank Accounts</span></td>
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
				<td width="100%"><html:form action="EditBankAccount"
					method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">Bank Account Entry 
										</span></td>
								</tr>
																<tr>
									<td colspan="8" class="form-row-input">
								Opening Balance:&nbsp;
										
										</td></tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">
										<td class="form-row-text">Date:</td>
										<td class="form-row-input">
										<html:text
												property="bankDetail.dwDate" size="12"
												maxlength="100" styleId="searchProjectName" />
										<a	href="#" id="beneficiaryDOB" name="beneficiaryDOB"> <img
													src='images/calendar.gif'
													onclick="calendar.select(document.forms[0]['bankDetail.dwDate'],'bankDetail.dwDate','dd/MM/yyyy');return false;" />
												</a>		
										</td>
										<td class="form-row-text">Bank Name:</td>
										<td class="form-row-input">
										<html:select
											property="bankDetail.bankId"
											styleId="searchProjectName">
											<html:optionsCollection property="bankNameList"
														label="bankName" value="id" />
										</html:select>	
										</td>
										<td class="form-row-text">Type:</td>
										<td class="form-row-input">
										<html:select
											property="bankDetail.type"
											styleId="searchProjectName">
											<html:option value="DEPOSIT">DEPOSIT</html:option>
											<html:option value="WITHDRAWAL">WITHDRAWAL</html:option>
										</html:select>	
										</td>										
										</tr>
										<tr>
										<td class="form-row-text">Amount :</td>
										<td class="form-row-input">
										<html:text
												property="bankDetail.amt" size="6"
												maxlength="25" styleId="searchProjectName" />
										</td>
										<td class="form-row-text">		
										Pay Type:
										</td>
										<td class="form-row-input">
										<html:select
												property="bankDetail.paymentType" style="WIDTH:100PX;" >
											<html:option value=""></html:option>
											<html:option value="CASH">CASH</html:option>
											<html:option value="CHEQUE">CHEQUE</html:option>
											<html:option value="DD">DD</html:option>
											<html:option value="OTHERS">OTHERS</html:option>
										</html:select>		
											<html:hidden property="bankDetail.id" />	
										</td>
										<td class="form-row-text">		
										Remarks:
										</td>
										<td class="form-row-input">
										<html:text
												property="bankDetail.remarks" size="40" />
										</td>
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
										name="bankDetailForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="bankList"
										name="bankDetailForm">
										No Results Found
									</logic:empty> <logic:notEmpty property="bankList"
										name="bankDetailForm">
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
														<tr>
															<th class="grid-heading-row">Date</th>
															<th class="grid-heading-row">Bank Name</th>
															<th class="grid-heading-row">Type</th>
															<th class="grid-heading-row">Payment Type</th>
															<th class="grid-heading-row">Amount</th>
															<th class="grid-heading-row">Remarks</th>
														</tr>
														<logic:iterate id="bankListDetail"
															name="bankDetailForm" property="bankList"
															type="com.cubepro.bank.BankDetails" indexId="i">
															<tr>
																<td class="grid-row" align="center"><bean:write
																	name="bankListDetail"
																	property="dwDate" /></td>
																<td class="grid-row" align="center"><bean:write
																	name="bankListDetail"
																	property="bankName" /></td>
																<td class="grid-row" align="center"><bean:write
																	name="bankListDetail"
																	property="type" /></td>
																<td class="grid-row" align="center"><bean:write
																	name="bankListDetail"
																	property="paymentType" /></td>
																<td class="grid-row" align="center"><bean:write
																	name="bankListDetail"
																	property="amt" /></td>
																<td class="grid-row" align="center"><bean:write
																	name="bankListDetail"
																	property="remarks" /></td>
														</logic:iterate>
													</table>
													</td>
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
</html>