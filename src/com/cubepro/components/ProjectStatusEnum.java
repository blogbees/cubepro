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
 * @author pradeep.nagarajan
 * This enum holds the status of the project 
 *
 */
public enum ProjectStatusEnum implements CodeAndNameEnum, java.io.Serializable{
	NEW(1,"projectStatus.new"),
	INITIAL_APPROVAL_IN_PROGRESS(2,"projectStatus.initialApprovalInProgress"),
	INITIALLY_APPROVED(3, "projectStatus.initiallyApproved"),
	SENT_FOR_RECONSIDERATION(4, "projectStatus.sentForReconsideration"),
	TECHNICAL_APPROVAL_IN_PROGRESS(5,"projectStatus.technicalApprovalIn-Progress"),	
	TECHNICALLY_APPROVED(6, "projectStatus.technicallyApproved"),
	ADMINISTRATIVE_APPROVAL_IN_PROGRESS(7, "projectStatus.administrativeApprovalInProgress"),
	ADMINISTRATIVELY_APPROVED(8, "projectStatus.administrativelyApproved"),
	IN_PROGESS(9, "projectStatus.inProgress"),
	COMPLETED(10, "projectStatus.Completed"),
	CLOSED(11, "projectStatus.Closed");
	

	public static final Collection<ProjectStatusEnum> ALL_ENTITY_TYPES = Arrays.asList(
			NEW, INITIAL_APPROVAL_IN_PROGRESS, INITIALLY_APPROVED, SENT_FOR_RECONSIDERATION, TECHNICAL_APPROVAL_IN_PROGRESS, TECHNICALLY_APPROVED, 
			ADMINISTRATIVE_APPROVAL_IN_PROGRESS, ADMINISTRATIVELY_APPROVED, IN_PROGESS, COMPLETED, CLOSED);
	
	/**
	 * Status of the projects that can be exported 
	 */
	public static final Collection<ProjectStatusEnum> EXPORT_PROJECT_STATUS = Arrays.asList(IN_PROGESS);
			
	private static final Map<Integer, ProjectStatusEnum> VALUES_BY_CODE_LOOKUP;

	static {
		VALUES_BY_CODE_LOOKUP = new HashMap<Integer, ProjectStatusEnum>();
		for (ProjectStatusEnum projectStatusEnum : EnumSet.allOf(ProjectStatusEnum.class)) {
			if (VALUES_BY_CODE_LOOKUP.get(projectStatusEnum.getCode()) != null) {
				throw new IllegalStateException("Duplicate code:" + projectStatusEnum.getCode());
			}
			VALUES_BY_CODE_LOOKUP.put(projectStatusEnum.getCode(), projectStatusEnum);
		}
	}
	
	private int code;
	private String name;
	
	private ProjectStatusEnum(int code,String name) {
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
	public static ProjectStatusEnum getValue(int code) {
		ProjectStatusEnum projectStatusEnum = VALUES_BY_CODE_LOOKUP.get(code);
		if (projectStatusEnum == null) {
			throw new IllegalStateException("Invalid Code: " + code);
		}
		return projectStatusEnum;
	}
	
	public static Set<Integer> getKeySet(){
		return VALUES_BY_CODE_LOOKUP.keySet();
	}
}
