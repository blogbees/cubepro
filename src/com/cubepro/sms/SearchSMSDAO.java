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
 * NAME: SearchSMSDAO.java LOCATION: Cubicle Technologies, BUSINESS OWNERS:
 * PRIMARY PROJECT CONTACT: DEVELOPED BY: CubePro J2EE Team
 * 
 * DESCRIPTION: NOTES: DEPENDENCIES: $Log:$
 */

package com.cubepro.sms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.cubepro.classes.ClassDetails;
import com.cubepro.mark.MarkDetails;
import com.cubepro.student.StudentDetails;
import com.cubepro.util.DatabaseConnector;

public class SearchSMSDAO {

	private static Logger log = Logger.getLogger(SearchSMSDAO.class);

	private static String SQL_GET_ABSENT_DETAILS = " select sd.student_id, sd.roll_no, sd.student_name, cd.class_id, cd.class_name, "
			+ " cd.section_name, sd.mobile from attendance_details ad "
			+ " inner join student_details sd oN ad.student_id = sd.student_id "
			+ " inner join class_details cd on cd.class_id = sd.class_id "
			+ " where attn_status = 'ABSENT' ";

	private static final String SQL_GET_MARKLIST_DETAILS = " select sd.student_id, sd.roll_no, sd.student_name, "
			+ " cd.class_id, cd.class_name, cd.section_name, sd.mobile, sid.subject_id, sid.subject_name, "
			+ " mark, sid.max_marks, md.mark_id from mark_details md inner join student_details sd on md.student_id = sd.student_id "
			+ " inner join cws_details cws on cws.class_id = sd.class_id and cws.subject_id = md.subject_id "
			+ " inner join class_details cd on cd.class_id = sd.class_id inner join subject_details sid on sid.subject_id = md.subject_id "
			+ " where cd.class_id = ? and term_id = ? order by sd.student_id, cws.cws_order asc ";

	public List getAbsentDetails(SearchSMSDetails smsDetails) throws Exception {
		ArrayList studentList = new ArrayList();
		StringBuffer sqlQueryForSearch = new StringBuffer(
				SQL_GET_ABSENT_DETAILS);
		try {
			DatabaseConnector dbConnector = new DatabaseConnector();
			Connection connection = dbConnector.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rst = null;

			try {

				if (smsDetails.getClassId() > 0) {
					sqlQueryForSearch.append(" and cd.class_id = ? ");
				}
				if (smsDetails.getSectionName() != null
						&& smsDetails.getSectionName().length() > 0) {
					sqlQueryForSearch.append(" and cd.section_name = ? ");
				}
				pstmt = connection.prepareStatement(sqlQueryForSearch
						.toString());

				if (smsDetails.getClassId() > 0) {
					pstmt.setInt(1, smsDetails.getClassId());
				}
				if (smsDetails.getSectionName() != null
						&& smsDetails.getSectionName().length() > 0) {
					pstmt.setString(2, smsDetails.getSectionName());
				}
				// logging
				log.debug(" SQL Query - " + sqlQueryForSearch.toString()
						+ " classid -" + smsDetails.getClassId()
						+ " sectionname -" + smsDetails.getSectionName());

				rst = pstmt.executeQuery();

				while (rst.next()) {
					log.debug("Result found");
					StudentDetails studentDetails = new StudentDetails();
					studentDetails.setStudentId(rst.getInt(1));
					studentDetails.setRollNo(rst.getString(2));
					studentDetails.setStudentName(rst.getString(3));
					ClassDetails classDetails = new ClassDetails();
					classDetails.setClassId(rst.getInt(4));
					classDetails.setClassName(rst.getString(5));
					classDetails.setSectionName(rst.getString(6));
					studentDetails.setClassDetails(classDetails);
//					studentDetails.setMobileNo(rst.getLong(7));
					studentList.add(studentDetails);
				}
			} catch (final SQLException e) {
				throw e;
			} finally {
				// close the dbconnection finally
				dbConnector.closeConnection(rst, pstmt, connection);
			}
		} catch (final SQLException e) {
			throw e;
		}
		return studentList;
	}

	public List getMarkListDetails(SearchSMSDetails smsDetails)
			throws Exception {
		ArrayList markList = new ArrayList();
		try {
			DatabaseConnector dbConnector = new DatabaseConnector();
			Connection connection = dbConnector.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rst = null;
			int prevStudentId = -1;
			try {

				pstmt = connection.prepareStatement(SQL_GET_MARKLIST_DETAILS);
				pstmt.setInt(1, smsDetails.getClassId());
				pstmt.setInt(2, smsDetails.getTermId());
				// logging
				rst = pstmt.executeQuery();
				Map subjectWiseMark = null;
				MarkDetails markDetails =  null;
				while (rst.next()) {
					if (prevStudentId == -1 || prevStudentId != rst.getInt(1)) {
						if (markDetails != null) {
//							markDetails.setSubjectWiseMark(subjectWiseMark);
							markList.add(markDetails);
						}

						markDetails = new MarkDetails();
						StudentDetails studentDetails = new StudentDetails();
						studentDetails.setStudentId(rst.getInt(1));
						studentDetails.setRollNo(rst.getString(2));
						studentDetails.setStudentName(rst.getString(3));
						ClassDetails classDetails = new ClassDetails();
						classDetails.setClassId(rst.getInt(4));
						classDetails.setClassName(rst.getString(5));
						classDetails.setSectionName(rst.getString(6));
						studentDetails.setClassDetails(classDetails);
//						studentDetails.setMobileNo(rst.getLong(7));
						// set student detail
//						markDetails.setStudentDetail(studentDetails);
						subjectWiseMark = new HashMap();
					}
					subjectWiseMark.put(rst.getInt(8), rst.getDouble(10));
					markDetails.setMarkId(rst.getInt(12));

					prevStudentId = rst.getInt(1);
				}
				if(markDetails!=null){
//				markDetails.setSubjectWiseMark(subjectWiseMark);
				markList.add(markDetails);
				}
			} catch (final SQLException e) {
				log.error(" error occured in searchSMSDAO e-", e);
				throw e;
			} finally {
				// close the dbconnection finally
				dbConnector.closeConnection(rst, pstmt, connection);
			}
		} catch (final SQLException e) {
			log.error(" error occured in searchSMSDAO e-", e);
			throw e;
		}
		return markList;
	}
}