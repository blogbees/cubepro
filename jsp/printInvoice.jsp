<%-- Generic Includes--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="/struts-bean" prefix="bean"%>
<%@ taglib uri="/struts-html" prefix="html"%>
<%@ taglib uri="/struts-logic" prefix="logic"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cubepro.fees.FeesMaster"%>
<%@page import="com.cubepro.invoice.form.InvoiceDetailForm"%>
<html>
<head>
<link href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet" type="text/css"  media="print" />
</head>
<body width="310px" height="600px">
<!-- Sub menu js part is included -->
<%@include file="/jsp/common/subMenuJs.jsp"%>

<script language="javascript">
function convertMoneyToWords(inputValue) {
	var junkVal=inputValue;
	junkVal=Math.floor(junkVal);
	var obStr=new String(junkVal);
	numReversed=obStr.split("");
	actnumber=numReversed.reverse();

	if(Number(junkVal) >=0){
		//do nothing
	}
	else{
		alert('wrong Number cannot be converted');
		return false;
	}
	if(Number(junkVal)==0){
		document.getElementById('container').innerHTML='Rupees Zero Only';
		return false;
	}
	if(actnumber.length>9){
		alert('Oops!!!! the Number is too big to covertes');
		return false;
	}

	var iWords=["Zero", " One", " Two", " Three", " Four", " Five", " Six", " Seven", " Eight", " Nine"];
	var ePlace=['Ten', ' Eleven', ' Twelve', ' Thirteen', ' Fourteen', ' Fifteen', ' Sixteen', ' Seventeen', ' Eighteen', ' Nineteen'];
	var tensPlace=['dummy', ' Ten', ' Twenty', ' Thirty', ' Forty', ' Fifty', ' Sixty', ' Seventy', ' Eighty', ' Ninety' ];

	var iWordsLength=numReversed.length;
	var totalWords="";
	var inWords=new Array();
	var finalWord="";
	j=0;
	for(i=0; i<iWordsLength; i++){
		switch(i)
		{
		case 0:
			if(actnumber[i]==0 || actnumber[i+1]==1 ) {
				inWords[j]='';
			}
			else {
				inWords[j]=iWords[actnumber[i]];
			}
			inWords[j]=inWords[j]+' Only';
			break;
		case 1:
			tens_complication();
			break;
		case 2:
			if(actnumber[i]==0) {
				inWords[j]='';
			}
			else if(actnumber[i-1]!=0 && actnumber[i-2]!=0) {
				inWords[j]=iWords[actnumber[i]]+' Hundred and';
			}
			else {
				inWords[j]=iWords[actnumber[i]]+' Hundred';
			}
			break;
		case 3:
			if(actnumber[i]==0 || actnumber[i+1]==1) {
				inWords[j]='';
			}
			else {
				inWords[j]=iWords[actnumber[i]];
			}
			if(actnumber[i+1] != 0 || actnumber[i] > 0){
				inWords[j]=inWords[j]+" Thousand";
			}
			break;
		case 4:
			tens_complication();
			break;
		case 5:
			if(actnumber[i]==0 || actnumber[i+1]==1) {
				inWords[j]='';
			}
			else {
				inWords[j]=iWords[actnumber[i]];
			}
			if(actnumber[i+1] != 0 || actnumber[i] > 0){
				inWords[j]=inWords[j]+" Lakh";
			}
			break;
		case 6:
			tens_complication();
			break;
		case 7:
			if(actnumber[i]==0 || actnumber[i+1]==1 ){
				inWords[j]='';
			}
			else {
				inWords[j]=iWords[actnumber[i]];
			}
			inWords[j]=inWords[j]+" Crore";
			break;
		case 8:
			tens_complication();
			break;
		default:
			break;
		}
		j++;
	}

	function tens_complication() {
		if(actnumber[i]==0) {
			inWords[j]='';
		}
		else if(actnumber[i]==1) {
			inWords[j]=ePlace[actnumber[i-1]];
		}
		else {
			inWords[j]=tensPlace[actnumber[i]];
		}
	}
	inWords.reverse();
	for(i=0; i<inWords.length; i++) {
		finalWord+=inWords[i];
	}
	document.getElementById('container').innerHTML='Rupees  '+finalWord;
}
</script>
<html:form action="InvoiceDetail" method="post">
	<% 
List printInvoiceDetails = 
(ArrayList)request.getAttribute("invoicePrintDetails");
	
SchoolDetails schoolDetails = (SchoolDetails)request.getAttribute("schoolDetails");
InvoiceDetailForm invoice=new InvoiceDetailForm(); 
FeesMaster fm = new FeesMaster();
if(printInvoiceDetails!=null && printInvoiceDetails.isEmpty() == false)
	fm = (FeesMaster)printInvoiceDetails.get(0);
DecimalFormat d = new DecimalFormat("######.00");
%>
	<table width="310px" border="0">
		<tr class='noPrint'>
			<td width="25%" class='noPrint'><a align="right"
				href="javascript:window.print();" class='noprint'><b>PRINT</b></a>
					<html:hidden property="studentId" />
	<html:hidden property="classId" />
				</td>
		</tr>
		<tr>
			<td height="20px" align="center"><%=schoolDetails.getSchoolName()%></td>
		</tr>
		<tr>
			<td height="20px" align="center"><%=fm.getFeesType()%> RECEIPT</td>
		</tr>
		<tr>
			<td colspan="2" height="35px">
			<table width="100%" align="top" border="0">
				<tr>
					<td>Bill No:</td>


					<td><%=request.getParameter("invoiceId")%></td>
					<td>Std&Sec:</td>
					<td align="left"><bean:write name="invoiceDetailForm"
						property="invoiceDetails.studentDetails.classDetails.classWithSectionName" /></td>
				</tr>
				<tr>
					<td >Name:</td>
					<td nowrap align="left" ><bean:write name="invoiceDetailForm"
						property="invoiceDetails.studentDetails.lastName" />&nbsp; <bean:write
						name="invoiceDetailForm"
						property="invoiceDetails.studentDetails.studentName" /></td>
					<td nowrap>Admission No:</td>
					<td align="left" ><bean:write name="invoiceDetailForm"
						property="invoiceDetails.studentDetails.admissionNo" /></td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<% double total = 0.00; %>
			<td colspan="2" height="200px">
			<table width="100%" align="top">

				<% Iterator it = 

printInvoiceDetails.iterator(); int i = 1;%>
				<% while(it.hasNext()){
						FeesMaster f = (FeesMaster) 

it.next();
						try{
							

d.format(Double.parseDouble(f.getFeesAmt()));
						}catch(Exception e){
							f.setFeesAmt("0.00");
						}
						
						try{
							if(!f.getFine().equals("0.00"))
							{
							 fm.setFine(f.getFine());
							}
d.format(Double.parseDouble(f.getFine()));
						}catch(Exception e){
							f.setFine("0.00");
						}
						
						try{
							if(!f.getHostelFee().equals("0.00"))
							{
							 fm.setHostelFee(f.getHostelFee());
							}
d.format(Double.parseDouble(f.getHostelFee()));
						}catch(Exception e){
							f.setHostelFee("0.00");
						}
						
						try{
							if(!f.getTransportFee().equals("0.00"))
							{
							 fm.setTransportFee(f.getTransportFee());
							}
d.format(Double.parseDouble(f.getTransportFee()));
						}catch(Exception e){
							f.setTransportFee("0.00");
						}
						
						try{
							if(!f.getScholarAmt().equals("0.00"))
							{
							 fm.setScholarAmt(f.getScholarAmt());
							}
d.format(Double.parseDouble(f.getScholarAmt()));
						}catch(Exception e){
							f.setScholarAmt("0.00");
						}
						
						try{
							if(!f.getPaidAmt().equals("0.00"))
							{
							 fm.setPaidAmt(f.getPaidAmt());
							}
d.format(Double.parseDouble(f.getPaidAmt()));
						}catch(Exception e){
							f.setPaidAmt("0.00");
						}
						
					%>
				<tr valign="top">

					<td><%=i++%>.&nbsp;<%=f.getFeesName()%></td>
					<td>--</td>
					<td align="right"><%=d.format(Double.parseDouble(f.getFeesAmt()))%></td>
					<% total = total + Double.parseDouble(f.getFeesAmt());%>
				</tr>
				<%} %>
				<tr height="2px" >
					<td align="right"></td>
					<td></td>
					<td align="right">------------</td>
				</tr>
				<tr height="2px" >
					<td align="right">Total Actual Amt</td>
					<td>--</td>
					<td align="right"><%=d.format(total)%></td>
				</tr>
				<tr height="2px" >
					<td align="right"></td>
					<td></td>
					<td align="right">------------</td>
				</tr>
				<% if(!fm.getPaidAmt().equals("0.00"))
				{%>
				<tr height="2px" >
					<td align="right">Paid Amt</td>
					<td>--</td>
					<td align="right"><%=d.format(Double.parseDouble(fm.getPaidAmt()))%></td>
				</tr>
				<%} %>
				<% if(!fm.getFine().equals("0.00") && !fm.getFine().equals(".00") && !fm.getFine().equals("0"))
				{%>
				<tr height="2px" >
					<td align="right">Fine</td>
					<td>--</td>
					<td align="right"><%=d.format(Double.parseDouble(fm.getFine()))%></td>
				</tr>
				<%} %>
			
				<%if(!fm.getScholarAmt().equals("0.00") && 
						!fm.getScholarAmt().equals(".00") && !fm.getScholarAmt().equals("0"))
				{ %>
				<tr height="2px" >
					<td align="right">Scholarship</td>
					<td>--</td>
					<td align="right"><%=d.format(Double.parseDouble(fm.getScholarAmt()))%></td>
				</tr>
				<%} %>
				<tr height="2px" >
					<td align="right"></td>
					<td></td>
					<td align="right">------------</td>
				</tr>
				<tr height="2px" >
					<td align="right">Balance Amt</td>
					<td>--</td>
					<td align="right"><%=d.format(total - Double.parseDouble(fm.getPaidAmt()) + Double.parseDouble(fm.getFine()) - Double.parseDouble(fm.getScholarAmt()))%></td>
				</tr>
				<tr height="2px" >
					<td align="right"></td>
					<td></td>
					<td align="right">------------</td>
				</tr>
				<%
				double net = Double.parseDouble(fm.getPaidAmt()); 
				%>
				<tr height="20px" align="right"><td align="right" colspan="2">
				Amount in Words:</td><td><span id="container" align="right"></span>
				</td></tr>
			</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="20px">
			<table width="100%" align="top">
					<tr>
					<td>
					<h5 align="left">Date:
					<%=fm.getFeesDate() %>
					</h5>
					</td>
					<td>
					<h5 align="right">Signature</h5>
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
<script language="javascript">
				convertMoneyToWords("<%=net%>");
</script>
</html:form>
</body>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.cubepro.registration.SchoolDetails"%>
<%@page import="java.util.Iterator"%>
</html>