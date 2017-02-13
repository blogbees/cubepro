<%@include file="/jsp/common/commonHeader.jsp"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cubepro.reports.AccountBudgetSheet"%>
<%@page import="com.cubepro.util.DateUtils"%>
<%@page import="com.cubepro.util.StringUtils"%>
<html> 
<head> 
<title></title> 
</head> 
<body>
<% 
List accBudgetList = (ArrayList)request.getAttribute("ACCBUDGET");
List incomeDetails = (ArrayList)accBudgetList.get(0);
List expenseDetails = (ArrayList)accBudgetList.get(1);
%> 
<bean:define id="yearTo" name="accBudgetForm" property="toYear" />
 <p align="right" class="alt" ><a href="javascript:window.print();"><b>Print</b></a>&nbsp;</p>
<br />
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" align="center"> 
    <CAPTION><h3><bean:write name="accBudgetForm" property="accType" />&nbsp; 
    <bean:write name="accBudgetForm" property="schoolDetails.schoolName" />
    Account Budget For The Year <bean:write name="accBudgetForm" property="fromYear" /> - 
    <bean:write name="accBudgetForm" property="toYear" />
    </h3></CAPTION> 
    <TR>
    <td valign="top">
    <TABLE WIDTH="100%" BORDER="1" CELLPADDING="0" CELLSPACING="0" align="center">
    <tr> 
    <TH WIDTH="20%" > Expenditure</TH> 
    <TH > Budget <BR>For <br>Apr <bean:write name="accBudgetForm" property="fromYear" /> - Mar <bean:write name="accBudgetForm" property="toYear" /></TH> 
    <TH > Actuals <BR>For <br>Apr <bean:write name="accBudgetForm" property="fromYear" /> - Mar <bean:write name="accBudgetForm" property="toYear" /> </TH> 
    <TH >
    <TABLE WIDTH="100%" BORDER="1" CELLPADDING="0" CELLSPACING="0" align="center" height="70">
    <tr><td align="center" colspan="2">Estimated</td></tr>
    <tr><td align="center" width="50%">
    Apr <bean:write name="accBudgetForm" property="fromYear" /> - Dec <bean:write name="accBudgetForm" property="fromYear" />
    </td><td align="center" width="50%">
    Jan <bean:write name="accBudgetForm" property="toYear" /> - Mar <bean:write name="accBudgetForm" property="toYear" />
    </td></tr>
    </tr></table>
    </TH> 
    <TH > Budget <BR>For <br><%=(Integer.parseInt(""+yearTo)+1) %></TH>
    </tr>
     <% 
     	int minusSize = incomeDetails.size() - expenseDetails.size(); 
     	Iterator it = expenseDetails.iterator();
     	while(it.hasNext()){
     		AccountBudgetSheet accountBudgetSheet = (AccountBudgetSheet)it.next();
     %>
    <tr>
    <td align="center"><%=StringUtils.nullToBlank(accountBudgetSheet.getDesc())%></td>
    <td align="right"><%=StringUtils.nullToBlank(accountBudgetSheet.getPrevBudget())%></td>
    <td align="right"><%=StringUtils.nullToBlank(accountBudgetSheet.getActuals())%></td>
    <td height="100%" >
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" align="center">
    <tr><td width="50%" align="right">
    <%=StringUtils.nullToBlank(accountBudgetSheet.getEst1())%></td>
    <td width="50%" align="right"> <%=StringUtils.nullToBlank(accountBudgetSheet.getEst2())%></td>
    </tr></table></td>
    <td><%=StringUtils.nullToBlank(accountBudgetSheet.getNextBudget())%></td>
    </tr>
    <%}
     	if(minusSize>0){
     		for(int i=0; i < minusSize; i++){
     			%>
     		<tr>
     	     	<td scope="col" >&nbsp;</td>
     	<td scope="col" >&nbsp;</td>
     	<td scope="col" >&nbsp;</td>
		<td height="100%">
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" align="center">
    <tr><td align="center">&nbsp;</td>
    	<td align="center">&nbsp;</td>
    </tr></table></td>
     <td scope="col" >&nbsp;</td>

     </tr>	
     			<%
     		}
     	}
     %>
    </TABLE>
    </td>
    <td valign="top">
    <TABLE WIDTH="100%" BORDER="1" CELLPADDING="0" CELLSPACING="0" align="center">
    <tr>
    <TH WIDTH="20%" > Income</TH> 
    <TH > Budget <BR>For <br>Apr <bean:write name="accBudgetForm" property="fromYear" /> - Mar <bean:write name="accBudgetForm" property="toYear" /></TH> 
    <TH > Actuals <BR>For <br>Apr <bean:write name="accBudgetForm" property="fromYear" /> - Mar <bean:write name="accBudgetForm" property="toYear" /></TH> 
    <TH >
    <TABLE WIDTH="100%" BORDER="1" CELLPADDING="0" CELLSPACING="0" align="center" height="70">
    <tr><td align="center" colspan="2">Estimated</td></tr>
    <tr><td align="center" width="50%">
    Apr <bean:write name="accBudgetForm" property="fromYear" /> - Dec <bean:write name="accBudgetForm" property="fromYear" />
    </td><td align="center" width="50%">
    Jan <bean:write name="accBudgetForm" property="toYear" /> - Mar <bean:write name="accBudgetForm" property="toYear" />
    </td></tr>
    </tr></table>
    </TH> 
    <TH > Budget <BR>For <br><%=(Integer.parseInt(""+yearTo)+1) %></TH>
    </tr> 
 	<% it = incomeDetails.iterator();
     	while(it.hasNext()){
     		AccountBudgetSheet accountBudgetSheet = (AccountBudgetSheet)it.next();
     %>
    <tr>
    <td align="center"><%=StringUtils.nullToBlank(accountBudgetSheet.getDesc())%></td>
    <td align="right"><%=StringUtils.nullToBlank(accountBudgetSheet.getPrevBudget())%></td>
    <td align="right"><%=StringUtils.nullToBlank(accountBudgetSheet.getActuals())%></td>
    <td height="100%">
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" align="center">
    <tr><td width="50%" align="right">
    <%=StringUtils.nullToBlank(accountBudgetSheet.getEst1())%></td>
    <td width="50%" align="right"><%=StringUtils.nullToBlank(accountBudgetSheet.getEst2())%></td>
    </tr></table></td>
    <td><%=StringUtils.nullToBlank(accountBudgetSheet.getNextBudget())%></td>
    </tr>
     <%}
     if(minusSize>0){
     		for(int i=0; i < -(minusSize); i++){
     			%>
     		<tr>
     	<td scope="col" >&nbsp;</td>
     	<td scope="col" >&nbsp;</td>
     	<td scope="col" >&nbsp;</td>
		<td height="100%">
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" align="center">
    <tr><td align="center">&nbsp;</td>
    	<td align="center" >&nbsp;</td>
    </tr></table></td>
     <td scope="col" >&nbsp;</td>
     </tr>	
     			<%
     		}
     	}
     %>
         </TABLE>
 	</td>
 	</TR>
</TABLE> 
<TABLE WIDTH="100%" BORDER="0"> 
<!--<tr> 
<td width="50%" >Opening Balance As on </td> 
<td width="25%" ></td> 
<td width="25%" ></td> 
</tr> 
<tr> 
<td width="50%" >Closing Balance As on </td> 
<td width="25%" ></td> 
<td width="25%" ></td> 
</tr>--> 
<tr> 
<td width="50%" ><h5>Date:<%=DateUtils.getCurrentSysDate()%></h5></td> 
<td width="25%" align="left"> Head Master</td> 
<td width="25%" align="left"> Correspondent</td> 
</tr> 
</body> 
</html>