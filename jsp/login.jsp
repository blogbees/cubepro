<%@include file="/jsp/common/commonHeader.jsp"%>
<html:base />
<script language="JavaScript" type="text/javascript">
			function submitLogin() {
				document.loginForm.action = "<%=request.getContextPath()%>/Login.cp?action=validateUserAndLogin";
				document.loginForm.submit();
			}
			function SubmitOnEnter(e) {
				var code;
				if (e.keyCode) code = e.keyCode;
				else if (e.which) code = e.which;
				if(code==13) {
					submitLogin();
				}
			}
		
		function forgotPassword() {
			var url = '<%=request.getContextPath()%>/ForgotPassword.do?action=none';
			// To open a popup window for accepting user id on click of forgot password link
			window.open(url, 'forgotPassword', 'toolbar=0,scrollbars=1,location=0,statusbar=1,menubar=0,resizable=0,screenX=10,screenY=25,width=400,height=150');
		}
</script>
<body bgcolor="white"
	onload="document.forms[0]['loginDetails.userName'].focus();">
<html:form action="Login" method="post">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="30%">&nbsp;</td>
			<td width="40%" align="center">
			<table width="100%" style="padding-top: 200px">
				<tr>
					<!-- Add action error here -->
					<td class="error" align="left" nowrap colspan="2" align="center">
					<html:messages id="message" message="true">
						<bean:write name="message" />
					</html:messages></td>
				</tr>

				<tr>
					<td colspan="2" class="login-txt" align="right">
					<%
						String sessionError = request.getParameter("error");
						if (sessionError != null
								&& sessionError.equals("sessiontimeouterror")) {
							MessageResources msgResources = (MessageResources) request
									.getAttribute(Globals.MESSAGES_KEY);
							Locale locale = (Locale) request.getSession().getAttribute(
									Globals.LOCALE_KEY);
							out.print(msgResources.getMessage(locale,
									"error.session.invalid"));
						}
					%> <img src="<%=request.getContextPath()%>/images/logo2.gif" /></td>
				</tr>
				<tr>
					<td width="39%" class="login-txt"><bean:message
						key="login.username" /></td>
					<td width="61%" class="login-input"><html:text
						property="loginDetails.userName"
						onkeypress="SubmitOnEnter(event);" /> <span class="required">*</span>
					<html:messages id="err_username" property="username">
						<br />
						<span class="error"><bean:write name="err_username" /> </span>
					</html:messages></td>
				</tr>
				<tr>
					<td class="login-txt"><bean:message key="login.password" /></td>
					<td class="login-input"><html:password
						property="loginDetails.password"
						onkeypress="SubmitOnEnter(event);"></html:password> <span
						class="required">*</span> <html:messages id="err_password"
						property="password">
						<br />
						<span class="error"><bean:write name="err_password" /> </span>
					</html:messages></td>
				</tr>
				<tr>
					<td class="login-txt"><bean:message key="login.locale" /></td>
					<td class="login-input"><bean:define name="loginForm"
						id="allLocale" property="allLocales" toScope="page" /> <html:select
						name="loginForm" property="localeCode" style="width:145px">
						<%--<html:optionsCollection useBundle="true" name="allLocale"
							label="name" value="code" />--%>
						<html:option value="en">English</html:option>
					</html:select> <span class="required">*</span></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<div id="button">
					<table>
						<tr>
							<td class="login-button">
							<ul>
								<li class="buttonrightcrnr login"
									onmouseover="this.className='buttonhighlight login'"
									onmouseout="this.className='buttonrightcrnr login'"
									title="<bean:message key="login.button.login"/>"><a
									href="javascript:submitLogin()"> <bean:message
									key="login.button.login" /> </a></li>
							</ul>
							</td>
						</tr>
					</table>
					</div>
					</td>
				</tr>
			</table>
			</td>
			<td width="30%">&nbsp;</td>
		</tr><td colspan="3" align="center"><%@include file="/jsp/footer.jsp"%></td>
		<tr>
		</tr>
	</table>
</html:form>

</body>
<%@page import="org.apache.struts.util.MessageResources"%>
<%@page import="java.util.Locale"%>
<%@page import="org.apache.struts.Globals"%>
</html>
