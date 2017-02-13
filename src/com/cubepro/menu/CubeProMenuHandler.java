package com.cubepro.menu;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;

import com.cubepro.components.enums.MenuDetailsEnum;
import com.cubepro.menu.service.PermissionService;
import com.cubepro.roll.RolePermission;

/**
 * Class to filter the menu items that needs to be displayed to a user
 * 
 * 
 */
public class CubeProMenuHandler {

	MenuPermissionHelper menuPermissionHelper = new MenuPermissionHelper();

	/**
	 * Method to get list of sub-menu(sub-modules) of the given main
	 * menu(module) that is available for the user based on his role permission
	 * 
	 * @param moduleNameInString -
	 *            Module name for which sub-module names has to be retrieved
	 * @return - list of sub-module names for the given module name
	 */
	private void populateMenu(Map<String, RolePermission> permissions,
			List<MenuDetails> mainMenuList,
			Map<String, List<MenuDetails>> subMenuMap, int userId, Session session) {

		PermissionService permissionService = new PermissionService();
		List<MenuPermissions> permissionList = permissionService.findByLoginId(userId,session);
		for (MenuPermissions menuPermissions : permissionList) {
			if("Student".equals(menuPermissions.getMenus().getMenuName())){
				populateStudentMenu(mainMenuList, subMenuMap);
			}else if("Staff".equals(menuPermissions.getMenus().getMenuName())){
				populateStaffMenu(mainMenuList, subMenuMap);
			}else if("Attendance".equals(menuPermissions.getMenus().getMenuName())){
				populateAttendanceMenu(mainMenuList, subMenuMap);
			}else if("Academic".equals(menuPermissions.getMenus().getMenuName())){
				populateAcademicMenu(mainMenuList, subMenuMap);
			}else if("SMS".equals(menuPermissions.getMenus().getMenuName())){
				populateSMSMenu(mainMenuList, subMenuMap);
			}else if("Fees".equals(menuPermissions.getMenus().getMenuName())){
				populateFeesEntryMenu(mainMenuList, subMenuMap);
			}else if("Finance".equals(menuPermissions.getMenus().getMenuName())){
				populateAccountBillMenu(mainMenuList, subMenuMap);
			}else if("Hostel".equals(menuPermissions.getMenus().getMenuName())){
				populateHostelMenu(mainMenuList, subMenuMap);
			}else if("Library".equals(menuPermissions.getMenus().getMenuName())){
				populateLibraryMenu(mainMenuList, subMenuMap);
			}else if("Transport".equals(menuPermissions.getMenus().getMenuName())){
				populateTransportMenu(mainMenuList, subMenuMap);
			}else if("Reports".equals(menuPermissions.getMenus().getMenuName())){
				populateReportsMenu(mainMenuList, subMenuMap);
			}else if("Admin".equals(menuPermissions.getMenus().getMenuName())){
				populateAdminMenu(mainMenuList, subMenuMap, userId);
			}
		}
	}

	/**
	 * Method to add the menu details to the list of menu details. Menu details
	 * that need to be added is given in terms of 'MenuDetialsEnum'.
	 * 
	 * @param menuList -
	 *            the list to which menu details will be added
	 * @param menuDetailsEnum -
	 *            menu details that need to be added to the list, in terms of
	 *            'MenuDetailsEnum'
	 * @return - MenuDetails list with the given MenuDetails being added
	 */
	private List<MenuDetails> addMenuDetailsToList(List<MenuDetails> menuList,
			MenuDetailsEnum menuDetailsEnum) {

		MenuDetails menuDetails = new MenuDetails();
		menuDetails.setMenuNameKey(menuDetailsEnum.getMenuNameKey());
		menuDetails.setMenuItem(menuDetailsEnum);
		menuDetails.setLink(menuDetailsEnum.getLink());
		menuDetails.setMenuWidth(menuDetailsEnum.getWidth());
		menuDetails.setSortOrder(menuDetailsEnum.getSortOrder());
		menuList.add(menuDetails);
		return menuList;
	}

	/**
	 * Method to add the menu details to the list of menu details. Menu details
	 * that need to be added is given in terms of 'MenuDetialsEnum'.
	 * 
	 * @param menuList -
	 *            the list to which menu details will be added
	 * @param menuDetailsEnum -
	 *            menu details that need to be added to the list, in terms of
	 *            'MenuDetailsEnum'
	 * @return - MenuDetails list with the given MenuDetails being added
	 */
	private List<MenuDetails> addSubMenuDetailsToList(
			List<MenuDetails> menuList, MenuDetailsEnum menuDetailsEnum) {

		MenuDetails menuDetails = new MenuDetails();
		menuDetails.setMenuNameKey(menuDetailsEnum.getMenuNameKey());
		menuDetails.setLink(menuDetailsEnum.getLink());
		menuDetails.setCssClass(menuDetailsEnum.getCssClass());
		menuDetails.setSortOrder(menuDetailsEnum.getSortOrder());
		menuDetails.setParent(menuDetailsEnum.getParent());
		menuDetails.setHasLevelTwoMenu(menuDetailsEnum.getHasLevelTwoMenu());
		menuList.add(menuDetails);
		return menuList;
	}

	
	/**
	 * Method to get the permissions available for the user and to get the list
	 * of menu and submenu details that will be available for the given
	 * permssion.
	 * 
	 * @param connection -
	 *            connection object
	 * @param userId -
	 *            id of the user
	 * @return - Authorized menu object contains - menu details that can be view
	 *         by the user
	 * @throws SQLException
	 */

	public Menu getAuthorizedMenu(Map<String, RolePermission> permissions, int userId, Session session) {

		// This list will be populated based on the sub-menu permissions
		// available
		List<MenuDetails> mainMenuList = new ArrayList<MenuDetails>();
		Map<String, List<MenuDetails>> subMenuMap = new HashMap<String, List<MenuDetails>>();
		Menu menu = new Menu();
		populateMenu(permissions, mainMenuList, subMenuMap, userId, session);
		// Sort and Set main menu and submenu details to menu object
		Collections.sort(mainMenuList);
		menu.setMainMenu(mainMenuList);
		menu.setSubMenu(subMenuMap);

		return menu;
	}

	/**
	 * Method to populate Reports menu
	 * 
	 * @param permissions
	 * @param mainMenuList
	 * @param subMenuList
	 */
	private void populateStudentMenu(List<MenuDetails> mainMenuList,
			Map<String, List<MenuDetails>> subMenuMap) {

		List<MenuDetails> subMenuList = new ArrayList<MenuDetails>();
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.STUDENT_CREATION);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.STUDENTS_LIST);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.STUDENT_UPDATE);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.STUDENT_HOMEWORK);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.STUDENT_ALUMINIUM);
		

		// Reports menu
		addMenuDetailsToList(mainMenuList, MenuDetailsEnum.STUDENT);
		// Add the sub-menu to map with main menu name as key
		subMenuMap.put(MenuDetailsEnum.STUDENT.getMenuNameKey(),
				subMenuList);

		// Sort the submenu
		Collections.sort(subMenuList);
	}
	
	
	private void populateTransportMenu(List<MenuDetails> mainMenuList,
			Map<String, List<MenuDetails>> subMenuMap) {

		List<MenuDetails> subMenuList = new ArrayList<MenuDetails>();
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.VEHICLE_MASTER);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.ROUTE_MASTER);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.STOP_MASTER);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.ROUTE_STOP_MASTER);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.VEHICLE_MAINT);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.VEHICLE_FUEL);
		// Reports menu
		addMenuDetailsToList(mainMenuList, MenuDetailsEnum.TRANSPORT);
		// Add the sub-menu to map with main menu name as key
		subMenuMap.put(MenuDetailsEnum.TRANSPORT.getMenuNameKey(),
				subMenuList);

		// Sort the submenu
		Collections.sort(subMenuList);
	}
	
	private void populateHostelMenu(List<MenuDetails> mainMenuList,
			Map<String, List<MenuDetails>> subMenuMap) {

		List<MenuDetails> subMenuList = new ArrayList<MenuDetails>();
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.BUILDING_INF);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.ROOM);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.VISITOR);
		// Reports menu
		addMenuDetailsToList(mainMenuList, MenuDetailsEnum.HOSTEL);
		// Add the sub-menu to map with main menu name as key
		subMenuMap.put(MenuDetailsEnum.HOSTEL.getMenuNameKey(),
				subMenuList);

		// Sort the submenu
		Collections.sort(subMenuList);
	}
	
	private void populateAccountBillMenu(List<MenuDetails> mainMenuList,
			Map<String, List<MenuDetails>> subMenuMap) {

		List<MenuDetails> subMenuList = new ArrayList<MenuDetails>();
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.ENTER_TRANSACTION);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.ENTER_ASSANDLIA);
		//addSubMenuDetailsToList(subMenuList,
			//	MenuDetailsEnum.ENTER_BUDGET);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.ENTER_BANKACC);
		


		// Reports menu
		addMenuDetailsToList(mainMenuList, MenuDetailsEnum.PERM_ACCOUNT_BILL);
		// Add the sub-menu to map with main menu name as key
		subMenuMap.put(MenuDetailsEnum.PERM_ACCOUNT_BILL.getMenuNameKey(),
				subMenuList);

		// Sort the submenu
		Collections.sort(subMenuList);
	}
	
	
	private void populateAdminMenu(List<MenuDetails> mainMenuList,
			Map<String, List<MenuDetails>> subMenuMap, int userId) {

		List<MenuDetails> subMenuList = new ArrayList<MenuDetails>();
		//TODO: need to set with permissions
		if(userId==1){
			addSubMenuDetailsToList(subMenuList,
					MenuDetailsEnum.LOGIN);
			addSubMenuDetailsToList(subMenuList,
					MenuDetailsEnum.MENU_PERMISSIONS);
		}
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.SCHOOL);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.CLASS);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.SUBJECT);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.CWS);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.TERM);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.CWT);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.FEES);
		//addSubMenuDetailsToList(subMenuList,
		//		MenuDetailsEnum.HOMEWORK);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.TRANSDESC);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.BANK_INFORMATION);
		
		
		// Reports menu
		addMenuDetailsToList(mainMenuList, MenuDetailsEnum.ADMIN);
		// Add the sub-menu to map with main menu name as key
		subMenuMap.put(MenuDetailsEnum.ADMIN.getMenuNameKey(),
				subMenuList);

		// Sort the submenu
		Collections.sort(subMenuList);
	}
	/**
	 * Method to populate Reports menu
	 * 
	 * @param permissions
	 * @param mainMenuList
	 * @param subMenuList
	 */
	private void populateStaffMenu(List<MenuDetails> mainMenuList,
			Map<String, List<MenuDetails>> subMenuMap) {

		List<MenuDetails> subMenuList = new ArrayList<MenuDetails>();
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.STAFF_CREATION);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.STAFFS_LIST);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.STAFF_UPDATE);
		

		// Reports menu
		addMenuDetailsToList(mainMenuList, MenuDetailsEnum.STAFF);
		// Add the sub-menu to map with main menu name as key
		subMenuMap.put(MenuDetailsEnum.STAFF.getMenuNameKey(),
				subMenuList);

		// Sort the submenu
		Collections.sort(subMenuList);
	}
	
	private void populateAttendanceMenu(List<MenuDetails> mainMenuList,
			Map<String, List<MenuDetails>> subMenuMap) {

		List<MenuDetails> subMenuList = new ArrayList<MenuDetails>();
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.STUDENT_ATTENDANCE);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.STAFF_ATTENDANCE);
		

		// Reports menu
		addMenuDetailsToList(mainMenuList, MenuDetailsEnum.ATTENDANCE);
		// Add the sub-menu to map with main menu name as key
		subMenuMap.put(MenuDetailsEnum.ATTENDANCE.getMenuNameKey(),
				subMenuList);

		// Sort the submenu
		Collections.sort(subMenuList);
	}
	
	
	private void populateAcademicMenu(List<MenuDetails> mainMenuList,
			Map<String, List<MenuDetails>> subMenuMap) {

		List<MenuDetails> subMenuList = new ArrayList<MenuDetails>();

		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.CLASS_TIMETABLE);
		//addSubMenuDetailsToList(subMenuList,
		//		MenuDetailsEnum.STAFF_TIMETABLE);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.EXAM_TIMETABLE);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.MARK_SHEET);
		// Reports menu
		addMenuDetailsToList(mainMenuList, MenuDetailsEnum.TIMETABLE);
		// Add the sub-menu to map with main menu name as key
		subMenuMap.put(MenuDetailsEnum.TIMETABLE.getMenuNameKey(),
				subMenuList);

		// Sort the submenu
		Collections.sort(subMenuList);
	}
	
	private void populateLibraryMenu(List<MenuDetails> mainMenuList,
			Map<String, List<MenuDetails>> subMenuMap) {

		List<MenuDetails> subMenuList = new ArrayList<MenuDetails>();

		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.CATEGORY);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.BOOK);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.STUDENT_LEND_DETAILS);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.STAFF_LEND_DETAILS);
		// Reports menu
		addMenuDetailsToList(mainMenuList, MenuDetailsEnum.LIBRARY);
		// Add the sub-menu to map with main menu name as key
		subMenuMap.put(MenuDetailsEnum.LIBRARY.getMenuNameKey(),
				subMenuList);

		// Sort the submenu
		Collections.sort(subMenuList);
	}
	
	private void populateFeesEntryMenu(List<MenuDetails> mainMenuList,
			Map<String, List<MenuDetails>> subMenuMap) {

		List<MenuDetails> subMenuList = new ArrayList<MenuDetails>();

		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.STUDENT_FEES);
		// Reports menu
		addMenuDetailsToList(mainMenuList, MenuDetailsEnum.FEESENTRY);
		
		// Add the sub-menu to map with main menu name as key
		subMenuMap.put(MenuDetailsEnum.FEESENTRY.getMenuNameKey(),
				subMenuList);

		// Sort the submenu
		Collections.sort(subMenuList);
	}
	
	private void populateSMSMenu(List<MenuDetails> mainMenuList,
			Map<String, List<MenuDetails>> subMenuMap) {

		List<MenuDetails> subMenuList = new ArrayList<MenuDetails>();

		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.ABSENT_SMS);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.MARK_SMS);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.FEES_SMS);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.GENERAL_SMS);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.STAFF_SMS);
		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.HOMEWORK_SMS);
		
		// Reports menu
		addMenuDetailsToList(mainMenuList, MenuDetailsEnum.SMS);
		// Add the sub-menu to map with main menu name as key
		subMenuMap.put(MenuDetailsEnum.SMS.getMenuNameKey(),
				subMenuList);

		// Sort the submenu
		Collections.sort(subMenuList);
	}
	
	private void populateReportsMenu(List<MenuDetails> mainMenuList,
			Map<String, List<MenuDetails>> subMenuMap) {


		List<MenuDetails> subMenuList = new ArrayList<MenuDetails>();

		addSubMenuDetailsToList(subMenuList,
				MenuDetailsEnum.SELECT_REPORTS);
		
		// Reports menu
		addMenuDetailsToList(mainMenuList, MenuDetailsEnum.REPORTS);
		// Add the sub-menu to map with main menu name as key
		subMenuMap.put(MenuDetailsEnum.REPORTS.getMenuNameKey(),
				subMenuList);

		// Sort the submenu
		Collections.sort(subMenuList);
	}
}