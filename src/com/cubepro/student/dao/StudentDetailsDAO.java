package com.cubepro.student.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
import com.cubepro.util.DatabaseConnector;

/**
 * Data access object (DAO) for domain model class StudentDetails.
 * 
 * @see StudentDetails
 * @author MyEclipse Persistence Tools
 */

public class StudentDetailsDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(StudentDetailsDAO.class);

	// property constants
	public static final String STUDENT_NAME = "studentName";

	public static final String ROLL_NO = "rollNo";

	public static final String ADMISSION_NO = "admissionNo";

	public static final String FATHER_NAME = "fatherName";

	public static final String MOTHER_NAME = "motherName";

	public static final String GUARDIAN_NAME = "guardianName";

	public static final String ADDRESS1 = "address1";

	public static final String ADDRESS2 = "address2";

	public static final String CITY = "city";

	public static final String STATE = "state";

	public static final String COUNTRY = "country";

	public static final String ZIP_CODE = "zipCode";

	public static final String PHONE = "phone";

	public static final String MOBILE = "mobile";

	public static final String COURSE_IDS = "courseIds";

	public static final String GENDER = "gender";

	public static final String STATUS = "status";

	private static final String SQL_UPDATE_ALL_STUDENTS_CLASS = "update student_details set class_id = ? where class_id = ?";
	
	private static final String SQL_UPDATE_ALL_STUDENTS_CLASS_COUNT = "select count(*) FROM student_details  where class_id = ?";
	
	private static final String SQL_UPDATE_ALL_STUDENTS_CLASS_BY_ADMISSION_NO = "update student_details set class_id = ? where class_id = ? and admission_no = ?";
	
	private static final String SQL_GET_UNPAID_STUDENT_DETAILS="SELECT st.student_id, st.student_name, ct.class_id, st.admission_no, concat(ct.class_name,'-',ct.section_name) class_det,max(paid_amt) paidamt,sum(fm.fees_amt) actualamt, st.mobile1 mobile FROM " +
			" invoice_details i, fees_master fm, student_details st, class_details ct where st.student_id = i.student_id and st.class_id = fm.class_id and st.class_id = ct.class_id and i.fees_type = fm.fees_type and " +
			" i.sub_type = fm.fees_name";
	
	private static final String SQL_GET_HOMWORK_STUDENT_DETAILS = "select cd.class_id, st.admission_no, st.student_id, st.student_name, concat(cd.class_name,'-',cd.section_name) class_det,sth.date_of_assignment, sth.date_to_complete, sth.general_comments, st.mobile1 mobile from student_homework sth "
			+ "inner join class_details cd on cd.class_id = sth.class_id left join student_details st on st.class_id = sth.class_id where 1=1 ";
	
	public StudentDetailsDAO() {
		super(null);
	}

	public StudentDetailsDAO(Session session) {
		super(session);
	}

	public void save(StudentDetails transientInstance) {
		log.debug("saving StudentDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void saveOrUpdate(StudentDetails transientInstance) {
		log.debug("saving StudentDetails instance");
		try {
			session.saveOrUpdate(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(StudentDetails persistentInstance) {
		log.debug("deleting StudentDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public StudentDetails findById(java.lang.Integer id) {
		log.debug("getting StudentDetails instance with id: " + id);
		try {
			StudentDetails instance = (StudentDetails) session.get(
					"com.cubepro.student.StudentDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(StudentDetails instance) {
		log.debug("finding StudentDetails instance by example");
		try {
			List results = session.createCriteria("StudentDetails").add(
					Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding StudentDetails instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from StudentDetails as model where model."
					+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<StudentDetails> getStudentList(StudentDetails studentDetails)
			throws Exception {
		log.debug("finding StudentDetails instance with property: "
				+ studentDetails.getStudentName() + ", rollNo: "
				+ studentDetails.getRollNo());
		try {
			String queryString = "from StudentDetails as model ";
			String whereQuery = " where 1=1 ";
			if (studentDetails.getStudentName() != null
					&& studentDetails.getStudentName().trim().length() > 0)
				whereQuery += " and model.studentName like ? ";
			if (studentDetails.getScholar1() != null
					&& studentDetails.getScholar1().trim().length() > 0)
				whereQuery += " and model.scholar1 like ? ";
			if (studentDetails.getRollNo() != null
					&& studentDetails.getRollNo().trim().length() > 0)
				whereQuery += " and model.rollNo like ? ";
			if (studentDetails.getAdmissionNo() != null
					&& studentDetails.getAdmissionNo().trim().length() > 0)
				whereQuery += " and model.admissionNo like ? ";
			if (studentDetails.getDobString() != null
					&& studentDetails.getDobString().trim().length() > 0)
				whereQuery += " and model.dobString = ? ";
			if (CubeProConstants.ALL_CLASS_SECTIONS != studentDetails
					.getClassDetails().getClassId().intValue())
				whereQuery += " and model.classDetails.classId = ? ";
			if (studentDetails.getPta() != null
					&& studentDetails.getPta().trim().length() > 0)
				whereQuery += " and model.pta = ? ";
			
			if (studentDetails.getOrderBy() != null
					&& studentDetails.getOrderBy().trim().length() > 0){
				queryString += whereQuery + " order by "+studentDetails.getOrderBy();
			}else{
				queryString += whereQuery + " order by model.bookSerialNo asc, model.admissionNo asc ";
			}
					
			Query queryObject = session.createQuery(queryString);
			int i = 0;
			if (studentDetails.getStudentName() != null
					&& studentDetails.getStudentName().trim().length() > 0)
				queryObject.setParameter(i++, studentDetails.getStudentName()
						+ CubeProConstants.CHAR_PERCENTAGE);
			if (studentDetails.getRollNo() != null
					&& studentDetails.getRollNo().trim().length() > 0)
				queryObject.setParameter(i++, CubeProConstants.CHAR_PERCENTAGE
						+ studentDetails.getRollNo()
						+ CubeProConstants.CHAR_PERCENTAGE);
			if (studentDetails.getAdmissionNo() != null
					&& studentDetails.getAdmissionNo().trim().length() > 0)
				queryObject.setParameter(i++, CubeProConstants.CHAR_PERCENTAGE
						+ studentDetails.getAdmissionNo()
						+ CubeProConstants.CHAR_PERCENTAGE);
			if (studentDetails.getDobString() != null
					&& studentDetails.getDobString().trim().length() > 0)
				queryObject.setParameter(i++, studentDetails.getDobString());
			if (CubeProConstants.ALL_CLASS_SECTIONS != studentDetails
					.getClassDetails().getClassId().intValue())
				queryObject.setParameter(i++, studentDetails.getClassDetails()
						.getClassId());
			if (studentDetails.getPta() != null
					&& studentDetails.getPta().trim().length() > 0)
				queryObject.setParameter(i++, studentDetails.getPta());
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<StudentDetails> getStudentFeesList(
			StudentDetails studentDetails, String fromDate,String toDate)
			throws Exception {
		log.debug("finding StudentFeesDetails instance with property: "
				+ studentDetails.getStudentName());
		try {
			List<StudentDetails> studentFeesList = new ArrayList<StudentDetails>();
			int n=1,a=1;
			DatabaseConnector dbConnector = new DatabaseConnector();
			Connection connection = dbConnector.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rst = null;
			PreparedStatement pstmt1 = null;
			ResultSet rst1 = null;
			try
			{
			StringBuffer sqlQueryForNoFees = new StringBuffer("SELECT st.student_id, st.student_name, concat(ct.class_name,'-',ct.section_name) class_det,0 paidamt,sum(fees_amt) actualamt, ct.class_id, st.admission_no, st.mobile1 mobile FROM student_details st, class_details ct, fees_master fm where st.class_id = ct.class_id and ct.class_id = fm.class_id ");
			StringBuffer sqlQueryForSearch = new StringBuffer(SQL_GET_UNPAID_STUDENT_DETAILS);
			StringBuffer sqlSubQuery = new StringBuffer(" select st.student_id from invoice_details i,student_details st, class_details ct where st.class_id = ct.class_id and st.student_id = i.student_id ");
			           if(!(studentDetails.getStudentName().equals(null) || studentDetails.getStudentName().equals("") || studentDetails.getStudentName().equals("null")) )
				        {
			        	   sqlQueryForSearch.append(" and st.student_name like ?");
			        	   sqlQueryForNoFees.append(" and st.student_name like ?");
			        	   sqlSubQuery.append(" and st.student_name like'"+studentDetails.getStudentName()+"%' ");
			        	   
				        }	
			            if(!(studentDetails.getAdmissionNo()==null || studentDetails.getAdmissionNo()=="" || studentDetails.getAdmissionNo()=="null") )
			            {
			            		sqlQueryForSearch.append(" and st.admission_no = ?");
			            		sqlQueryForNoFees.append(" and st.admission_no = ?");
			            		sqlSubQuery.append(" and st.admission_no = '"+studentDetails.getAdmissionNo()+"' ");
			            }
			            if(!(fromDate.equals("") && toDate.equals("")))
			            {
			            		sqlQueryForSearch.append(" and str_to_date(i.`fees_date`,'%d/%m/%Y') >= str_to_date(?,'%d/%m/%Y') and str_to_date(i.`fees_date`,'%d/%m/%Y') <= str_to_date(?,'%d/%m/%Y') ");
			            		//sqlQueryForNoFees.append(" and str_to_date(i.`fees_date`,'%d/%m/%Y') >= str_to_date(?,'%d/%m/%Y') and str_to_date(i.`fees_date`,'%d/%m/%Y') <= str_to_date(?,'%d/%m/%Y') ");
			            		sqlSubQuery.append(" and str_to_date(i.`fees_date`,'%d/%m/%Y') >= str_to_date('"+fromDate+"','%d/%m/%Y') and str_to_date(i.`fees_date`,'%d/%m/%Y') <= str_to_date('"+toDate+"','%d/%m/%Y') ");
			            }
			            if(studentDetails.getClassDetails().getClassId()!=null)
			            {
			            		sqlQueryForSearch.append(" and ct.class_id =? ");
			            		sqlQueryForNoFees.append(" and ct.class_id =? ");
			            		sqlSubQuery.append(" and ct.class_id ="+studentDetails.getClassDetails().getClassId()+" ");
			            }
			            sqlQueryForNoFees.append("and st.student_id not in ( "+sqlSubQuery.toString()+" ) ");
			            sqlQueryForSearch.append(" group by st.mobile1, ct.class_id, st.admission_no, st.student_id, st.student_name, concat(ct.class_name,'-',ct.section_name) having max(paid_amt) < sum(fm.fees_amt) ");
			            sqlQueryForNoFees.append(" group by st.mobile1, ct.class_id, st.admission_no, st.student_id, st.student_name, concat(ct.class_name,'-',ct.section_name) ");
			            // Query queryObject = session.createSQLQuery(queryString);
			            pstmt = connection.prepareStatement(sqlQueryForNoFees
								.toString());
			            pstmt1 = connection.prepareStatement(sqlQueryForSearch
								.toString());
			        	if(!(studentDetails.getStudentName().equals(null) || studentDetails.getStudentName().equals("") || studentDetails.getStudentName().equals("null")) )
				        {
			        		pstmt.setString(a, studentDetails.getStudentName()+"%");
			        		pstmt1.setString(n, studentDetails.getStudentName()+"%");
			        		n++;a++;
				        }	
			            if(!(studentDetails.getAdmissionNo()==null || studentDetails.getAdmissionNo()=="" || studentDetails.getAdmissionNo()=="null") )
			            {
			            	pstmt.setString(a, studentDetails.getAdmissionNo());
			            	pstmt1.setString(n, studentDetails.getAdmissionNo());
			            	n++;a++;
			            }
			            if(!(fromDate.equals("") && toDate.equals("")))
			            {
			            	//pstmt.setString(a,fromDate);
			            	pstmt1.setString(n,fromDate);
			            	n++;
			            	//a++;
			            	//pstmt.setString(a,toDate);
			            	pstmt1.setString(n,toDate);
			            	n++;
			            	//a++;
			            }
			            if(studentDetails.getClassDetails().getClassId()!=null)
			            {
			            	pstmt.setInt(a, studentDetails.getClassDetails().getClassId());
			            	pstmt1.setInt(n, studentDetails.getClassDetails().getClassId());
			            	n++;a++;
			        	}
			            rst = pstmt.executeQuery();
			            while (rst.next()) {
			            	StudentDetails studentsDetails = new StudentDetails();
							ClassDetails classDetails = new ClassDetails();
							classDetails.setClassWithSectionName(rst.getString("class_det"));
							studentsDetails.setStudentName(rst.getString("student_name"));
							classDetails.setClassId(rst.getInt("class_id"));
							studentsDetails.setAdmissionNo(rst.getString("admission_no"));
							studentsDetails.setPaidAmt(rst.getString("paidamt"));
							studentsDetails.setActualAmt(rst.getString("actualamt"));
							studentsDetails.setMobile(rst.getString("mobile"));
							studentsDetails.setClassDetails(classDetails);
							studentFeesList.add(studentsDetails);
						}
			            
			            rst1 = pstmt1.executeQuery();
			            while (rst1.next()) {
			            	StudentDetails studentsDetails = new StudentDetails();
							ClassDetails classDetails = new ClassDetails();
							classDetails.setClassWithSectionName(rst1.getString("class_det"));
							studentsDetails.setStudentName(rst1.getString("student_name"));
							classDetails.setClassId(rst1.getInt("class_id"));
							studentsDetails.setAdmissionNo(rst1.getString("admission_no"));
							studentsDetails.setPaidAmt(rst1.getString("paidamt"));
							studentsDetails.setActualAmt(rst1.getString("actualamt"));
							studentsDetails.setMobile(rst1.getString("mobile"));
							studentsDetails.setClassDetails(classDetails);
							studentFeesList.add(studentsDetails);
						}

			            
			}
			catch(final SQLException e)
			{throw e;
			} finally {
				// close the dbconnection finally
				dbConnector.closeConnection(rst1, pstmt1, null);
				dbConnector.closeConnection(rst, pstmt, connection);
				
			}
			return studentFeesList;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	
	@SuppressWarnings("unchecked")
	public List<StudentDetails> getStudentHomeWorkList(StudentDetails studentDetails, String fromDate,String toDate)
			throws Exception {
		log.debug("finding StudentFeesDetails instance with property: "
				+ studentDetails.getStudentName());
		try {
			List<StudentDetails> studentFeesList = new ArrayList<StudentDetails>();
			int n=1,a=1;
			DatabaseConnector dbConnector = new DatabaseConnector();
			Connection connection = dbConnector.getConnection();
			PreparedStatement pstmt1 = null;
			ResultSet rst1 = null;
			try
			{
			StringBuffer sqlQueryForSearch = new StringBuffer(SQL_GET_HOMWORK_STUDENT_DETAILS);
			
			           if(!(studentDetails.getStudentName().equals(null) || studentDetails.getStudentName().equals("") || studentDetails.getStudentName().equals("null")) )
				        {
			        	   sqlQueryForSearch.append(" and st.student_name like ?");
				        }	
			            if(!(studentDetails.getAdmissionNo()==null || studentDetails.getAdmissionNo()=="" || studentDetails.getAdmissionNo()=="null") )
			            {
			            		sqlQueryForSearch.append(" and st.admission_no = ?");
			            }
			            if(!(fromDate.equals("") && toDate.equals("")))
			            {
			            		sqlQueryForSearch.append(" and str_to_date(sth.`date_of_assignment`,'%d/%m/%Y') >= str_to_date(?,'%d/%m/%Y') and str_to_date(sth.`date_of_assignment`,'%d/%m/%Y') <= str_to_date(?,'%d/%m/%Y') ");
			            }
			            if(studentDetails.getClassDetails().getClassId()!=null)
			            {
			            	if (CubeProConstants.ALL_CLASS_SECTIONS != studentDetails
			    					.getClassDetails().getClassId().intValue()){
			            		sqlQueryForSearch.append(" and cd.class_id =? ");
			            	}
			            }

			            pstmt1 = connection.prepareStatement(sqlQueryForSearch
								.toString());
			        	if(!(studentDetails.getStudentName().equals(null) || studentDetails.getStudentName().equals("") || studentDetails.getStudentName().equals("null")) )
				        {
			        		pstmt1.setString(n, studentDetails.getStudentName()+"%");
			        		n++;
				        }	
			            if(!(studentDetails.getAdmissionNo()==null || studentDetails.getAdmissionNo()=="" || studentDetails.getAdmissionNo()=="null") )
			            {
			            	pstmt1.setString(n, studentDetails.getAdmissionNo());
			            	n++;
			            }
			            if(!(fromDate.equals("") && toDate.equals("")))
			            {
			            	pstmt1.setString(n,fromDate);
			            	n++;
			            	pstmt1.setString(n,toDate);
			            	n++;
			            }
			            if(studentDetails.getClassDetails().getClassId()!=null)
			            {
			            	if (CubeProConstants.ALL_CLASS_SECTIONS != studentDetails
			    					.getClassDetails().getClassId().intValue()){
				            	pstmt1.setInt(n, studentDetails.getClassDetails().getClassId());
				            	n++;
			            	}
			        	}
			            rst1 = pstmt1.executeQuery();
			            while (rst1.next()) {
			            	StudentDetails studentsDetails = new StudentDetails();
							ClassDetails classDetails = new ClassDetails();
							classDetails.setClassWithSectionName(rst1.getString("class_det"));
							studentsDetails.setStudentName(rst1.getString("student_name"));
							classDetails.setClassId(rst1.getInt("class_id"));
							studentDetails.setStudentId(rst1.getInt("student_id"));
							studentsDetails.setAdmissionNo(rst1.getString("admission_no"));
							studentsDetails.setHomeWorkAssignedDate(rst1.getString("date_of_assignment"));
							studentsDetails.setHomeWorkCompletionDate(rst1.getString("date_to_complete"));
							studentsDetails.setHomeWorkDesc(rst1.getString("general_comments"));
							studentsDetails.setMobile(rst1.getString("mobile"));
							studentsDetails.setClassDetails(classDetails);
							studentFeesList.add(studentsDetails);
						}

			            
			}
			catch(final SQLException e)
			{throw e;
			} finally {
				// close the dbconnection finally
				dbConnector.closeConnection(rst1, pstmt1, null);
			}
			return studentFeesList;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByStudentName(Object studentName) {
		return findByProperty(STUDENT_NAME, studentName);
	}

	public List findByRollNo(Object rollNo) {
		return findByProperty(ROLL_NO, rollNo);
	}

	public List findByAdmissionNo(Object admissionNo) {
		return findByProperty(ADMISSION_NO, admissionNo);
	}

	public List findByFatherName(Object fatherName) {
		return findByProperty(FATHER_NAME, fatherName);
	}

	public List findByMotherName(Object motherName) {
		return findByProperty(MOTHER_NAME, motherName);
	}

	public List findByGuardianName(Object guardianName) {
		return findByProperty(GUARDIAN_NAME, guardianName);
	}

	public List findByAddress1(Object address1) {
		return findByProperty(ADDRESS1, address1);
	}

	public List findByAddress2(Object address2) {
		return findByProperty(ADDRESS2, address2);
	}

	public List findByCity(Object city) {
		return findByProperty(CITY, city);
	}

	public List findByState(Object state) {
		return findByProperty(STATE, state);
	}

	public List findByCountry(Object country) {
		return findByProperty(COUNTRY, country);
	}

	public List findByZipCode(Object zipCode) {
		return findByProperty(ZIP_CODE, zipCode);
	}

	public List findByPhone(Object phone) {
		return findByProperty(PHONE, phone);
	}

	public List findByMobile(Object mobile) {
		return findByProperty(MOBILE, mobile);
	}

	public List findByCourseIds(Object courseIds) {
		return findByProperty(COURSE_IDS, courseIds);
	}

	public List findByGender(Object gender) {
		return findByProperty(GENDER, gender);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findAll() {
		log.debug("finding all StudentDetails instances");
		try {
			String queryString = "from StudentDetails";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public StudentDetails merge(StudentDetails detachedInstance) {
		log.debug("merging StudentDetails instance");
		try {
			StudentDetails result = (StudentDetails) session
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(StudentDetails instance) {
		log.debug("attaching dirty StudentDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(StudentDetails instance) {
		log.debug("attaching clean StudentDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	@SuppressWarnings("deprecation")
	public void updateAllStudentsClass(Long fromClassId, Long toClassId)
			throws Exception {
		PreparedStatement pstmt = null;
		Connection conn = null;
		int i = 1;
		try {
			conn = session.connection();
			pstmt = conn.prepareStatement(SQL_UPDATE_ALL_STUDENTS_CLASS);
			pstmt.setLong(i++, toClassId);
			pstmt.setLong(i++, fromClassId);
			pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			conn.rollback();
			log.error("failed", e);
			throw e;
		} finally {
			pstmt.close();
			conn.close();
			conn = null;
		}
	}
	@SuppressWarnings("deprecation")
	public int getAllStudentsCount(Long fromClassId)
			throws Exception {
		int k=0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs=null;
		int i = 1;
		try {
			conn = session.connection();
			pstmt = conn.prepareStatement(SQL_UPDATE_ALL_STUDENTS_CLASS_COUNT);
			pstmt.setLong(i++, fromClassId);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				 k=Integer.parseInt(rs.getString(1));
			}
			conn.commit();
		} catch (Exception e) {
			conn.rollback();
			log.error("failed", e);
			throw e;
		} finally {
			pstmt.close();
			rs.close();
			conn.close();
			conn = null;
		}
		return k;
	}
	public void updateAllStudentsClass(Long fromClassId, Long toClassId,
			String admissionNo) throws Exception {
		PreparedStatement pstmt = null;
		Connection conn = null;
		int i = 1;
		try {
			conn = session.connection();
			pstmt = conn.prepareStatement(SQL_UPDATE_ALL_STUDENTS_CLASS_BY_ADMISSION_NO);
			pstmt.setLong(i++, toClassId);
			pstmt.setLong(i++, fromClassId);
			pstmt.setString(i++, admissionNo);
			pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			conn.rollback();
			log.error("failed", e);
			throw e;
		} finally {
			pstmt.close();
			conn.close();
			conn = null;
		}
	}
	
	/**
	 * @param fromClassId
	 * @return
	 * @throws Exception
	 */
	public List<StudentDetails> getAllStudents(Integer fromClassId) throws Exception {
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rst = null;
		List<StudentDetails> studentDetailsList = new ArrayList<StudentDetails>();
		int i = 1;
		try {
			conn = new DatabaseConnector().getConnection();
			pstmt = conn.prepareStatement("select student_id, student_name, mobile1 from student_details where class_id = ?");
			pstmt.setInt(i++, fromClassId);
			rst = pstmt.executeQuery();
			while(rst.next()){
				StudentDetails studentDetails = new StudentDetails();
				studentDetails.setStudentId(rst.getInt("student_id"));
				studentDetails.setStudentName(rst.getString("student_name"));
				studentDetails.setMobile(rst.getString("mobile1"));
				studentDetailsList.add(studentDetails);
			}
		} catch (Exception e) {
			conn.rollback();
			log.error("failed", e);
			throw e;
		} finally {
			rst.close();
			pstmt.close();
			conn.close();
			conn = null;
		}
		return studentDetailsList;
	}
}