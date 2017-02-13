<%
		for(MenuDetails subMenu : subMenuList) {
		%>
			<tr> 
			          <td style="padding-top:10px;" class="border-bottom"><span class="<%= subMenu.getCssClass() %>"><a href="<%= subMenu.getLink() %>"><bean:message key="<%= subMenu.getMenuNameKey()%>"/></a></span></td> 
			</tr> 
<%		} 
%>
