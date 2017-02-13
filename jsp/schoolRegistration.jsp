<%-- Generic Includes--%>
<%@include file="/jsp/common/commonHeader.jsp"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<body>
<!-- Sub menu js part is included -->
<%@include file="/jsp/common/subMenuJs.jsp"%>
<script src="<%=request.getContextPath()%>/js/multifile.js"
	type="text/javascript"></script>
<script language="javascript">
	
	mmLoadMenus();	
			
			function submitStudentForm(){
				if(validate() == true){
				document.forms[0].action="<%=request.getContextPath()%>/EditSchool.cp?action=saveSchoolDetails";
				document.forms[0].submit();
				}
			}
			
			function validate(){
				if(IfNullorEmpty(document.forms[0]['schoolDetails.schoolName'].value)){
					jAlert('Please enter school name')
					document.forms[0]['schoolDetails.schoolName'].focus();
					return false;
				}
				return true;
			}
			
			function resetStudentFields(){
				document.forms[0].action="<%=request.getContextPath()%>/EditSchool.cp?action=resetStudentFields";
				document.forms[0].submit();
			}
			
</script>

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
				<td colspan="3" class="bread-crumb"><a href="<%=request.getContextPath()%>/Home.cp"><bean:message
					key="nrega.home" /></a> &gt; <span>School Detail</span></td>
			</tr>
			<tr>
				<td width="100%"><html:form action="EditSchool" method="post"
					enctype="multipart/form-data">
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
								<td colspan="8"><span class="success">
								<script language="javascript">
												alert('<bean:write name="msg" />');
												</script>
								<bean:write
									name="msg" /> </span></td>
							</tr>
						</logic:messagesPresent>
						<tr>
							<td><!-- Grid Part Start -->
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="form-border">
								<tr>
									<td colspan="5" class="form-sub-heading"><span
										class="personal-details">School Details</span></td>
								</tr>

								<tr>
									<td width="20%" class="form-row-text"></td>
									<td colspan="4" width="21%" class="ben-form-row-input"><html:hidden
										property="schoolDetails.schoolId" /></td>
								</tr>
								<tr>
									<td colspan="5" class="form-row-text">
									<table width="100%" border="0" align="center" cellpadding="0"
										cellspacing="1">
										<tr>
											<td width="20%" class="form-row-text" nowrap><bean:message
												key="schoolDetails.schoolName" /></td>
											<td width="20%" colspan="3" class="form-row-input" nowrap>
											<html:text property="schoolDetails.schoolName"
												maxlength="200" size="150"></html:text></td>
											</tr>
											<tr>	
											<td width="20%" class="form-row-text" nowrap>Short Name(For SMS):
											</td>
											<td  width="20%" colspan="3" class="form-row-input" nowrap><html:text property="schoolDetails.smsName"
												maxlength="50" size="25" />
											</td>
										</tr>
										<tr>
											<td width="20%" class="form-row-text"><bean:message
												key="schoolDetails.address1" /></td>
											<td width="20%" class="ben-form-eng-name-input"><html:textarea
												property="schoolDetails.address1" rows="5" cols="4"
												styleId="address1" />
											<div id="feedback1" /><html:messages id="err_middleNameEn"
												property="middleNameEn">
												<span class="required">*</span>
												<br />
												<span class="error"><bean:write
													name="err_middleNameEn" /> </span>
											</html:messages>
											</td>
											<td width="20%" class="form-row-text"><bean:message
												key="schoolDetails.address2" /></td>
											<td width="20%" class="ben-form-eng-name-input"><html:textarea
												property="schoolDetails.address2" styleId="address2"
												cols="4" rows="5" />
											<div id="feedback2" /><html:messages id="err_surnameEn"
												property="surnameEn">
												<br />
												<span class="error"><bean:write name="err_surnameEn" />
												</span>
											</html:messages>
											</td>
										<td class="form-row-text" width="20%" rowspan="3">
										<table width="100%">
											<tr>
												<td class="ben-form-row-input" align="left">
												<table width="100%" height="200px" cellpadding="0"
													cellspacing="0" align="left" border="0"
													class="form-row-text">
													<tr>
														<td><img
															src="<bean:write name="schoolDetailForm" property="schoolDetails.logo" />"
															width="200" height="200" /> <html:hidden
															property="schoolDetails.logo" /></td>
													</tr>
													<tr align="left" valign="bottom">
														<td align="left">Select Photo: <html:file
															property="schoolPhoto" styleId="schoolPhoto"
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
											<td width="20%" class="form-row-text"><bean:message
												key="schoolDetails.phoneNo1" /></td>
											<td width="20%" class="ben-form-eng-name-input" nowrap>
											<html:text property="schoolDetails.phoneNo1" maxlength="25"></html:text>
											</td>
											<td width="20%" class="form-row-text"><bean:message
												key="schoolDetails.phoneNo2" /></td>
											<td width="20%" class="ben-form-eng-name-input" nowrap>
											<html:text property="schoolDetails.phoneNo2" maxlength="25"></html:text>
											</td>
											<td width="20%" class="form-row-text"></td>
										</tr>
										<tr>
											<td width="20%" class="form-row-text" nowrap><bean:message
												key="schoolDetails.mobile" /></td>
											<td width="20%" class="ben-form-eng-name-input" nowrap
												align="left"><html:text
												property="schoolDetails.mobileNo" maxlength="45" size="10" />
											</td>
											<td width="20%" class="form-row-text"><bean:message
												key="schoolDetails.faxNo" /></td>
											<td width="20%" class="ben-form-eng-name-input"><html:text
												property="schoolDetails.faxNo" size="7" maxlength="25"></html:text>
											</td>
											<td width="20%" class="form-row-text"></td>
										</tr>
										<tr>
											<td width="20%" class="form-row-text"><bean:message
												key="schoolDetails.city" /></td>
											<td width="20%" class="ben-form-eng-name-input" nowrap>
											<html:text property="schoolDetails.city" size="7"
												maxlength="25"></html:text></td>
											<td width="20%" class="form-row-text" nowrap align="right">
											<bean:message key="schoolDetails.state" /> - <bean:message
												key="schoolDetails.country" /> - <bean:message
												key="schoolDetails.zipCode" /></td>
											<td width="40%" colspan="2" class="ben-form-eng-name-input"
												nowrap align="left"><html:text
												property="schoolDetails.state" maxlength="25" size="10" />
											- <html:text property="schoolDetails.country" maxlength="15"
												size="10" /> - <html:text property="schoolDetails.zipCode"
												maxlength="6" size="5" /> <html:messages id="err_surnameEn"
												property="surnameEn">
												<br />
												<span class="error"><bean:write name="err_surnameEn" />
												</span>
											</html:messages></td>
										</tr>
										<tr>
											<td width="20%" class="form-row-text">Classes Eligible</td>
											<td width="20%" class="ben-form-eng-name-input" nowrap>
											<html:text property="schoolDetails.classes" maxlength="45"
												size="10" /></td>
											<td width="20%" class="form-row-text">Division</td>
											<td width="20%" class="ben-form-eng-name-input" nowrap>
											<html:select property="schoolDetails.division">
												<html:option value="Primary">Primary</html:option>
												<html:option value="HSC">HSC</html:option>
												<html:option value="Others">Others</html:option>
											</html:select></td>
											<td width="20%" class="form-row-text"></td>
										</tr>
										<tr>
											<td width="20%" class="form-row-text">Exam Board:</td>
											<td width="20%" class="ben-form-eng-name-input" nowrap>
											<html:select property="schoolDetails.category">
												<html:option value="All">All</html:option>
												<html:option value="Matriculation">Matriculation</html:option>
												<html:option value="StateBoard">State Board</html:option>
												<html:option value="CBSC">CBSC</html:option>
												<html:option value="Others">Others</html:option>
											</html:select></td>
											<td width="20%" class="form-row-text">Director</td>
											<td width="20%" class="ben-form-eng-name-input" nowrap>
											<html:select property="schoolDetails.subCategory">
												<html:option value="Management">Management</html:option>
												<html:option value="Proprietor">Proprietor</html:option>
												<html:option value="Trust">Trust</html:option>
												<html:option value="Others">Others</html:option>
											</html:select></td>
											<td width="20%" class="form-row-text"></td>
										</tr>
										<tr>
											<td width="20%" class="form-row-text">Govt Reg No</td>
											<td width="20%" class="ben-form-eng-name-input" nowrap>
											<html:text property="schoolDetails.govtRegNo" maxlength="45"
												size="15" /></td>
											<td width="20%" class="form-row-text">Validity</td>
											<td width="20%" class="ben-form-eng-name-input" nowrap>
											<html:text property="schoolDetails.validityDate"
												maxlength="25" size="10" /></td>
											<td width="20%" class="form-row-text"></td>
										</tr>
										<tr>
											<td width="20%" class="form-row-text"><bean:message
												key="schoolDetails.email" /></td>
											<td width="20%" class="ben-form-eng-name-input" nowrap>
											<html:text property="schoolDetails.email" maxlength="25"></html:text>
											</td>
											<td width="20%" class="form-row-text"><bean:message
												key="schoolDetails.website" /></td>
											<td width="20%" class="ben-form-eng-name-input" nowrap>
											<html:text property="schoolDetails.website" maxlength="45"></html:text>
											</td>
											<td width="20%" class="form-row-text"></td>
										</tr>
									</table>
									</td>
								</tr>
								<tr>
									<td colspan="5" class="form-sub-heading"><span
										class="personal-details">Other Details</span></td>
								</tr>
								<tr>

									<td width="20%" class="form-row-text">Max Leave for Staff</td>
									<td width="20%" class="ben-form-eng-name-input" nowrap><html:text
										property="schoolDetails.staffMaxLeave" maxlength="45" size="10" />
									</td>
									<td width="20%" class="form-row-text">Total Working Days</td>
									<td width="20%" class="ben-form-eng-name-input" nowrap><html:text
										property="schoolDetails.studentMaxLeave" maxlength="45" size="10" />
									</td>
									<td width="20%" class="form-row-text"></td>
								</tr>
								<tr>

									<td width="20%" class="form-row-text">Correspondence Name</td>
									<td width="20%" class="ben-form-eng-name-input" nowrap><html:text
										property="schoolDetails.corresName" maxlength="45" size="10" />
									</td>
									<td width="20%" class="form-row-text">Principal</td>
									<td width="20%" class="ben-form-eng-name-input" nowrap><html:text
										property="schoolDetails.principal" maxlength="45" size="10" />
									</td>
									<td width="20%" class="form-row-text"></td>
								</tr>
								<tr>
									<td width="20%" class="form-row-text">HeadMaster Name</td>
									<td width="20%" class="ben-form-eng-name-input" nowrap>
										<html:text
												property="schoolDetails.headMasterName" maxlength="45" size="10" />
									</td>
									<td width="20%" class="form-row-text">Management/Trust
									Name</td>
									<td width="20%" class="ben-form-eng-name-input" nowrap>
										<html:text
												property="schoolDetails.mgmtName" maxlength="45" size="10" />
									
									</td>
									<td width="20%" class="form-row-text"></td>
								</tr>
								<tr>
									<td width="20%" class="form-row-text">Revenue District</td>
									<td width="20%" class="ben-form-eng-name-input" nowrap>
										<html:text
												property="schoolDetails.revDis" maxlength="100" size="10" />
									</td>
									<td width="20%" class="form-row-text">Educational District</td>
									<td width="20%" class="ben-form-eng-name-input" nowrap>
										<html:text
												property="schoolDetails.eduDis" maxlength="100" size="10" />
									
									</td>
									<td width="20%" class="form-row-text"></td>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td align="right">
							<table border="0">
								<tr>
									<td align="right">
									<div id="button">
									<ul>

										<li class="buttonrightcrnr submit"
											onmouseover="this.className='buttonhighlight submit'"
											onmouseout="this.className='buttonrightcrnr submit'"
											title='<bean:message key = "schoolDetails.updateStudent"/>'>
										<a href="javascript:submitStudentForm();"
											onkeypress="if(event.keyCode == 32) {submitStudentForm();}"><bean:message
											key="schoolDetails.updateStudent" /> </a></li>
										<!--<logic:equal name="schoolDetailForm"
											property="schoolDetails.schoolId" value="0">
											<li class="buttonrightcrnr addmember2"
												onmouseover="this.className='buttonhighlight addmember2'"
												onmouseout="this.className='buttonrightcrnr addmember2'"
												title='<bean:message key = "schoolDetails.addStudent"/>'>
											<a href="#" onclick="resetStudentFields();"
												onkeypress="if(event.keyCode == 32) {resetStudentFields();};"><bean:message
												key="schoolDetails.addStudent" /> </a></li>
										</logic:equal>-->
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
		<!-- Grid Part End --></td>
	</tr>
	<tr>
		<!-- Footer Part Start -->
		<td>&nbsp;</td>
		<!-- Footer Part End -->
	</tr>
</table>
<script language="javascript">
	//$(function(){
		//	   var multi_selector = new MultiSelector( document.getElementById( 'initialPhoto-list' ), 1);
			   //multi_selector.hasHeader = -1;
			   ///multi_selector.context = 'create';
			   //multi_selector.addElement( document.getElementById( 'studentPhoto' ) );		
	
			//});
			
	$(function() {
		$('#address1').maxlength({limit:200, feedbackElement:'#feedback1'}); 
		$('#address2').maxlength({limit:200, feedbackElement:'#feedback2'});
	});
	</script>
</body>
</html>
