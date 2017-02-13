<%@page import="com.cubepro.menu.Menu, com.cubepro.menu.MenuDetails, java.util.List"%>

<%@page import="com.cubepro.components.CubeProConstants"%>
<%@page import="com.cubepro.components.enums.MenuDetailsEnum"%>

<script language="JavaScript" src="js/mm_menu.js"></script>
 <script language="JavaScript"><!-- 

function mmLoadMenus() {
<% 
			Menu menu = (Menu)session.getAttribute(CubeProConstants.ATTR_AUTHORIZED_MENU);
%>

	
		////////////////////////////////////////////////////////////////////////////////////
<%
	if(menu!=null){
			for(MenuDetails topMenu : menu.getMainMenu()) {
				List<MenuDetails> subMenuList = menu.getSubMenu().get(topMenu.getMenuNameKey());
				if(subMenuList.size()>0) {
					for(MenuDetails subMenu : subMenuList) {
						if(subMenu.getHasLevelTwoMenu() == true){
%>
							mm_menu_<%= subMenu.getMenuNameKey()%> = new Menu("<bean:message key='<%= subMenu.getMenuNameKey()%>'/>",150,22,"",12,"#FFFFFF","#FFFFFF","#02334a","#00608c","left","middle",4,0,200,-5,7,true,true,true,5,true,false);
<%
							for(MenuDetails levelTwoMenu  : subMenu.getLevelTwoMenuList()){
%>
								mm_menu_<%= subMenu.getMenuNameKey()%>.addMenuItem("<bean:message key='<%= levelTwoMenu.getMenuNameKey()%>'/>", "location='<%= levelTwoMenu.getLink()%>'");
<%
							}
%>
							mm_menu_<%= subMenu.getMenuNameKey()%>.hideOnMouseOut=true;
							mm_menu_<%= subMenu.getMenuNameKey()%>.bgColor='#FFFFFF';
							mm_menu_<%= subMenu.getMenuNameKey()%>.menuBorder=0;
							mm_menu_<%= subMenu.getMenuNameKey()%>.menuLiteBgColor='#777777';
							mm_menu_<%= subMenu.getMenuNameKey()%>.menuBorderBgColor='#777777';
<%						}
					}// End of inner for loop
%>
					mm_menu_<%= topMenu.getMenuNameKey()%> = new Menu("root",<%= topMenu.getMenuWidth()%>,22,"",12,"#FFFFFF","#FFFFFF","#02334a","#00608c","left","middle",4,0,200,-5,7,true,true,true,5,true,false);
<%
					for(MenuDetails subMenu : subMenuList) {
						if(subMenu.getHasLevelTwoMenu() == true){
%>							
							//Add submenu(that has children) to topmenu
							mm_menu_<%= topMenu.getMenuNameKey()%>.addMenuItem(mm_menu_<%= subMenu.getMenuNameKey()%>, "location='<%= subMenu.getLink()%>'");
							mm_menu_<%= topMenu.getMenuNameKey()%>.childMenuIcon="<%=request.getContextPath()%>/images/arrows.gif";
<%						
						} else {
%>							//Add submenu(that do not have children) to topmenu
							mm_menu_<%= topMenu.getMenuNameKey()%>.addMenuItem("<bean:message key='<%= subMenu.getMenuNameKey()%>'/>", "location='<%= subMenu.getLink()%>'");
<%						}
					}// End of inner for loop
%>
					mm_menu_<%= topMenu.getMenuNameKey()%>.hideOnMouseOut=true;
					mm_menu_<%= topMenu.getMenuNameKey()%>.bgColor='#FFFFFF';
					mm_menu_<%= topMenu.getMenuNameKey()%>.menuBorder=0;
					mm_menu_<%= topMenu.getMenuNameKey()%>.menuLiteBgColor='#777777';
					mm_menu_<%= topMenu.getMenuNameKey()%>.menuBorderBgColor='#777777';
<%				} // End if %>
<%
			}// End of outer for loop
			
%>
<% if (menu.getMainMenu().size() > 0) { %>
	mm_menu_<%=menu.getMainMenu().get(0).getMenuNameKey()%>.writeMenus();
<% }} %>  
} // mmLoadMenus()
// 
--></script> 