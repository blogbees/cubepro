<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="cpro"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<title><cpro:text name="login.title" /></title>
		<link href='<cpro:url value="/css/style.css"/>' rel="stylesheet"
			type="text/css" />
		<!--[if lte IE 6]>
<style type="text/css">
html, body
	{
	height: 100%;
	overflow: auto;
	}
#left {
	position: absolute; left: 0;
	width: 20%;
}
</style>
<![endif]-->
<script language="javascript" type="text/javascript" src='<cpro:url value="/js/util.js" />' >
</script>
	</head>
	<body>
		<table border="0" cellpadding="2" cellspacing="2" width="100%" height="100%" >
			<tr>
				<td colspan="2" align="right" >
					<jsp:include flush="false" page="header.jsp" />
				</td>
			</tr>
			<tr>
				<td width="18%" valign="top" >
					<jsp:include flush="false" page="left_menus.jsp" />
				</td>
				<td width="85%" valign="top" >

					<div style="padding-left: 10px; padding-right: 12px; text-align: left;">
						<ul id="tbnav">
   <li><a title="Basic plugin search" href="#absent"><div style="padding-top: 3px;">Send Absent SMS</div></a></li>
   <li><a title="Advanced plugin search" href="#marklist"><div style="padding-top: 3px;">Send Mark List</div></a></li>
   <li><a title="Advanced plugin search" href="#general"><div style="padding-top: 3px;">Send General SMS</div></a></li>
						</ul>

<div id="absent" class="tbcont">
					<jsp:include flush="true" page="absentSMSDetails.jsp"></jsp:include>
</div>
<div id="marklist" class="tbcont">
					<jsp:include flush="true" page="smsMarkLists.jsp"></jsp:include>
</div>
<div id="general" class="tbcont">
					<jsp:include flush="true" page="smsMarkLists.jsp"></jsp:include>
</div>

</div>

				</td>
			</tr>
		</table>
	</body>
</html>
