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
				document.forms[0].action="<%=request.getContextPath()%>/TransactionDetail.cp?action=getTransaction";
				document.forms[0].submit();
			}
			
			function saveForm(){
				document.forms[0].action="<%=request.getContextPath()%>/TransactionDetail.cp?action=saveTransaction";
				document.forms[0].submit();
			}
			
			function remittance(){
			 	var transCode = document.forms[0]['transactionDetails.transactionCode'].value;
			 	if(transCode!="CASH EXPENSE"){
			 	 	alert("Remittance can be done only for CASH EXPENSE");
			 	}else{
					document.forms[0].action="<%=request.getContextPath()%>/TransactionDetail.cp?action=remittance";
					document.forms[0].submit();
				}
			}
			
			function withdrawal(){
				var transCode = document.forms[0]['transactionDetails.transactionCode'].value;
			 	if(transCode!="BANK EXPENSE"){
			 		alert("Withdrawal can be done only for BANK EXPENSE");
			 	}else{
					document.forms[0].action="<%=request.getContextPath()%>/TransactionDetail.cp?action=withdrawal";
					document.forms[0].submit();
				}
			}
			
			function getTransctionMasterList(){
				document.forms[0].action="<%=request.getContextPath()%>/TransactionDetail.cp?action=getTransaction";
				document.forms[0].submit();
			}
			
			function resetFilters(){
				document.forms[0]['transactionDetails.transactionDate'].value = "";
				document.forms[0]['transactionDetails.transactionCode'].value = "CASH INCOME";	
				document.forms[0]['transactionDetails.transactionType'].value = "MANAGEMENT A/C";
				document.forms[0]['transactionDetails.transactionSubType'].value = "";
				document.forms[0]['transactionDetails.transactionDesc'].value = "";
				document.forms[0]['transactionDetails.paymentType'].value = "";
				document.forms[0]['transactionDetails.transactionId'].value = "";
				document.forms[0]['transactionDetails.amount'].value = "0.0";
				document.forms[0]['transactionDetails.remarks'].value = "";
				document.forms[0]['transactionDetails.regBookNo'].value = "";
				document.forms[0]['transactionDetails.debitNar'].value = "";
				document.forms[0]['transactionDetails.creditNar'].value = "";
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
					key="nrega.home" /></a> &gt; <span>Transactions</span></td>
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
				<td width="100%"><html:form action="TransactionDetail"
					method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">Transaction Entry </span></td>
								</tr>

								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">
										<td class="form-row-text">Date:</td>
										<td class="form-row-input"><html:text
											property="transactionDetails.transactionDate" size="12"
											maxlength="100" styleId="searchProjectName" /> <a href="#"
											id="beneficiaryDOB" name="beneficiaryDOB"> <img
											src='images/calendar.gif'
											onclick="calendar.select(document.forms[0]['transactionDetails.transactionDate'],'transactionDetails.transactionDate','dd/MM/yyyy');return false;" />
										</a></td>
										<td class="form-row-text">Transaction Type:</td>
										<td class="form-row-input"><html:select
											property="transactionDetails.transactionCode"
											styleId="searchProjectName"
											onchange="javascript:getTransctionMasterList();">
											<html:option value="CASH INCOME">CASH INCOME</html:option>
											<html:option value="BANK INCOME">BANK INCOME</html:option>
											<html:option value="CASH EXPENSE">CASH EXPENSE</html:option>
											<html:option value="BANK EXPENSE">BANK EXPENSE</html:option>
										</html:select></td>
										<td class="form-row-text">Account Type :</td>
										<td class="form-row-input"><html:select
											property="transactionDetails.transactionType"
											styleId="searchProjectName"
											onchange="javascript:getTransctionMasterList();">
											<html:option value="MANAGEMENT A/C">MANAGEMENT A/C</html:option>
											<html:option value="SIF A/C">SIF A/C</html:option>
											<html:option value="COMPUTER A/C">COMPUTER A/C</html:option>
											<html:option value="GENERAL FUND A/C">GENERAL FUND A/C</html:option>
											<html:option value="AMENITY FUND A/C">AMENITY FUND A/C</html:option>
											<html:option value="SPECIAL FEE A/C">SPECIAL FEE A/C</html:option>
											<html:option value="PTA A/C">PTA A/C</html:option>
										</html:select></td>
										</tr>
										<tr>
											<td class="form-row-text"><bean:message
												key="transactionDetail.transDesc" /> :</td>
											<td class="form-row-input"><html:select
												property="transactionDetails.transactionDesc"
												style="width:250px;">
												<html:optionsCollection property="transMasterList"
													label="desc" value="desc" />
											</html:select></td>
											<td class="form-row-text">Type:</td>
											<td class="form-row-input"><html:select
												property="transactionDetails.transactionSubType"
												styleId="searchProjectName">
												<html:option value=""></html:option>
												<html:option value="ASSET">ASSET</html:option>
												<html:option value="LIABILITY">LIABILITY</html:option>
												<html:option value="BUDGET">BUDGET</html:option>
											</html:select></td>
											<td class="form-row-text">Pay Type:</td>
											<td class="form-row-input"><html:select
												property="transactionDetails.paymentType"
												style="WIDTH:100PX;">
												<html:option value=""></html:option>
												<html:option value="CASH">CASH</html:option>
												<html:option value="CHEQUE">CHEQUE</html:option>
												<html:option value="DD">DD</html:option>
												<html:option value="OTHERS">OTHERS</html:option>
											</html:select></td>
										</tr>
										<tr>
											<td class="form-row-text">Remarks :</td>
											<td class="form-row-input"><html:text
												property="transactionDetails.remarks" size="45"
												maxlength="100" styleId="searchProjectName" /></td>
											<td class="form-row-text"><bean:message
												key="transactionDetail.amount" /> :</td>
											<td class="form-row-input"><html:text
												property="transactionDetails.amount" size="6" maxlength="25"
												styleId="searchProjectName" /> <html:hidden
												property="transactionDetails.transactionId" /></td>
											<td class="form-row-text" nowrap >Reg Book No</td>
											<td class="form-row-input"><html:text
												property="transactionDetails.regBookNo" size="45"
												maxlength="100" styleId="searchProjectName" /></td>
										</tr>
										<tr><td class="form-row-text" colspan="6" align="left">
										<table width="100%" border="0" cellspacing="0" cellpadding="0"
										align="center" >
										<tr><td class="form-row-text" align="right">Narrations for:</td>
										<td align="left">
										<table width="100%" border="0" cellspacing="0" cellpadding="0"
										align="left" >
										<tr><td class="form-row-text">Debit:								
										</td>
										<td class="form-row-input"><html:text
												property="transactionDetails.debitNar" size="150"
												maxlength="200" styleId="searchProjectName" />
										</tr>
										<tr><td class="form-row-text">Credit:								
										</td>
										<td class="form-row-input"><html:text
												property="transactionDetails.creditNar" size="150"
												maxlength="200" styleId="searchProjectName" />
										</tr>
										</table>
										</td>
										</tr>
										</table></td>
										</tr>
										<tr>
										<td class="form-row-text" nowrap colspan="4" align="right">Cash
											Balance: <b>Rs. <bean:write name="transactionDetailForm"
												property="cashBalance" /></b> Bank Balance: <b>Rs. <bean:write
												name="transactionDetailForm" property="bankBalance" /></b></td>
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
												<li class="buttonrightcrnr search-but"
													onmouseover="this.className='buttonhighlight search-but'"
													onmouseout="this.className='buttonrightcrnr search-but'"
													onkeypress="withdrawal();" title="Search Project"><a
													href="javascript:withdrawal();">Bank Withdrawal</a></li>
												<li class="buttonrightcrnr search-but"
													onmouseover="this.className='buttonhighlight search-but'"
													onmouseout="this.className='buttonrightcrnr search-but'"
													onkeypress="remittance();" title="Search Project"><a
													href="javascript:remittance();">Bank Remittance</a></li>
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
										name="transactionDetailForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="transactionList"
										name="transactionDetailForm">
										No Results Found
									</logic:empty> <logic:notEmpty property="transactionList"
										name="transactionDetailForm">
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
													<td colspan="8"><display:table
														id="transactionListDetail" name="searchResult"
														requestURI="TransactionDetail.cp" pagesize="10"
														sort="list" defaultsort="1" defaultorder="descending"
														excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<display:column title="Id" property="transactionId"
															style="width: 5%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Transaction Type"
															property="transactionCode" style="width: 13%;"
															sortable="true" headerClass="grid-heading-row"></display:column>
														<display:column title="Account Type"
															property="transactionType" style="width: 13%;"
															sortable="true" headerClass="grid-heading-row"></display:column>
														<display:column title="Date" property="transactionDate"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Transaction Desc"
															property="transactionDesc" style="width: 13%;"
															sortable="true" headerClass="grid-heading-row"></display:column>
														<display:column title="Type" property="transactionSubType"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Amount" property="amount"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Pay Type" property="paymentType"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Remarks" property="remarks"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Debit Narration" property="debitNar"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Credit Narration" property="creditNar"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>	
														<display:column title=""
															href="TransactionDetail.cp?action=setTransaction&"
															paramId="transId" paramProperty="transactionId"
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
</html>