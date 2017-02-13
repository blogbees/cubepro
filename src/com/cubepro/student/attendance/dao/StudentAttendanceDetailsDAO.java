package com.cubepro.student.attendance.dao;


import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProConstants;
import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.student.StudentDetails;
import com.cubepro.student.attendance.StudentAttendanceDetails;
import com.cubepro.util.DatabaseConnector;

/**
 * Data access object (DAO) for domain model class StudentAttendanceDetails.
 * 
 * @see StudentAttendanceDetails
 * @author MyEclipse Persistence Tools
 */

public class StudentAttendanceDetailsDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory
			.getLog(StudentAttendanceDetailsDAO.class);

	// property constants
	public static final String STUDENT_ID = "studentId";

	public static final String ATTENDANCE_STATUS = "attendanceStatus";

	public static final String ATTENDANCE_REASON = "attendanceReason";

	public static final String CREATE_USER_ID = "createUserId";

	public static final String CHANGE_USER_ID = "changeUserId";

	public StudentAttendanceDetailsDAO(Session session) {
		super(session);
	}

	public void save(StudentAttendanceDetails transientInstance) {
		log.debug("saving StudentAttendanceDetails instance");
		try {
			session.saveOrUpdate(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(StudentAttendanceDetails persistentInstance) {
		log.debug("deleting StudentAttendanceDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public StudentAttendanceDetails findById(java.lang.Integer id) {
		log.debug("getting StudentAttendanceDetails instance with id: " + id);
		try {
			StudentAttendanceDetails instance = (StudentAttendanceDetails) session
					.get("StudentAttendanceDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(StudentAttendanceDetails instance) {
		log.debug("finding StudentAttendanceDetails instance by example");
		try {
			List results = session.createCriteria("StudentAttendanceDetails")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding StudentAttendanceDetails instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from StudentAttendanceDetails as model where model."
					+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByStudentId(Object studentId) {
		return findByProperty(STUDENT_ID, studentId);
	}

	public List findByAttendanceStatus(Object attendanceStatus) {
		return findByProperty(ATTENDANCE_STATUS, attendanceStatus);
	}

	public List findByAttendanceReason(Object attendanceReason) {
		return findByProperty(ATTENDANCE_REASON, attendanceReason);
	}

	public List findByCreateUserId(Object createUserId) {
		return findByProperty(CREATE_USER_ID, createUserId);
	}

	public List findByChangeUserId(Object changeUserId) {
		return findByProperty(CHANGE_USER_ID, changeUserId);
	}

	public List findAll() {
		log.debug("finding all StudentAttendanceDetails instances");
		try {
			String queryString = "from com.cubepro.student.attendance.StudentAttendanceDetails";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public StudentAttendanceDetails merge(
			StudentAttendanceDetails detachedInstance) {
		log.debug("merging StudentAttendanceDetails instance");
		try {
			StudentAttendanceDetails result = (StudentAttendanceDetails) session
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(StudentAttendanceDetails instance) {
		log.debug("attaching dirty StudentAttendanceDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<StudentAttendanceDetails> getStudentAttendanceList(
			StudentDetails studentDetails, String attendanceDateString)
			throws Exception {
		log.debug("finding StudentAttendanceDetails instance with property: "
				+ studentDetails.getStudentName() + ", rollNo: "
				+ studentDetails.getRollNo());
		try {
			String queryString = "from StudentAttendanceDetails as model where (( model.studentDetails.studentName like ? or model.studentDetails.rollNo like ? or model.studentDetails.admissionNo like ?) and model.studentDetails.classDetails.classId = ?) and model.absentDate = ? ";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, studentDetails.getStudentName()+CubeProConstants.CHAR_PERCENTAGE);
			queryObject.setParameter(1, studentDetails.getRollNo()+CubeProConstants.CHAR_PERCENTAGE);
			queryObject.setParameter(2, studentDetails.getAdmissionNo()+CubeProConstants.CHAR_PERCENTAGE);
			queryObject.setParameter(3, studentDetails.getClassDetails()
					.getClassId());
			queryObject.setParameter(4, attendanceDateString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<StudentAttendanceDetails> getStudentFeesList(
			StudentDetails studentDetails, String attendanceDateString)
			throws Exception {
		log.debug("finding StudentFeesDetails instance with property: "
				+ studentDetails.getStudentName());
		try {
			ArrayList studentFeesList = new ArrayList();
			int n=1;
			int i=0;
			DatabaseConnector dbConnector = new DatabaseConnector();
			Connection connection = dbConnector.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rst = null;
			String queryString="select class_details.section_name ,student_details.student_name,student_details.class_id,student_details.admission_no" +
					" FROM student_details INNER JOIN invoice_details ON student_details.student_id = invoice_details.student_id" +
					" INNER JOIN  class_details ON student_details.class_id = class_details.class_id" +
					" Where ";
			try
			{
			StringBuffer sqlQueryForSearch = new StringBuffer(queryString);
			           if(studentDetails.getStudentName()!=null)
				        {
			        	   i=1;
			        	   sqlQueryForSearch.append("student_details.student_name=?");
				        }	
			            if(studentDetails.getAdmissionNo()!=null)
			            {
			            	if(i==1)
			            	{
			            		sqlQueryForSearch.append(" and student_details.admission_no = ?");
			            		i=2;
			            	}
			            	else
			            	{
			            		sqlQueryForSearch.append(" student_details.admission_no = ?");
			            	}
			        	    
			            }
			            if(studentDetails.getClassDetails().getClassId()!=null)
			            {
			            	if(i>0)
			            	{
			            		sqlQueryForSearch.append(" and student_details.class_id =?");
			            	}
			            	else
			            	{
			            		sqlQueryForSearch.append(" student_details.class_id =?");
			            	}
			        	}
			           // Query queryObject = session.createSQLQuery(queryString);
			            pstmt = connection.prepareStatement(sqlQueryForSearch
								.toString());
			        	if(studentDetails.getStudentName()!=null)
				        {
			        		pstmt.setString(n, studentDetails.getStudentName());
				        	n++;
				        }	
			            if(studentDetails.getAdmissionNo()!=null)
			            {
			            	pstmt.setString(n, studentDetails.getAdmissionNo());
			        	    n++;
			            }
			            if(studentDetails.getClassDetails().getClassId()!=null)
			            {
			            	pstmt.setInt(n, studentDetails.getClassDetails().getClassId());
				              n++;
			        	}
			            rst = pstmt.executeQuery();
			            while (rst.next()) {
							log.debug("Result found");
							StudentDetails studentsDetail = new StudentDetails();
							ClassDetails classDetails = new ClassDetails();
							classDetails.setSectionName(rst.getString(1));
							//studentsDetail.setRollNo(studentDetails.getRollNo());
							studentsDetail.setStudentName(rst.getString(2));
							classDetails.setClassId(rst.getInt(3));
							studentDetails.setAdmissionNo(rst.getString(4));
							studentFeesList.add(studentDetails);
						}
			}
			catch(final SQLException e)
			{throw e;
			} finally {
				// close the dbconnection finally
				dbConnector.closeConnection(rst, pstmt, connection);
			}
			       //str_to_date(invoice_details.`fees_date`,'%d/%m/%Y') >= str_to_date(?,'%d/%m/%Y')" +
					//"and str_to_date(invoice_details.`fees_date`,'%d/%m/%Y') <= str_to_date(?,'%d/%m/%Y') and     student_details.`class_id` = ? AND      student_details.`admission_no` = ?  AND     student_details.`student_name`=?";
			return studentFeesList;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<StudentAttendanceDetails> getAbsentStudentsList(
			StudentDetails studentDetails, String attendanceDateString)
			throws Exception {
		log.debug("finding StudentAttendanceDetails instance with property: "
				+ studentDetails.getStudentName() + ", rollNo: "
				+ studentDetails.getRollNo());
		try {
			String queryString = "from StudentAttendanceDetails as model where ( " +
					"(model.studentDetails.studentName like ? or model.studentDetails.admissionNo like ?) " +
					"and model.studentDetails.classDetails.classId = ? and "
					+ ATTENDANCE_STATUS + " = 'Absent' and model.absentDate = ?  ) ";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, studentDetails.getStudentName()+"%");
			queryObject.setParameter(1, studentDetails.getAdmissionNo()+"%");
			queryObject.setParameter(2, studentDetails.getClassDetails().getClassId());
			queryObject.setParameter(3, attendanceDateString);					
					
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public void attachClean(StudentAttendanceDetails instance) {
		log.debug("attaching clean StudentAttendanceDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}