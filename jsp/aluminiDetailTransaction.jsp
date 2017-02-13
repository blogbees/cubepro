<%-- Generic Includes--%>
<%@include file="/jsp/common/commonHeader.jsp"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<% response.setHeader("Cache-Control","no-cache");%>
<body>
<!-- Sub menu js part is included -->
<%@include file="/jsp/common/subMenuJs.jsp"%>

<script language="JavaScript1.2"><!--
	mmLoadMenus();	
	   function SubmitOnEnter(e) {
				var code;
				if (e.keyCode) code = e.keyCode;
				else if (e.which) code = e.which;
				if(code==13) {
					submitSearch();
				}
			}
			
			function validate(){
				return true;
			}
			function submitSearch(){
			var checkV =  confirm('This is a Bulk Operation. Are you sure you want to update all the records?');
				if(checkV){
					document.forms[0].action="<%=request.getContextPath()%>/Aluminium.cp?action=updateStudents";
					document.forms[0].submit();
					
					alert(<%=request.getAttribute("Count")%>+" Students are Updated");
					
					}
			}
			
			function updateByAdmission(){
					var admissionNo = document.forms[0]['admissionNo'].value;
					if(admissionNo == null || admissionNo == "" || admissionNo.length <=0){
						alert("Please enter Admission No and then update");
						document.forms[0]['admissionNo'].focus();
					}else{
					document.forms[0].action="<%=request.getContextPath()%>/Aluminium.cp?action=updateByAdmission";
					document.forms[0].submit();
					}
			}
			
			function resetFilters(){
				
			}
			
--></script>

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
					key="nrega.home" /></a> &gt; <span>Student Alumini</span></td>
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
				<td width="100%" align="center"><html:form action="Aluminium"
					method="post">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="1" class="form-border">
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border" align="center">
								<tr>
									<td colspan="10" class="form-heading"><span
										class="search-heading">Bulk Update</span></td>
								</tr>
								<tr>
									<td class="form-row-text" nowrap>Update All Students of
									Class From:</td>
									<td class="form-row-input" nowrap><html:select
										property="fromClassId" style="width:80px;" value="*">
										<html:optionsCollection property="classList"
											label="classWithSectionName" value="classId" />
									</html:select></td>
									<td class="form-row-text" nowrap>To:</td>
									<td class="form-row-input" nowrap><html:select
										property="toClassId" style="width:80px;" value="*">

										<html:optionsCollection property="classList"
											label="classWithSectionName" value="classId" />
									</html:select></td>
									<td class="form-row-text" nowrap></td>
									<td class="form-row-text" nowrap>&nbsp;</td>
									<td class="form-row-text" nowrap>&nbsp;</td>
									<td class="form-row-text" nowrap>&nbsp;</td>
									<td class="form-row-input" nowrap>
									<div id="button2">
									<ul>
										<li class="buttonrightcrnr search-but"
											onmouseover="this.className='buttonhighlight search-but'"
											onmouseout="this.className='buttonrightcrnr search-but'"
											onkeypress="SubmitOnEnter(event);" title="Search Project">
										<a href="javascript:submitSearch();">Update All Students </a>
										</li>
									</ul>
									</div>
									</td>
									
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td valign="middle" class="padding-btm-ten">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								class="form-border" align="center">
								<tr>
									<td colspan="10" class="form-heading"><span
										class="search-heading">Update By Admission No</span></td>
								</tr>
								<tr>
									<td class="form-row-text" nowrap>Admission No</td>
									<td class="form-row-text" nowrap><html:text
										property="admissionNo" size="15" maxlength="20" /></td>
									<td class="form-row-text" nowrap>Update Class From:</td>
									<td class="form-row-input" nowrap><html:select
										property="fromAdmClassId" style="width:80px;" >
										<html:optionsCollection property="classList"
											label="classWithSectionName" value="classId" />
									</html:select></td>
									<td class="form-row-text" nowrap>To:</td>
									<td class="form-row-input" nowrap><html:select
										property="toAdmClassId" style="width:80px;" >

										<html:optionsCollection property="classList"
											label="classWithSectionName" value="classId" />
									</html:select></td>
									<td class="form-row-text" nowrap></td>
									<td class="form-row-text" nowrap>&nbsp;</td>
									<td class="form-row-input" nowrap>
									<div id="button2">
									<ul>
										<li class="buttonrightcrnr search-but"
											onmouseover="this.className='buttonhighlight search-but'"
											onmouseout="this.className='buttonrightcrnr search-but'"
											onkeypress="SubmitOnEnter(event);" title="Search Project">
										<a href="javascript:updateByAdmission();">Update Student</a></li>
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
</body>
</html>