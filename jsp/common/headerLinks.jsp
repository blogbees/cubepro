<%@page import="com.cubepro.components.enums.LocaleEnum"%>
<%@page import="com.cubepro.components.CubeProConstants"%>
<%@page import="com.cubepro.general.ApplicationProperties"%>
<%@page import="com.cubepro.util.StringUtils"%>
<jsp:directive.page import="com.cubepro.login.entity.LoginDetails"/>
<script language="javascript">
function openContact(){
var url = "<%=request.getContextPath()%>/contact.html";
window.open(url,"","height=350,width=820,align=center");
}
</script>
<div id="header">
	<img src="<%=request.getContextPath()%>/images/logo.png" class="logo"  alt=""/> 
    <ul> 
    	<bean:define id="Local_Key" name="org.apache.struts.action.LOCALE" scope="session" />
    	<logic:present name="loginUser" scope="session">
    		<bean:define id="userObj" name="<%=CubeProConstants.ATTR_LOGIN_USER%>" scope="session" type="com.cubepro.login.entity.LoginDetails"/> 
    	</logic:present>
		<li class="home"><a href="Home.cp" title='<bean:message key="nregs.home"/>'><bean:message key="nregs.home"/></a></li>
		<li class="contact"><a title='<bean:message key="nregs.contactus"/>' onclick="javascript:openContact();" style="cursor:hand;"><bean:message key="nregs.contactus"/></a></li> 
		<li class="help"><a title='<bean:message key="nregs.help"/>' href="<%=request.getContextPath()%>/manual/CubeProManual.pdf" target="blank"><bean:message key="nregs.help"/></a></li> 
		<li class="logout"><a href="Logout.cp" title='<bean:message key="nregs.logout"/>'><bean:message key="nregs.logout"/></a></li>
	</ul>
	<span class="app-version"> 
		<bean:message key="nrega.application.version"/> <%=ApplicationProperties.getProperty("application.version") %>
	</span>
	<span class="welcome-note">
		<bean:message key="welcome.heading"/>&nbsp;
			<b>
				<% LoginDetails user = ((LoginDetails)request.getSession().getAttribute(CubeProConstants.ATTR_LOGIN_USER)); %>
					<%=user.getUserName()%>
			</b>
	<br />
	
			<%-- if(request.getSession(true).getAttribute(CubeProConstants.PORT_NAME)!=null){ %>
				<b>SMS PORT ACTIVE AT:&nbsp;<font color="green">
				<script type="text/javascript">
					var str="<%=request.getSession(true).getAttribute(CubeProConstants.PORT_NAME)%>";
					document.write(str.blink());
				</script> 
				 </font></b>
			<%} --%>			
	</span>

	</span>		
</div>