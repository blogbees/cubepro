package com.cubepro.components;

import java.util.Arrays;
import java.util.Collection;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;


public enum LastIndexEnum implements CodeAndNameEnum {
	
	BENEFICIARY (1, "Beneficiary"),
	PROJECT (2, "Project");
	
	public static final Collection<LastIndexEnum> ALL_INDEXES = Arrays.asList(BENEFICIARY, PROJECT);
	
	private static final Map<Integer, LastIndexEnum> VALUES_BY_CODE_LOOKUP;

	static {
		VALUES_BY_CODE_LOOKUP = new HashMap<Integer, LastIndexEnum>();
		for (LastIndexEnum lastIndex : EnumSet.allOf(LastIndexEnum.class)) {
			if (VALUES_BY_CODE_LOOKUP.get(lastIndex.getCode()) != null) {
				throw new IllegalStateException("Duplicate code:" + lastIndex.getCode());
			}
			VALUES_BY_CODE_LOOKUP.put(lastIndex.getCode(), lastIndex);
		}
	}

	/* The code for the last index type */
	int indexTypeCode;
	/* Name of the last index type */
	String indexTypeName;
	
	private LastIndexEnum(int indexTypeCode, String indexTypeName) {
		this.indexTypeCode = indexTypeCode;
		this.indexTypeName = indexTypeName;
	}

	/* (non-Javadoc)
	 * @see com.cubepro.components.CodeAndNameEnum#getName()
	 */
	public String getName() {
		return indexTypeName;
	}

	/* (non-Javadoc)
	 * @see com.cubepro.components.CodeEnum#getCode()
	 */
	public int getCode() {
		return indexTypeCode;
	}
	
	/**
	 * Method to get the Last index type name from given code
	 * 
	 * @param code
	 * @return CodeEnum
	 */
	public static LastIndexEnum getValue(int code) {
		
		LastIndexEnum codeEnum = VALUES_BY_CODE_LOOKUP.get(code);
		if (codeEnum == null) {
			throw new IllegalStateException("Invalid Code: " + code);
		}
		return codeEnum;
	}
}