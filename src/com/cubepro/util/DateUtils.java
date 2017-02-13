package com.cubepro.util;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.validator.GenericTypeValidator;

import com.cubepro.components.CubeProConstants;
import com.cubepro.general.ApplicationProperties;
import com.cubepro.general.components.Log;

/**
 * @author sajeev.sreekantan
 * 
 */
public final class DateUtils {

	/**
	 * Delimiter between the years
	 */
	public final static String FY_DELIMITER = "-";

	public static final String DATE_TIME_FORMAT = "dd/MM/yyyy HH:mm:ss";

	public static final String APPLICATION_START_YEAR = "application.start.year";

	public static final DateFormat DATE_FORMAT = new SimpleDateFormat(
			CubeProConstants.DATE_FORMAT);

	// Should not initialize!
	private DateUtils() throws IllegalAccessException {
		throw new IllegalAccessException(
				"Utility class should not be initialized!");
	}

	/**
	 * Method to generate Date Object from a String representation of date
	 * 
	 * @return java.sql.Date
	 * 
	 */
	public static Date getDateForDB(String date) {
		java.util.Date utilDateObj = getDate(date);
		if (utilDateObj != null) {
			Date sqlDateObj = new java.sql.Date(utilDateObj.getTime());
			return sqlDateObj;
		}
		return null;
	}

	/**
	 * Method to generate String representation of date from a Date object
	 * 
	 * @return String
	 */
	public static String getDBDateString(Date sqlDateObj) {
		if (sqlDateObj == null) {
			return null;
		}
		// Convert sql date into util date
		java.util.Date utilDate = new java.util.Date(sqlDateObj.getTime());
		return getDateAsString(utilDate);
	}

	/**
	 * Method to generate util.Date object
	 * 
	 * @param date
	 * @return util.Date object
	 */
	public static java.util.Date getDate(String date) {
		if (StringUtils.isEmpty(date)) {
			return null;
		}
		try {
			return DATE_FORMAT.parse(date);
		} catch (ParseException e) {
			return null;
		}
	}

	/**
	 * @param utilDate
	 * @return String representation of date
	 */
	public static String getDateAsString(java.util.Date utilDate) {
		if (utilDate == null) {
			return null;
		}
		return DATE_FORMAT.format(utilDate);
	}

	/**
	 * Method to return the next financial year
	 * 
	 * @return String
	 */
	public static String getNextFinancialYear() {
		// To append the next year and next to next year
		// Get current financial year and add 1 to both for eg:
		// current financial year is: 2009-2010 then
		// next financial year is: 2010-2011
		int currentYear = Calendar.getInstance().get(Calendar.YEAR);
		return generateFYString(currentYear + 1, currentYear + 2);
	}

	/**
	 * Method to return the previous financial year
	 * 
	 * @return String
	 */
	public static String getPreviousFinancialYear() {
		// Get current financial year and subtract 1 to both for eg:
		// current financial year is: 2009-2010 then
		// previous financial year is: 2008-2009
		int currentYear = Calendar.getInstance().get(Calendar.YEAR);
		return generateFYString(currentYear - 1, currentYear);
	}

	/**
	 * Method to generate current Financial year
	 * 
	 * @return String
	 */
	public static String getCurrentFinancialYear() {

		// To append the current year and next year
		// To get the current year
		int currentYear = Calendar.getInstance().get(Calendar.YEAR);
		// To get the current month
		int currentMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
		// To check whether current month is before march or not
		// if yes, then append previous month - current month
		// else current year and next year
		if (currentMonth <= 3) {
			return generateFYString(currentYear - 1, currentYear);
		} else {
			return generateFYString(currentYear, currentYear + 1);
		}
	}

	/**
	 * Method to generate current Financial year
	 * 
	 * @return String
	 */
	public static ArrayList<String> getFinancialYear(int yearNo) {

		ArrayList<String> financialYear = new ArrayList<String>();

		// To append the current year and next year
		StringBuffer currentFYBuffer;
		// To get the current year
		int currentYear = Calendar.getInstance().get(Calendar.YEAR);
		// To get the current month
		int currentMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
		// To check whether current month is before march or not
		// if yes, then append previous month - current month
		// else current year and next year

		for (int financilaYearIndex = 0; financilaYearIndex <= yearNo; financilaYearIndex++) {
			currentFYBuffer = new StringBuffer();
			if (currentMonth <= 3) {
				currentFYBuffer = currentFYBuffer.append(currentYear - 1);
				currentFYBuffer = currentFYBuffer.append(FY_DELIMITER);
				currentFYBuffer = currentFYBuffer.append(currentYear);
			} else {
				currentFYBuffer = currentFYBuffer.append(currentYear);
				currentFYBuffer = currentFYBuffer.append(FY_DELIMITER);
				currentFYBuffer = currentFYBuffer.append(currentYear + 1);
			}
			financialYear.add(currentFYBuffer.toString());
			currentYear--;
		}

		return financialYear;
	}

	public static void main(String[] args) {
		System.out.println(DateUtils.getFinancialYear(0));
	}

	/**
	 * Method to return start date of current financial year
	 * 
	 * @return
	 */
	/*
	 * public static java.util.Date getFYStartDate() {
	 *  // Get current financial year String currentFY =
	 * getCurrentFinancialYear(); // Split current financial year by '-'
	 * String[] financialYears = StringUtils.split(currentFY, FY_DELIMITER);
	 * return getDate("01/04/" + financialYears[0]); }
	 */

	/**
	 * Method to return end date of current financial year
	 * 
	 * @return
	 */
	/*
	 * public static java.util.Date getFYEndDate() {
	 *  // Get current financial year String currentFY =
	 * getCurrentFinancialYear(); // Split current financial year by '-'
	 * String[] financialYears = StringUtils.split(currentFY, FY_DELIMITER);
	 * return DateUtils.getDate("31/03/" + financialYears[1]); }
	 */

	/**
	 * Method to get 'Date of birth' with date and month defaulted to 1st Jan
	 * for the given age
	 * 
	 * @param age
	 * @return
	 */
	public static String getDateOfBirth(int age) {
		Calendar dob = Calendar.getInstance();
		dob.add(Calendar.YEAR, -age);
		dob.set(Calendar.MONTH, Calendar.JANUARY);
		dob.set(Calendar.DATE, 1);
		return DATE_FORMAT.format(dob.getTime());
	}

	/**
	 * Method to get age based on the given DOB
	 * 
	 * @param dobInDate
	 * @return
	 */
	public static Integer getAgeOfDOB(String dobInString) {

		Integer age = null;

		try {
			Calendar dob = Calendar.getInstance();
			Calendar today = Calendar.getInstance();
			dob.setTime(DATE_FORMAT.parse(dobInString));

			String year = String.valueOf(dob.get(Calendar.YEAR));
			if (year.length() == 4) {

				int currentYear = today.get(Calendar.YEAR);
				int currentMonth = today.get(Calendar.MONTH);
				int dobYear = dob.get(Calendar.YEAR);
				int dobMonth = dob.get(Calendar.MONTH);

				if (currentYear > dobYear) {

					age = currentYear - dobYear - 1;
					if (currentMonth > dobMonth) {
						age++;
					} else if (currentMonth == dobMonth
							&& today.get(Calendar.DATE) >= dob
									.get(Calendar.DATE)) {
						age++;
					}
				} else if (currentYear == dobYear) {
					age = 0;
				}
			}
		} catch (ParseException parseException) {
			Log.error(DateUtils.class, "Invalid date - " + dobInString,
					parseException);
		}

		return age;
	}

	/**
	 * Calculates the number of days passed from reset date till now
	 * 
	 * @param fromDate
	 * @return
	 */
	public static long getElapsedDays(java.util.Date fromDate) {
		long startTime = fromDate.getTime();
		long endTime = System.currentTimeMillis();
		return getElapsedDays(startTime, endTime);
	}

	/**
	 * 
	 * @param fromTime
	 * @param toTime
	 * @return
	 */
	public static long getElapsedDays(long fromTime, long toTime) {
		long days = (toTime - fromTime) / (1000 * 60 * 60 * 24);
		return days;
	}

	/**
	 * Purpose: This method will convert a string object of specified format to
	 * a date object
	 * 
	 * @param stringDate,
	 *            inputFormat
	 * @return date
	 * @throws ParseException
	 */
	public static java.util.Date stringToDate(String stringDate,
			String inputFormat) throws ParseException, IllegalArgumentException {
		java.util.Date date = null;
		DateFormat formatter = null;
		// Process if stringDate has value, otherwise returns null
		if (stringDate != null && stringDate.length() > 0) {
			try {

				formatter = new SimpleDateFormat(inputFormat);
				formatter.setLenient(false);
				date = formatter.parse(stringDate);

			} catch (ParseException e) {
				Log.error(DateUtils.class, "Incorrect date format"
						+ e.getMessage(), e);
				throw e;
			} catch (IllegalArgumentException e) {
				Log.error(DateUtils.class, "Incorrect date format"
						+ e.getMessage(), e);
				throw e;
			}
		}
		return date;
	}

	/**
	 * Purpose: This method will convert a date object to a string object of
	 * specified format
	 * 
	 * @param date,
	 *            outputFormat
	 * @return outStringDate
	 */
	public static String dateToString(java.util.Date date, String outputFormat) {
		String outStringDate = null;
		DateFormat formatter = null;
		if (date != null) {
			formatter = new SimpleDateFormat(outputFormat);
			outStringDate = formatter.format(date);
		}
		return outStringDate;
	}

	/**
	 * Purpose: Converts the given date from the represented formated to
	 * required format
	 * 
	 * @param stringDate -
	 *            Input Date in String format
	 * @param inputFormat -
	 *            Format of input string Date
	 * @param outputFormat -
	 *            Required date format
	 * @return returns a date string of required format
	 * @throws ParseException
	 */
	public static String formatDateString(String stringDate,
			String inputFormat, String outputFormat) throws ParseException {
		java.util.Date date = null;
		String outStringDate = null;
		DateFormat formatter = null;
		// Process if stringDate has value, otherwise returns null
		if (stringDate != null && stringDate.length() > 0) {
			try {
				formatter = new SimpleDateFormat(inputFormat);
				date = formatter.parse(stringDate);
				formatter = new SimpleDateFormat(outputFormat);
				outStringDate = formatter.format(date);
			} catch (ParseException e) {
				Log.error(DateUtils.class, "Incorrect date format:"
						+ e.getMessage(), e);
				throw e;
			}
		}
		return outStringDate;
	}

	/**
	 * 
	 * @return current system date as dd/MM/yyyy format
	 * @throws Exception
	 */
	public static String getCurrentSysDate() {
		return DateUtils.dateToString(new java.util.Date(),
				CubeProConstants.DATE_FORMAT);
	}

	/**
	 * @return
	 */
	public static String getCurrentSysTime() {
		return DateUtils.dateToString(new java.util.Date(),
				CubeProConstants.DATE_TIME_FORMAT);
	}

	/**
	 * Method to get start dates of previous and current financial year
	 * 
	 * @return startDateList
	 */
	public static List<java.util.Date> getCurrentAndPrevFYStartDate() {
		List<java.util.Date> startDateList = new ArrayList<java.util.Date>(2);
		int currentYear = Calendar.getInstance().get(Calendar.YEAR);
		int prevYear = currentYear - 1;
		startDateList.add(getDate("01/04/" + prevYear));
		startDateList.add(getDate("01/04/" + currentYear));
		return startDateList;
	}

	/**
	 * Method to check whether the given date is before today or not
	 * 
	 * @param date
	 * @return true/false
	 */
	public static boolean isBeforeToday(java.util.Date date) {
		if (date == null) {
			return false;
		}
		java.util.Date today = getAbsoluteDate(null);
		return date.before(today);
	}

	/**
	 * Method to validate from date. The date less than or equal to today will
	 * be a valid from date.
	 * 
	 * @param date
	 * @return true/false
	 */
	public static boolean isValidFromDate(java.util.Date date) {
		if (date == null) {
			return false;
		}
		java.util.Date today = getAbsoluteDate(null);
		java.util.Date fromDate = getAbsoluteDate(date);
		return (fromDate.before(today) || fromDate.equals(today));
	}

	/**
	 * Method to validate to date. The date greater than or equal to today will
	 * be a valid to date.
	 * 
	 * @param date
	 * @return true/false
	 */
	public static boolean isValidToDate(java.util.Date date) {
		if (date == null) {
			return false;
		}
		java.util.Date today = getAbsoluteDate(null);
		java.util.Date toDate = getAbsoluteDate(date);
		return (toDate.after(today) || toDate.equals(today));
	}

	/**
	 * Method if the given date is valid
	 * 
	 * @param date
	 * @return boolean
	 */
	public static boolean isValidDateStr(String date) {
		try {
			if (date == null) {
				return true;
			}
			if (date.length() == 0) {
				return true;
			}
			if (date.length() != 10) {
				return false;
			}

			// Checking the date value
			int tempValue = Integer.parseInt(date.substring(0, 2));
			if (!(tempValue >= 1 && (tempValue <= 28 || tempValue <= 29
					|| tempValue <= 30 || tempValue <= 31))) {
				return false;
			}

			// Checking the month value
			tempValue = Integer.parseInt(date.substring(3, 5));
			if (!(tempValue >= 1 && tempValue <= 12)) {
				return false;
			}

			tempValue = Integer.parseInt(date.substring(6, 10));

			java.util.Date dateFormat = getDate(date);
			if (dateFormat == null) {
				return false;
			}
		} catch (IllegalArgumentException e) {
			return false;
		}
		return true;
	}

	/**
	 * Method to check whether the given date is valid or not
	 * 
	 * @param date
	 * @return
	 */
	public static boolean isValidDate(String date) {

		if (GenericTypeValidator.formatDate(date, CubeProConstants.DATE_FORMAT,
				true) == null) {
			return false;
		} else if (date != null && !date.matches("[0-9/]*")) {
			return false;
		}
		return true;
	}

	/**
	 * Method to validate From and To dates returns true if the combination of
	 * From and To date is valid
	 * 
	 * @param fromDate
	 * @param toDate
	 * @return
	 */
	public static boolean compareDates(String fromDate, String toDate) {
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();

		// getting from date
		if (!com.cubepro.util.StringUtils.isEmpty(fromDate)) {
			String fromDateArray[] = fromDate.split("/");
			c1.set(Integer.parseInt(fromDateArray[2]), Integer
					.parseInt(fromDateArray[1]) - 1, Integer
					.parseInt(fromDateArray[0]));
		}

		// getting to date
		if (!com.cubepro.util.StringUtils.isEmpty(toDate)) {
			String toDateArray[] = toDate.split("/");
			c2.set(Integer.parseInt(toDateArray[2]), Integer
					.parseInt(toDateArray[1]) - 1, Integer
					.parseInt(toDateArray[0]));
		}

		if ((c1.before(c2)) || (c1.equals(c2))) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * Method to return list of financial years (Current year + 5 consecutive
	 * years)
	 * 
	 * @return
	 */
	public static List<String> getListOfFinancialYears() {
		List<String> financialYearList = new ArrayList<String>();
		int currentYear = Calendar.getInstance().get(Calendar.YEAR);
		financialYearList.add(getCurrentFinancialYear());
		for (int i = 0; i < 5; i++) {
			financialYearList.add(generateFYString(currentYear + 1,
					currentYear + 2));
			currentYear += 1;
		}
		return financialYearList;
	}

	/**
	 * Method to return list of financial years (From the date configured in
	 * application.properties to the current year)
	 * 
	 * @return
	 */
	public static List<String> getAllYears() {
		int noOfFutureYears = 5;
		List<String> financialYearList = new ArrayList<String>();
		int startYear = Integer.parseInt(getApplicationStartYear());

		int currentYear = Calendar.getInstance().get(Calendar.YEAR);
		int diff = currentYear - startYear + noOfFutureYears + 1;

		for (int i = 0; i < diff; i++) {
			financialYearList.add(generateFYString(startYear, startYear + 1));
			startYear += 1;
		}
		return financialYearList;
	}

	/**
	 * Method to read the From date configured in application.properties
	 * 
	 * @return
	 */
	private static String getApplicationStartYear() {
		return ApplicationProperties.getProperty(APPLICATION_START_YEAR);
	}

	/**
	 * Method to generate the Financial year String from the given input
	 * Example: 2009-2010
	 * 
	 * @param fromYear
	 * @param toYear
	 * @return
	 */
	private static String generateFYString(int fromYear, int toYear) {
		StringBuffer stringBuffer = new StringBuffer(9);
		stringBuffer.append(fromYear);
		stringBuffer.append(FY_DELIMITER);
		stringBuffer.append(toYear);
		return stringBuffer.toString();
	}

	// Local method to calculate absolute date. The time will be set to zero
	// If no date supplied, it will give the current date.
	public static java.util.Date getAbsoluteDate(java.util.Date date) {
		Calendar calendar = Calendar.getInstance();
		if (date != null) {
			calendar.setTime(date);
		}
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		return calendar.getTime();
	}

	/**
	 * Current timestamp
	 * 
	 * @return current time
	 */
	public static Timestamp now() {
		return new Timestamp(System.currentTimeMillis());
	}

	public static java.util.Date appendCurrentTimeWithDate(
			java.util.Date dateField) {
		Calendar dateWithTime = null;
		if (dateField != null) {
			Calendar currentTime = Calendar.getInstance();
			currentTime.setTime(new java.util.Date());
			dateWithTime = Calendar.getInstance();
			dateWithTime.setTime(dateField);
			dateWithTime.set(Calendar.HOUR_OF_DAY, currentTime
					.get(Calendar.HOUR_OF_DAY));
			dateWithTime.set(Calendar.MINUTE, currentTime.get(Calendar.MINUTE));
			dateWithTime.set(Calendar.SECOND, currentTime.get(Calendar.SECOND));
		}
		return dateWithTime.getTime();
	}

	/**
	 * Method to get the financial start date for the given finanical year for
	 * example: input: 2008-2009 and output: Date instance of (01-04-2008
	 * 00:00:00)
	 * 
	 * @param financialYear
	 * @return
	 */
	public static java.util.Date getFinancialYearStartDate(String financialYear) {
		java.util.Date startDate = new java.util.Date();
		if (!com.cubepro.util.StringUtils.isEmpty(financialYear)) {
			String temp[] = StringUtils.split(financialYear, "-");
			if (!com.cubepro.util.StringUtils.isEmpty(temp[0])) {
				if (com.cubepro.util.StringUtils.isNumeric(temp[0])) {
					startDate = getDate("01/04/" + temp[0]);
				}
			}
		}
		return getAbsoluteDate(startDate);
	}

	/**
	 * Method to get the financial start date for the given finanical year for
	 * example: input: 2008-2009 and output: Date instance of (31-03-2009
	 * 00:00:00)
	 * 
	 * @param financialYear
	 * @return
	 */
	public static java.util.Date getFinancialYearEndDate(String financialYear) {
		java.util.Date endDate = new java.util.Date();
		if (!com.cubepro.util.StringUtils.isEmpty(financialYear)) {
			String temp[] = StringUtils.split(financialYear, "-");
			if (!com.cubepro.util.StringUtils.isEmpty(temp[1])) {
				if (com.cubepro.util.StringUtils.isNumeric(temp[1])) {
					endDate = getDate("31/03/" + temp[1]);
				}
			}
		}
		return getAbsoluteDate(endDate);
	}

	/**
	 * Method to get the financial start date for the given finanical year for
	 * example: input: 2008-2009 and output: 01-04-2008
	 * 
	 * @param financialYear
	 * @return
	 */
	public static String getFinancialYearStartDateAsString(String financialYear) {
		if (!com.cubepro.util.StringUtils.isEmpty(financialYear)) {
			String temp[] = StringUtils.split(financialYear, "-");
			if (!com.cubepro.util.StringUtils.isEmpty(temp[0])) {
				if (com.cubepro.util.StringUtils.isNumeric(temp[0])) {
					return "01/04/" + temp[0];
				}
			}
		}
		return null;
	}

	/**
	 * Method to get the financial start date for the given finanical year for
	 * example: input: 2008-2009 and output: 31-04-2009
	 * 
	 * @param financialYear
	 * @return
	 */
	public static String getFinancialYearEndDateAsString(String financialYear) {
		if (!com.cubepro.util.StringUtils.isEmpty(financialYear)) {
			String temp[] = StringUtils.split(financialYear, "-");
			if (!com.cubepro.util.StringUtils.isEmpty(temp[1])) {
				if (com.cubepro.util.StringUtils.isNumeric(temp[1])) {
					return "31/03/" + temp[1];
				}
			}
		}
		return null;
	}

	/**
	 * Method to get the financial start date for the Previous finanical year
	 * for example: input: 2008-2009 and output: 2007-03-01
	 * 
	 * @param financialYear
	 * @return
	 */
	public static String getPreviousFinancialYearStartDate(String financialYear) {
		if (!com.cubepro.util.StringUtils.isEmpty(financialYear)) {
			String temp[] = StringUtils.split(financialYear, "-");
			Long startDate = (Long.valueOf(temp[0]) - 1);

			if (!com.cubepro.util.StringUtils.isEmpty(startDate.toString())) {
				if (com.cubepro.util.StringUtils
						.isNumeric(startDate.toString())) {
					return startDate + "-04-01";
				}
			}
		}
		return null;
	}

	/**
	 * Method to get the financial End date for the Previous finanical year for
	 * example: input: 2008-2009 and output: 2008-03-01
	 * 
	 * @param financialYear
	 * @return
	 */
	public static java.util.Date getPreviousFinancialYearEndDate(
			String financialYear) {
		if (!com.cubepro.util.StringUtils.isEmpty(financialYear)) {
			String temp[] = StringUtils.split(financialYear, "-");
			Long endDate = (Long.valueOf(temp[1]) - 1);

			if (!com.cubepro.util.StringUtils.isEmpty(endDate.toString())) {
				if (com.cubepro.util.StringUtils.isNumeric(endDate.toString())) {
					return getDate("31/03/" + endDate);
				}
			}
		}
		return null;
	}

	/**
	 * Method to get the financial start date for the Next finanical year for
	 * example: input: 2008-2009 and output: 2009-03-01
	 * 
	 * @param financialYear
	 * @return
	 */
	public static String getNextFinancialYearStartDate(String financialYear) {
		if (!com.cubepro.util.StringUtils.isEmpty(financialYear)) {
			String temp[] = StringUtils.split(financialYear, "-");
			Long startDate = (Long.valueOf(temp[0]) + 1);

			if (!com.cubepro.util.StringUtils.isEmpty(startDate.toString())) {
				if (com.cubepro.util.StringUtils
						.isNumeric(startDate.toString())) {
					return startDate + "-04-01";
				}
			}
		}
		return null;
	}

	/**
	 * Method to get the financial End date for the Previous finanical year for
	 * example: input: 2008-2009 and output: 2010-03-01
	 * 
	 * @param financialYear
	 * @return
	 */
	public static String getNextFinancialYearEndDate(String financialYear) {
		if (!com.cubepro.util.StringUtils.isEmpty(financialYear)) {
			String temp[] = StringUtils.split(financialYear, "-");
			Long EndDate = (Long.valueOf(temp[1]) + 1);

			if (!com.cubepro.util.StringUtils.isEmpty(EndDate.toString())) {
				if (com.cubepro.util.StringUtils.isNumeric(EndDate.toString())) {
					return EndDate + "-04-01";
				}
			}
		}
		return null;
	}

	/**
	 * Method to get the previous financial year for the given financial year
	 * 
	 * @param financialYear
	 * @return
	 */
	public static String getPreviousFinancialYear(String financialYear) {

		String prevFinancialYear = "";
		if (!com.cubepro.util.StringUtils.isEmpty(financialYear)) {
			String temp[] = StringUtils.split(financialYear, "-");
			prevFinancialYear = String.valueOf(Integer.valueOf(temp[0]) - 1)
					+ "-" + temp[0];
		}
		return prevFinancialYear;
	}

	/**
	 * Method to get the next financial year for the given financial year
	 * 
	 * @param financialYear
	 * @return
	 */
	public static String getNextFinancialYear(String financialYear) {

		String nextFinancialYear = "";
		if (!com.cubepro.util.StringUtils.isEmpty(financialYear)) {
			String temp[] = StringUtils.split(financialYear, "-");
			nextFinancialYear = temp[1] + "-"
					+ String.valueOf(Integer.valueOf(temp[1]) + 1);
		}
		return nextFinancialYear;
	}

	/**
	 * Method to get the financial year's start year for example: if given is
	 * 2008-2009, it returns 2008
	 * 
	 * @param financialYear
	 * @return
	 */
	public static String getStartYearOfFinancialYear(String financialYear) {

		if (StringUtils.isEmpty(financialYear)) {
			return null;
		}
		String[] financialYearArray = StringUtils.split(financialYear, "-");
		return financialYearArray[0];
	}

	public static String getDateToWords(String inputDate) {
		char dateChars[] = inputDate.toCharArray();
		String wordString = "";
		if(dateChars[0] != '0'){
			wordString += " " +getNumberToWords(dateChars[0]);
		}
		wordString += " " +getNumberToWords(dateChars[1]);
		wordString += " -" ;
		if(dateChars[3] != '0'){
			wordString += " " +getNumberToWords(dateChars[3]);
		}
		wordString += " " +getNumberToWords(dateChars[4]);
		wordString += " -" ;
		wordString += " " +getNumberToWords(dateChars[6]);
		wordString += " " +getNumberToWords(dateChars[7]);
		wordString += " " +getNumberToWords(dateChars[8]);
		wordString += " " +getNumberToWords(dateChars[9]);
		return wordString;
	}

	public static String getNumberToWords(char number) {
		String numberString = "";
		if (number == '0') {
			numberString = "ZERO";
		} else if (number == '1') {
			numberString = "ONE";
		} else if (number == '2') {
			numberString = "TWO";
		} else if (number == '3') {
			numberString = "THREE";
		} else if (number == '4') {
			numberString = "FOUR";
		} else if (number == '5') {
			numberString = "FIVE";
		} else if (number == '6') {
			numberString = "SIX";
		} else if (number == '7') {
			numberString = "SEVEN";
		} else if (number == '8') {
			numberString = "EIGHT";
		} else if (number == '9') {
			numberString = "NINE";
		}
		return numberString;
	}
}
