package com.cubepro.components;

	public class CubeProConstants{
		
		/**
		 *  Variable to hold the key for cookie name in application.properties file
		 */
		public final static String SESSION_COOKIENAME = "session.cookiename"; 
		
		/**
		 * Action forwards
		 */
		public final static String SUCCESS = "success";
		
		public final static String VALID_USER = "isUserIsValid";
		
		public final static String SUCESS3 = "success3";
		
		public final static String ACKNOWLEDGE = "acknowledge";
		
		public final static String RELOAD = "reload";
		
		public final static String ERROR = "error";
		
		public final static String ACCESS_DENIED = "accessDenied";
		
		/**
		 * Error key to be used in jsp page, to display region permission denied message
		 */
		public final static String ERR_KEY_REGION_PERM_DENIED = "regionPermissionDenied";
		
		public final static String LOAD = "load";
		
		public final static String FAILURE = "failure";
		/**
		 * some general constants
		 */
		
		public final static String PUBLIC_LOGIN = "publicLogin";
		
		public final static String TRUE = "true";

		public final static String NAVIGATION = "nav";
		
		public final static String SEARCH = "search";
		
		public final static String QUESTION = "question";
			
		public final static String SUBMIT = "submit";
		
		public final static String SAVE = "save";
		
		public final static String ADD = "add";
		
		public final static String EDIT = "edit";
		
		public final static String DELETE = "delete";
		
		public final static String CANCEL = "cancel";
		
		public final static String COLLAPSE = "collapse";
		
		public final static String PUBLISHED = "published";
		
		public final static String SAVELIST ="savelist";
		
		public final static String VIEW_HISTORY ="viewHistory";

		public final static String ADMIN_APPROVAL = "adminApproval";
		
		public final static String GET_CHILD_REGION = "getChildRegionCode";
		
		public final static String SUBMIT_CHILD_REGION = "submitChildRegionAlso";
		
		public static final String STAFF_TYPE_WARDEN = "WARDEN"; 
			
		
		/**
		 * Constant to hold the name of the system user
		 */
		public final static String SYSTEM_USER = "SYSTEM_USER";
		
		/**
		 * Name of the struts message resource properties file
		 */
		public static final String STRUTS_MESSAGE_RESOURCE_FILE_NAME = "MessageResources";
		
		/*
		 * Date constant
		 */	
		public static final String DATE_FORMAT = "dd/MM/yyyy";
		
		/*
		 * Date time format
		 */
		public static final String DATE_TIME_FORMAT = "dd/MM/yyyy hh:mm:ss";
		

		/**
		 * Local Bodies
		 */
		public final static String STATE_CODE = "10";
		
		public final static long STATE_ID = 1;
		
		public final static int DISTRICT_LEVEL_ID = 2;
		
		public final static int BLOCK_LEVEL_ID = 3;
		
		public final static int STATE_LEVEL_ID = 1;
		
		public final static String REGION_LEVEL_ID = "regionLevelId";
		
		public final static String REGION_ID = "regionId";
		
		public final static String PARENT_ID = "parentId";
		
		public final static long PARENT_ID_OF_DISTRICT = 1;
		
		public final static String LOCAL_BODY_STATE = "State";
		
		public final static String LOCAL_BODY_DISTRICT = "District";
		
		public final static String LOCAL_BODY_BLOCK = "Block";
		
		public final static String LOCAL_BODY_PANCHAYAT = "Panchayat";
		
		public final static String LOCAL_BODY_VILLAGE = "Village";
		
		public final static int LOCAL_BODY_STATE_CODE_LENGTH = 2;
		
		public final static int LOCAL_BODY_DISTRICT_CODE_LENGTH = 2;
		
		public final static int LOCAL_BODY_BLOCK_CODE_LENGTH = 4;
		
		public final static int LOCAL_BODY_PANCHAYAT_CODE_LENGTH = 3;
		
		public final static int LOCAL_BODY_BLOCK_PANCHAYAT_CODE_LENGTH = 7;
		
		public final static int LOCAL_BODY_VILLAGE_CODE_LENGTH = 3;// Just the village code
		
		public final static int LOCAL_BODY_PANCHAYAT_VILLAGE_CODE_LENGTH = 8;//Village code + panchayat code (3+5=8)
		
		public final static int PANCHAYAT_LEVEL_ID = 4;
		
		public final static int VILLAGE_LEVEL_ID = 5;
		
		/*
		 * Length of the project unique id
		 */
		public static final int PROJECT_UID_LENGTH = 26;
		
		/**
		 * Project
		 */
		public final static String PROJECT_ID = "projectId";
		/**
		 * Social Audit
		 */
		public final static int MONTHS_BETWEEN_TWO_AUDITS = 6;
		/**
		 * Project Scheme Type
		 */
		public final static String PROJECT_SCHEME_ID = "projectSchemeTypeId";	
		
		/**
		 * Soil Type
		 */
		public final static String SOIL_TYPE_ID = "soilTypeId";
		
		/**
		 * Project Details Rendering Mode
		 */
		public final static String UPDATE = "update";
		
		public final static String GRIEVANCEBENEFICIARY = "beneficiary";
			
		/**
		 * Filter Change Page
		 */
		public final static String UPDATE_PAGE = "projectUpdate";
		
		public final static String CREATE_PAGE = "projectCreate";	
		
		public final static String POPUP_PAGE = "popup";
		
		/**
		 * Revert project's Reason default id
		 */
		public static long REVERT_PROJECT_REASON_ID = -9999L;
		
		/**
		 * Financial Year
		 */
		public final static int CURRENT_YEAR_STATUS = 0;
		/**
		 * Grievance Registration	
		 */
		public final static String INIT_LOAD = "init";
		
		public final static String LOAD_GRIEVANCE = "loadGrievance";
		
		public final static String GET_STATUS = "status";

		public final static String FORM_SUBMIT = "submit";
		
		public final static String ASSIGN = "assign";
		
		public final static String RESOLVE = "resolve";
		
		public final static String CLOSE = "close";
		
		public final static String RESET_SEARCH = "resetSearch";
		
		public final static String REOPEN = "reopen";
			
		public final static String GET_TRACK_INFO = "trackinfo";
		
		public final static String GRIEVANCE_TRACK_CLEAR = "reset";
		
		public final static String GET_PREVIOUS_COMMENTS = "previousComments";
		
		public final static String SEARCH_USER = "searchUser";
		
		public final static String SEARCH_USER_RESULTS = "SearchResults";
		
		public final static String SEARCH_PAGE_NO = "pageno";
		
		public final static String PRINT = "print";
		
		public final static String OPERATION = "operation";
		/**
		 * constant to grievance disposal date
		 */
		public final static int MAX_DAYS_TO_RESOLVE = 30;
		
		/**
		 * Grievance Permissions.
		 */	
		public final static String PERMISSION_GRIEVANCE_ASSIGN = "PERM_GRIEVANCE_ASSIGN";
		public final static int GRIEVANCE_ASSIGN_INDEX = 0;	
		public final static String PERMISSION_GRIEVANCE_INPROGRESS = "PERM_GRIEVANCE_INPROGRESS";
		public final static int GRIEVANCE_INPROGRESS_INDEX = 1;
		public final static String PERMISSION_GRIEVANCE_RESOLVE = "PERM_GRIEVANCE_RESOLVE";
		public final static int GRIEVANCE_RESOLVE_INDEX = 2;
		public final static String PERMISSION_GRIEVANCE_CLOSE = "PERM_GRIEVANCE_CLOSE";
		public final static int GRIEVANCE_CLOSE_INDEX = 3;
		public final static String PERMISSION_GRIEVANCE_REOPEN = "PERM_GRIEVANCE_RE-OPEN";
		public final static int GRIEVANCE_REOPEN_INDEX = 4;
		public final static String PERMISSION_GRIEVANCE_ORIGIN = "PERM_GRIEVANCE_ORIGIN";
		public final static String PERMISSION_GRIEVANCE_RECEIVE = "PERM_GRIEVANCE_RECEIVE";
		public final static String PERMISSION_GRIEVANCE_REDRESSAL = "PERM_GRIEVANCE_REDRESSAL";

		public final static String GRIEVANCE_PERMISSIONS = "grievancePermissions";	
		
		public final static String GRIEVANCE_ORIGIN_PERMISSION = "originPermission";	

		
		/**
		 * Session attribute to hold district list
		 */
		public static final String SESSION_DISTRICTS = "districtList";
		/**
		 * Session attribute to hold state
		 */
		public static final String SESSION_STATE = "stateList";
		/**
		 * Session attribute to hold role list
		 */
		public static final String SESSION_ROLE = "grievanceAgainstList";
		/**
		 * Session attribute to hold domain list
		 */
		public static final String SESSION_DOMAIN = "domainList";
		/**
		 * Session attribute to hold Implementing agencies list
		 */
		public static final String SESSION_AGENCY = "agencyList";

		
		/**
		 * Photo Size
		 */
		public final static long PHOTO_SIZE = 3145728; //3 MB
		
		public final static String ATTR_LOGIN_USER = "loginUser";
		
		public final static String ATTR_AUTHORIZED_MENU = "authorizedMenu";
		
		public final static String SESSION_PAGE_SIZE = "pageSize";
		
		/**
		 * Beneficiary Constants
		 */
		
		public final static int MINOR_AGE_LIMIT = 18;
		
		// Max length of the barcode before appending the checksum digit
		public final static int BARCODE_LENGTH_BEFORE_CHECKSUM = 9;
		
		// Mod of the barcode with this number will give the barcode check sum digit
		public final static int BARCODE_CHECKSUM_DIGIT_GENERATOR = 7;
		
		// Maximum lenght of the barcode
		public final static int MAX_BARCODE_LENGTH = 10;
		
		public final static int BARCODE_START_INDEX = 0;
		
		// Value of the APL radio button
		public final static char APL_RADIO_VALUE = 'A';
		
		// Value of the BPL radio button
		public final static char BPL_RADIO_VALUE = 'B';
		
		// Value of the 'None' radio button in the beneficiary registration screen
		public final static char NONE_RADIO_VALUE = 'N';
		
		/**
		 * Constant to specify beneficiary uid length
		 */
		public final static int BENEFICIARY_UID_LENGTH = 23;
		

		/**
		 *  Last Index
		 */
		
		public final static long DEFAULT_BENEFICIARY_START_INDEX = 1;
		
		public final static int LAST_INDEX_FAMILY_CODE_LENGTH = 5;	
			
		
		/**
		 * Project UID different Code lengths - this may not be needed if Beneficiary UID standard was followed 
		 */
		public final static int PUID_YEAR_CODE_LENGTH = 2;
		public final static int PUID_SCHEME_CODE_LENGTH = 2;
		public final static int LAST_INDEX_PROJECT_CODE_LENGTH = 3;
		
		public final static long DEFAULT_PROJECT_START_INDEX = 1;
		
		/**
		 * Days between applied date for work and work allotted date
		 */
		public final static int DEMAND_DATE_DIFFERENCE = 15;
		
		/**
		 * Dashboard constants
		 */
		public final static String ROLE_PRS = "PRS";
		
		public final static String STATUS_ASSIGNED = "Assigned";
		
		public final static String ATTR_ASSIGNED_TO_ID = "ASSIGNED_TO_ID";
		
		public final static String REQ_DASHBOARD_DTO = "dashboardDTO";
		
		public final static String IS_DASHBOARD_EXIST = "isDashboardExist";
		
		public final static String ATTR_WF_ROLE_ID = "CURRENT_REVIEWER_ROLE_ID";
		
		public final static String ATTR_WF_REGION_ID = "CURRENT_REGION_ID";
		
		public final static String ATTR_WF_ENTITY_TYPE = "WF_ENTITY_TYPE";
		
		public final static String ATTR_PROJECT_ID = "PROJECT_ID";
		
		public final static String ATTR_WF_ACTION_CODE = "WF_ACTION_CODE";
		
		public final static String ATTR_SUBMISSION_DATE = "SUBMISSION_DATE";
		
		public final static String ATTR_USER_ID = "USER_ID";
		
		public final static String ATTR_STATUS = "STATUS";
		
		public final static String PARAM_PRS_FUND_PIE = "PRS_FUND_PIE";
		
		public final static String PARAM_PRS_PROJECTS_PIE = "PRS_PROJECTS_PIE";
		
		public final static String ATTR_PHYSICAL_AUDIT_STATUS = "PHYSICAL_AUDIT_STATUS";
		
		public final static String ATTR_MAN_DAYS = "MAN_DAYS";
		
		public final static String ATTR_WF_INSTANCE_ID = "WF_INSTANCE_ID";
		
		public final static String ATTR_WF_STEP_ID = "WF_STEP_ID";
		
		public final static String ATTR_STATUS_ID = "STATUS_ID";
		
		public final static String ATTR_CONF_ID = "CONF_ATTRIBUTE_ID";
		
		public final static String ATTR_NAME = "ATTRIBUTE_NAME";
		
		public final static String ATTR_VALUE = "ATTRIBUTE_VALUE";

		public final static String STANDARD_WAGE = "standard_wage";
		
		public final static String DRESSING_SOIL = "dressing_rate";
		
		public final static String COMPACTION_WORK = "compaction_rate";
		
		public final static String ENG_MAN_DAYS = " Man Day for ";
		
		public final static String CUBIC_FEET = "cft";
		
		public final static String DELIMITER = "_";
		
		public final static String CURRENCY = "Rs";
		
		public final static String GRIEVANCE_OPEN = "Open";
		
		public final static String GRIEVANCE_ASSIGNED = "Assigned";
		
		public final static String GRIEVANCE_RESOLVED = "Resolved";
		
		public final static String GRIEVANCE_CLOSED = "Closed";
		
		/**
		 * Dashboard Action mapping names
		 */
		public final static String PRS_DASHBOARD = "prsDashboard";
		
		public final static String ENGINEER_DASHBOARD = "engDashboard";
		
		public final static String PO_DASHBOARD = "poDashboard";
		
		public final static String DPC_DASHBOARD = "dpcDashboard";
		
		public final static String SU_DASHBOARD = "suDashboard";
		
		public final static String ACCOUNTANT_DASHBOARD = "accDashboard";
		
		public final static String OTHER_ROLE = "otherRole";
		
		public final static String SHOW_HOME = "homePage";
			
		/**
		 * Display table default page size
		 */		
		public final static int DEFAULT_PAGE_SIZE = 10;
		
		/**
		 * Grievance Page size constants
		 */
		public static final String GRIEVANCE_PAGE_SIZE = "grievancePageSize";
		
		public static final String GRIEVANCE_PAGE_OFFSET = "offset";
		
		public static final String GRIEVANCE_TRACKS_RESULT = "grievanceList";
		
		public static final String GRIEVANCE_TRACK_PAGE_SIZE = "grievanceTrackPage";
		
		public static final String RECONSIDER_PAGE_SIZE = "reconsiderPageSize";
		
		public static final String TECH_EST_PAGE_SIZE = "techEstPageSize";
		
		public static final String TECT_APPROVAL_PAGE_SIZE = "techApprovalPageSize";
		
		public static final String MEASUREMENT_APPROVAL_PAGE_SIZE = "measurementApprovalPageSize";
		
		public static final String INITIAL_APPROVAL_PAGE_SIZE = "initApprovalPageSize";
		
		public static final String ADMIN_APPROVAL_PAGE_SIZE = "adminApprovalPageSize";
		
		public static final String PHYSICAL_AUDIT_PAGE_SIZE = "physicalAuditPageSize";
		
		public static final String DEV_PLAN_PAGE_SIZE = "devPlanPageSize";
		
		public static final String FUND_CLAIN_FORM_PAGE_SIZE = "fundClaimFormPageSize";
		
		public static final String ATTR_GRIEVANCE_SEARCH_RESULT = "grievanceSearch";
		
		public static final String ATTR_GRIEVANCE_TRACK_RESULTS = "grievanceTrackResults";
		
		public static final String DOMAIN_PAGE_SIZE = "domainPage";

		public static final String CATEGORY_PAGE_SIZE = "categoryPage";

		public static final String SUB_CATEGORY_PAGE_SIZE = "subCategoryPage";
		
		public static final String LINE_DEPARTMENTS_PAGE_SIZE = "linedepartmentsPage";
		
		public static final String LINE_DEPARTMENTS_PROJECTS_PAGE_SIZE = "linedepartmentProjectsPage";
		
		public static final String PROJECTS_DEVELOPMENT_PLAN_PAGE_SIZE = "projectctsDevelopmentsPage";
		
		public static final String DISTRICT_DEVELOPEMENT_PLAN_PAGE_SIZE = "districtDevelopementPlanPageSize";
		
		public static final String BLOCK_DEVELOPEMENT_PLAN_PAGE_SIZE = "blockDevelopementPlanPageSize";

		public static final String PANCHAYAT_DEVELOPEMENT_PLAN_PAGE_SIZE = "panchayatDevelopementPlanPageSize";
		
		public static final String NO_PROJECTS_IN_DEV_PLAN = "devPlanProjectsPage";
		
		public static final String FUND_RELEASE_STATE_LEVEL_PAGE = "stateFundReleasePage";
		
		public static final String FUND_RELEASE_DISTRICT_LEVEL_PAGE = "districtFundReleasePage";
		
		public static final String FUND_RELEASE_BLOCK_LEVEL_PAGE = "blockFundReleasePage";
		
		public static final String CREATE = "create";
		
		public static final String GRIEVANCEID = "grievanceId";
		
		public static final String UPDATE_PERMISSION = "updatePermission";
		
		public static final String CREATE_PERMISSION = "createPermission";

			
		/**
		 * Dashboard Pie chart image constants
		 */
		public static final String PROJECT_STATISTICS = "projectStatistics";
			
		public static final String BENEFICIARY_STATISTICS = "beneficiaryStatistics";
		
		public static final String GENDER_STATISTICS = "genderStatistics";
		
		public static final String FUND_STATISTICS = "fundStatistics";
		
		public static final String FUND_UTILIZATION = "fundUtilization";
		
		public static final String NO_IMAGE = "No Image to Dispaly";

		public static final String ENCRYPT_KEY = "e1s2h3a4k5t6h7i8";
		
		// Beneficiary permission
		public final static String PERMISSION_BENEFICIARY = "PERM_BENEFICIARY";
		
		// Beneficiary permission to delete the user from view(ie.hide) 
		public final static String PERMISSION_BENEFICIARY_HIDE = "PERM_BENEFICIARY_HIDE";
		
		public final static String PERMISSION_REGISTER_GRIEVANCE = "PERM_REGISTER_GRIEVANCE";
		
		/**
		 * Social audit/ physical audit
		 */
		
		public final static String PROJECTSCHEMECATEGORY= "projectschemecategory";
		
		public final static String PROJECTSTATUS= "projectstatus";
		
		public final static String PROJECTFINANCIALYEAR ="projectfinancialyear";
		
		public final static String ESHAKTHI = "eshakthi";
		
		public final static String INSPECTIONESHAKTHI = "inspectioneshakthi";
		
		public final static String NONESHAKTHI = "noneshakthi";
		
		public static final String ATTR_SOCIAL_AUDIT_SEARCH_RESULT = "socialAuditSearch";
		
		public static final String ATTR_INSPECTION_AUDIT_SEARCH_RESULT = "inspectionAuditSearch";
		
		public static final String CATEGORYLIST = "categorylist";
		
		public static final String INSPECTIONCATEGORYLIST = "inspectioncategorylist";
		
		public static final String QUESTIONLIST = "questionlist";
		
		public static final String PAGECOUNT = "pagecount";
		
		public static final String INSPECTIONPAGECOUNT = "inspectionpagecount";
		
		public static final String POPULATESOCIALAUDIT = "populatesocialaudit";
		
		public static final String POPULATEINSPECTIONAUDIT = "populateinspectionaudit";
		
		public static final String GETQUESTIONINSPECTION = "getquestioninspection";
		
		public static final String PROJECTID = "projectIdSearch";
		
		public static final String AUDITID = "auditId";
		
		public static final String PAGE = "page";
		
		public static final String NAV = "nav";
		
		public static final String NEXT = "next";
		
		public static final String PREVIOUS = "prev";
		
		public static final String PUBLISH = "publish";
		
		public static final String GOTOPAGE = "gotopage";
		
		public static final String INSPECTIONGOTOPAGE = "inspectiongotopage";
		
		public static final String QUESTIONSIZE = "questionsize";	
		
		public static final String INSPECTIONQUESTIONSIZE = "inspectionquestionsize";	
		
		public static final String SAVESOCIALAUDIT = "save";	
		
		public static final String SAVEINSPECTIONAUDIT = "saveinspection";
		
		public static final String MODE = "mode";
		
		public static final String ADDMODE = "addmode";
		
		public static final String UPDATEMODE = "updatemode";
		
		
		/**
		 * Admin Constants
		 */
		public static final String ROLE_PAGE_SIZE = "rolePageSize";
		
		public static final String SEARCH_USER_PAGE_SIZE = "searchUserPageSize";
		
		public static final String ASSIGN_REGION_PAGE_SIZE = "assignRegionPageSize";
		
		public static final String EDIT_USER = "editUser";
		
		public static final String CREATE_USER = "createUser";
		
		/*
		 * Email template constants
		 */
		 
		/**
		 * placeholder for the Petitioner’s name in email templates
		 */
		public static final String EMAIL_TEMPLATE_PETITIONER_PLACEHOLDER = "$PETITIONER_NAME$";
		/**
		 * placeholder for the tracking number of grievance in email templates
		 */
		public static final String EMAIL_TEMPLATE_TRACKING_NO_PLACEHOLDER = "$TRACKING_NO$";
		/**
		 * placeholder for the grievance status in email templates
		 */
		public static final String EMAIL_TEMPLATE_GRIEVANCE_STATUS_PLACEHOLDER = "$GRIEVANCE_STATUS$";
		/**
		 * placeholder for the grievance disposal date in email templates
		 */
		public static final String EMAIL_TEMPLATE_GRIEVANCE_DISPOSAL_DATE = "$Grievance_DISPOSAL_DATE$";
			
		/**
		 * Class to store Emuster Role Constants
		 * 
		 * @author balaji.vankadari
		 */
		public static class RoleConstants {
			
			public final static int ADMINISTRATOR = 1;
			
			public final static int PRS = 2;
			
			public final static int PTA = 3;
			
			public final static int JE = 4;
			
			public final static int AE = 5;
			
			public final static int EE = 6;
			
			public final static int SE = 7;
			
			public final static int PO = 8;
			
			public final static int DPC = 9;
			
			public final static int ADPC = 10;
			
			public final static int AB = 11;
			
			public final static int AD = 12;
			
			public final static int VMC = 13;
			
			public final static int FA = 14;
			
			public final static int SU = 15;
			
			public final static int PUB = 16;
			
			public final static int DEOB = 17;
			
			public final static int DEOD = 18;
			
			public final static int HE = 19;
			
			public final static int DE = 20;
			
			public final static int SUP = 21;
		}
		
		/**
		 * Project Closure Constants
		 */
		public static final String PROJECT_SEARCH_LIST = "searchDTOList";	
		public static final String PROJECT_CLOSURE_PAGE_SIZE = "pagesize";	
		public static final String PROJECT_CLOSURE_PROJ_ID = "projId";
		public static final String PROJECT_CLOSURE_NAV = "nav";
		public static final String PROJECT_CLOSURE_SEARCH = "search"; 
		public static final String PROJECT_CLOSURE_OP = "op";
		public static final String PROJECT_CLOSURE_NEW_PAGE = "newpage";
		public final static String PROJECT_CLOSURE_DO_THIS = "dothis";
		public final static String PROJECT_CLOSURE_CLRFRM = "clrfrm";
		public final static String PROJECT_CLOSURE_SUBMIT = "submit";
		
		/**
		 * Admin Technical Estimation Constants
		 */
		public static final String MALE_FEMALE_RATIO 			= "maleFemaleRatio";
		public static final String WAGE_MATERIAL_RATIO 			= "wageMaterialRatio";
		public static final String LEAD_TABLE 					= "leadTable";
		public static final String LIFT_TABLE 					= "liftTable";
		public static final String PLANT_TYPE 					= "plantType";
		public static final String TREE_PLANTATION_STANDARDS 	= "treePlantStandards";
		public static final String PROTECTION_CLEANING_WEEDS 	= "protectionCleaningWeeds";
		public static final String LARGE_AREA_PLANTATION 		= "largeAreaPlantation";
		public static final String PROTECTION_OF_PLANTS 		= "protectionOfPlants";
		public static final String SEARCHDISTRICT = "searchDistrictsList";
		
		public static final String MALE_FEMALE_PAGE_SIZE		= "maleFemaleRatio";
		public static final String WAGE_MATERIAL_PAGE_SIZE		= "wageMaterialRatio";
		public static final String LEAD_TABLE_PAGE_SIZE			= "leadTable";
		public static final String LIFT_TABLE_PAGE_SIZE			= "liftTable";
		public static final String PLANT_TYPE_PAGE_SIZE			= "plantType";
		public static final String TREE_PLANTATION_STANDARDS_PAGE_SIZE	= "treePlantStandards";
		public static final String PROTECTION_CLEANING_WEEDS_PAGE_SIZE 	= "protectionCleaningWeeds";
		public static final String LARGE_AREA_PLANTATION_PAGE_SIZE 		= "largeAreaPlantation";
		public static final String PROTECTION_OF_PLANTS_PAGE_SIZE 		= "protectionOfPlants";
		
		public static final String PLANT_TYPE_LIST				= "plantTypeList";
		public static final String SOIL_TYPE_LIST				= "soilTypeList";
		
		/**
		 * Admin - Rates For Structured Work Constants
		 */
		public static final String EARTH_WORK					= "earthWork";
		public static final String LOCAL_SAND_FILLING			= "localSandFilling";
		public static final String BRICK_SOLING					= "brickSoling";
		public static final String PLAIN_CEMENT_CONCRETE		= "plainCemenetConcrete";
		public static final String BRICK_WORK					= "brickWork";
		public static final String CEMENT_PLASTER				= "cementPlaster";
		public static final String CEMENT_PLASTER_PUNNING		= "cementPlasterPunning";
		public static final String CEMENT_CONCRETE_SLAB			= "cementConcreteSlab";
		public static final String PROVISION_SHUTTER_CATERING	= "provisionShutterCatering";
		public static final String SUPPLY_PIPE_CULVERT			= "supplyPipeCulvert";
		public static final String LABOUR_PIPE_CULVERT			= "labourPipeCulvert";
		public static final String MATERIAL						= "material";
		public static final String CARRIAGE_COST				= "carriageCost";
		public static final String CONTRACTOR_BENEFIT  			= "contractorBenefit";
		
		public static final String EARTH_WORK_PAGE_SIZE					= "earthWorkPageSize";
		public static final String LOCAL_SAND_FILLING_PAGE_SIZE			= "localSandFillingPageSize";
		public static final String BRICK_SOLING_PAGE_SIZE				= "brickSolingPageSize";
		public static final String PLAIN_CEMENT_CONCRETE_PAGE_SIZE		= "PlainCemenetConcretePageSize";
		public static final String BRICK_WORK_PAGE_SIZE					= "brickWorkPageSize";
		public static final String CEMENT_PLASTER_PAGE_SIZE				= "cementPlasterPageSize";
		public static final String CEMENT_PLASTER_PUNNING_PAGE_SIZE		= "cementPlasterPunningPageSize";
		public static final String CEMENT_CONCRETE_SLAB_PAGE_SIZE		= "cementConcreteSlabPageSize";
		public static final String PROVISION_SHUTTER_CATERING_PAGE_SIZE	= "provisionShutterCateringPageSize";
		public static final String SUPPLY_PIPE_CULVERT_PAGE_SIZE			= "supplyPipeCulvertPageSize";
		public static final String LABOUR_PIPE_CULVERT_PAGE_SIZE			= "labourPipeCulvertPageSize";
		public static final String MATERIAL_PAGE_SIZE						= "materialPageSize";
		public static final String CARRIAGE_COST_PAGE_SIZE					= "carriageCostPageSize";
		public static final String CONTRACTOR_BENEFIT_PAGE_SIZE   			= "contractorBenefitPageSize";
		
		/**
		 * Admin - Project rates and costs Constants
		 */
		public static final String LEAN_PERIOD 					= "leanPeriod";
		public static final String UNSKILLED_LABOUR_WAGE		= "unskilledLabourWage";
		public static final String SEMISKILLED_LABOUR_WAGE		= "semiskilledLabourWage";
		public static final String SKILLED_LABOUR_WAGE			= "skilledLabourWage";
		public static final String MATE_WAGE					= "mateWage";
		public static final String WATER_PROVIDER_WAGE			= "waterProviderWage";
		public static final String CONTINGENCY_COST_PERCENTAGE	= "contingencyCostPercentage";
		public static final String MISCELLANEOUS_COST			= "miscellaneousCost";
		public static final String DRESSING_EARTH_WORK			= "dressingEarthWork";
		public static final String ROAD_COMPACTION_WORK			= "roadCompactionWork";
		public static final String EARTH_WORK_VOLUME			= "earthWorkVolume";
		
		public static final String LEAN_PERIOD_PAGE_SIZE				= "leanPeriodPageSize";
		public static final String UNSKILLED_LABOUR_WAGE_PAGE_SIZE		= "unskilledLabourWagePageSize";
		public static final String SEMISKILLED_LABOUR_WAGE_PAGE_SIZE	= "semiskilledLabourWagePageSize";
		public static final String SKILLED_LABOUR_WAGE_PAGE_SIZE		= "skilledLabourWagePageSize";
		public static final String MATE_WAGE_PAGE_SIZE					= "mateWagePageSize";
		public static final String WATER_PROVIDER_WAGE_PAGE_SIZE		= "waterProviderWagePageSize";
		public static final String CONTINGENCY_COST_PERCENTAGE_PAGE_SIZE= "contingencyCostPercentagePageSize";
		public static final String MISCELLANEOUS_COST_PAGE_SIZE			= "miscellaneousCostPageSize";
		public static final String DRESSING_EARTH_WORK_PAGE_SIZE		= "dressingEarthWorkPageSize";
		public static final String ROAD_COMPACTION_WORK_PAGE_SIZE		= "roadCompactionWorkPageSize";
		public static final String EARTH_WORK_VOLUME_PAGE_SIZE			= "earthWorkVolumePageSize";
		
		/**
		 * Constants for Allocate Demand by Project or Beneficiary
		 */
		public static final String BY_PROJECT						= "byProject";
		public static final String BY_BENEFICIARY					= "byBeneficiary";
		public static final String ALLOCATE_DEMAND_BY_PROJECT		= "allocateDemandByProject";
		public static final String ALLOCATE_DEMAND_BY_BENEFICIARY	= "allocateDemandByBeneficiary";	
		
		/**
		 * List of Projects constants
		 */
		public final static String LOP_GETLIST = "getlist";
		public static final String LOP_PAGE_SIZE = "pagesize";
		public static final String LOP_OP = "op";
		public final static String LOP_NEW_PAGE = "newpage";
		/**
		 * Admin Beneficiary General Constants
		 */
		public static final String VILLAGE_PAGE_SIZE = "villagePageSize";
		
		/**
		 * Admin Beneficiary Registration Constants
		 */
		public static final String MARITAL_STATUS = "maritalStatus";
		public static final String RELIGION = "religion";
		public static final String CASTE = "caste";
		public static final String EDUCATION = "education";
		public static final String PROFESSION = "profession";
		public static final String POST_OFFICE = "postOffice";
		public static final String POLICE_STATION = "policeStation";
		
		public static final String MARITAL_PAGE_SIZE = "maritalStatusPageSize";
		public static final String RELIGION_PAGE_SIZE = "religionPageSize";
		public static final String CASTE_PAGE_SIZE = "castePageSize";
		public static final String EDUCATION_PAGE_SIZE = "educationPageSize";
		public static final String PROFESSION_PAGE_SIZE = "professionPageSize";
		public static final String POST_OFFICE_PAGE_SIZE = "postOfficePageSize";
		public static final String POLICE_STATION_PAGE_SIZE = "policeStationPageSize";
		
		/**
		 * Admin Project Planning Constants
		 */
			
		public static final String REASON_FOR_RECONSIDERATION = "reasonforreconsideration";
		public static final String AUTO_APPROVAL_DAYS  = "autoApprovalDays";
		public static final String RESON_FOR_RECONSIDERATION_SIZE = "reasonforreconsideration";
		
		public static final String PROJECT_AUTO_APPROVALDAYS = "ProjectAutoApprovalDays";
		
		//HelpdeskTicket Page constants.
		
		public static final String HELPDESK_TICKET_PAGE_SIZE = "helpdeskTicketPageSize";
		
		public static final String ATTR_HELPDESK_TICKET_SEARCH_RESULT = "ticketSearch";
		
		public static final String HELPDESK_TICKET_PAGE_OFFSET = "offset";	
		
		//public static final String HELPDESK_TICKET_TRACKS_RESULT = "helpdeskList";
			
		public static final String HELPDESK_TICKET_TRACKS_RESULT = "helpdeskTicketsList";
			
		
		//HelpdeskTicket request constants.
		public final static String HELPDESK_TICKET_ID ="helpdeskTicketId";	
		
		//private final static String SEARCH = "search";	
		//private final static String RESET_SEARCH = "resetSearch";
		//private final static String INIT_LOAD = "init";
		//private final static String SAVE = "save";
		//private final static String SEARCH_USER = "searchUser";
		public final static String SEARCH_ASSET = "searchAsset";
		public final static String LOAD_TICKET = "loadTicket";
		public final static String TICKET_TRACK_INFO = "ticketTrackInfo";
		//private final static String CREATE = "create";

		
		/**
		 * HelpdeskTicket Permissions.
		 */	
		public final static String PERMISSION_HELPDESK_TICKET_ASSIGN = "PERM_HELPDESK_TICKET_ASSIGN";
		public final static int HELPDESK_TICKET_ASSIGN_INDEX = 0;	
		public final static String PERMISSION_HELPDESK_TICKET_INPROGRESS = "PERM_HELPDESK_TICKET_INPROGRESS";//TODO:no entry in DB.
		public final static int HELPDESK_TICKET_INPROGRESS_INDEX = 1;
		public final static String PERMISSION_HELPDESK_TICKET_RESOLVE = "PERM_HELPDESK_TICKET_RESOLVE"; //TODO:no entry in DB.
		public final static int HELPDESK_TICKET_RESOLVE_INDEX = 2;
		public final static String PERMISSION_HELPDESK_TICKET_CLOSE = "PERM_HELPDESK_TICKET_CLOSE";
		public final static int HELPDESK_TICKET_CLOSE_INDEX = 3;
		public final static String PERMISSION_HELPDESK_TICKET_REOPEN = "PERM_HELPDESK_TICKET_REOPEN";
		public final static int HELPDESK_TICKET_REOPEN_INDEX = 4;
		public final static String PERMISSION_HELPDESK_TICKET_DUPLICATE = "PERM_HELPDESK_TICKET_DUPLICATE";
		public final static String PERMISSION_HELPDESK_TICKET_RECEIVE = "PERM_HELPDESK_TICKET_RECEIVE";
		public final static String PERMISSION_HELPDESK_TICKET = "PERM_HELPDESK_TICKET";

		public final static String HELPDESK_TICKET_PERMISSIONS = "helpdeskTicketPermissions";
		
		// Financial Module Constants
		public final static String GET_DETAILS = "getDetails";
		public final static String ADD_DETAILS = "addDetails";
		
		// System is a User for schedulers, hence his User id will be 0
		public final static long SYSTEM_USER_ID = 0;
		
		
		// Max records to process in a scheduler per iteration
		public final static int MAX_RECORD_SIZE = 50;
		
		// Max records to commit per transaction in scheduler
		public final static int MAX_COMMIT_SIZE = 10;

		// Error threshold in scheduler
		public final static int THRESHOLD_COUNT = 5;

		public static final String DEFAULT_DROP_DOWN_VALUE = "-1";
		
		public static final String PROJECT_DETAILS_PAGE_SIZE = "projDetailPageSize";
		
		/**
		 * <b>Data transfer constants</b>
		 */
		
		/**
		 * Latitude - at south pole
		 */
		public static final int LATITUDE_MIN_ALLOWED_DEGREES = -90;
		
		/**
		 * Latitude - at north pole
		 */
		public static final int LATITUDE_MAX_ALLOWED_DEGREES = 90;
		
		/**
		 * Longitude - min allowed degrees
		 */
		public static final int LONGITUDE_MIN_ALLOWED_DEGREES = -180;
		
		/**
		 * Longitude - max allowed degrees
		 */
		public static final int LONGITUDE_MAX_ALLOWED_DEGREES = 180;
		
		/**
		 * Precision and scale values of latitude and longitude
		 */
		public static final int LATITUDE_PRECISION = 8;
		public static final int LATITUDE_SCALE = 6;
		public static final int LONGITUDE_PRECISION = 9;
		public static final int LONGITUDE_SCALE = 6;
		
		public static final String CHAR_PERCENTAGE = "%" ;
		
		public static final String STUDENT_PHOTO_PATH = "/photos/" ;
		
		public static final int ALL_CLASS_SECTIONS = -999 ;
		
		public static final String COM_1 = "COM1" ;
		public static final String COM_2 = "COM2" ;
		public static final String COM_3 = "COM3" ;
		public static final String COM_4 = "COM4" ;
		public static final String LPT_1 = "LPT1" ;
		public static final String LPT_2 = "LPT2" ;
		public static final String PORT_NAME = "smsPortName";
		public static final String PERIODS = "Period ";
		public static final String NATIONALITY_INDIAN = "INDIAN";
		public static final String STATUS_NO_FLAG = "N";
		public static final String STATUS_YES_FLAG = "Y";
		public static final String CUBEPRO_VALID_TILL_DATE = "01/02/2014";// dd/mm/yyyy
	}
 
