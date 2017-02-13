package com.cubepro.components.displaytable;

import com.cubepro.components.CodeAndNameEnum;

import java.util.Arrays;
import java.util.Collection;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

public enum PageSizeEnum implements CodeAndNameEnum {
	
	TEN(10, "10"),
	TWENTY(20, "20"),
	THIRTY(30, "30"),
	FORTY(40, "40"),
	SIXTY(60, "60");
	
public static final Collection<PageSizeEnum> ALL_PAGESIZE = Arrays.asList(TEN, TWENTY, THIRTY, FORTY, SIXTY);
	
	private static final Map<Integer, PageSizeEnum> VALUES_BY_CODE_LOOKUP;

	static {
		VALUES_BY_CODE_LOOKUP = new HashMap<Integer, PageSizeEnum>();
		for (PageSizeEnum pagesize : EnumSet.allOf(PageSizeEnum.class)) {
			if (VALUES_BY_CODE_LOOKUP.get(pagesize.getCode()) != null) {
				throw new IllegalStateException("Duplicate code:" + pagesize.getCode());
			}
			VALUES_BY_CODE_LOOKUP.put(pagesize.getCode(), pagesize);
		}
	}

	// page size code and name
	int code;
	String name;
	
	private PageSizeEnum(int code, String name) {
		this.code = code;
		this.name = name;
	}

	/* (non-Javadoc)
	 * @see com.cubepro.components.CodeAndNameEnum#getName()
	 */
	public String getName() {
		return name;
	}

	/* (non-Javadoc)
	 * @see com.cubepro.components.CodeEnum#getCode()
	 */
	public int getCode() {
		return code;
	}
	
	/**
	 * Method to get the gender name from given code
	 * 
	 * @param code
	 * @return CodeEnum
	 */
	public static PageSizeEnum getValue(int code) {
		
		PageSizeEnum codeEnum = VALUES_BY_CODE_LOOKUP.get(code);
		if (codeEnum == null) {
			throw new IllegalStateException("Invalid Code: " + code);
		}
		return codeEnum;
	}
}

