package com.cubepro.mark.dao;

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

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.mark.MarkDetails;
import com.cubepro.student.StudentDetails;
import com.cubepro.subject.SubjectDetails;

/**
 * Data access object (DAO) for domain model class MarkDetails.
 * 
 * @see MarkDetails
 * @author MyEclipse Persistence Tools
 */

public class MarkDetailsDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(MarkDetailsDAO.class);

	// property constants
	public static final String SUBJECT_ID = "subjectId";

	public static final String MARK_OBTAINED = "markObtained";

	public static final String MAX_MARKS = "maxMarks";

	public static final String CREATE_USER_ID = "createUserId";

	public static final String CHANGE_USER_ID = "changeUserId";
	
	public static final String SQL_GET_MARK_LIST = "SELECT subject_name, mark_obtained FROM mark_details m, subject_details s where exam_id = ? and student_id = ? and m.subject_id = s.subject_id ";

	public MarkDetailsDAO(Session session){
		super(session);
	}
	public MarkDetailsDAO(){
		
	}
	
	
	public List<MarkDetails> getMarkListForSMS(Connection conn, int studentId, int examId) throws Exception{
		List<MarkDetails> markList = new ArrayList<MarkDetails>();
		PreparedStatement st = null;
		ResultSet rst = null;
		try {
			st = conn.prepareStatement(SQL_GET_MARK_LIST);
			st.setInt(1, examId);
			st.setInt(2, studentId);
			rst = st.executeQuery();
			while(rst.next()){
				MarkDetails markDetails = new MarkDetails();
				markDetails.setSubjectDetails(new SubjectDetails());
				markDetails.getSubjectDetails().setSubjectName(rst.getString("subject_name"));
				markDetails.setMarkObtained(rst.getString("mark_obtained"));
				markList.add(markDetails);
			}
		} catch (SQLException re) {
			log.error("save failed", re);
			throw re;
		}finally{
			if(rst!=null)
				rst.close();
				if(st!=null)
				st.close();
			}
			return markList;
	}
	
	public void save(MarkDetails transientInstance) {
		log.debug("saving MarkDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	

	public void delete(MarkDetails persistentInstance) {
		log.debug("deleting MarkDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public MarkDetails findById(java.lang.Integer id) {
		log.debug("getting MarkDetails instance with id: " + id);
		try {
			MarkDetails instance = (MarkDetails) session.get(
					"MarkDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(MarkDetails instance) {
		log.debug("finding MarkDetails instance by example");
		try {
			List results = session.createCriteria("MarkDetails").add(
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
		log.debug("finding MarkDetails instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from MarkDetails as model where model."
					+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findBySubjectId(Object subjectId) {
		return findByProperty(SUBJECT_ID, subjectId);
	}

	public List findByMarkObtained(Object markObtained) {
		return findByProperty(MARK_OBTAINED, markObtained);
	}

	public List findByMaxMarks(Object maxMarks) {
		return findByProperty(MAX_MARKS, maxMarks);
	}

	public List findByCreateUserId(Object createUserId) {
		return findByProperty(CREATE_USER_ID, createUserId);
	}

	public List findByChangeUserId(Object changeUserId) {
		return findByProperty(CHANGE_USER_ID, changeUserId);
	}

	public List findAll() {
		log.debug("finding all MarkDetails instances");
		try {
			String queryString = "from MarkDetails";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public MarkDetails merge(MarkDetails detachedInstance) {
		log.debug("merging MarkDetails instance");
		try {
			MarkDetails result = (MarkDetails) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(MarkDetails instance) {
		log.debug("attaching dirty MarkDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(MarkDetails instance) {
		log.debug("attaching clean MarkDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<MarkDetails> getMarkList(StudentDetails studentDetails, int examId) throws Exception {
		log.debug("finding StudentDetails instance with property: "
				+ studentDetails.getStudentName() + ", rollNo: " + studentDetails.getRollNo());
		try {
			String queryString = "from MarkDetails as model where ( model.studentDetails.studentId = ? and model.studentDetails.classDetails.classId = ? and model.examDetails.examId = ?)";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, studentDetails.getStudentId());
			queryObject.setParameter(1, studentDetails.getClassDetails().getClassId());
			queryObject.setParameter(2, examId);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}		
	}

}