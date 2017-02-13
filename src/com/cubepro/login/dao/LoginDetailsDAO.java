package com.cubepro.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.exception.GenericJDBCException;

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.login.entity.LoginDetails;

/**
 * Data access object (DAO) for domain model class LoginDetails.
 * 
 * @see .LoginDetails
 * @author MyEclipse Persistence Tools
 */

public class LoginDetailsDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(LoginDetailsDAO.class);

	// property constants
	public static final String USER_NAME = "userName";

	public static final String PASSWORD = "password";

	public static final String CREATE_USER_ID = "createUserId";

	public static final String CHANGE_USER_ID = "changeUserId";

	public static final String STATUS = "status";

	private static final String SQL_MD5 = "select md5(?) passWord from dual";

	public LoginDetailsDAO(Session session) {
		super(session);
	}

	public String getMd5Value(String passWord) throws Exception {
		String pass = "";
		ResultSet rs = null;
		PreparedStatement st = null;
		Connection conn = session.connection();
		try {
			st = conn.prepareStatement(SQL_MD5);
			st.setString(1, passWord);
			rs = st.executeQuery();
			while (rs.next()) {
				pass = rs.getString("passWord");
			}
		} catch (SQLException re) {
			log.error("save failed", re);
			throw re;
		} finally {
			if (rs != null)
				rs.close();
			if (st != null)
				st.close();
			if (conn != null)
				conn.close();
		}
		return pass;
	}

	public void save(LoginDetails transientInstance) {
		log.debug("saving LoginDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(LoginDetails persistentInstance) {
		log.debug("deleting LoginDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public LoginDetails findById(java.lang.Integer id) {
		log.debug("getting LoginDetails instance with id: " + id);
		try {
			LoginDetails instance = (LoginDetails) session.get("com.cubepro.login.entity.LoginDetails",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(LoginDetails instance) {
		log.debug("finding LoginDetails instance by example");
		try {
			List results = session.createCriteria("LoginDetails").add(
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
		log.debug("finding LoginDetails instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from LoginDetails as model where model."
					+ propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserName(Object userName) {
		return findByProperty(USER_NAME, userName);
	}

	public List findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List findByCreateUserId(Object createUserId) {
		return findByProperty(CREATE_USER_ID, createUserId);
	}

	public List findByChangeUserId(Object changeUserId) {
		return findByProperty(CHANGE_USER_ID, changeUserId);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findAll() {
		log.debug("finding all LoginDetails instances");
		try {
			String queryString = "from LoginDetails";
			Query queryObject = session.createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public LoginDetails merge(LoginDetails detachedInstance) {
		log.debug("merging LoginDetails instance");
		try {
			LoginDetails result = (LoginDetails) session
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(LoginDetails instance) {
		log.debug("attaching dirty LoginDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(LoginDetails instance) {
		log.debug("attaching clean LoginDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public List getUserDetails(final String userName, final String passWord)
			throws HibernateException, GenericJDBCException, SQLException {
		String queryString = "from LoginDetails as model where model.userName=? and model.password = md5(?) and status = 'ACTIVE' ";
		Query queryObject = session.createQuery(queryString);
		log.debug("validating user while login userName -" + userName);
		queryObject.setParameter(0, userName);
		queryObject.setParameter(1, passWord);
		List userDetails = queryObject.list();
		return userDetails;
	}
}