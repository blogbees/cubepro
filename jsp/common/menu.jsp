<div id="menu"> 
		      <ul> 
		      <%  for(MenuDetails topMenu : menu.getMainMenu()) { %>
		      		<li><a href="<%= topMenu.getLink()%>" name="<%= topMenu.getMenuNameKey()%>" id="<%= topMenu.getMenuNameKey()%>" onmouseover="MM_showMenu(window.mm_menu_<%= topMenu.getMenuNameKey()%>,0,22,null,'<%= topMenu.getMenuNameKey()%>')" onmouseout="MM_startTimeout();"><bean:message key="<%= topMenu.getMenuNameKey()%>"/></a></li> 
		      <%}%>
		      </ul> 
 </div>
