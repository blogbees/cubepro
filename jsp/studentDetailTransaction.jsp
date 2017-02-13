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

<script language="javascript">
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
	
			function validate(){
				var dob = document.forms[0]['studentDetails.dobString'];
				if(!IfNullorEmpty(dob.value)){
					if(isDate(dob.value, 'dd/MM/yyyy') == false){					
						jAlert(' <bean:message key="date.invalid"/> ! ')
						dob.focus();
						return false;
					}
				}
				var doj = document.forms[0]['studentDetails.dojString'];
				if(!IfNullorEmpty(doj.value)){
					if(isDate(doj.value, 'dd/MM/yyyy') == false){					
					jAlert(' <bean:message key="date.invalid"/> ! ')
					doj.focus();
					return false;
				}
				}
				if(IfNullorEmpty(document.forms[0]['studentDetails.fatherName'].value) 
					&& IfNullorEmpty(document.forms[0]['studentDetails.guardianName'].value)){
					alert('Please enter either father name or guardian name');
					document.forms[0]['studentDetails.fatherName'].focus();
					return false;
				}				
				return true;
			}
			
			function resetStudentFields(){
				document.forms[0].action="<%=request.getContextPath()%>/StudentDetail.cp?action=resetStudentFields";
				document.forms[0].submit();
			}
			
			function toggleTransportCombo(){
				var obj = document.forms[0]['studentDetails.isUsingTransport'];
				if(obj.value == "Yes"){
					document.forms[0]['studentDetails.routeStopId'].disabled = false;
				}else{
					document.forms[0]['studentDetails.routeStopId'].value = "";
					document.forms[0]['studentDetails.routeStopId'].disabled = true;
				}
			}
			
			function toggleHostelCombo(){
				var obj = document.forms[0]['studentDetails.isUsingHostel'];
				if(obj.value == "Yes"){
					document.forms[0]['studentDetails.roomId'].disabled = false;
				}else{
					document.forms[0]['studentDetails.roomId'].value = "";
					document.forms[0]['studentDetails.roomId'].disabled = true;
				}
			}
			function toggleScholarship(){
			document.forms[0]['studentDetails.scholar1'].disabled = true;
			var obj = document.forms[0]['studentDetails.isUsingScholar'];
				if(obj.value == "Yes"){
					document.forms[0]['studentDetails.scholar1'].disabled = false;
				}else{
					document.forms[0]['studentDetails.scholar1'].disabled = true;
					
				}
			}
			
</script>
<style type="text/css">
body {
	font-size: 62.5%;
}

input {
	width: 196px;
	height: 1.1em;
	display: block;
}
</style>


<table width="999" border="0" align="center" cellpadding="0"
	cellspacing="0">
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
					key="nrega.home" /></a> &gt; <span>Student Detail</span></td>
			</tr>
			<tr>
				<td width="100%"><html:form action="StudentDetail"
					method="post" enctype="multipart/form-data">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td colspan="8" class="form-heading"><span
								class="search-heading"><bean:message
								key="beneficiaryregisteration.benregister" /> </span></td>
						</tr>
						<html:messages id="msg" message="true" />
						<logic:messagesPresent message="true">
							<tr>
										<script language="javascript">
												alert('<bean:write name="msg" />');
												</script>
								<td colspan="8"><span class="success"><b><bean:write
									name="msg" /></b></span></td>
							</tr>
						</logic:messagesPresent>
						<tr>
							<td><!-- Grid Part Start -->
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="form-border">
								<tr>
									<td colspan="5" class="form-sub-heading"><span
										class="personal-details">Academic Details</span></td>
								</tr>


								<tr>
									<td colspan="5">
									<table width="100%" border="0">
										<td class="form-row-text" width="70%">
										<table width="100%" border="0">
											<tr>
												<td class="form-row-text" nowrap>Admission No<span
													class="required">*</span></td>
												<td class="form-row-input" nowrap><html:text
													property="studentDetails.admissionNo" maxlength="100"
													size="20"></html:text></td>
												<td class="form-row-text" nowrap>Reg Serial No<br /><span
													class="required">(book No)<span></td>
												<td class="form-row-input" nowrap><html:text
													property="studentDetails.bookSerialNo" maxlength="100"
													size="20"></html:text></td>
												<td class="form-row-text" nowrap>Govt Reg No</td>
												<td class="form-row-input" nowrap><html:text
													property="studentDetails.govtRegNo" maxlength="100"
													size="20"></html:text></td>
											</tr>
											<tr>

												<td class="form-row-text" nowrap>First Name <span
													class="required">*</span></td>
												<td class="form-row-input" nowrap colspan="3"><html:text
													property="studentDetails.studentName" maxlength="45"
													size="60"></html:text></td>
												<td class="form-row-text" nowrap>Last Name <span
													class="required">*</span></td>
												<td class="form-row-input" nowrap><html:text
													property="studentDetails.lastName" maxlength="45" size="10"></html:text>
												</td>
												<td class="form-row-input" nowrap><html:hidden
													property="studentDetails.studentId"></html:hidden>
												</td>
											</tr>
											<tr>
												<td class="form-row-text" nowrap><bean:message
													key="staffDetails.sex" /></td>
												<td class="form-row-input" nowrap><html:select
													property="studentDetails.gender" style="width:70px;">
													<html:option value="Male">Male</html:option>
													<html:option value="Female">Female</html:option>
													<html:option value="Others">Others</html:option>
												</html:select> <span class="required">*</span></td>
												<td class="form-row-text" nowrap><bean:message
													key="projectSearch.rollNo" /><span class="required">*</span></td>
												<td class="form-row-input" nowrap><html:text
													property="studentDetails.rollNo"
													onblur="copyFamilyHeadValue();" maxlength="25" size="10"
													disabled="true"></html:text><span class="required">*</span>
												</td>
												<td class="form-row-text" nowrap><bean:message
													key="studentDetails.class" /> <span class="required">*</span></td>
												<td class="form-row-input" nowrap><html:select
													property="studentDetails.classDetails.classId"
													style="width:100px;">
													<html:optionsCollection property="classList"
														label="classWithSectionName" value="classId" />
												</html:select></td>
											</tr>
											<tr>
												<td class="form-row-text" nowrap><bean:message
													key="studentDetails.fatherName" /><span class="required">*</span></td>
												<td class="form-row-input" nowrap><html:text
													property="studentDetails.fatherName" maxlength="25"
													size="15"></html:text></td>
												<td class="form-row-text" nowrap><bean:message
													key="studentDetails.motherName" /></td>
												<td class="form-row-input" nowrap><html:text
													property="studentDetails.motherName" maxlength="25"
													size="15"></html:text></td>
												<td class="form-row-text" nowrap>Guardian Name</td>
												<td class="form-row-input" nowrap><html:text
													property="studentDetails.guardianName" maxlength="45"
													size="15"></html:text></td>

											</tr>
											<tr>
												<td class="form-row-text" nowrap><bean:message
													key="studentDetails.dobString" /><span class="required">*</span></td>
												<td class="form-row-input" nowrap><html:text
													property="studentDetails.dobString" maxlength="25"
													size="10" styleId="rangeB"></html:text></td>
												<td class="form-row-text" nowrap><bean:message
													key="studentDetails.dojString" /><span class="required">*</span></td>
												<td class="form-row-input" nowrap><html:text
													property="studentDetails.dojString" maxlength="25"
													size="10" styleId="rangeA"></html:text></td>
												<td class="form-row-text" nowrap>Mother Tongue</td>
												<td class="form-row-input" nowrap><html:text
													property="studentDetails.motherTongue" maxlength="25"
													size="10" /></td>
											</tr>
											<tr>
												<td class="form-row-text" nowrap>Community<span
													class="required">*</span></td>
												<td class="form-row-input" nowrap><html:select
													style="width:50px;" property="studentDetails.category">
													<html:option value="OC">OC</html:option>
													<html:option value="BC">BC</html:option>
													<html:option value="OBC">OC/BC</html:option>
													<html:option value="MBC">MBC</html:option>
													<html:option value="SC">SC</html:option>
													<html:option value="ST">ST</html:option>
													<html:option value="OTHERS">Others</html:option>
												</html:select></td>

												<td class="form-row-text" nowrap>Sub Caste</td>
												<td class="form-row-input" nowrap><html:text
													property="studentDetails.subCategory" maxlength="25"
													size="20" /></td>
												<td class="form-row-text" nowrap>Physical Status</td>
												<td class="form-row-input" nowrap><html:text
													property="studentDetails.physicalStatus" maxlength="25"
													size="10" /></td>


											</tr>
											<tr>
												<td class="form-row-text" nowrap>Scholarship if Any<span
													class="required">*</span></td>
											<td class="form-row-input" nowrap><html:select
												property="studentDetails.isUsingScholar"
												style="width:50px;"
												onchange="javascript:toggleScholarship();">
												<html:option value="No">No</html:option>
												<html:option value="Yes">Yes</html:option>
											</html:select></td>
												<td class="form-row-text" nowrap>Medium</td>
												<td class="form-row-input" nowrap><html:text
													property="studentDetails.medium" maxlength="25" size="10" />
												</td>
												<td class="form-row-text" nowrap>First Language</td>
												<td class="form-row-input" nowrap><html:text
													property="studentDetails.firstLanguage" maxlength="25"
													size="10" /></td>
											</tr>
											<tr>
												<td class="form-row-text" nowrap>Second Language</td>
												<td class="form-row-input" nowrap><html:text
													property="studentDetails.secondLanguage" maxlength="25"
													size="10" /></td>
												<td class="form-row-text" nowrap>Scholarship</td>
											<td width="16%" class="form-row-input" ><html:text
													property="studentDetails.scholar1" maxlength="25"
													size="10" /></td>
													<td class="form-row-text" nowrap>PTA</td>
											<td width="16%" class="form-row-input" colspan="2"><html:select
													property="studentDetails.pta" style="width:79px;"
													 >
													 <html:option value="ACTIVE">Active</html:option>
													 <html:option value="IN-ACTIVE">In-Active</html:option>
													 </html:select>
													 </td>
											</tr>

										</table>
										</td>
										<td class="form-row-text" width="30%">
										<table width="100%">
											<tr>
												<td class="ben-form-row-input" align="left">
												<table width="100%" height="200px" cellpadding="0"
													cellspacing="0" align="left" border="0"
													class="form-row-text">
													<tr>
														<td><img
															src="<bean:write name="studentDetailForm" property="studentDetails.photo" />"
															width="200" height="200" /> <html:hidden
															property="studentDetails.photo" /></td>
													</tr>
													<tr align="left" valign="bottom">
														<td align="left">Select Photo: <html:file
															property="studentPhoto" styleId="studentPhoto"
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
									</table>
									</td>
								</tr>
								<tr>
									<td colspan="5" class="form-sub-heading"><span
										class="personal-details">Academic Details II</span></td>
								</tr>

								<tr>
									<td width="17%" class="form-row-text" nowrap>Nationality <span
										class="required">*</span> <html:text
										property="studentDetails.nationality" maxlength="45" size="10" />
									</td>
									<td width="17%" class="form-row-text" nowrap>Religion<span
										class="required">*</span> <html:text
										property="studentDetails.religion" maxlength="45" size="10" />
									</td>
									<td width="16%" class="form-row-text" nowrap>Prev School <html:text
										property="studentDetails.prevInst" maxlength="45" size="20" /></td>
									<td width="16%" class="form-row-text" nowrap>Blood Group
									<html:select property="studentDetails.bloodGroup"
										style="width:150px;">
										<html:option value="Nil">Nil</html:option>
										<html:option value="A +ve">A Positive (A +ve)</html:option>
										<html:option value="A -ve">A Negative (A -ve)</html:option>
										<html:option value="AB -ve">AB Negative (AB -ve)</html:option>
										<html:option value="AB +ve">AB Positive (AB +ve)</html:option>
										<html:option value="A1 -ve">A1 Negative (A1 -ve)</html:option>
										<html:option value="A1 +ve">A1 Positive (A1 +ve)</html:option>
										<html:option value="A1B +ve">A1B Negative (A1B -ve)</html:option>
										<html:option value="A1B -ve">A1B Positive (A1B +ve)</html:option>
										<html:option value="A2 -ve">A2 Negative (A2 -ve)</html:option>
										<html:option value="A2 +ve">A2 Positive (A2 +ve)</html:option>
										<html:option value="A2B -ve">A2B Negative (A2B -ve)</html:option>
										<html:option value="A2B +ve">A2B Positive (A2B +ve)</html:option>
										<html:option value="B -ve">B Negative (B -ve)</html:option>
										<html:option value="B +ve">B Positive (B +ve)</html:option>
										<html:option value="O -ve">O Negative (O -ve)</html:option>
										<html:option value="O +ve">O Positive (O +ve)</html:option>
									</html:select></td>
									<td width="16%" class="form-row-text" nowrap></td>
								</tr>
								<tr>
									<td width="17%" class="form-row-text" nowrap>Reason <html:text
										property="studentDetails.prevInstReason" maxlength="45"
										size="30" /></td>
									<td width="16%" class="form-row-text" nowrap>Iden Mark 1 <html:text
										property="studentDetails.idenMark1" maxlength="45" size="10" />
									</td>
									<td width="16%" class="form-row-text" nowrap>Iden Mark 2 <html:text
										property="studentDetails.idenMark2" maxlength="45" size="10" />
									</td>

									<td width="16%" class="form-row-text">Remarks <html:text
										property="studentDetails.remarks" maxlength="100" size="30"
										style="width:320px;" /></td>
									<td width="16%" class="form-row-text" nowrap></td>
								</tr>

								<tr>
									<td colspan="5" class="form-sub-heading"><span
										class="personal-details">Contact - Address</span></td>
								</tr>
								<tr>
									<td width="17%" class="form-row-text" nowrap colspan="5"
										align="left">
									<table border="0" cellpadding="2" cellspacing="2" align="left"
										width="80%">
										<tr>
											<td align="left">Present Address:&nbsp;&nbsp;&nbsp; <html:textarea
												property="studentDetails.address2" rows="7" cols="10">
											</html:textarea></td>
											<td align="left">Permanent Address:&nbsp;&nbsp;&nbsp; <html:textarea
												property="studentDetails.address1" rows="7" cols="10">
											</html:textarea></td>

										</tr>
									</table>
									</td>
								</tr>
								<!-- <tr>
									<td width="16%" class="form-row-text" nowrap>District <html:text
										property="studentDetails.resDistrict" maxlength="45" size="10" />

									</td>
									<td width="16%" class="form-row-text" nowrap>State <html:text
										property="studentDetails.resState" maxlength="45" size="10" />

									</td>
									<td width="16%" class="form-row-text" nowrap colspan="3">
									</td>
								</tr>
								
								<tr>
									<td colspan="5" class="form-sub-heading"><span
										class="personal-details">Contact - Office</span></td>
								</tr>
								<tr>
									<td width="17%" class="form-row-text" nowrap>Office Name <html:text
										property="studentDetails.officeName" maxlength="45" size="10" />

									</td>
									<td width="17%" class="form-row-text" nowrap>Complex Name
									<html:text property="studentDetails.officeCompName"
										maxlength="45" size="10" /></td>
									<td width="16%" class="form-row-text" nowrap>Office No. <html:text
										property="studentDetails.officeNo" maxlength="45" size="10" /></td>
									<td width="16%" class="form-row-text" nowrap>Street <html:text
										property="studentDetails.officeStreet" maxlength="45"
										size="10" /></td>
									<td width="16%" class="form-row-text" nowrap></td>

								</tr>
								<tr>
									<td width="16%" class="form-row-text" nowrap>City /
									PinCode <html:text property="studentDetails.officeCity"
										maxlength="45" size="10" /> / <html:text
										property="studentDetails.officePinCode" maxlength="45"
										size="10" /></td>

									<td width="16%" class="form-row-text" nowrap>District <html:text
										property="studentDetails.officeDist" maxlength="45" size="10" />
									</td>
									<td width="16%" class="form-row-text" nowrap>State <html:text
										property="studentDetails.officeState" maxlength="45" size="10" /></td>
									<td width="16%" class="form-row-text" nowrap></td>
									<td width="16%" class="form-row-text" nowrap></td>
								</tr>
								-->
								<tr>
									<td colspan="5" class="form-sub-heading"><span
										class="personal-details">Contact - Phone</span></td>
								</tr>
								<tr>
									<td width="17%" class="form-row-text" nowrap>Landline 1 <html:text
										property="studentDetails.landline1" maxlength="45" size="10" />
									</select></td>
									<td width="17%" class="form-row-text" nowrap>Mobile
									1(Receiving SMS No) <html:text property="studentDetails.mobile"
										maxlength="45" size="10" /></td>
									<td width="16%" class="form-row-text" nowrap>E-mail <html:text
										property="studentDetails.email" maxlength="100" size="25" />
									</td>
									<td width="16%" class="form-row-text" nowrap></td>
									<td width="16%" class="form-row-text" nowrap></td>
								</tr>
								<tr>
									<td width="17%" class="form-row-text" nowrap>Landline 2 <html:text
										property="studentDetails.landline2" maxlength="45" size="10" /></select></td>
									<td width="17%" class="form-row-text" nowrap>Mobile 2 <html:text
										property="studentDetails.mobile2" maxlength="45" size="10" />
									<!--Office 2 <html:text
										property="studentDetails.office2" maxlength="45" size="10" />--></td>
									<td width="16%" class="form-row-text" nowrap>Alternate
									E-mail <html:text property="studentDetails.altemail"
										maxlength="100" size="25" /></td>
									<td width="16%" class="form-row-text" nowrap></td>
									<td width="16%" class="form-row-text" nowrap></td>
								</tr>
								<!--  
								<tr>
									<td colspan="5" class="form-sub-heading"><span
										class="personal-details">Contact - Emergency</span></td>
								</tr>
								<tr>
									<td width="17%" class="form-row-text" nowrap>Name<span
										class="required">*</span> <html:text
										property="studentDetails.emerName" maxlength="45" size="10" /></td>
									<td width="17%" class="form-row-text" nowrap>Phone Number<span
										class="required">*</span> <html:text
										property="studentDetails.emerMobileNo" maxlength="45"
										size="10" /></td>
									<td width="16%" class="form-row-text" nowrap>Landline <html:text
										property="studentDetails.emerLandlineNo" maxlength="45"
										size="10" /></td>
									<td width="16%" class="form-row-text" nowrap>Physician
									Name (Doctor) <html:text property="studentDetails.emerDoc"
										maxlength="45" size="10" /></td>
									<td width="16%" class="form-row-text" nowrap></td>
								</tr>

								<tr>
									<td colspan="5" class="form-sub-heading"><span
										class="personal-details">Contact - SMS</span></td>
								</tr>
								<tr>
									<td width="17%" class="form-row-text" nowrap>Contact Name
									<html:text property="studentDetails.smsContName" maxlength="45"
										size="10" /> </select></td>
									<td width="17%" class="form-row-text" nowrap>Receiving SMS
									No <html:text property="studentDetails.smsRecNo" maxlength="45"
										size="10" /></td>
									<td width="16%" class="form-row-text" nowrap>GateWay <html:text
										property="studentDetails.smsGateway" maxlength="45" size="10" />
									</td>
									<td width="16%" class="form-row-text" nowrap></td>
									<td width="16%" class="form-row-text" nowrap></td>
								</tr>
						-->
								<tr>
									<td colspan="5" class="form-sub-heading"><span
										class="personal-details">Additional Facility</span></td>
								</tr>
								<tr>
									<td colspan="5" class="form-row-text" nowrap>
									<table border="0" cellspacing="2" cellpadding="2" width="80%">
										<tr>
											<td>Transport</td>
											<td align="left"><html:select
												property="studentDetails.isUsingTransport"
												style="width:50px;"
												onchange="javascript:toggleTransportCombo();">
												<html:option value="No">No</html:option>
												<html:option value="Yes">Yes</html:option>
											</html:select></td>
											<td width="16%" class="form-row-text">Vehicle - Route -
											Stop - Fees</td>
											<td width="16%" class="form-row-input" colspan="4"><html:select
												property="studentDetails.routeStopId" style="width:400px;">
												<html:option value="">--Select--</html:option>
												<logic:iterate property="routeStopList"
													name="studentDetailForm" id="routeStopListId" indexId="i"
													type="com.cubepro.transport.RouteStop">
													<html:option
														value="<%=String.valueOf(routeStopListId.getRouteStopId())%>">
														<bean:write name="routeStopListId"
															property="route.vehicle.regName" /> - 
														<bean:write name="routeStopListId"
															property="route.routeName" /> -
														<bean:write name="routeStopListId"
															property="stop.stopName" /> - 
														<bean:write name="routeStopListId" property="stopFees" />
													</html:option>
												</logic:iterate>
											</html:select></td>

										</tr>
										<tr>
											<td>Hostel</td>
											<td align="left"><html:select
												property="studentDetails.isUsingHostel" style="width:50px;"
												onchange="javascript:toggleHostelCombo();">
												<html:option value="No">No</html:option>
												<html:option value="Yes">Yes</html:option>
											</html:select></td>
											<td width="16%" class="form-row-text">Building - Room -
											Extn</td>
											<td width="16%" class="form-row-input" colspan="4"><html:select
												property="studentDetails.roomId" style="width:400px;">
												<html:option value="">--Select--</html:option>
												<logic:iterate property="roomList" name="studentDetailForm"
													id="roomListId" indexId="i" type="com.cubepro.hostel.Room">
													<html:option
														value="<%=String.valueOf(roomListId.getRoomId())%>">
														<bean:write name="roomListId" property="buildingInf.name" /> - 
														<bean:write name="roomListId" property="roomNo" /> -
														<bean:write name="roomListId" property="roomExtn" />
													</html:option>
												</logic:iterate>
											</html:select></td>

										</tr>
										<tr>
											<td>Library</td>
											<td align="left"><html:select
												property="studentDetails.isUsingLibrary" style="width:50px;">
												<html:option value="No">No</html:option>
												<html:option value="Yes">Yes</html:option>
											</html:select></td>
											<td></td>
											
										</tr>
									</table>
									</td>
								</tr>

								<tr>
									<td colspan="5" class="form-sub-heading"><span
										class="personal-details">Extra Curriculum</span></td>
								</tr>
								<tr>
									<td width="16%" class="form-row-text">Courses</td>
									<td width="16%" class="form-row-input" colspan="4"><html:text
										property="studentDetails.courseIds" size="100" maxlength="45" /></td>
								</tr>

							</table>
							</td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td align="right">
				<table>
					<tr>
						<td align="right">
						<div id="button">
						<ul>

							<li class="buttonrightcrnr submit"
								onmouseover="this.className='buttonhighlight submit'"
								onmouseout="this.className='buttonrightcrnr submit'"
								title='<bean:message key = "studentDetails.updateStudent"/>'>
							<a href="javascript:submitStudentForm();"
								onkeypress="if(event.keyCode == 32) {submitStudentForm();}"><bean:message
								key="studentDetails.updateStudent" /> </a></li>
							<logic:notEqual name="studentDetailForm"
								property="studentDetails.studentId" value="0">
								<li class="buttonrightcrnr addmember2"
									onmouseover="this.className='buttonhighlight addmember2'"
									onmouseout="this.className='buttonrightcrnr addmember2'"
									title='<bean:message key = "studentDetails.addStudent"/>'>
								<a href="#" onclick="resetStudentFields();"
									onkeypress="if(event.keyCode == 32) {resetStudentFields();};">
								Add New Student </a></li>
							</logic:notEqual>
							</a>
							</li>
						</ul>
						</div>
						</td>
					</tr>
				</table>
				</td>
			</tr>

		</table>
		</html:form></td>
	</tr>
</table>
<!-- Grid Part End -->
</td>
</tr>
<tr>
	<!-- Footer Part Start -->
	<td>&nbsp;</td>
	<!-- Footer Part End -->
</tr>
</table>
<script language="javascript">
	addMandatoryField('studentDetails.studentName','First Name',[]);
	addMandatoryField('studentDetails.lastName','Last Name',[]);
	addMandatoryField('studentDetails.dobString','Date Of Birth',[]);
	addMandatoryField('studentDetails.dojString','Date Of Joining',[]);
	
	function submitStudentForm(){
		if(validate() == true && validateForm(document.forms[0],this) == true){
		document.forms[0].action="<%=request.getContextPath()%>/StudentDetail.cp?action=persistStudent";
		document.forms[0].submit();
		}
	}
    toggleTransportCombo();
    toggleHostelCombo();
    toggleScholarship();
	</script>
</body>
</html>
