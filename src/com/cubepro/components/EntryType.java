/**
 * 
 */
package com.cubepro.components;

import java.util.Arrays;
import java.util.Collection;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

/**
 * @author ratnavel.sundaramurt
 *
 */
public enum EntryType implements CodeAndNameEnum  {
	ESTIMATION(1,"Estimation"),
	MEASUREMENT(2,"Measurement");

public static final Collection<EntryType> ALL_ENTRY_TYPES = Arrays.asList(ESTIMATION, MEASUREMENT);
	
	private static final Map<Integer, EntryType> VALUES_BY_CODE_LOOKUP;

	static {
		VALUES_BY_CODE_LOOKUP = new HashMap<Integer, EntryType>();
		for (EntryType entryType : EnumSet.allOf(EntryType.class)) {
			if (VALUES_BY_CODE_LOOKUP.get(entryType.getCode()) != null) {
				throw new IllegalStateException("Duplicate code:" + entryType.getCode());
			}
			VALUES_BY_CODE_LOOKUP.put(entryType.getCode(), entryType);
		}
	}

	/**	The code for entry type */
	private int code;
	/**	The name for entry type */
	private String name;

	// Prevent from outside access
	private EntryType(int code, String name) {
		this.code = code;
		this.name = name;
	}

	/* (non-Javadoc)
	 * @see com.cubepro.components.CodeEnum#getCode()
	 */
	public int getCode() {
		return code;
	}

	/* (non-Javadoc)
	 * @see com.cubepro.components.CodeAndNameEnum#getName()
	 */
	public String getName() {
		return name;
	}

	/**
	 * Method to get the EntryType from given code
	 * 
	 * @param code
	 * @return CodeEnum
	 */
	public static EntryType getValue(int code) {
		EntryType codeEnum = VALUES_BY_CODE_LOOKUP.get(code);
		if (codeEnum == null) {
			throw new IllegalStateException("Invalid Code: " + code);
		}
		return codeEnum;
	}

}
