<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="cpro"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<script language="javascript" type="text/javascript">
		</script>

		<title><cpro:text name="login.title" /></title>


		<script language="javascript" type="text/javascript"
			src='<cpro:url value="/js/datetimepicker.js" />'></script>
		<script language="javascript" type="text/javascript"
			src='<cpro:url value="/js/datevalidation.js" />'></script>

		<link href='<cpro:url value="/css/style.css"/>' rel="stylesheet"
			type="text/css" />
		<link href='<cpro:url value="/themes/blue/style.css"/>'
			rel="stylesheet" type="text/css" media="print, projection, screen" />
		<script language="javascript" type="text/javascript"
			src='<cpro:url value="/js/jquery-latest.js" />'></script>
		<script language="javascript" type="text/javascript"
			src='<cpro:url value="/js/jquery.tablesorter.js" />'></script>
		<link href='<cpro:url value="/css/sexy-combo.css" />' rel="stylesheet"
			type="text/css" />
		<link href='<cpro:url value="/css/sexy.css" />' rel="stylesheet"
			type="text/css" />
		<script type="text/javascript"
			src='<cpro:url value="/js/jquery.sexy-combo-2.0.6.min.js" />'></script>
		
		<script language="javascript">

	
function getAttendanceDetail(){
document.forms[0].action = '<cpro:url value="/Attendance.do?action=getAttendanceList"/>';
document.forms[0].submit();
}

function saveAttendanceDetail(){
document.forms[0].action = '<cpro:url value="/Attendance.do?action=saveAttendanceList"/>';
document.forms[0].submit();
}


	$(function() {
		$("table").tablesorter();
	});


$(function() {
    $("#basic-combo").sexyCombo();
	});
	
</script>
	</head>
	<body>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td valign="top">
					<cpro:form method="POST" validate="true">
						<table border="0" cellpadding="2" cellspacing="2" align="center"
							width="100%">
							<tr>
								<td>
									<cpro:actionerror cssErrorClass="errorstyle" />
									<cpro:actionmessage cssErrorClass="successstyle" />
								</td>
							</tr>


							<tr>
								<th colspan="4" align="center" class="headerFont">

									Attendance Detail Entry

								</th>
							</tr>
							<tr>
								<td>
									<table>
										<tr>
											<td>
												<table>
													<cpro:select list="classList" id="basic-combo" name="classId"
														label='Select Class' accesskey="C" listKey="classId"
														listValue="classWithSection" emptyOption="false"
														key="classId"  required="true"
														id="basic-combo">
													</cpro:select>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tr>
											<td>
												<table>
													<cpro:textfield name="attendanceDate"
														label='Attendance Date' accesskey="A" cssClass="labelFont"
														required="true"
														onblur="Datevalidateformatonblur(this.value,this);"
														onfocus="Datevalidateformatonfocus(this.value,this);" />

												</table>
											</td>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table cellspacing="4" border="0">
										<tr>
											<td>
												<input type="button" name="Search" value="Search Students"
													style="width:150px;" onclick="getAttendanceDetail()"
													class="labelFont" class="labelFont" />
											</td>
											<td>
												<input type="button" name="Save" value="Save Attendance"
													style="width:150px;" onclick="saveAttendanceDetail()"
													class="labelFont" class="labelFont" />
											</td>
											<td class="labelFont">
												Total Students:
											</td>
											<td class="labelFont">
												Present :
											</td>
											<td class="labelFont">
												Absent :
											</td>
											<td class="labelFont">
												Other :
											</td>
										</tr>
									</table>
								</td>

							</tr>

						</table>
						<table id="tablesorter-cubepro" class="tablesorter" border="1"
							cellpadding="0" cellspacing="1" align="center" width="100%"  >
							<thead>
								<tr>
									<th>
										Roll No
									</th>
									<th>
										Student Name
									</th>
									<th>
										Class
									</th>
									<th>
										Section
									</th>
									<th>
										Mobile No
									</th>
									<th>
										Attendance Date
									</th>
									<th>
										Attendance Status
									</th>
									<th>
										Attendance Reason
									</th>
								</tr>
							</thead>
							<tbody>
								<cpro:iterator value="studentList" id="attendanceDetail"
									status="student_stat">
									<tr>
										<td>
											<cpro:property value="studentDetail.rollNo" />
											<cpro:hidden key="studentDetail.studentId" />
											<cpro:hidden key="attendanceId" />
										</td>
										<td>
											<cpro:property value="studentDetail.studentName" />
										</td>
										<td>
											<cpro:property value="studentDetail.classDetails.className" />
										</td>
										<td>
											<cpro:property value="studentDetail.classDetails.sectionName" />
										</td>
										<td>
											<cpro:property value="studentDetail.mobileNo" />
										</td>
										<td>
											<cpro:property value="attendanceDate" />
										</td>
										<td>
											<table>
												<cpro:select list="attendanceStatuses" label="" tabindex="7"
													labelSeparator="" name="attendanceStatus"
													cssClass="labelFont" required="true" cssClass="labelFont"
													cssStyle="width:100px;" />
											</table>
										</td>
										<td>
											<table>
												<cpro:textfield name="attendanceReason" label=""
													labelSeparator="" size="25" maxlength="25"
													cssClass="labelFont" />
											</table>
										</td>

									</tr>
								</cpro:iterator>
							</tbody>
						</table>
					</cpro:form>
				</td>
			</tr>
		</table>
	</body>
</html>
