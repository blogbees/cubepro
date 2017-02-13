<%-- Generic Includes--%>
<%@include file="/jsp/common/commonHeader.jsp" %>
<body>
<!-- Sub menu js part is included -->
<%@include file="/jsp/common/subMenuJs.jsp" %>

<script language="JavaScript1.2">mmLoadMenus();</script> 
<table width="999" border="0" align="center" cellpadding="0" cellspacing="0"> 
  <!-- Header Part Start --> 
    <tr>
    	<td> <%@include file="/jsp/common/headerLinks.jsp"%></td>
	 </tr>
	<!-- Header Part End --> 
  <tr> 
  <!-- Menu Part Start --> 
    <td class="menu-bg">
    	<%@include file="/jsp/common/menu.jsp" %>
    </td> 
	<!-- Menu Part End --> 
  </tr> 
  <tr> 
    <td class="padding"> 
	<!-- Grid Part Start --> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="form-border"> 
	  	<tr>
		    <td colspan="3" class="form-heading">Permission Denied</td>
	  	</tr>
	  	<tr>
	    	<td style="padding:10px;">
	    		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form-border">
					<tr>
						<td class="form-row-text-left" align="left" >
							<html:errors/><br/>
						</td>
					</tr>
				</table>		
			<br/> 
			</td>
	  	</tr>
	</table>
	</td>
	</tr>
	</table>
	</body>
</html>
