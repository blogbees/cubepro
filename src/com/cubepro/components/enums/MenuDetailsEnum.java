	package com.cubepro.components.enums;

import com.cubepro.general.MenuProperties;
import com.cubepro.util.StringUtils;


/**
 * Enum to hold menu name, sub-menu name and its corresponding fields. Main menu
 * fields - menu name, link, width and sort order Sub-menu fields - menu name,
 * link, css class and sort order Note : If a new screen has to be added into
 * the CubePro application, then one enum should be added here.
 * 
 * @author satish.janakiraman
 * 
 */
public enum MenuDetailsEnum {
		
		STUDENT("STUDENT", MenuProperties.getProperty("menu.link.student"), new Integer(MenuProperties.getProperty("menu.width.project")), Integer.valueOf(MenuProperties.getProperty("menu.sort.project"))),
		STUDENT_CREATION("STUDENT_CREATION", MenuProperties.getProperty("submenu.link.studentcreation"), MenuProperties.getProperty("submenu.cssclass.projectcreation"), 1, STUDENT, false),
		STUDENTS_LIST("LIST_OF_STUDENTS", MenuProperties.getProperty("submenu.link.listofstudents"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 2, STUDENT, false),
		STUDENT_UPDATE("STUDENT_UPDATE", MenuProperties.getProperty("submenu.link.studentupdation"), MenuProperties.getProperty("submenu.cssclass.projectupdation"), 3, STUDENT, false),		
		STUDENT_HOMEWORK("STUDENT_HOMEWORK", MenuProperties.getProperty("submenu.link.studenthomework"), MenuProperties.getProperty("submenu.cssclass.projectupdation"), 4, STUDENT, false),
		STUDENT_ALUMINIUM("STUDENT_ALUMINIUM", MenuProperties.getProperty("submenu.link.aluminium"), MenuProperties.getProperty("submenu.cssclass.projectupdation"), 5, STUDENT, false),
		

		STAFF("STAFF", MenuProperties.getProperty("menu.link.staff"), Integer.valueOf(MenuProperties.getProperty("menu.width.project")), Integer.valueOf(MenuProperties.getProperty("menu.sort.project"))),
		STAFF_CREATION("STAFF_CREATION", MenuProperties.getProperty("submenu.link.staffcreation"), MenuProperties.getProperty("submenu.cssclass.projectcreation"), 1, STAFF, false),
		STAFFS_LIST("LIST_OF_STAFFS", MenuProperties.getProperty("submenu.link.listofstaff"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 2, STAFF, false),
		STAFF_UPDATE("STAFF_UPDATE", MenuProperties.getProperty("submenu.link.staffupdation"), MenuProperties.getProperty("submenu.cssclass.projectupdation"), 3, STAFF, false),		
		STAFF_SALARY("STAFF_SALARY", MenuProperties.getProperty("submenu.link.staffsalary"), MenuProperties.getProperty("submenu.cssclass.projectupdation"), 4, STAFF, false),

		ATTENDANCE("ATTENDANCE", MenuProperties.getProperty("menu.link.attendance"), Integer.valueOf(MenuProperties.getProperty("menu.width.project")), Integer.valueOf(MenuProperties.getProperty("menu.sort.project"))),
		STUDENT_ATTENDANCE("STUDENT_ATTENDANCE", MenuProperties.getProperty("submenu.link.studentattendance"), MenuProperties.getProperty("submenu.cssclass.projectcreation"), 1, ATTENDANCE, false),
		STAFF_ATTENDANCE("STAFF_ATTENDANCE", MenuProperties.getProperty("submenu.link.staffattendance"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 2, ATTENDANCE, false),
		LEAVE_MANAGEMENT("LEAVE_MANAGEMENT", MenuProperties.getProperty("submenu.link.leavemgmt"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 3, ATTENDANCE, false),

		TIMETABLE("TIMETABLE", MenuProperties.getProperty("menu.link.timetable"), Integer.valueOf(MenuProperties.getProperty("menu.width.project")), Integer.valueOf(MenuProperties.getProperty("menu.sort.project"))),
		EXAM_TIMETABLE("EXAM_TIMETABLE", MenuProperties.getProperty("submenu.link.examtimetable"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 1, TIMETABLE, false),
		CLASS_TIMETABLE("CLASS_TIMETABLE", MenuProperties.getProperty("submenu.link.classtimetable"), MenuProperties.getProperty("submenu.cssclass.projectcreation"), 2, TIMETABLE, false),
		STAFF_TIMETABLE("STAFF_TIMETABLE", MenuProperties.getProperty("submenu.link.stafftimetable"), MenuProperties.getProperty("submenu.cssclass.projectcreation"), 3, TIMETABLE, false),
		MARK_SHEET("MARK_SHEET", MenuProperties.getProperty("submenu.link.markupdation"), MenuProperties.getProperty("submenu.cssclass.projectupdation"), 4, TIMETABLE, false),
		
		LIBRARY("LIBRARY", MenuProperties.getProperty("menu.link.library"), Integer.valueOf(MenuProperties.getProperty("menu.width.project")), Integer.valueOf(MenuProperties.getProperty("menu.sort.project"))),
		CATEGORY("CATEGORY_", MenuProperties.getProperty("submenu.link.category"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 1, LIBRARY, false),
		BOOK("BOOK", MenuProperties.getProperty("submenu.link.book"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 2, LIBRARY, false),
		STUDENT_LEND_DETAILS("STUDENT_LEND_DETAILS", MenuProperties.getProperty("submenu.link.studentlenddetails"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 3, LIBRARY, false),
		STAFF_LEND_DETAILS("STAFF_LEND_DETAILS", MenuProperties.getProperty("submenu.link.stafflenddetails"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 4, LIBRARY, false),

		TRANSPORT("TRANSPORT", MenuProperties.getProperty("menu.link.transport"), Integer.valueOf(MenuProperties.getProperty("menu.width.project")), Integer.valueOf(MenuProperties.getProperty("menu.sort.project"))),
		VEHICLE_MASTER("VEHICLE_MASTER", MenuProperties.getProperty("submenu.link.vehiclemaster"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 1, TRANSPORT, false),
		ROUTE_MASTER("ROUTE_MASTER", MenuProperties.getProperty("submenu.link.routemaster"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 2, TRANSPORT, false),
		STOP_MASTER("STOP_MASTER", MenuProperties.getProperty("submenu.link.stopmaster"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 3, TRANSPORT, false),
		ROUTE_STOP_MASTER("ROUTE_STOP_MASTER", MenuProperties.getProperty("submenu.link.routestopmaster"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 4, TRANSPORT, false),
		VEHICLE_MAINT("VEHICLE_MAINT", MenuProperties.getProperty("submenu.link.vehiclemaint"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 5, TRANSPORT, false),		
		VEHICLE_FUEL("VEHICLE_FUEL", MenuProperties.getProperty("submenu.link.vehiclefuel"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 6, TRANSPORT, false),
		
		HOSTEL("HOSTEL", MenuProperties.getProperty("menu.link.hostel"), Integer.valueOf(MenuProperties.getProperty("menu.width.project")), Integer.valueOf(MenuProperties.getProperty("menu.sort.project"))),
		BUILDING_INF("BUILDING_INF", MenuProperties.getProperty("submenu.link.buildingInf"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 1, HOSTEL, false),
		ROOM("ROOM", MenuProperties.getProperty("submenu.link.room"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 2, HOSTEL, false),
		VISITOR("VISITOR", MenuProperties.getProperty("submenu.link.visitor"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 3, HOSTEL, false),
		
		SMS("SMS", MenuProperties.getProperty("menu.link.sms"), Integer.valueOf(MenuProperties.getProperty("menu.width.project")), Integer.valueOf(MenuProperties.getProperty("menu.sort.project"))),
		ABSENT_SMS("ABSENT_SMS", MenuProperties.getProperty("submenu.link.absentsms"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 1, SMS, false),
		MARK_SMS("MARK_SMS", MenuProperties.getProperty("submenu.link.marksms"), MenuProperties.getProperty("submenu.cssclass.projectcreation"), 2, SMS, false),
		FEES_SMS("FEES_SMS", MenuProperties.getProperty("submenu.link.feessms"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 3, SMS, false),
		GENERAL_SMS("GENERAL_SMS", MenuProperties.getProperty("submenu.link.generalsms"), MenuProperties.getProperty("submenu.cssclass.projectcreation"), 4, SMS, false),
		STAFF_SMS("STAFF_SMS", MenuProperties.getProperty("submenu.link.staffsms"), MenuProperties.getProperty("submenu.cssclass.projectcreation"), 5, SMS, false),
		HOMEWORK_SMS("HOMEWORK_SMS", MenuProperties.getProperty("submenu.link.homeworksms"), MenuProperties.getProperty("submenu.cssclass.projectcreation"), 6, SMS, false),

		FEESENTRY("FEESENTRY", MenuProperties.getProperty("menu.link.feesentry"), Integer.valueOf(MenuProperties.getProperty("menu.width.project")), Integer.valueOf(MenuProperties.getProperty("menu.sort.project"))),
		STUDENT_FEES("STUDENT_FEES", MenuProperties.getProperty("menu.link.feesentry"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 1, FEESENTRY, false),
		

		PERM_ACCOUNT_BILL("PERM_ACCOUNT_BILL", MenuProperties.getProperty("menu.link.accountbill"), Integer.valueOf(MenuProperties.getProperty("menu.width.project")), Integer.valueOf(MenuProperties.getProperty("menu.sort.project"))),
		ENTER_TRANSACTION("ENTER_TRANSACTION", MenuProperties.getProperty("submenu.link.entertrans"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 1, PERM_ACCOUNT_BILL, false),
		ENTER_ASSANDLIA("ENTER_ASSANDLIA", MenuProperties.getProperty("submenu.link.assandlia"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 2, PERM_ACCOUNT_BILL, false),
		ENTER_BUDGET("ENTER_BUDGET", MenuProperties.getProperty("submenu.link.budget"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 3, PERM_ACCOUNT_BILL, false),
		ENTER_BANKACC("ENTER_BANKACC", MenuProperties.getProperty("submenu.link.bankacc"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), 4, PERM_ACCOUNT_BILL, false),
		
		
		ADMIN("ADMIN", MenuProperties.getProperty("menu.link.admin"), Integer.valueOf(MenuProperties.getProperty("menu.width.project")), Integer.valueOf(MenuProperties.getProperty("menu.sort.project"))),
		LOGIN("LOGIN", MenuProperties.getProperty("submenu.link.login"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), Integer.valueOf(MenuProperties.getProperty("submenu.sort.listofprojects")), ADMIN, false),
		SCHOOL("SCHOOL", MenuProperties.getProperty("submenu.link.school"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), Integer.valueOf(MenuProperties.getProperty("submenu.sort.listofprojects")), ADMIN, false),
		CLASS("CLASS", MenuProperties.getProperty("submenu.link.class"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), Integer.valueOf(MenuProperties.getProperty("submenu.sort.listofprojects")), ADMIN, false),
		SUBJECT("SUBJECT", MenuProperties.getProperty("submenu.link.subject"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), Integer.valueOf(MenuProperties.getProperty("submenu.sort.listofprojects")), ADMIN, false),
		CWS("CWS", MenuProperties.getProperty("submenu.link.cws"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), Integer.valueOf(MenuProperties.getProperty("submenu.sort.listofprojects")), ADMIN, false),
		TERM("TERM", MenuProperties.getProperty("submenu.link.term"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), Integer.valueOf(MenuProperties.getProperty("submenu.sort.listofprojects")), ADMIN, false),
		CWT("CWT", MenuProperties.getProperty("submenu.link.cwt"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), Integer.valueOf(MenuProperties.getProperty("submenu.sort.listofprojects")), ADMIN, false),
		FEES("FEES", MenuProperties.getProperty("submenu.link.fees"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), Integer.valueOf(MenuProperties.getProperty("submenu.sort.listofprojects")), ADMIN, false),
		HOMEWORK("HOMEWORK", MenuProperties.getProperty("submenu.link.homework"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), Integer.valueOf(MenuProperties.getProperty("submenu.sort.listofprojects")), ADMIN, false),
		TRANSDESC("TRANSDESC", MenuProperties.getProperty("submenu.link.trans"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), Integer.valueOf(MenuProperties.getProperty("submenu.sort.listofprojects")), ADMIN, false),
		BANK_INFORMATION("BANK_INFORMATION", MenuProperties.getProperty("submenu.link.bankinf"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), Integer.valueOf(MenuProperties.getProperty("submenu.sort.listofprojects")), ADMIN, false),
		MENU_PERMISSIONS("MENU_PERMISSIONS", MenuProperties.getProperty("submenu.link.menupermissions"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), Integer.valueOf(MenuProperties.getProperty("submenu.sort.listofprojects")), ADMIN, false),
		
		REPORTS("REPORTS", MenuProperties.getProperty("menu.link.reports"), Integer.valueOf(MenuProperties.getProperty("menu.width.project")), Integer.valueOf(MenuProperties.getProperty("menu.sort.project"))),
		SELECT_REPORTS("SELECT_REPORTS", MenuProperties.getProperty("submenu.link.runreports"),MenuProperties.getProperty("submenu.cssclass.listofprojects"), Integer.valueOf(MenuProperties.getProperty("submenu.sort.listofprojects")), REPORTS, false),

		
		;

		
		private String menuNameKey;
		private String link;
		private String cssClass;
		private Integer width;
		private Integer sortOrder;
		private MenuDetailsEnum parent;
		private Boolean hasLevelTwoMenu;

		/*
		 * Parameterized constructor to set menuName, link and width fields of a
		 * 'main menu'
		 * 
		 * @param menuName @param link
		 */
		private MenuDetailsEnum(String menuNameKey, String link, Integer width, Integer sortOrder) {
			this.menuNameKey = StringUtils.trim(menuNameKey);
			this.link = StringUtils.trim(link);
			this.width =  Integer.parseInt(StringUtils.trim(width.toString()));
			this.sortOrder = Integer.parseInt(StringUtils.trim(sortOrder.toString()));
		}
		
		/*
		 * Parameterized constructor to set menuName, link and cssClass fields
		 * of a 'sub-menu'
		 * 
		 * @param menuName @param link @param width @param cssClass
		 */
		private MenuDetailsEnum(String menuNameKey, String link, String cssClass, Integer sortOrder, MenuDetailsEnum parent, Boolean hasLevelTwoMenu) {
			this.menuNameKey = StringUtils.trim(menuNameKey);
			this.link = link;
			this.cssClass = cssClass;
			this.sortOrder =  Integer.parseInt(StringUtils.trim(sortOrder.toString()));
			this.parent = parent;
			this.hasLevelTwoMenu = hasLevelTwoMenu;
		}
		
		/**
		 * Getter method for link field
		 * 
		 * @return - link
		 */
		public String getLink() {
			return link;
		}
		
		/**
		 * Getter method for cssClass field
		 * 
		 * @return
		 */
		public String getCssClass() {
			return cssClass;
		}
		
		/**
		 * Getter method for width field
		 * 
		 * @return - menu width
		 */
		public Integer getWidth() {
			return width;
		}
		
		/**
		 * Getter method for sortOrder field
		 * 
		 * @return
		 */
		public Integer getSortOrder() {
			return sortOrder;
		}

		/**
		 * @return the parent
		 */
		public MenuDetailsEnum getParent() {
			return parent;
		}

		/**
		 * @return the hasChildren
		 */
		public Boolean getHasLevelTwoMenu() {
			return hasLevelTwoMenu;
		}
		
		/**
		 * @return the menuNameKey
		 */
		public String getMenuNameKey() {
		
			return menuNameKey;
		}
		
}
