<%-- Generic Includes--%>
<%@include file="/jsp/common/commonHeader.jsp" %>
<%@ page import="com.cubepro.components.CubeProConstants"%>
<%@ taglib uri="http://displaytag.sf.net/el" prefix="display"%>

<body>
	<!-- Sub menu js part is included -->
	<%@include file="/jsp/common/subMenuJs.jsp" %>
	<script language="JavaScript">mmLoadMenus();</script>
	<bean:define id="dashboardDTO" name="<%=CubeProConstants.REQ_DASHBOARD_DTO%>"></bean:define>
	<table width="100%" border="0" cellspacing="1" cellpadding="0" class="form-border">
  		<tr>
  			<td>
  				<%@include file="/jsp/common/headerLinks.jsp"%>
  			</td>
  		</tr>
		<!-- Menu Part Start --> 
  		<tr>  
    		<td class="menu-bg">
    			<%@include file="/jsp/common/menu.jsp" %>
    		</td>   
  		</tr>
  		<!-- Menu Part End -->   
		<tr>
  			<td colspan="6" class="grid-heading-row">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
      				<tr>
       					<td align="left"><span class="project-approval-sub "><bean:message key="dashboard.intial.approval.project" /></span></td>
       					<td align="right"><a href="#"><img src="images/collapseall.gif" alt="Collapse" border="0" title="Collapse" /></a></td>
      				</tr>
  				</table>
			</td>
		</tr>
		<tr>
			<td>
				<logic:empty name="dashboardDTO" property="initialApprovalProjectList"><h3><bean:message key="project.approval.noprojects" /></h3></logic:empty>
				<logic:notEmpty name="dashboardDTO" property="initialApprovalProjectList">
					<display:table id="initialApproval" name="dashboardDTO.initialApprovalProjectList" requestURI="DashboardTest.do" pagesize="10" sort="list" class="padding-btm-ten">
						<display:column title="Received Date" property="receivedDate" style="width: 20%" sortable="true" headerClass="grid-heading-row"></display:column>
						<display:column title="Project Name" property="projectName" style="width: 18%" sortable="true" headerClass="grid-heading-row" href="ProjectInitApproval.do?mode=Initial Approval" 
							paramId="projectId" paramProperty="projectId"></display:column>
						<display:column title="Project Type" property="projectType"  style="width: 19%" sortable="true" headerClass="grid-heading-row"></display:column>
						<display:column title="Village" property="village" style="width: 22%" sortable="true" headerClass="grid-heading-row"></display:column>
						<display:column title="Created By" property="createdBy" style="width: 21%" sortable="true" headerClass="grid-heading-row"></display:column>
						<display:column title="Project Cost" property="projectCost" style="width: 14%" sortable="true" headerClass="grid-heading-row"></display:column>
					</display:table>
				</logic:notEmpty>
			</td>
		</tr>
	</table>
</body>
</html>