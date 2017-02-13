package com.cubepro.components;

import java.util.Arrays;
import java.util.Collection;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

/**
 * Type of an entity. This could be a Project, Payroll etc.,
 * 
 * @author sajeev.sreekantan
 */
public enum EntityType implements CodeAndNameEnum {
	
	PROJECT(1, "workflow.entityType.project"), // Represents Project Entity 
	PAYROLL(2, "workflow.entityType.payroll"), // Represents Payroll Entity
	MEASUREMENT(3, "workflow.entityType.measurement"),
	FINANCE(4, "workflow.entityType.finance"),
	GRIEVANCE(5, "workflow.entityType.grievance"),
	ESTIMATION(6, "workflow.entityType.estimation"), //Represents Grievance Entity
	WORK_ORDER(7, "workflow.entityType.workOrder"),//Represents Work Order Entity 
	DOCUMENT_MANAGEMENT(8, "entityType.documentManagement"),// Represents document management
	HELPDESK(9, "workflow.entityType.helpdesk"),
	LABOUR_BUDGET(10,"entityType.labourBudget"),
	ATTRIBUTE_VALUE(11, ""); //TODO: update the property key
	
	public static final Collection<EntityType> ALL_ENTITY_TYPES = Arrays.asList(PROJECT, PAYROLL, MEASUREMENT, GRIEVANCE,HELPDESK);
	
	private static final Map<Integer, EntityType> VALUES_BY_CODE_LOOKUP;

	static {
		VALUES_BY_CODE_LOOKUP = new HashMap<Integer, EntityType>();
		for (EntityType entityType : EnumSet.allOf(EntityType.class)) {
			if (VALUES_BY_CODE_LOOKUP.get(entityType.getCode()) != null) {
				throw new IllegalStateException("Duplicate code:" + entityType.getCode());
			}
			VALUES_BY_CODE_LOOKUP.put(entityType.getCode(), entityType);
		}
	}

	/**	The code for entity */
	private int code;
	/**	The name for entity */
	private String name;

	// Prevent from outside access
	private EntityType(int code, String name) {
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
	 * Method to get the EntityType from given code
	 * 
	 * @param code
	 * @return CodeEnum
	 */
	public static EntityType getValue(int code) {
		EntityType codeEnum = VALUES_BY_CODE_LOOKUP.get(code);
		if (codeEnum == null) {
			throw new IllegalStateException("Invalid Code: " + code);
		}
		return codeEnum;
	}
}