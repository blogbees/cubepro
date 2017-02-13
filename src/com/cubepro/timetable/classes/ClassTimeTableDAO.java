package com.cubepro.timetable.classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.cubepro.general.CommonConstants;
import com.cubepro.classes.ClassDetails;
import com.cubepro.util.DatabaseConnector;

public class ClassTimeTableDAO {

	private static Logger log = Logger.getLogger(ClassTimeTableDAO.class);

	private static final String SQL_GET_CLASS_TT_DETAILS = " select class_tt_id , class_id ,  day_id ,  cws_id_1 ,  "
			+ " cws_id_2,  cws_id_3 ,  cws_id_4 ,  cws_id_5 ,  cws_id_6 ,  cws_id_7 ,  cws_id_8 from "
			+ " class_time_table where class_id = ? order by day_id asc ";

	private static final String SQL_INSERT_CLASS_TT_DETAILS = " insert into class_time_table (class_id, day_id, cws_id_1 ,  "
			+ " cws_id_2,  cws_id_3 ,  cws_id_4 ,  cws_id_5 ,  cws_id_6 ,  cws_id_7 ,  cws_id_8, create_date) values(?,?,?,?,?,?,?,?,?,?,now()) ";

	private static final String SQL_UPDATE_CLASS_TT_DETAILS = " update class_time_table set cws_id_1 = ? ,  "
			+ " cws_id_2 = ? ,  cws_id_3  = ? ,  cws_id_4  = ? ,  cws_id_5  = ? ,  cws_id_6  = ? ,  cws_id_7  = ? ,  cws_id_8  = ?  where class_tt_id = ? ";

	public List<ClassTimeTable> getClassTimeTableDetail(final int classId)
			throws Exception {

		List<ClassTimeTable> classTimeTableList = new ArrayList<ClassTimeTable>();
		boolean isRecordExists = false;
		try {
			DatabaseConnector dbConnector = new DatabaseConnector();
			Connection connection = dbConnector.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rst = null;

			try {

				pstmt = connection.prepareStatement(SQL_GET_CLASS_TT_DETAILS);
				pstmt.setInt(1, classId);

				rst = pstmt.executeQuery();

				while (rst.next()) {
					isRecordExists = true;
					ClassTimeTable classTimeTable = new ClassTimeTable();
					ClassDetails classDetail = new ClassDetails();
					classTimeTable.setClassTimeTableId(rst.getInt(1));
					classDetail.setClassId(rst.getInt(2));
					classTimeTable.setDay(rst.getInt(3));
					classTimeTable.setSubjectName1(rst.getString(4));
					classTimeTable.setSubjectName2(rst.getString(5));
					classTimeTable.setSubjectName3(rst.getString(6));
					classTimeTable.setSubjectName4(rst.getString(7));
					classTimeTable.setSubjectName5(rst.getString(8));
					classTimeTable.setSubjectName6(rst.getString(9));
					classTimeTable.setSubjectName7(rst.getString(10));
					classTimeTable.setSubjectName8(rst.getString(11));
					classTimeTable.setClassDetail(classDetail);
					classTimeTableList.add(classTimeTable);
				}
				// check if no record exists... if no .. construct a new
				// classtimetable list
				if (isRecordExists == false) {

					for (int i = 0; i < CommonConstants.MAX_DAY_VALUE; i++) {
						ClassTimeTable classTimeTable = new ClassTimeTable();
						ClassDetails classDetail = new ClassDetails();
						classTimeTable.setClassTimeTableId(0);
						classDetail.setClassId(classId);
						classTimeTable.setDay(i + 1);
						classTimeTable.setSubjectName1("");
						classTimeTable.setSubjectName2("");
						classTimeTable.setSubjectName3("");
						classTimeTable.setSubjectName4("");
						classTimeTable.setSubjectName5("");
						classTimeTable.setSubjectName6("");
						classTimeTable.setSubjectName7("");
						classTimeTable.setSubjectName8("");
						classTimeTable.setClassDetail(classDetail);
						classTimeTableList.add(classTimeTable);

					}

				}

			} catch (final SQLException e) {
				log.error(" Error occured ", e);
				throw e;
			} finally {
				// close the dbconnection finally
				dbConnector.closeConnection(rst, pstmt, connection);
			}
		} catch (final SQLException e) {
			log.error(" Error occured ", e);
			throw e;
		}
		return classTimeTableList;
	}

	public boolean saveClassTimeTable(final int classTimeTableId,
			final int dayId, final int classId, final String subjectName1,
			final String subjectName2, final String subjectName3,
			final String subjectName4, final String subjectName5,
			final String subjectName6, final String subjectName7,
			final String subjectName8) throws Exception {
		boolean status = false;
		try {
			DatabaseConnector dbConnector = new DatabaseConnector();
			Connection connection = dbConnector.getConnection();
			PreparedStatement pstmt = null;
			connection.setAutoCommit(false);
			try {
				if (classTimeTableId == 0) {
					pstmt = connection.prepareCall(SQL_INSERT_CLASS_TT_DETAILS);
					pstmt.setInt(1, classId);
					pstmt.setInt(2, dayId);
					pstmt.setString(3, subjectName1);
					pstmt.setString(4, subjectName2);
					pstmt.setString(5, subjectName3);
					pstmt.setString(6, subjectName4);
					pstmt.setString(7, subjectName5);
					pstmt.setString(8, subjectName6);
					pstmt.setString(9, subjectName7);
					pstmt.setString(10, subjectName8);

				} else {
					pstmt = connection.prepareCall(SQL_UPDATE_CLASS_TT_DETAILS);
					pstmt.setString(1, subjectName1);
					pstmt.setString(2, subjectName2);
					pstmt.setString(3, subjectName3);
					pstmt.setString(4, subjectName4);
					pstmt.setString(5, subjectName5);
					pstmt.setString(6, subjectName6);
					pstmt.setString(7, subjectName7);
					pstmt.setString(8, subjectName8);
					pstmt.setInt(9, classTimeTableId);
				}
				// save the image in database
				pstmt.executeUpdate();
				status = true;
			} catch (final SQLException e) {
				connection.rollback();
				log.error("Error occured e-", e);
				throw e;
			} finally {
				// close the dbconnection finally
				connection.commit();
				pstmt.close();
				dbConnector.closeConnection(connection);
			}
		} catch (final SQLException e) {
			log.error("Error Occured e-", e);
			throw e;
		}
		return status;
	}

}
