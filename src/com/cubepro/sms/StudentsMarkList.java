/*******************************************************************************
 * COPYRIGHT, 2009, Cubicle Technologies
 * *******************************************************************************
 * 
 * CONFIDENTIAL - Cubicle Technologies , Inc. (www.cubicletech.com)
 * 
 * This is an unpublished work, which is a trade secret, created in 2009.
 * Cubicle Technologies owns all rights to this work and intends to maintain it
 * in confidence to preserve its trade secret status. Cubicle Technologies
 * reserves the right to protect this work as an unpublished copyrighted work in
 * the event of an inadvertent or deliberate unauthorized publication. Cubicle
 * Technologies also reserves its rights under the copyright laws to protect
 * this work as a published work. Those having access to this work may not copy
 * it, use it, or disclose the information contained in it without the written
 * authorization of Cubicle Technologies.
 * 
 * *******************************************************************************
 * NAME:  StudentsMarkList.java
 * LOCATION: Cubicle Technologies
 * BUSINESS OWNERS:
 * PRIMARY PROJECT CONTACT: 
 * DEVELOPED BY: CubePro J2EE Team
 * 
 * DESCRIPTION:
 * NOTES:
 * DEPENDENCIES: 
 */
package com.cubepro.sms;

import com.cubepro.mark.MarkDetails;
import com.cubepro.student.StudentDetails;

public class StudentsMarkList {
private StudentDetails studentDetails;
private MarkDetails markDetails;
/**
 * @return Returns the markDetails.
 */
public MarkDetails getMarkDetails() {
	return markDetails;
}
/**
 * @param markDetails The markDetails to set.
 */
public void setMarkDetails(MarkDetails markDetails) {
	this.markDetails = markDetails;
}
/**
 * @return Returns the studentDetails.
 */
public StudentDetails getStudentDetails() {
	return studentDetails;
}
/**
 * @param studentDetails The studentDetails to set.
 */
public void setStudentDetails(StudentDetails studentDetails) {
	this.studentDetails = studentDetails;
}
}
