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
				document.forms[0].action="<%=request.getContextPath()%>/AssetAndLiaDetail.cp?action=getTransaction";
				document.forms[0].submit();
			}
			
			function saveForm(){
				document.forms[0].action="<%=request.getContextPath()%>/AssetAndLiaDetail.cp?action=saveTransaction";
				document.forms[0].submit();
			}
			
			function getTransactionMasterList(){
				document.forms[0].action="<%=request.getContextPath()%>/AssetAndLiaDetail.cp?action=getTransaction";
				document.forms[0].submit();
			}
			
			function resetFilters(){
				document.forms[0]['assetAndLiability.type'].value = "ASSET";
				document.forms[0]['assetAndLiability.date'].value = "";
				document.forms[0]['assetAndLiability.desc'].value = "";
				document.forms[0]['assetAndLiability.year'].value = "";
				document.forms[0]['assetAndLiability.amount'].value = "0.0";
				document.forms[0]['assetAndLiability.assAndLiaId'].value = "";
				document.forms[0]['assetAndLiability.regBookNo'].value = "";
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
					key="nrega.home" /></a> &gt; <span>Asset/Liability</span></td>
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
				<td width="100%"><html:form action="AssetAndLiaDetail"
					method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="8" class="form-heading"><span
										class="search-heading">Asset/Liability Entry</span></td>
								</tr>
								<tr>
									<td colspan="8" class="form-row-text">
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">
										<td class="form-row-text">Type :</td>
										<td class="form-row-input"><html:select
											property="assetAndLiability.type"
											styleId="searchProjectName" onchange="javascript:setSubTypes(this);">
											<html:option value="ASSET">ASSET</html:option>
											<html:option value="LIABILITY">LIABILITY</html:option>
											<html:option value="BUDGET">BUDGET</html:option>											
										</html:select>	</td>
										<td class="form-row-text">Sub Type :</td>
										<td class="form-row-input">
										<span id="subTypeObj" >
										<html:select
											property="assetAndLiability.subType"
											styleId="searchProjectName" >
										</html:select>
										</span>
										</td>
										<td class="form-row-text">Date:</td>
										<td class="form-row-input">
										<html:text
												property="assetAndLiability.date" size="12"
												maxlength="100" styleId="searchProjectName" />
										<a	href="#" id="beneficiaryDOB" name="beneficiaryDOB"> <img
													src='images/calendar.gif'
													onclick="calendar.select(document.forms[0]['assetAndLiability.date'],'assetAndLiability.date','dd/MM/yyyy');return false;" />
												</a>		
										</td>
										</tr>
										<tr>
										<td class="form-row-text">Desc:</td>
										<td class="form-row-input" >
										<div id="kkt">
											<html:text
													property="assetAndLiability.desc" size="45"
													maxlength="100" styleId="searchProjectName" />
										</div>			
										</td>
										<td class="form-row-text">Year :</td>
										<td class="form-row-input" >
										<html:text
												property="assetAndLiability.year" size="4"
												maxlength="100" styleId="searchProjectName" />
										</td>
										<td class="form-row-text"><bean:message
											key="transactionDetail.amount" /> :</td>
										<td class="form-row-input">
										<html:text
												property="assetAndLiability.amount" size="6"
												maxlength="25" styleId="searchProjectName" />
											<html:hidden property="assetAndLiability.assAndLiaId" />	
										</td>
										</tr>
										<tr>
										<td class="form-row-text" nowrap colspan="3">Reg Book No</td>
											<td class="form-row-input" colspan="3"><html:text
												property="transactionDetails.regBookNo" size="45"
												maxlength="100" styleId="searchProjectName" /></td>
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
										name="transactionDetailForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="assetAndLiabilityList"
										name="transactionDetailForm">
										No Results Found
									</logic:empty> <logic:notEmpty property="assetAndLiabilityList"
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
													<td colspan="8">
													<display:table id="transactionListDetail"
														name="searchResult"
														requestURI="AssetAndLiaDetail.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action" style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header" >
														<display:column title="Id" 
															property="assAndLiaId" style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Type" 
															property="type" style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Sub Type" 
															property="subType" style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Date" 
															property="date" style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Desc" 
															property="desc" style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Year" 
															property="year" style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Amount" 
															property="amount" style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
													</display:table>	
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
		<script language="javascript">
			function setSubTypes(obj){
			 var subTypeObj = document.getElementById("subTypeObj");
			 var appendText = "<select name='assetAndLiability.subType' >";
			 if(obj==null || obj.value=="ASSET"){
                appendText +="<option value='FIXED ASSET'>FIXED ASSET</option>";
				appendText +="<option value='CURRENT ASSET'>CURRENT ASSET</option>";
			 }else if(obj.value=="LIABILITY"){
			 		 appendText +="<option value='CAPITAL'>CAPITAL</option>";
			 		 appendText +="<option value='CURRENT LIABILITY'>CURRENT LIABILITY</option>";
			 }else if(obj.value=="BUDGET"){
				appendText +="<option value='MANAGEMENT A/C'>MANAGEMENT A/C</option>";
				appendText +="<option value='SIF A/C'>SIF A/C</option>";
				appendText +="<option value='COMPUTER A/C'>COMPUTER A/C</option>";
				appendText +="<option value='GENERAL FUND A/C'>GENERAL FUND A/C</option>";
				appendText +="<option value='AMENITY FUND A/C'>AMENITY FUND A/C</option>";
				appendText +="<option value='SPECIAL FEE A/C'>SPECIAL FEE A/C</option>";
				appendText +="<option value='PTA A/C'>PTA A/C</option>";			 
			 }
			 appendText +="</select>";
			 subTypeObj.innerHTML = appendText;
			 //if(obj!=null){
			 //	getTransactionMasterList();			
			 //} 
			}
			setSubTypes(null);
		</script>
</body>
</html>