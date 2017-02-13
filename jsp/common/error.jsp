<%-- Generic Includes--%>
<%@page import="org.apache.struts.Globals" %>         
<%@page import="java.io.StringWriter"%>
<%@page import="java.util.Date"%>
<html>
<body> 
<table width="999" border="0" align="center" cellpadding="0" cellspacing="0"> 
	<!-- Header Part End --> 
  	<tr>
    <td class="padding"> 
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" class="form-border">
	  	<tr>
		    <td colspan="3" class="form-heading">Error</td>
	  	</tr>
	  	<tr>
	    	<td style="padding:10px;">
				<html:errors/><br/>
	    		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form-border">
					<tr>
						<td class="form-row-text-left" align="left" >
							Error Time:<%=new Date() %><br/>
							Error Trace:<br/>
						<%
							// read the Struts exception that is placed here by the default Struts Exception handler.
							Exception ex = (Exception) request.getAttribute(Globals.EXCEPTION_KEY);
							if ( ex != null ) {
								StringWriter sw = new StringWriter();
								ex.printStackTrace(new java.io.PrintWriter(sw));
								out.write(sw.getBuffer().toString().replaceAll("\n", "<br/>"));
							}
						%>
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
