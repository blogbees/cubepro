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
<script src="<%=request.getContextPath()%>/js/multifile.js"
	type="text/javascript"></script>
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
				  $('#rangeB').daterangepicker({
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
			function submitStaffForm(){
				if(validate() == true){
				document.forms[0].action="<%=request.getContextPath()%>/StaffDetail.cp?action=persistStaff";
				document.forms[0].submit();
				}
			}
			
			function validate(){
				var dob = document.forms[0]['staffDetails.dobString'];
				if(!IfNullorEmpty(dob.value)){
					if(isDate(dob.value, 'dd/MM/yyyy') == false){					
					jAlert(' <bean:message key="date.invalid"/> ! ')
					dob.focus();
					return false;
				}
				}
				return true;
				
				var doj = document.forms[0]['staffDetails.dojString'];
				if(!IfNullorEmpty(doj.value)){
					if(isDate(doj.value, 'dd/MM/yyyy') == false){					
					jAlert(' <bean:message key="date.invalid"/> ! ')
					doj.focus();
					return false;
				}
				}
				if(IfNullorEmpty(document.forms[0]['staffDetails.firstName'].value)){
					jAlert('Please enter staff name')
					document.forms[0]['staffDetails.firstName'].focus();
					return false;
				}
				if(IfNullorEmpty(document.forms[0]['staffDetails.firstName'].value)){
					jAlert('Please enter staff name')
					document.forms[0]['staffDetails.firstName'].focus();
					return false;
				}
				if(IfNullorEmpty(document.forms[0]['staffDetails.fatherName'].value) && IfNullorEmpty(document.forms[0]['staffDetails.guardianName'].value)){
					jAlert('Please enter either father name or guardian name')
					document.forms[0]['staffDetails.fatherName'].focus();
					return false;
				}				
				return true;
			}
			
			function resetStaffFields(){
				document.forms[0].action="<%=request.getContextPath()%>/StaffDetail.cp?action=resetStaffFields";
				document.forms[0].submit();
			}
			
			function setSubjects(){
				document.forms[0].action="<%=request.getContextPath()%>/StaffDetail.cp?action=getSubject";
				document.forms[0].submit();
			}
			
			function roundNumber(number,decimals) {
	var newString;// The new rounded number
	decimals = Number(decimals);
	if (decimals < 1) {
		newString = (Math.round(number)).toString();
	} else {
		var numString = number.toString();
		if (numString.lastIndexOf(".") == -1) {// If there is no decimal point
			numString += ".";// give it one at the end
		}
		var cutoff = numString.lastIndexOf(".") + decimals;// The point at which to truncate the number
		var d1 = Number(numString.substring(cutoff,cutoff+1));// The value of the last decimal place that we'll end up with
		var d2 = Number(numString.substring(cutoff+1,cutoff+2));// The next decimal, after the last one we want
		if (d2 >= 5) {// Do we need to round up at all? If not, the string will just be truncated
			if (d1 == 9 && cutoff > 0) {// If the last digit is 9, find a new cutoff point
				while (cutoff > 0 && (d1 == 9 || isNaN(d1))) {
					if (d1 != ".") {
						cutoff -= 1;
						d1 = Number(numString.substring(cutoff,cutoff+1));
					} else {
						cutoff -= 1;
					}
				}
			}
			d1 += 1;
		} 
		if (d1 == 10) {
			numString = numString.substring(0, numString.lastIndexOf("."));
			var roundedNum = Number(numString) + 1;
			newString = roundedNum.toString() + '.';
		} else {
			newString = numString.substring(0,cutoff) + d1.toString();
		}
	}
	if (newString.lastIndexOf(".") == -1) {// Do this again, to the new string
		newString += ".";
	}
	var decs = (newString.substring(newString.lastIndexOf(".")+1)).length;
	for(var i=0;i<decimals-decs;i++) newString += "0";
	//var newNumber = Number(newString);// make it a number if you like
	return newString; // Output the result to the form field (change for your purposes)
}
			
			function setPFRelatedValues(){
				var basicPay = document.forms[0]['staffDetails.basicPay'].value;
				if(trim(basicPay)!=""){
					document.forms[0]['staffDetails.hra'].value = roundNumber((basicPay * 0.25),2);
					document.forms[0]['staffDetails.allow1'].value = roundNumber((basicPay * 0.10),2);
					document.forms[0]['staffDetails.allow2'].value = roundNumber((basicPay * 0.10),2);
					document.forms[0]['staffDetails.pfAmt'].value = roundNumber((basicPay * 0.12),2);
					document.forms[0]['staffDetails.esiAmt'].value = roundNumber((basicPay * 0.0475),2);
				}
			}
			
			function toggleTransportCombo(){
				var obj = document.forms[0]['staffDetails.isUsingTransport'];
				if(obj.value == "Yes"){
					document.forms[0]['staffDetails.routeStopId'].disabled = false;
				}else{
					document.forms[0]['staffDetails.routeStopId'].value = "";
					document.forms[0]['staffDetails.routeStopId'].disabled = true;
				}
			}
			
			function toggleHostelCombo(){
				var obj = document.forms[0]['staffDetails.isUsingHostel'];
				if(obj.value == "Yes"){
					document.forms[0]['staffDetails.roomId'].disabled = false;
				}else{
					document.forms[0]['staffDetails.roomId'].value = "";
					document.forms[0]['staffDetails.roomId'].disabled = true;
				}
			}
</script>

	<table width="999" border="0" align="center" cellpadding="0"
		cellspacing="0">
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
							<span>Staff Detail</span>
						</td>
					</tr>
					<tr>
						<td width="100%">
							<html:form action="StaffDetail" method="post" enctype="multipart/form-data">
								<table width="100%" border="0" align="center" cellpadding="0"
									cellspacing="1" class="form-border">
									<tr>
										<td colspan="8" class="form-heading">
											<span class="search-heading">Staff Register</span>
										</td>
									</tr>
									<html:messages id="msg" message="true" />
									<logic:messagesPresent message="true">
										<tr>
											<td colspan="8">
												<script language="javascript">
												alert('<bean:write name="msg" />');
												</script>
												<b>
												<span class="success"><b><bean:write
									name="msg" /></span></b>
											</td>
										</tr>
									</logic:messagesPresent>
									<tr>
										<td>
											<!-- Grid Part Start -->
											<table width="100%" border="0" align="center" cellpadding="0"
												cellspacing="1" class="form-border">
												<tr>
													<td colspan="6" class="form-sub-heading">
														<span class="personal-details"><bean:message
																key="staffDetails.staffRegister" /> </span>
													</td>
												</tr>
											<tr>
											<td colspan="5" class="form-row-text">
											<table width="100%" border="0" align="center" cellpadding="0"
												cellspacing="1" class="form-border">
												<tr>
													<td width="21%" class="form-row-text">
														<!--<bean:message key="staffDetails.staffId" /><span class="required">*</span>:-->
													</td>
													<td colspan="6" width="21%" class="ben-form-row-input">
														<html:hidden property="staffDetails.staffId" 
															/>
															
													</td>
												</tr>
												<tr>
																<td width="16%" class="form-row-text" nowrap>
																	First Name<span class="required">*</span>  
																</td>
																<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.firstName"
																		 maxlength="45"
																		size="10" />
																</td>
																<td width="16%" class="form-row-text" nowrap>
																	Second Name<span class="required">*</span>
																</td>
																<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.secondName"
																		 maxlength="45"
																		size="10" />
																</td>
																<td width="16%" class="form-row-text" nowrap>
																Sex<span class="required">*</span>
																</td>
																<td width="17%" class="form-row-input" nowrap>
																	<html:select property="staffDetails.sex" style="width:50px;" >
																	 <html:option value="Male">Male</html:option>
																	 <html:option value="Female">Female</html:option>
																	 <html:option value="Others">Others</html:option>
																	</html:select>	
																	<span class="required">*</span>
																</td>
																</tr>
																																<tr>
																<td width="16%" class="form-row-text" nowrap>
																	<bean:message key="staffDetails.staffNo" />
																</td>
																<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.staffNo"
																		 maxlength="25"
																		size="10" disabled="true"></html:text>
																	<span class="required">*</span> 
																	<!--<html:hidden
																		property="staffDetails.classDetails.classId"
																		value="1" />-->
																</td>
																<td width="17%" class="form-row-text">
																	DOB
																</td>
																<td class="form-row-input" nowrap>
																	<html:text property="staffDetails.dobString"
																		maxlength="25" size="10" styleId="rangeA"></html:text>
																	<span class="required">*</span>
																	
																</td>
																<td width="16%" class="form-row-text">
																	DOJ
																	<span class="required">*</span>
																</td>
																<td class="form-row-input" nowrap>
																	<html:text property="staffDetails.dojString" size="10"
																		maxlength="25" styleId="rangeB"></html:text>
																	<span class="required">*</span>
																	
																	</a>
																</td>
															</tr>
															<tr>
																<td width="16%" class="form-row-text">
																	Fath./Husb. Name
																</td>
																<td width="17%" class="ben-form-eng-name-input">
																	<html:text property="staffDetails.fatherName"
																		maxlength="25"></html:text>
																</td>
																<td width="17%" class="form-row-text">
																	<bean:message key="staffDetails.motherName" />
																</td>
																<td width="18%" class="ben-form-eng-name-input">
																	<html:text property="staffDetails.motherName"
																		maxlength="25"></html:text>
																</td>
																<td width="16%" class="form-row-text">
																	<bean:message key="staffDetails.guardianName" />
																</td>
																<td width="16%" class="ben-form-eng-name-input" nowrap>
																	<html:text property="staffDetails.guardianName"
																		maxlength="25"></html:text>
																</td>
															</tr>
															<tr>
																<td width="16%" class="form-row-text">
																	<bean:message key="staffDetails.qualification" />
																</td>
																<td width="16%" class="ben-form-eng-name-input" nowrap>
																	<html:text property="staffDetails.qualification"
																		size="7" maxlength="25"></html:text>
																</td>
																<td width="34%" class="form-row-text" nowrap>
																	<bean:message key="staffDetails.designation" />
																</td>
																<td width="35%" 
																	class="ben-form-eng-name-input" nowrap>
																	<html:text property="staffDetails.designation"
																		maxlength="25" size="6" />
																</td>
																<td width="16%" class="form-row-text" nowrap>
																	Department
																</td>
																<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.dept"
																		 maxlength="45"
																		size="20" />
																</td>
															</tr>
															<tr>
																			<td width="16%" class="form-row-text" nowrap>
																				<bean:message key="staffDetails.salaryAmount" />
																			</td>
																			<td width="16%" class="form-row-input" nowrap>
																				<html:text property="staffDetails.salaryAmount" maxlength="20" size="10" />
																			</td>
																			<td width="16%" class="form-row-text" nowrap>
																	Prev Emp Details
																</td>
																<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.prevEmp"
																		 maxlength="45"
																		size="25" />
																</td>
																<td width="16%" class="form-row-text" nowrap >
																</td>
																<td width="17%" class="form-row-input" nowrap>
																</td>
															</tr>
															<tr>
																<td colspan="6">
																	<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center" >
																		<tr>
																			<td width="16%" class="form-row-text">
																				<bean:message key="staffDetails.subjectHandled1" />
																			</td>
																			<td width="16%" class="form-row-input" nowrap>
																				<html:text property="staffDetails.subjectHandled1"
																					style="width:100px;" size="25" maxlength="45" />
																					
																			</td>
																			<td width="16%" class="form-row-text" nowrap>
																				<bean:message key="staffDetails.subjectHandled2" />
																			</td>
																			<td width="16%"  class="form-row-input"
																				nowrap>
																			<html:text property="staffDetails.subjectHandled2"
																					style="width:100px;" size="25" maxlength="45" />
																			</td>
																			<td width="16%" class="form-row-text" nowrap>
																				<bean:message key="staffDetails.subjectHandled3" />
																			</td>
																			<td width="16%" class="form-row-input"
																				nowrap>
																				<html:text property="staffDetails.subjectHandled3"
																					style="width:100px;" size="25" maxlength="45" />
																			</td>
																			<td width="16%" class="form-row-text" nowrap>
																				<bean:message key="staffDetails.subjectHandled4" />
																			</td>
																			<td width="16%"  class="form-row-input"
																				nowrap>
																				<html:text property="staffDetails.subjectHandled4"
																					style="width:100px;" size="25" maxlength="45" />
																			</td>
																			</tr>
																			</table>
																			</td>
																			</tr>
																			
															</table>
															</td>
															<td class="form-row-text" >
										<table width="100%">
											<tr>
												<td class="ben-form-row-input" align="left">
												<table width="100%" height="200px" cellpadding="0"
													cellspacing="0" align="left" border="0"
													class="form-row-text">
													<tr>
														<td><img
															src="<bean:write name="staffDetailForm" property="staffDetails.photo" />"
															width="200" height="200" /> <html:hidden
															property="staffDetails.photo" /></td>
													</tr>
													<tr align="left" valign="bottom">
														<td align="left">Select Photo: <html:file
															property="staffPhoto" styleId="staffPhoto"
															accept="jpg" /></td>
														<td align="left">
														<div width="100%" height="200px" id="initialPhoto-list">
														</div>
														<td>
													</tr>
												</table>
												</td>
											</tr>
										</table>
										</td>
															</tr>
															
																															
																<tr>
																	<td colspan="6" class="form-sub-heading">
																		<span class="personal-details">Contact Information</span>
																	</td>
																</tr>
															<tr>
																<td width="16%" class="form-row-text" nowrap>
																	House No
																</td>
																<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.houseNo"
																		 maxlength="45"
																		size="10" />
																</td>
																<td width="16%" class="form-row-text" nowrap>
																	House Name
																</td>
																<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.houseName"
																		 maxlength="45"
																		size="15" />
																</td>
																<td width="16%" class="form-row-text" nowrap>
																	Street
																</td>
																<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.street"
																		 maxlength="45"
																		size="15" />
																</td>
															</tr>
															<tr>
																<td width="16%" class="form-row-text" nowrap>
																	City/Pin
																</td>
																<td width="17%" class="form-row-input" nowrap>
																<html:text property="staffDetails.city"
																		 maxlength="45"
																		size="10" />
/
																	<html:text property="staffDetails.pin"
																		 maxlength="45"
																		size="8" />
																	
																</td>
																<td width="16%" class="form-row-text" nowrap>
																	District/State
																</td>
																<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.district"
																		 maxlength="45"
																		size="10" />
																	/
																	<html:text property="staffDetails.state"
																		 maxlength="45"
																		size="10" />
																	
																</td>
																<td width="16%" class="form-row-text" nowrap>
																	Country
																</td>
																<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.country"
																		 maxlength="45"
																		size="15" />
																	
																</td>
															</tr>
															<tr>
																<td width="16%" class="form-row-text">
																	<bean:message key="staffDetails.phone" />
																</td>
																<td width="16%" class="ben-form-eng-name-input" nowrap>
																	<html:text property="staffDetails.phone" maxlength="25"></html:text>
																</td>
																<td width="16%" class="form-row-text" nowrap>
																	Mobile(Receiving SMS No) 
																</td>
																<td width="17%" class="ben-form-eng-name-input" nowrap>
																	<html:text property="staffDetails.mobile"
																		maxlength="45" size="10" />
																</td>
																<td width="16%" class="form-row-text" nowrap>
																	Email
																</td>
																<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.email"
																		 maxlength="45"
																		size="15" />
																	
																</td>
															</tr>
										
									<tr>
										<td colspan="6" class="form-sub-heading">
												<span class="personal-details">Payroll Information - Earnings</span>
										</td>
									</tr>
									<tr>
										<td width="16%" class="form-row-text">
											Basic Pay
										</td>
										<td width="16%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.basicPay"
																		 maxlength="45"
																		size="10" onblur="javascript:setPFRelatedValues();" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											House Rent Allowance 
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.hra"
																		 maxlength="45"
																		size="10" />

										</td>
										<td width="16%" class="form-row-text" nowrap>
											Dearness Allowance
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.da"
																		 maxlength="45"
																		size="10" />
											
										</td>
									</tr>
									<tr>
										<td width="16%" class="form-row-text">
											CCA
										</td>
										<td width="16%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.allow1"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											Contribution
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.allow2"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											Others(If Any)
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.others"
																		 maxlength="45"
																		size="10" />
											
										</td>
									</tr>	
									<tr>
										<td colspan="6" class="form-sub-heading">
												<span class="personal-details">Payroll Information - Deductions</span>
										</td>
									</tr>
									<tr>
										<td width="16%" class="form-row-text">
											PF Amount
										</td>
										<td width="16%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.pfAmt"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											PF Account #
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.pfAcc"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											Any Loan Amt
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.loanAmt"
																		 maxlength="45"
																		size="10" />
											
										</td>
									</tr>
									<tr>
										<td width="16%" class="form-row-text">
											ESI Amount
										</td>
										<td width="16%" class="form-row-input" nowrap>
																												<html:text property="staffDetails.esiAmt"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											ESI Account #
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.esiAcc"
																		 maxlength="45"
																		size="10" />

										</td>
										<td width="16%" class="form-row-text" nowrap>
											Others(If Any)
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.esiOthers"
																		 maxlength="45"
																		size="10" />
											
										</td>
									</tr>								
									<tr>
										<td width="16%" class="form-row-text">
											TDS Amount
										</td>
										<td width="16%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.tdsAmt"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											TDS Account #
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.tdsAcc"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
										 	
										</td>
										<td width="17%" class="form-row-input" nowrap>
											
										</td>
									</tr>
<!-- Start fix for new fields -->
									<tr>
										<td colspan="6" class="form-sub-heading">
												<span class="personal-details">Addition</span>
										</td>
									</tr>
									<tr>
										<td width="16%" class="form-row-text">
											D.P
										</td>
										<td width="16%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.d_p"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											P.P
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.p_p"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											M.A
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.m_a"
																		 maxlength="45"
																		size="10" />
											
										</td>
									</tr>
<tr>
										<td width="16%" class="form-row-text">
											O.A
										</td>
										<td width="16%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.o_a"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											S.A
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.sa"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											
										</td>
										<td width="17%" class="form-row-input" nowrap>
											
										</td>
									</tr>
									<tr>
										<td colspan="6" class="form-sub-heading">
												<span class="personal-details">Govt Deduction</span>
										</td>
									</tr>
									<tr>
										<td width="16%" class="form-row-text">
											P.F Cont
										</td>
										<td width="16%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.pf_cont"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											FBF
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.fbf"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											HF
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.hf"
																		 maxlength="45"
																		size="10" />
											
										</td>
									</tr>
<tr>
										<td width="16%" class="form-row-text">
											P.F Rec
										</td>
										<td width="16%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.pf_rec"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											FA
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.fa"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											SPF - I
										</td>
										<td width="17%" class="form-row-input" nowrap>
												<html:text property="staffDetails.spf_1"
																		 maxlength="45"
																		size="10" />
										</td>
									</tr>									
									<tr>
										<td colspan="6" class="form-sub-heading">
												<span class="personal-details">Management Deduction</span>
										</td>
									</tr>
									<tr>
										<td width="16%" class="form-row-text">
											NTC
										</td>
										<td width="16%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.ntc"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											T.A
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.t_a"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											CMA
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.cma"
																		 maxlength="45"
																		size="10" />
											
										</td>
									</tr>
									<tr>
										<td width="16%" class="form-row-text">
											DIOCESAN
										</td>
										<td width="16%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.diocesan"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											LIC
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.lic"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											RD
										</td>
										<td width="17%" class="form-row-input" nowrap>
												<html:text property="staffDetails.rd"
																		 maxlength="45"
																		size="10" />
										</td>
									</tr>		
									<tr>
										<td width="16%" class="form-row-text">
											PLI
										</td>
										<td width="16%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.pli"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											GUILD
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.guild"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											Staff Ex.
										</td>
										<td width="17%" class="form-row-input" nowrap>
												<html:text property="staffDetails.staff_ex"
																		 maxlength="45"
																		size="10" />
										</td>
									</tr>
									<tr>
										<td width="16%" class="form-row-text">
											P.TAX
										</td>
										<td width="16%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.p_tax"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											Co-Optex
										</td>
										<td width="17%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.co_optex"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											MISC
										</td>
										<td width="17%" class="form-row-input" nowrap>
												<html:text property="staffDetails.misc"
																		 maxlength="45"
																		size="10" />
										</td>
									</tr>
									<tr>
										<td width="16%" class="form-row-text">
											STAMP
										</td>
										<td width="16%" class="form-row-input" nowrap>
																	<html:text property="staffDetails.stamp"
																		 maxlength="45"
																		size="10" />
											
										</td>
										<td width="16%" class="form-row-text">
											
										</td>
										<td width="16%" class="form-row-text">
											
										</td>
										<td width="16%" class="form-row-text">
											
										</td>
										<td width="16%" class="form-row-text">
											
										</td>
									</tr>	
									<tr>
									<td class="form-row-text">
									 Transport
									 </td><td align="left" class="form-row-text">
									 <html:select
										property="staffDetails.isUsingTransport" style="width:50px;" onchange="javascript:toggleTransportCombo();">
										<html:option value="No">No</html:option>
										<html:option value="Yes">Yes</html:option>
									</html:select>
									</td>	
										<td width="16%" class="form-row-text" nowrap>
											Vehicle - Route - Stop - Fees
										</td>
										<td width="17%" class="form-row-input" nowrap colspan="3">
											<html:select
													property="staffDetails.routeStopId"
													style="width:400px;">
													<option value="">--Select--</option>
													<logic:iterate property="routeStopList" name="staffDetailForm" id="routeStopListId" indexId="i" type="com.cubepro.transport.RouteStop">
														<html:option value="<%=String.valueOf(routeStopListId.getRouteStopId())%>" >
														<bean:write name="routeStopListId" property="route.vehicle.regName" /> - 
														<bean:write name="routeStopListId" property="route.routeName" /> -
														<bean:write name="routeStopListId" property="stop.stopName" /> - 
														<bean:write name="routeStopListId" property="stopFees" />
														</html:option>
													</logic:iterate>
												</html:select>
										</td>
									</tr>
									<tr>
									<td class="form-row-text">
									 Hostel
									 </td><td align="left" class="form-row-text">
									 <html:select
										property="staffDetails.isUsingHostel" style="width:50px;" onchange="javascript:toggleHostelCombo();">
										<html:option value="No">No</html:option>
										<html:option value="Yes">Yes</html:option>
									</html:select>
									</td>		
										<td width="16%" class="form-row-text" nowrap>
											Building - Room - Extn
										</td>
										<td width="17%" class="form-row-input" nowrap colspan="3" >
											<html:select
													property="staffDetails.roomId"
													style="width:400px;">
													<option value="">--Select--</option>
													<logic:iterate property="roomList" name="staffDetailForm" id="roomListId" indexId="i" type="com.cubepro.hostel.Room">
														<html:option value="<%=String.valueOf(roomListId.getRoomId())%>" >
														<bean:write name="roomListId" property="buildingInf.name" /> - 
														<bean:write name="roomListId" property="roomNo" /> -
														<bean:write name="roomListId" property="roomExtn" />
														</html:option>
													</logic:iterate>
												</html:select>
										</td>
									</tr>
									
<!-- End fix for new fields -->

									<tr>
										<td colspan="6" class="form-sub-heading">
												<span class="personal-details">Bank Details</span>
										</td>
									</tr>
									<tr>
										<td width="16%" class="form-row-text">
											Bank Name
										</td>
										<td width="16%" class="form-row-input" nowrap>
															<html:text property="staffDetails.bankName"
																		 maxlength="45"
																		size="20" />
											
										</td>
										<td width="16%" class="form-row-text" nowrap>
											Bank Acc #
										</td>
										<td width="17%" class="form-row-input" nowrap>
											<html:text property="staffDetails.bankAcc"
																		 maxlength="45"
																		size="20" />
										</td>
										<td width="16%" class="form-row-text" nowrap>
											Type
										</td>
										<td width="17%" class="form-row-input" nowrap>
											<html:select property="staffDetails.type">
											<html:option value="CASH" >Cash</html:option>
											<html:option value="CHEQUE" >Cheque</html:option>
											<html:option value="CREDIT" >Credit</html:option>
											<html:option value="OTHERS" >Others</html:option>
											</html:select>
										</td>
										
									</tr>


									<tr>
										<td align="right" colspan="6" class="form-row-text">
											<table border="0" align="right" >
												<tr>
													<td align="right">
														<div id="button">
															<ul>

																<li class="buttonrightcrnr submit"
																	onmouseover="this.className='buttonhighlight submit'"
																	onmouseout="this.className='buttonrightcrnr submit'"
																	title='<bean:message key = "staffDetails.updateStaff"/>'>
																	<a href="javascript:submitStaffForm();"
																		onkeypress="if(event.keyCode == 32) {submitStaffForm();}">
																		<logic:notEqual name="staffDetailForm"
																	property="staffDetails.staffId" value="">
																		<bean:message
																			key="staffDetails.updateStaff" /> 
																			</logic:notEqual>
																		<logic:equal name="staffDetailForm"
																	property="staffDetails.staffId" value="">
																		Save Staff 
																			</logic:equal>	
																			</a>
																</li>
																<logic:notEqual name="staffDetailForm"
																	property="staffDetails.staffId" value="0">
																	<li class="buttonrightcrnr addmember2"
																		onmouseover="this.className='buttonhighlight addmember2'"
																		onmouseout="this.className='buttonrightcrnr addmember2'"
																		title='<bean:message key = "staffDetails.addStaff"/>'>
																		<a href="#" onclick="resetStaffFields();"
																			onkeypress="if(event.keyCode == 32) {resetStaffFields();};">Add New Staff </a>
																	</li>
																</logic:notEqual>
															</ul>
														</div>
													</td>
												</tr>
											</table>
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
	<script language="javascript">
	toggleTransportCombo();
    toggleHostelCombo();
	</script>
</body>
</html>
