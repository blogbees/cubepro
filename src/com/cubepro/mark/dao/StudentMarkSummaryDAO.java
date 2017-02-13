package com.cubepro.mark.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.mark.StudentMarkSummary;
import com.cubepro.student.StudentDetails;

/**
 * Data access object (DAO) for domain model class MarkDetails.
 * 
 * @see StudentMarkSummary
 * @author MyEclipse Persistence Tools
 */

public class StudentMarkSummaryDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory
			.getLog(StudentMarkSummaryDAO.class);
	private static final String SQL_GET_TOTAL = "select a.total, truncate(a.perc,2) perc, case when a.perc < 40 then 'F' else "
			+ "case when a.perc >=40 and a.perc < 60 then 'C' else case when a.perc >=60 and a.perc < 80 then 'A' "
			+ "else case when a.perc >80 then 'A+' else '' end end end end as grade  from ( "
			+ "SELECT sum(m.mark_obtained) total, (sum(m.mark_obtained)/sum(m.max_marks)) * 100 perc "
			+ "FROM mark_details m where m.exam_id = ? and m.student_id = ?)a";
	// property constants
	public static final String SUBJECT_ID = "subjectId";

	public static final String MARK_OBTAINED = "markObtained";

	public static final String MAX_MARKS = "maxMarks";

	public static final String CREATE_USER_ID = "createUserId";

	public static final String CHANGE_USER_ID = "changeUserId";

	public StudentMarkSummaryDAO(Session session) {
		super(session);
	}

	public Map<String,String> getStudentMarkSummary(int examId, int studentId)
			throws Exception {
		Connection conn = null;
		ResultSet rst = null;
		PreparedStatement pstmt = null;
		Map<String,String> tot = new HashMap<String,String>();
		try {
			conn = session.connection();
			pstmt = conn.prepareStatement(SQL_GET_TOTAL);
			pstmt.setInt(1, examId);
			pstmt.setInt(2, studentId);
			rst = pstmt.executeQuery();
			while(rst.next()){
				tot.put("total", rst.getString("total"));
				tot.put("perc", rst.getString("perc"));
				tot.put("grade", rst.getString("grade"));
			}
		} catch (Exception e) {
			throw e;
		} finally {
			rst.close();
			pstmt.close();
			conn.close();
		}
		return tot;
	}

	public void save(StudentMarkSummary transientInstance) {
		log.debug("saving StudentMarkSummary instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(StudentMarkSummary persistentInstance) {
		log.debug("deleting StudentMarkSummary instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public StudentMarkSummary findById(java.lang.Integer id) {
		log.debug("getting StudentMarkSummary instance with id: " + id);
		try {
			StudentMarkSummary instance = (StudentMarkSummary) session.get(
					"StudentMarkSummary", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(StudentMarkSummary instance) {
		log.debug("finding StudentMarkSummary instance by example");
		try {
			List results = session.createCriteria("StudentMarkSummary").add(
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
		log.debug("finding StudentMarkSummary instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from StudentMarkSummary as model where model."
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
		log.debug("finding all StudentMarkSummary instances");
		try {
			String queryString = "from StudentMarkSummary";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public StudentMarkSummary merge(StudentMarkSummary detachedInstance) {
		log.debug("merging StudentMarkSummary instance");
		try {
			StudentMarkSummary result = (StudentMarkSummary) session
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(StudentMarkSummary instance) {
		log.debug("attaching dirty StudentMarkSummary instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(StudentMarkSummary instance) {
		log.debug("attaching clean StudentMarkSummary instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<StudentMarkSummary> getMarkList(StudentDetails studentDetails,
			int examId) throws Exception {
		log.debug("finding StudentDetails instance with property: "
				+ studentDetails.getStudentName() + ", rollNo: "
				+ studentDetails.getRollNo());
		try {
			String queryString = "from StudentMarkSummary as model where ( model.studentDetails.studentId = ? and model.studentDetails.classDetails.classId = ? and model.examDetails.examId = ?)";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, studentDetails.getStudentId());
			queryObject.setParameter(1, studentDetails.getClassDetails()
					.getClassId());
			queryObject.setParameter(2, examId);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

}