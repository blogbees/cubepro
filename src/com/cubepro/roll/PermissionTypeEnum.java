package com.cubepro.roll;


import java.util.Arrays;
import java.util.Collection;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

/**
 * Enum to specify the operation on permission where the code is integer and value is key of operation name to support i18N
 *  
 * @author balaji.vankadari
 *
 */
public enum PermissionTypeEnum  {
	
	CREATE(1, "assign.permissions.create"),
	READ(2, "assign.permissions.read"),
	UPDATE(4, "assign.permissions.update"),
	DELETE(8, "assign.permissions.delete"),
	ALLOW(16, "assign.permissions.allow");
	
public static final Collection<PermissionTypeEnum> ALL_PERMISSIONS = Arrays.asList(CREATE, READ, UPDATE, DELETE, ALLOW);

public static final Collection<PermissionTypeEnum> CRUD_PERMISSIONS = Arrays.asList(CREATE, READ, UPDATE, DELETE);

public static final Collection<PermissionTypeEnum> CRU_PERMISSIONS = Arrays.asList(CREATE, READ, UPDATE);

	private static final Map<Integer, PermissionTypeEnum> VALUES_BY_CODE_LOOKUP;

	static {
		VALUES_BY_CODE_LOOKUP = new HashMap<Integer, PermissionTypeEnum>();
		for (PermissionTypeEnum permission : EnumSet.allOf(PermissionTypeEnum.class)) {
			if (VALUES_BY_CODE_LOOKUP.get(permission.getCode()) != null) {
				throw new IllegalStateException("Duplicate code:" + permission.getCode());
			}
			VALUES_BY_CODE_LOOKUP.put(permission.getCode(), permission);
		}
	}

	// permission code and name
	int code;
	String name;
	
	private PermissionTypeEnum(int code, String name) {
		this.code = code;
		this.name = name;
	}

	/* (non-Javadoc)
	 * @see gov.nrega.action.components.CodeAndNameEnum#getName()
	 */
	public String getName() {
		return name;
	}

	/* (non-Javadoc)
	 * @see gov.nrega.action.components.CodeEnum#getCode()
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
	public static PermissionTypeEnum getValue(int code) {
		
		PermissionTypeEnum codeEnum = VALUES_BY_CODE_LOOKUP.get(code);
		if (codeEnum == null) {
			throw new IllegalStateException("Invalid Code: " + code);
		}
		return codeEnum;
	}
}