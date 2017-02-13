<%@include file="/jsp/common/commonHeader.jsp"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cubepro.transaction.AssetAndLiabilityDetails"%>
<html>
<head>
<title>Balance Sheet</title>
<link href="<%=request.getContextPath()%>/css/reports.css" rel="stylesheet" type="text/css" />
<script language="javascript">
</script>
</head>
<body>
<html:form action="BalanceSheet" method="post">
<% 
List balanceSheetList = (ArrayList)request.getAttribute("BALANCESHEET");
List assetDetails = (ArrayList)balanceSheetList.get(0);
List liabilityDetails = (ArrayList)balanceSheetList.get(1);
%>
<br />
    <h3 align="center">BALANCE SHEET</h3>
    <p align="left" class="alt" >From:<b><bean:write name="balanceSheetForm" property="fromDate"/></b>
    &nbsp;To:<b><bean:write name="balanceSheetForm" property="toDate"/></b></p>
    <p align="right" class="alt" ><a href="javascript:print();"><b>Print</b></a>&nbsp;</p>
    <br />
    
<TABLE id="mytable" WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" align="center">
<tr>
<td height="100%">
<TABLE id="mytable" WIDTH="100%" height="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" align="center">
 <TR>
    <Th ROWSPAN="2" align="center"><b>LIABILITIES</b></Th>
    <Th COLSPAN="2" align="center"><b>AMOUNT</b></Th>
 </TR>
  <TR>
    <Th><b>Rs</b></TD>
    <Th><b>Rs</b></TD>
 </TR>
 <tr>
 	<td scope="col" class="alt"></td>
 	<td scope="col" class="alt"></td>
 	<td scope="col" class="alt"></td>
 </tr>
 <% int minusSize = assetDetails.size() - liabilityDetails.size();
 	Iterator it = liabilityDetails.iterator();
 	double amt = 0.0;
 	while(it.hasNext()){
 		AssetAndLiabilityDetails assetAndLiabilityDetails = (AssetAndLiabilityDetails)it.next();
 	%>
 	<tr>	
 	<td scope="col" ><%=assetAndLiabilityDetails.getDesc()%></td>
 	<td scope="col" ><%=assetAndLiabilityDetails.getAmount()%></td>
 	<td scope="col" ><%=amt%></td>
 	</tr>
 	<% amt = amt + Double.valueOf(assetAndLiabilityDetails.getAmount()).doubleValue(); %>
 <%}
 	if(minusSize>0){
 		for(int i=0; i < minusSize; i++){
 			%>
 		<tr>
 	<td scope="col" >&nbsp;</td>
 	<td scope="col" >&nbsp;</td>
 	<td scope="col" >&nbsp;</td>
 </tr>	
 			<%
 		}
 	}
 %>
 	
 
 <TR>
    <Td><b>Balance</b></TD>
    <TD><%=amt%></TD>
    <TD><%=amt%></TD>
 </TR>      
</TABLE>
</td>
<td height="100%">
<TABLE id="mytable" WIDTH="100%" BORDER="0" height="100%" CELLPADDING="0" CELLSPACING="0" align="center">
 <TR>
    <Th ROWSPAN="2" align="center"><b>ASSETS</b></Th>
    <Th COLSPAN="2" align="center"><b>AMOUNT</b></Th>
 </TR>
  <TR>
    <Th><b>Rs</b></TD>
    <Th><b>Rs</b></TD>
 </TR>
  <tr>
 	<td ></td>
 	<td ></td>
 	<td ></td>
 </tr>
 
 <% 
 	it = assetDetails.iterator();
 	amt = 0;
 	while(it.hasNext()){
 		AssetAndLiabilityDetails assetAndLiabilityDetails = (AssetAndLiabilityDetails)it.next();
 	%>
 	<tr>	
 	<td scope="col" ><%=assetAndLiabilityDetails.getDesc()%></td>
 	<td scope="col" ><%=assetAndLiabilityDetails.getAmount()%></td>
 	<td scope="col" ><%=amt%></td>
 	</tr>
 	<% amt = amt + Double.valueOf(assetAndLiabilityDetails.getAmount()).doubleValue(); %>
 <%}
 
  	if(minusSize<0){
 		for(int i=0; i < -(minusSize); i++){
 			%>
 		<tr>
 	<td scope="col" >&nbsp;</td>
 	<td scope="col" >&nbsp;</td>
 	<td scope="col" >&nbsp;</td>
 </tr>	
<%}}%>
  <TR>
    <Td><b>Balance</b></TD>
    <TD><%=amt%></TD>
    <TD><%=amt%></TD>
 </TR>      
    
</TABLE>
</td>
</tr>
</TABLE>

</html:form>
</body>
</html>

