
/**
 * 
 */
package com.cubepro.components;

import java.util.Arrays;
import java.util.Collection;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * This enum holds the status of the project 
 *
 */
public enum WorkProjectionEnum implements CodeAndNameEnum, java.io.Serializable{
	
	
	
	DRAFT(1,"projectStatus.new"),
	SAVED(2,"projectStatus.initialApprovalInProgress"),
	ATTACHMENT_ADDED(3, ""),
	ATTACHMENT_REMOVED(4,"");
	

	public static final Collection<WorkProjectionEnum> ALL_ENTITY_TYPES = Arrays.asList(
			DRAFT, SAVED);
	
	
			
	private static final Map<Integer, WorkProjectionEnum> VALUES_BY_CODE_LOOKUP;

	static {
		VALUES_BY_CODE_LOOKUP = new HashMap<Integer, WorkProjectionEnum>();
		for (ProjectStatusEnum projectStatusEnum : EnumSet.allOf(ProjectStatusEnum.class)) {
			if (VALUES_BY_CODE_LOOKUP.get(projectStatusEnum.getCode()) != null) {
				throw new IllegalStateException("Duplicate code:" + projectStatusEnum.getCode());
			}
			WorkProjectionEnum workProjectionEnum = null;
			VALUES_BY_CODE_LOOKUP.put(workProjectionEnum.getCode(), workProjectionEnum);
		}
	}
	
	private int code;
	private String name;
	
	private WorkProjectionEnum(int code,String name) {
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
	 * Method to get the EntityType from given code
	 * 
	 * @param code
	 * @return CodeEnum
	 */
	public static WorkProjectionEnum getValue(int code) {
		WorkProjectionEnum workProjectionEnum = VALUES_BY_CODE_LOOKUP.get(code);
		if (workProjectionEnum == null) {
			throw new IllegalStateException("Invalid Code: " + code);
		}
		return workProjectionEnum;
	}
	
	public static Set<Integer> getKeySet(){
		return VALUES_BY_CODE_LOOKUP.keySet();
	}
}

