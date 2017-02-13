<%-- Generic Includes--%>
<%@include file="/jsp/common/commonHeader.jsp"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<head>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
<meta http-equiv="cache-control" content="no-cache"/>
</head>
<body onload="validate();">
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
				document.forms[0].action="<%=request.getContextPath()%>/InvoiceDetail.cp?action=getInvoiceDetail";
				document.forms[0].submit();
			}
			
			function getFeesSubType(){
				document.forms[0].action="<%=request.getContextPath()%>/InvoiceDetail.cp?action=getInvoiceDetail";
				document.forms[0].submit();
			}
			
			function saveForm(){
				var invoiceNo =document.forms[0]['invoiceDetails.invoiceNo'].value; 
				var amt =document.forms[0]['invoiceDetails.totalAmtPaid'].value ;
				var feesDate =document.forms[0]['invoiceDetails.feesDate'].value;
				var gross=document.forms[0]['invoiceDetails.grossAmt'].value;
				var isValid = true;
				if(feesDate==null || feesDate == ""){
					alert("Please enter or select fees date");
					document.forms[0]['invoiceDetails.feesDate'].focus();
					isValid = false;
				}
				//if((amt==null || amt == "" || amt == "0.0" ) && isValid){
				if((gross==null || gross == "" || gross == "0.0" ))
				{
					alert("Amount is Zero. Please select sub type or Transport FEE or Hostel FEE for amount");
					document.forms[0]['invoiceDetails.totalAmtPaid'].focus();
					isValid = false;
				}
				//if(document.forms[0]['invoiceDetails.invoiceNo'].disabled == false && (invoiceNo==null || invoiceNo == "") && isValid){
				//	alert("Please enter or select checkbox for Invoice No");
				//	document.forms[0]['invoiceDetails.invoiceNo'].focus();
				//	isValid = false;
				//}
				if(isValid){
					chkScholars(null);
					chkTransports(null);
					chkHostels(null);
					chkFines(null);
					document.forms[0]['invoiceDetails.transportFee'].disabled=false;
	 				 document.forms[0]['invoiceDetails.hostelFee'].disabled=false;
	 				 document.forms[0]['invoiceDetails.fine'].disabled=false;
	 				 document.forms[0]['invoiceDetails.grossAmt'].disabled=false;
	 				 document.forms[0]['invoiceDetails.scholarAmt'].disabled=false;
					getMultipleSelection("invoiceDetails.subType", true);
					document.forms[0].action="<%=request.getContextPath()%>/InvoiceDetail.cp?action=saveInvoice";
					document.forms[0].submit();
				}
				if(document.forms[0]['invoiceDetails.paidAmt'].value=="")
				{
				 document.forms[0]['invoiceDetails.paidAmt'].value="0";
				 document.forms[0]['invoiceDetails.balanceAmt'].value="0";
				}
				else
				{
				 document.forms[0]['invoiceDetails.balanceAmt'].value= parseInt(document.forms[0]['invoiceDetails.grossAmt'].value)-parseInt(document.forms[0]['invoiceDetails.paidAmt'].value);
				}
			}
			
			function setInvoice(obj){
				if(obj.checked == true){
					document.forms[0]['invoiceDetails.invoiceNo'].value = "";
					document.forms[0]['invoiceDetails.invoiceNo'].disabled = true;
				}else{
					document.forms[0]['invoiceDetails.invoiceNo'].disabled = false;
				}
			}
			var printInvoiceNo = "";
			function resetFilters(){
				if(document.forms[0]['invoiceDetails.invoiceNo'].value!="")
				{
				document.forms[0]['invoiceDetails.paidAmt'].value="0";
				printInvoiceNo = document.forms[0]['invoiceDetails.invoiceNo'].value;
				document.forms[0]['invoiceDetails.invoiceId'].value = 0;
				document.forms[0]['invoiceDetails.invoiceNo'].value = "";
				document.forms[0]['invoiceDetails.feesDate'].value = "";
				document.forms[0]['invoiceDetails.totalAmtPaid'].value = "";
				document.forms[0]['invoiceDetails.payBy'].value = "";
				document.forms[0]['invoiceDetails.paidBy'].value = "";
				document.forms[0]['invoiceDetails.fine'].value = "";
				//document.forms[0]['invoiceDetails.hostelFee'].value = "0";
				document.forms[0]['invoiceDetails.balanceAmt'].value="0";
				//document.forms[0]['invoiceDetails.transportFee'].value = "0";
				document.forms[0]['invoiceDetails.fine'].value = "0";
				//document.forms[0]['invoiceDetails.scholarAmt'].value = "0";
				}
			}
			var selectedValue;
			var selectedName;
			
			function setTotalAmt(obj){
				var selectValue =  getMultipleSelection("invoiceDetails.subType", true);
				var totalAmtObj = document.forms[0]['invoiceDetails.totalAmtPaid'];
				totalAmtObj.value = 0.0;
				for(j = 0; j < selectValue.length; j++){
					totalAmtObj.value = parseFloat(totalAmtObj.value) + parseFloat(selectValue[j]); 
				}
				document.forms[0].selectedName.value = selectedName.toString();
				document.forms[0].selectedValue.value = selectValue.toString();
			}
			function setGrossAmt(obj){
			var selectValue =  getMultipleSelection("invoiceDetails.subType", true);
				var grossAmtObj = document.forms[0]['invoiceDetails.grossAmt'];
				grossAmtObj.value = 0.0;
				for(j = 0; j < selectValue.length; j++){
					grossAmtObj.value = parseFloat(grossAmtObj.value) + parseFloat(selectValue[j]); 
				}
			}
			function selectAllFeesType(){
				selectedValue = new Array();
				selectedName = new Array(); 
				var mySelect = document.forms[0].elements["invoiceDetails.subType"]; 
				for(j = 0; j < mySelect.options.length; j++) 
				{
					 mySelect.options[j].selected  = true;
				}
				setTotalAmt("invoiceDetails.subType");
				setGrossAmt("invoiceDetails.subType");
				document.forms[0]['invoiceDetails.paidAmt'].focus();
			}
			
			function getMultipleSelection(elementName,array)
			{ 
				selectedValue = new Array();
				selectedName = new Array(); 
				var mySelect = document.forms[0].elements[elementName]; 
				for(j = 0; j < mySelect.options.length; j++) 
				{
					 if(mySelect.options[j].selected) {
					 	 selectedValue.push(mySelect.options[j].value);
					 	 selectedName.push(mySelect.options[j].text); 
					  }
				}
				document.forms[0].selectedName.value=selectedName;
				document.forms[0].selectedValue.value=selectedValue;
				if(array != true) 
					return selectedValue.toString();
				else 
					return selectedValue;
			} 
			
			function printBill(){
				var answer = prompt("Invoice No?",printInvoiceNo);
				if(answer==""){
					alert("Please enter invoice no");
				}else if(answer!=null && answer!=""){
							 document.forms[0]['invoiceDetails.transportFee'].disabled=false;
			 				 document.forms[0]['invoiceDetails.hostelFee'].disabled=false;
			 				 document.forms[0]['invoiceDetails.fine'].disabled=false;
			 				 document.forms[0]['invoiceDetails.grossAmt'].disabled=false;
			 				 document.forms[0]['invoiceDetails.scholarAmt'].disabled=false;
					var url ="<%=request.getContextPath()%>/InvoiceDetail.cp?action=printInvoice&invoiceId="+answer+"&studentId="+document.forms[0].studentId.value;
					window.open(url,"","height=500,width=400,align=center");
				}
			}
			function validate()
			{
			 document.forms[0]['invoiceDetails.transportFee'].disabled=true;
			 document.forms[0]['invoiceDetails.hostelFee'].disabled=true;
			 document.forms[0]['invoiceDetails.fine'].disabled=true;
			 document.forms[0]['invoiceDetails.scholarAmt'].disabled=true;
			 if(document.forms[0]['invoiceDetails.balanceAmt'].value=="")
			 {
			  document.forms[0]['invoiceDetails.balanceAmt'].value="0";
			 }
			 if(document.forms[0]['invoiceDetails.paidAmt'].value=="")
			 {
			 document.forms[0]['invoiceDetails.paidAmt'].value="0";
			  document.forms[0]['invoiceDetails.balanceAmt'].value="0";
			 }
			}
			
			function chkFines(obj)
			{
			 	if(document.forms[0]['chkFine'].checked){
			  		document.forms[0]['invoiceDetails.fine'].disabled=false;
				}else{
					document.forms[0]['invoiceDetails.fine'].disabled=true;
					document.forms[0]['invoiceDetails.fine'].value = "0.00";
				}
			}

			function chkScholars(obj)
			{
			 if(document.forms[0]['chkScholar'].checked){
			  		document.forms[0]['invoiceDetails.subType'].disabled=true;
			  //		document.forms[0]['invoiceDetails.scholarAmt'].disabled=false;
			 }else{
			  		document.forms[0]['invoiceDetails.scholarAmt'].disabled=true;
			  		document.forms[0]['invoiceDetails.scholarAmt'].value = "0.00";
			 }
			}
			
			function chkTransports(obj)
			{
			 if(document.forms[0]['chkTransport'].checked)
			 {
			    document.forms[0]['invoiceDetails.subType'].disabled=true;
			    //document.forms[0]['invoiceDetails.transportFee'].disabled=false;
			 }else{
			    document.forms[0]['invoiceDetails.subType'].disabled=false;
			    document.forms[0]['invoiceDetails.transportFee'].disabled=true;
			    document.forms[0]['invoiceDetails.transportFee'].value = "0.00";
			 }
			}
			
			function chkHostels(obj)
			{
			 if(document.forms[0]['chkHostel'].checked)
              	{
			      document.forms[0]['invoiceDetails.subType'].disabled=true;	
			      //document.forms[0]['invoiceDetails.hostelFee'].disabled=false;
              	}else{
              	  document.forms[0]['invoiceDetails.subType'].disabled=false;	
			      document.forms[0]['invoiceDetails.hostelFee'].disabled=true;
			      document.forms[0]['invoiceDetails.hostelFee'].value = "0.00";
              	}
			}
			// calculate balance 
			function calculateBalance(){
			try{
				var formObj = document.forms[0];
				var total = formObj['invoiceDetails.totalAmtPaid'].value;
				var paid = formObj['invoiceDetails.paidAmt'].value;
				var hostelFee = formObj['invoiceDetails.hostelFee'].value;
				var transportFee = formObj['invoiceDetails.transportFee'].value;
				var fine = formObj['invoiceDetails.fine'].value;
				var scholarAmt = formObj['invoiceDetails.scholarAmt'].value;
				if(isNaN(paid) || paid == ""){
					paid = 0;
				}
				if(isNaN(hostelFee) || hostelFee == ""){
					hostelFee = 0;
				}
				if(isNaN(transportFee) || transportFee == ""){
					transportFee = 0;
				}
				if(isNaN(fine) || fine == ""){
					fine = 0;
				}
				if(isNaN(scholarAmt) || scholarAmt == ""){
					scholarAmt = 0;
				}
				var actualPaid = parseFloat(paid) + parseFloat(hostelFee) + parseFloat(transportFee) + parseFloat(fine) + parseFloat(scholarAmt);
				formObj['invoiceDetails.balanceAmt'].value = parseFloat(total) - parseFloat(paid);
				formObj['invoiceDetails.grossAmt'].value = parseFloat(actualPaid); 
				}catch(e){
				  alert("Error Occured:"+e);
				} 
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
					key="nrega.home" /></a> &gt; <span>Invoice</span></td>
			</tr>
			<html:messages id="msg" message="true" />
			<logic:messagesPresent message="true">
				<tr>
					<td colspan="10"><span class="success">
					<script language="javascript">
												alert('<bean:write name="msg" />');
												</script>
					<bean:write
						name="msg" /> </span></td>
				</tr>
			</logic:messagesPresent>
				<tr>
					<td colspan="10" class="error" ><html:errors/>
					</td>
				</tr>
			<tr>
				<td width="100%"><html:form action="InvoiceDetail"
					method="post">
					<html:hidden property="invoiceDetails.invoiceId" />
					<html:hidden property="studentId" />
					<html:hidden property="classId" />
					<html:hidden property="scholarAmt" />

					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border">
								<tr>
									<td colspan="10" class="form-heading"><span
										class="search-heading"><bean:message
										key="projectSearch.heading" /> </span></td>
								</tr>
								<tr>
									<td colspan="10" class="form-row-text" nowrap>
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										align="center" class="form-border">
										<tr>
										<td class="form-row-text" nowrap>Fees Date :</td>
										<td class="form-row-input" nowrap>
										<html:text
											property="invoiceDetails.feesDate"
											size="10" maxlength="12" styleId="searchProjectName"
											/>
											<a	href="#" id="beneficiaryDOB" name="beneficiaryDOB"> <img
												src='images/calendar.gif'
											onclick="calendar.select(document.forms[0]['invoiceDetails.feesDate'],'invoiceDetails.feesDate','dd/MM/yyyy');return false;" />
											</a>	
										
										<!--  <td class="form-row-text">Receipt No :</td>-->
<html:hidden
											property="invoiceDetails.invoiceNo" 
											 /> 
									<input type="checkbox" name="changeInv" onchange="javascript:setInvoice(this);" onclick="javascript:setInvoice(this);"
											 style="visibility:hidden;" /></td>
										<td class="form-row-text"><bean:message
											key="invoiceDetails.studentDetails.studentName" /> :</td>
										<td class="form-row-input"><html:text
											property="invoiceDetails.studentDetails.studentName"
											size="25" maxlength="25" styleId="searchProjectName"
											disabled="true" /></td>

										<td class="form-row-text"><bean:message
											key="projectSearch.class" /> :</td>
										<td class="form-row-input"><html:text
											property="invoiceDetails.studentDetails.classDetails.classWithSectionName"
											size="5" maxlength="5" styleId="searchProjectName"
											disabled="true" /></td>

										<td class="form-row-input" nowrap colspan="2" >Community: <html:text
											property="invoiceDetails.studentDetails.category"
											size="5" maxlength="5" styleId="searchProjectName"
											disabled="true" />
											Sub Caste: <html:text
											property="invoiceDetails.studentDetails.subCategory"
											size="20" styleId="searchProjectName"
											disabled="true" />
										</td>
										</tr>
										<tr>
											<td class="form-row-text"><bean:message
												key="invoiceDetails.feesType" /> :</td>
											<td class="form-row-input"><html:select
												property="invoiceDetails.feesType"
												styleId="searchProjectName" onchange="javascript:getFeesSubType();">
												<html:optionsCollection property="feesType" label="feesType"
													value="feesType" />
											</html:select></td>

											<td class="form-row-text">Sub Type :</td>
											<td class="form-row-input"><html:select
												property="invoiceDetails.subType"
												styleId="searchProjectName" size="8" multiple="true" onchange="javascript:setTotalAmt(this);javascript:setGrossAmt(this);" onblur="javascript:getMultipleSelection('invoiceDetails.subType', true);">
												<html:optionsCollection property="feesSubType" label="feesName"
													value="feesAmt" />
											</html:select></td>
											<td colspan="6">
											<table border="0" width="100%" height="100%" ><tr>
											<td class="form-row-text"><bean:message
												key="invoiceDetails.amountPaid" /> :</td>
											<td class="form-row-input"><html:text
												property="invoiceDetails.totalAmtPaid" size="5"
												maxlength="10" styleId="searchProjectName" disabled="true"/></td>
  											<td class="form-row-text">Gross Amount:</td>
											<td class="form-row-input"><html:text
												property="invoiceDetails.grossAmt" size="5"
												maxlength="10" styleId="searchProjectName" disabled="true"/></td>											</td>
											</tr>
											<tr>

											<td class="form-row-text">Paid Amount:</td>
											<td class="form-row-input"><html:text
												property="invoiceDetails.paidAmt" size="5"
												maxlength="10" styleId="searchProjectName" onblur="javascript:calculateBalance();"/></td>	
											<td class="form-row-text">Balance Amount:</td>
											<td class="form-row-input"><html:text
												property="invoiceDetails.balanceAmt" size="5"
												maxlength="10" styleId="searchProjectName" onblur="javascript:calculateBalance();"/></td>																								
											</tr>
											<tr>
                                            <td class="form-row-text">Paid By :</td>
											<td class="form-row-input">
											<html:select
												property="invoiceDetails.paidBy" 
												 style="width:100px;">
          								       <html:option value="Student">Student</html:option>
											   <html:option value="Parent">Parent</html:option>
											   <html:option value="Others">Others</html:option>
											</html:select>
											</td>											
											<td class="form-row-text">Pay By :</td>
											<td class="form-row-input"><html:select property="invoiceDetails.payBy" style="width:100px;">
												<html:option value="CASH">Cash</html:option>
												<html:option value="CREDITCARD">Credit Card</html:option>
												<html:option value="CHEQUE">Cheque</html:option>
											</html:select></td>

											</tr>
											<tr>
											
											<td class="form-row-text"><input type="checkbox" name="chkTransport" />Transport Fee:</td>
											<td class="form-row-input">
											<html:text
												property="invoiceDetails.transportFee" size="5" 
												maxlength="45" styleId="searchProjectName" onblur="javascript:calculateBalance();"/>
											</td>

											<td class="form-row-text"><input type="checkbox" name="chkHostel" />Hostel Fee:</td>
											<td class="form-row-input">
											<html:text
												property="invoiceDetails.hostelFee" size="5" 
												maxlength="45" styleId="searchProjectName" onblur="javascript:calculateBalance();"/>
											</td>
											</tr>
											<tr>
											<td class="form-row-text"><input type="checkbox" name="chkFine" onclick="javascript:chkFines(this);"/> Fine if Any :</td>
											<td class="form-row-input">
											<html:text
												property="invoiceDetails.fine" size="5" value="0.00"
												maxlength="45" styleId="searchProjectName" onblur="javascript:calculateBalance();"/>
											</td>
											<td class="form-row-text"><input type="checkbox" name="chkScholar" />Scholarship if Any :</td>
											<td class="form-row-input">
											<html:text
												property="invoiceDetails.scholarAmt" size="5" 
												maxlength="45" styleId="searchProjectName" onblur="javascript:calculateBalance();"/>
											</td>
											</tr>
											<tr>
											<td class="form-row-text">Student Type</td>
											<td class="form-row-input"><html:select property="invoiceDetails.studentType" style="width:110px;">
												<html:option value="NA">Select</html:option>
												<html:option value="NEW">New</html:option>
												<html:option value="OLD">Old</html:option>
											</html:select></td>
											<td class="form-row-text">Card/Cheque No:</td>
											<td class="form-row-input">
											<html:text
												property="invoiceDetails.chqNo" size="15"
												maxlength="45" styleId="searchProjectName" />
											</td>											
											<td><html:hidden property="selectedName" /></td>
											<td><html:hidden property="selectedValue" /></td>
											</tr>
											</table>
											</td>
										</tr>
									</table>
									</td>
								</tr>
								<tr>
									<td colspan="10" class="form-row-text">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td align="right">
											<div id="button2">
											<ul>
												<li class="buttonrightcrnr reset"
													onmouseover="this.className='buttonhighlight reset'"
													onmouseout="this.className='buttonrightcrnr reset'"
													title="Reset"><a href="javascript:printBill();">Print</a></li>
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
										name="invoiceDetailForm" property="pageSizeList"
										toScope="page" /> <logic:empty property="invoiceDetailList"
										name="invoiceDetailForm">
										<bean:message key="no.search.projects" />
									</logic:empty><logic:notEmpty property="invoiceDetailList"
										name="invoiceDetailForm">
										<tr>
											<td class="padding-btm-ten">
											<table width="100%" border="0" cellspacing="1"
												cellpadding="0">
												<tr>
													<td colspan="7" class="form-sub-heading">
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
												<td colspan="10"><display:table id="invoiceDetailsId"
														name="searchResult" requestURI="InvoiceDetail.cp"
														pagesize="10" sort="list" defaultsort="1"
														defaultorder="descending" excludedParams="action"
														style="width:100%;text-align:center;"
														class="padding-btm-ten form-border display-table-header">
														<%--<display:column title="Id" property="invoiceId" 
															style="width: 5%;" sortable="true"
															headerClass="grid-heading-row"></display:column>--%>
														<display:column title="Invoice No" property="invoiceNo"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<%--<display:column title="Invoice Date" property="invoiceDate"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>--%>
														<display:column title="Fees Type" property="feesType"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Fees Date" property="feesDate"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Actual Amount" property="totalAmtPaid"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Sub Type" property="subType"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Paid By" property="paidBy"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Pay By" property="payBy"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Fine" property="fine"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Card/Cheque No" property="chqNo"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>
														<display:column title="Student Type" property="studentType"
															style="width: 13%;" sortable="true"
															headerClass="grid-heading-row"></display:column>									
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
		<script language="javascript">
		resetFilters();
		selectAllFeesType();
		document.forms[0]['invoiceDetails.paidAmt'].value = document.forms[0]['invoiceDetails.totalAmtPaid'].value;
		</script>
</body>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cubepro.invoice.InvoiceDetails"%>
</html>
