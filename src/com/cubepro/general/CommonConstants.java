package com.cubepro.general;

public class CommonConstants {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3448437888581795504L;

	private CommonConstants() {
	}

	public static final String REGEX_FOR_COURSE_SPLIT = "~";

	public static final String DEFAULT_TEMPLATE_MESSAGE_FOR_ABSENT_SMS = "Dear Parent,\n This is to inform that your @child is absent on @absentDate \n @Regards";

	public static final String DEFAULT_TEMPLATE_MESSAGE_FOR_MARKLIST_SMS = "Dear @Parent. Below are the mark obtained by your @child.\n Exam: @ExamName \n @Rank \n @Subjects\n @Regards ";

	public static final String DEFAULT_TEMPLATE_MESSAGE_FOR_GENERAL_SMS = "";

	public static final String IMAGE_MODEM_NOT_TESTED = "/CubePro/images/ao_b_close.gif";

	public static final String IMAGE_MODEM_STATUS_OK = "/CubePro/images/tick.gif";

	public static final String IMAGE_MODEM_STATUS_ERROR = "/CubePro/images/ao_b_close.gif";

	public static final String MODEM_STATUS_NEED_TO_BE_TESTED = "Test Modem";

	public static final String MODEM_STATUS_OK = "Modem OK";

	public static final String MODEM_STATUS_ERROR = "Modem Error.";

	public static final int INITIAL_PAGE_INDEX = 1;

	public static final String RPT_TYPE_TEXTBOX = "text";

	public static final String RPT_TYPE_DATEBOX = "date";

	public static final String RPT_TYPE_RADIOBUTTON = "radio";

	public static final String RPT_TYPE_CHECKBOX = "checkbox";

	public static final String RPT_TYPE_BUTTON = "button";

	public static final String RPT_TYPE_COMBOBOX = "combo";
	
	public static final int MAX_DAY_VALUE = 6;

	public static final int MAX_PERIOD_VALUE = 8;

}
