package com.cubepro.components.enums;

import java.util.Arrays;
import java.util.Collection;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

public enum LocaleEnum {
	
	ENGLISH ("en", "locale.english"),
	HINDI ("hi", "locale.hindi");
	
	public static final Collection<LocaleEnum> ALL_LOCALES = Arrays.asList(ENGLISH, HINDI);
	
	private static final Map<String, LocaleEnum> VALUES_BY_CODE_LOOKUP;

	static {
		VALUES_BY_CODE_LOOKUP = new HashMap<String, LocaleEnum>();
		for (LocaleEnum locale : EnumSet.allOf(LocaleEnum.class)) {
			if (VALUES_BY_CODE_LOOKUP.get(locale.getCode()) != null) {
				throw new IllegalStateException("Duplicate code:" + locale.getCode());
			}
			VALUES_BY_CODE_LOOKUP.put(locale.getCode(), locale);
		}
	}

	/* The code for the locale */
	String localeCode;
	/* Name of the locale */
	String localeName;
	
	private LocaleEnum(String localeCode, String localeName) {
		this.localeCode = localeCode;
		this.localeName = localeName;
	}

	/* (non-Javadoc)
	 * @see com.cubepro.components.CodeAndNameEnum#getName()
	 */
	public String getName() {
		return localeName;
	}

	/* (non-Javadoc)
	 * @see com.cubepro.components.CodeEnum#getCode()
	 */
	public String getCode() {
		return localeCode;
	}
	
	/**
	 * Method to get the locale name from given code
	 * 
	 * @param code
	 * @return CodeEnum
	 */
	public static LocaleEnum getValue(String code) {
		
		LocaleEnum codeEnum = VALUES_BY_CODE_LOOKUP.get(code);
		if (codeEnum == null) {
			throw new IllegalStateException("Invalid Code: " + code);
		}
		return codeEnum;
	}
}