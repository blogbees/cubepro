package com.cubepro.util;

import com.cubepro.general.components.Log;

/**
 * Utility class for string manipulations
 * 
 * @author sajeev.sreekantan
 */
public final class StringUtils {

	public static final String BLANK_STRING = "";
	
	public static final String ZERO_DOUBLE_STRING = "0.00";

	/**
	 * Regular expression for checking decimal values
	 */
	private static final String DECIMAL_WITHOUT_ZERO_REGEX = "^((\\d*\\.\\d{0,2})|([1-9]+[0-9]*))$";
	
	private static final String DECIMAL_WITH_ZERO_REGEX = "^((\\d*\\.\\d{0,2})|([0-9]*))$";
	
	private static final String DECIMAL_WITH_ZERO_VAR_SCALE_REGEX = "^((\\d*\\.\\d{0,#})|([0-9]*))$";
	
	private static final String DECIMAL_WITH_ZERO_NEGATIVE_REGEX = "^([-+]?((\\d*\\.\\d{0,#})|([0-9]*)))$";
	
	/**
	 * ASCII value of small letter 'a'
	 */
	private static final int ASCII_SMALL_A = 97;
	
	/**
	 * ASCII value of captial letter 'A' 
	 */
	private static final int ASCII_CAPITAL_A = 65;

	/**
	 * ASCII value of small letter 'z' 
	 */
	private static final int ASCII_SMALL_Z = 122;

	/**
	 * ASCII value of capital letter 'Z' 
	 */
	private static final int ASCII_CAPITAL_Z = 90;

	/**
	 * ASCII value of digit one 
	 */
	private static final int ASCII_DIGIT_ONE = 48;

	/**
	 * ASCII value of digit nine 
	 */
	private static final int ASCII_DIGIT_NINE = 57;

	/**
	 * Last character value in ascii range 
	 */
	private static final int ASCII_LAST_CHAR = 127;

	/**
	 * ASCII value of space 
	 */
	private static final int ASCII_SPACE = 32;

	/**
	 * Unicode value of first character in Hindi
	 */
	private static final int UNICODE_HINDI_FIRST_CHAR = 2305;

	/**
	 * Unicode value of last character in Hindi 
	 */
	private static final int UNICODE_HINDI_LAST_CHAR = 2416;
	
	/**
	 * Constant to hold a string literal 'Yes'
	 */
	private static final String YES = "Yes";
	
	/**
	 * Constant to hold a string literal 'No'
	 */
	private static final String NO = "No";
	
	// Should not initialize!
	private StringUtils() throws IllegalAccessException {
		throw new IllegalAccessException("Utility class should not be initialized!");
	}
	
	/**
	 * Calculates the number of occurrences of a character in a specified string
	 * 
	 * @param value
	 * @param chatToCount
	 * @return number of occurrences
	 */
	public static int count(String value, char charToCount) {
		if (isEmpty(value)) {
			return 0;
		}
		String pattern = "[^" + charToCount + "]";
		return value.replaceAll(pattern,"").length();
	}
	
	/**
	 * Check whether the given string is null or empty
	 * 
	 * @param value
	 * @return true/false
	 */
	public static boolean isEmpty(String value) {
		if (value == null) {
			return true;
		} else if (value.trim().length() == 0) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * Method to trim a given value with Null check
	 * 
	 * @param value
	 * @return trimmed value
	 */
	public static final String trim(String value) {
		if (value == null) {
			return null;
		}
		return value.trim();
	}

	
	/**
	 * Checks equality with considering null values
	 * 
	 * @param value1
	 * @param value2
	 * @return true/false
	 */
	public static boolean equals(String value1, String value2) {
		if (value1 == null) {
			return value1 == value2;
		} else {
			return value1.equals(value2);
		}
	}
	
	/**
	 * Function to Split a string based on the delimiter 
	 *  
	 * @param str
	 * @param delimiter
	 * @return String Array
	 */
	public static String[] delimitedListToStringArray(String str, String delimiter){
		return org.springframework.util.StringUtils.delimitedListToStringArray(str, delimiter); 
	}
	
	/**
	 * Method to check whether the given string contains numeric value alone
	 * 
	 * @param value
	 * @return 'true' if contains only numeric value <br/>
	 * 'false' if non numeric value is encountered
	 */
	public static boolean isNumeric(String value) {
		
		if(!isEmpty(value)) {
			return org.apache.commons.lang.StringUtils.isNumeric(value);
		}
		return false;
	}
	
	/**
	 * Method to check whether given number is a valid decimal number 
	 * returns true for the examples 4, .4, 0.4, 2.6, 2.62
	 * returns false for the examples 0, -1, -1.3, 2.657
	 *  
	 * @param value
	 * @return
	 */
	public static boolean isDecimalWithoutZero(String value) {
		
		if (!isEmpty(value)) {
			return value.matches(DECIMAL_WITHOUT_ZERO_REGEX);
		}
		return false;
	}
	
	/**
	 * Method to check whether given number is a valid decimal number 
	 * returns true for the examples 4, .4, 0.4, 2.6, 2.62, 0, 0.0
	 * returns false for the examples -1, -1.3, 2.657
	 *  
	 * @param value
	 * @return
	 */
	public static boolean isDecimalWithZero(String value) {
		
		if (!isEmpty(value)) {
			return value.matches(DECIMAL_WITH_ZERO_REGEX);
		}
		return false;
	}
	
	/**
	 * Method to check whether given number is a valid decimal number 
	 * returns true for the examples 4, .4, 0.4, 2.6, 2.62, 0, 0.0
	 * Scale is the number of digits to the right of the decimal point in a number. 
	 *  
	 * @param value
	 * @return
	 */
	public static boolean isDecimalWithZero(String value, int scaleLength, boolean negativeAllowed) {
		
		if (!isEmpty(value)) {
			
			String regexExpression = negativeAllowed? DECIMAL_WITH_ZERO_NEGATIVE_REGEX
					: DECIMAL_WITH_ZERO_VAR_SCALE_REGEX;
			return value.matches(regexExpression.replaceFirst("#", String.valueOf(scaleLength)));
		}
		return false;
	}
	
	/**
	 * Method to check whether the given value is a negative number or not
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isNegativeNumber(String value) {
		
		if(!isEmpty(value)) {
			String trimmedValue = value.trim();
			try {
				return Integer.parseInt(trimmedValue) < 0;
			} catch (NumberFormatException numberFormatException) {
				Log.error(StringUtils.class, "Number format exception for value - " + trimmedValue, numberFormatException);
				return false;
			}
		}
		return false;
	}
	
	/**
	 * Method to check whether the given argument contains only zero's or not 
	 * 
	 * @param value
	 * @return 'true' if argument value is zero 'false' otherwise 
	 */
	public static boolean isZero(String value) {
		
		if(!StringUtils.isEmpty(value)) {
			
			try {
				String trimmedValue = trim(value);
				if(org.apache.commons.lang.StringUtils.isNumeric(trimmedValue)) {
					if(Integer.valueOf(trimmedValue) == 0) {
						return true;
					}
				}
			} catch (NumberFormatException e) {
				Log.info(StringUtils.class, "Entered value is not zero - " + value);
			}
		}
		return false;
	}
	
	/**
	 * Method to check whether the given string is a numeric value and contains dot or not
	 * 
	 * @param number
	 * @return
	 */
	public static boolean containsDot(String number) {
		
		if(!StringUtils.isEmpty(number)) {
			int dotIndex = number.indexOf(".");
			if(dotIndex != -1) {
				if(org.apache.commons.lang.StringUtils.isNumeric( number.replaceAll("\\.", ""))) {
					return true;
				}
			}
		}
		return false; 
	}
	
	/**
	 * Check whether the given string contains only english alphabets or numbers from 0-9 or space
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isEnglishAlphaNumericSpace(String value) {
		
		boolean alphaNumeric = false;
		if(!isEmpty(value)) {
			
			for(int index = 0; index < value.length(); index++) { // Iterate through each character to find whether each character is a english alphabet or not
				
				 alphaNumeric = (value.charAt(index) >= ASCII_SMALL_A && value.charAt(index) <= ASCII_SMALL_Z) || (value.charAt(index) >= ASCII_CAPITAL_A && value.charAt(index) <= ASCII_CAPITAL_Z) || (value.charAt(index) >= ASCII_DIGIT_ONE && value.charAt(index) <= ASCII_DIGIT_NINE) || value.charAt(index) == ASCII_SPACE; 
				 if(alphaNumeric == false) {
					 return alphaNumeric;
				 }
			}
		}
		return alphaNumeric;
	}
	
	/**
	 * Check whether the given string contains only english alphabets or numbers from 0-9 or space
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isEnglishAlphaSpace(String value) {
		
		boolean alphaNumeric = false;
		if(!isEmpty(value)) {
			
			for(int index = 0; index < value.length(); index++) { // Iterate through each character to find whether each character is a english alphabet or not
				
				 alphaNumeric = (value.charAt(index) >= ASCII_SMALL_A && value.charAt(index) <= ASCII_SMALL_Z) || (value.charAt(index) >= ASCII_CAPITAL_A && value.charAt(index) <= ASCII_CAPITAL_Z) || value.charAt(index) == ASCII_SPACE; 
				 if(alphaNumeric == false) {
					 return alphaNumeric;
				 }
			}
		}
		return alphaNumeric;
	}
	
	/**
	 * Method to check whether the given string contains only ascii characters or not
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isAscii(String value) {
		
		boolean ascii = false;
		
		if(!isEmpty(value)) {
			for(int index = 0; index < value.length(); index++) {
				ascii = value.charAt(index) <= ASCII_LAST_CHAR;
				if(ascii == false) {
					return ascii;
				}
			}
		}
	return ascii; 
	}
	
	/**
	 * Method to check whether the given string contains only hindi characters or not
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isHindiAlphaSpace(String value) {
		
		boolean hindi = false;
		
		if(!isEmpty(value)) {
			char hindiCharacter;
			for(int index = 0; index < value.length(); index++) {
				hindiCharacter = value.charAt(index);
				// Unicode value from '\u0901' to '\u0970' is hindi characters
				hindi = hindiCharacter >= UNICODE_HINDI_FIRST_CHAR && hindiCharacter <= UNICODE_HINDI_LAST_CHAR || hindiCharacter == ASCII_SPACE;
				if(hindi == false) {
					return false;
				}
			}
		}
		return hindi;
	}
	
	/**
	 * Method to check whether the given string contains only hindi characters, numbers and space alone or not
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isHindiAlphaNumericSpace(String value) {
		
		boolean hindiAlphaNumericSpace = false;
		
		if(!isEmpty(value)) {
			char hindiCharacter;
			for(int index = 0; index < value.length(); index++) {
				hindiCharacter = value.charAt(index);
				// Unicode value from '\u0901' to '\u0970' is hindi characters
				hindiAlphaNumericSpace = isHindiLetter(hindiCharacter)|| isNumeric(hindiCharacter) || hindiCharacter == ASCII_SPACE;
				if(hindiAlphaNumericSpace == false) {
					return false;
				}
			}
		}
		return hindiAlphaNumericSpace;
	}
	
	/**
	 * Method to check whether the given text contains only hindi letters, numbers and special characters
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isHindiText(String value) {

		boolean hindiText = false;
		
		if(!isEmpty(value)) {
			char character;
			for(int index = 0; index < value.length(); index++) {
				character = value.charAt(index);
				// Unicode value from '\u0901' to '\u0970' is hindi characters
				hindiText = (character >= UNICODE_HINDI_FIRST_CHAR && character <= UNICODE_HINDI_LAST_CHAR) || isNumeric(character) || isSpecialCharacter(character);
				if(hindiText == false) {
					return false;
				}
			}
		}
		return hindiText;
	}
	
	/**
	 * Method to check whether the given character is a not a alphabet
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isSpecialCharacter(char value) {
		
		return isAscii(value)  && !isEnglishLetter(value);
	}
	
	/**
	 * Method to check whether the given character is a english letter or not
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isEnglishLetter(char value) {
		return (value >=  ASCII_SMALL_A && value <= ASCII_SMALL_Z) || (value >= ASCII_CAPITAL_A && value <= ASCII_CAPITAL_Z);
	}
	
	/**
	 * Method to check whether the given character is a Hindi character
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isHindiLetter(char value) {
		return (value >= UNICODE_HINDI_FIRST_CHAR && value <= UNICODE_HINDI_LAST_CHAR);
	}
	
	/**
	 * Method to check whether the given character is a digit or not
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isNumeric(char value) {
		return value >= ASCII_DIGIT_ONE && value <= ASCII_DIGIT_NINE;
	}
	
	/**
	 * Method to check whether the given character is a ascii character or not
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isAscii(char value) {
		return value <= ASCII_LAST_CHAR;
	}
	
	/**
	 * Method to get empty string(trimmed) if the given value is null
	 * 
	 * @param value
	 * @return String
	 */
	public static String nullToBlank(String value) {
		if (value == null) {
			return BLANK_STRING;
		}
		return value.trim();
	}
	
	public static String nullToZeroDouble(String value) {
		if (value == null || value == "" || value.trim().length() == 0) {
			return ZERO_DOUBLE_STRING;
		}
		return value.trim();
	}
	
	/**
	 * Method to check whether the given string contains number(0-9) or not.
	 * 
	 * @param value
	 * @return true if the string does not contain number or the string is empty. false, if the string contains number
	 */
	public static boolean isNonNumericString(String value) {
		
		char character;
		boolean number = false;
		if(!isEmpty(value)) {
			for(int index = 0; index < value.length(); index++) {
				character = value.charAt(index);
				number = isNumeric(character);
				if(number == true) {
					return !number;
				}
			}
			return !number;
		}
		else { 
			return true;
		}
	}
	
	/**
	 * Method to return 'Yes' if boolean true is passed, 'No' otherwise.
	 * 
	 * @param value
	 * @return
	 */
	public static String getBooleanText(boolean value) {
		return value==true? YES : NO;
	}
	
	/**
	 * Method to check whether the value is percentage
	 * Return true if value matches percentage else false
	 * 
	 * @param value
	 * @return
	 */
	public static boolean isPercentage(String value) {
		if (isDecimalWithoutZero(value)){
			Double doubleValue = Double.parseDouble(value);
			if(doubleValue >= 0 && doubleValue <= 100) {
				return true;
			}
			return false;
		}
		return false;
	}
	
}