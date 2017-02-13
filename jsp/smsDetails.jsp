<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="cpro"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<cpro:form action="/SMSDetails.do" method="POST">
	<table border="0" cellpadding="2" cellspacing="2" align="center"
		width="100%">

		<tr>
			<th colspan="4" align="center">
				<h3>
					Absent SMS Screen
				</h3>
			</th>
		</tr>
		<tr>
			<td>
				<cpro:text name="sms.class.title" />
			</td>
			<td>
				<select name="class" tabindex="0">
					<option value="0">
						<cpro:text name="sms.class.title" />
					</option>
					<option value="1">
						I
					</option>

					<option value="2">
						II
					</option>
					<option value="3">
						III
					</option>
					<option value="4">
						IV
					</option>
					<option value="5">
						V
					</option>
					<option value="6">
						VI
					</option>
					<option value="7">
						VII
					</option>

					<option value="8">
						VIII
					</option>
					<option value="9">
						IX
					</option>
					<option value="10">
						X
					</option>
					<option value="11">
						XI
					</option>
					<option value="12">
						XII
					</option>
				</select>

			</td>
			<td>
				<cpro:text name="sms.section.title" />
			</td>
			<td>
				<select name="section" tabindex="1">
					<option value="0">
						<cpro:text name="sms.section.title" />
					</option>
					<option value="A">
						A
					</option>

					<option value="B">
						B
					</option>
					<option value="C">
						C
					</option>
					<option value="D">
						D
					</option>
					<option value="E">
						E
					</option>
					<option value="F">
						F
					</option>
					<option value="G">
						G
					</option>

					<option value="H">
						H
					</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				Date Of Absent
			</td>
			<td>
				<input type="text" name="dateOfAbsent" />
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<input type="button" name="Search" value="Search Students"
					style="width:150px;" />
				&nbsp;&nbsp;
					<input type="button" name="AbsentSMS" value="Today's Absentees"
					style="width:150px;" />
				&nbsp;&nbsp;
			</td>
		</tr>
	</table>
	<br />
	<br />
	<table border="1" cellpadding="0" cellspacing="0" align="center"
		width="100%">
		<tr>
			<th>
				Roll No
			</th>
			<th>
				Student Name
			</th>
			<th>
				SMS to be sent
			</th>
			<th>
				Select All
				<input type="checkbox" />
			</th>
		</tr>
		<tr>
			<td>
				R101
			</td>
			<td>
				Satish Raj J
			</td>
			<td>
				9094778902
			</td>
			<td>
				<input type="checkbox" />
			</td>

		</tr>
		<tr>
			<td>
				R102
			</td>
			<td>
				Ganesh Ram P
			</td>
			<td>
				9094778901
			</td>
			<td>
				<input type="checkbox" />
			</td>
		</tr>
		<tr>
			<td>
				R101
			</td>
			<td>
				Satish Raj J
			</td>
			<td>
				9094778902
			</td>
			<td>
				<input type="checkbox" />
			</td>

		</tr>
		<tr>
			<td>
				R102
			</td>
			<td>
				Ganesh Ram P
			</td>
			<td>
				9094778901
			</td>
			<td>
				<input type="checkbox" />
			</td>
		</tr>
		<tr>
			<td>
				R101
			</td>
			<td>
				Satish Raj J
			</td>
			<td>
				9094778902
			</td>
			<td>
				<input type="checkbox" />
			</td>

		</tr>
		<tr>
			<td>
				R102
			</td>
			<td>
				Ganesh Ram P
			</td>
			<td>
				9094778901
			</td>
			<td>
				<input type="checkbox" />
			</td>
		</tr>
		<tr>
			<td>
				R101
			</td>
			<td>
				Satish Raj J
			</td>
			<td>
				9094778902
			</td>
			<td>
				<input type="checkbox" />
			</td>

		</tr>
		<tr>
			<td>
				R102
			</td>
			<td>
				Ganesh Ram P
			</td>
			<td>
				9094778901
			</td>
			<td>
				<input type="checkbox" />
			</td>
		</tr>
		<tr>
			<td>
				R101
			</td>
			<td>
				Satish Raj J
			</td>
			<td>
				9094778902
			</td>
			<td>
				<input type="checkbox" />
			</td>

		</tr>
		<tr>
			<td>
				R102
			</td>
			<td>
				Ganesh Ram P
			</td>
			<td>
				9094778901
			</td>
			<td>
				<input type="checkbox" />
			</td>
		</tr>
		<tr>
			<td>
				R101
			</td>
			<td>
				Satish Raj J
			</td>
			<td>
				9094778902
			</td>
			<td>
				<input type="checkbox" />
			</td>

		</tr>
		<tr>
			<td>
				R102
			</td>
			<td>
				Ganesh Ram P
			</td>
			<td>
				9094778901
			</td>
			<td>
				<input type="checkbox" />
			</td>
		</tr>
	</table>
	<br />
	<table border="0" cellpadding="0" cellspacing="0" align="center"
		width="100%">
		<tr>
			<td>
				<table border="0" cellpadding="0" cellspacing="0" align="center"
					width="100%">
					<tr>
						<td align="center">
							<textarea rows="5" cols="5" name="smsTextFormat"
								style="width:600px;"></textarea>
						</td>
					</tr>
					<tr>
						<td align="center">
							<input type="button" name="GeneralSMS" value="Send SMS"
								style="width:600px;" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</cpro:form>
