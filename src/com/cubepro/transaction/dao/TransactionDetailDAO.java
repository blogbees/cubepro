package com.cubepro.transaction.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;

import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.transaction.AssetAndLiabilityDetails;
import com.cubepro.transaction.TransactionDetails;

public class TransactionDetailDAO extends BaseHibernateDAO {

	private static final Log log = LogFactory.getLog(TransactionDetails.class);

	public TransactionDetailDAO(Session session) {
		super(session);
	}

	public void save(TransactionDetails transientInstance) {
		log.debug("saving TransactionDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TransactionDetails persistentInstance) {
		log.debug("deleting TransactionDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TransactionDetails findById(java.lang.Integer id) {
		log.debug("getting TransactionDetails instance with id: " + id);
		try {
			TransactionDetails instance = (TransactionDetails) session.get(
					"com.cubepro.transaction.TransactionDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TransactionDetails instance) {
		log.debug("finding TransactionDetails instance by example");
		try {
			List results = session.createCriteria("TransactionDetails").add(
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
		log.debug("finding TransactionDetails instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from com.cubepro.transaction.TransactionDetails as model where model."
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
	public List<TransactionDetails> findAll() {
		log.debug("finding all TransactionDetails instances");
		try {
			Criteria queryObject = session.createCriteria(
					TransactionDetails.class)
					.addOrder(Order.desc("transactionId"));
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TransactionDetails merge(TransactionDetails detachedInstance) {
		log.debug("merging TransactionDetails instance");
		try {
			TransactionDetails result = (TransactionDetails) session
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TransactionDetails instance) {
		log.debug("attaching dirty TransactionDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TransactionDetails instance) {
		log.debug("attaching clean TransactionDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public double findCashBalance(TransactionDetails transactionDetails) throws Exception {
		log.debug("attaching clean TransactionDetails instance");
		double balance = 0.0;
		Connection conn = null;
		Statement statement = null;
		ResultSet rst = null;
		try {
			conn = session.connection();
			statement = conn.createStatement();
			rst = statement
					.executeQuery("SELECT SUM(CASE WHEN TRANSACTION_CODE = 'CASH INCOME' and trans_type = '"+transactionDetails.getTransactionType()+"' THEN abs(AMOUNT) ELSE 0 END) - SUM(CASE WHEN TRANSACTION_CODE = 'CASH EXPENSE' and trans_type = '"+transactionDetails.getTransactionType()+"' THEN abs(AMOUNT) ELSE 0 END) BALANCE FROM transaction_details t");
			while (rst.next()) {
				balance = rst.getDouble("BALANCE");
			}
			log.debug("attach successful");
		} catch (SQLException re) {
			log.error("attach failed", re);
			throw re;
		} finally {
			rst.close();
			statement.close();
			conn.close();
		}
		return balance;
	}
	
	public double findBankBalance(TransactionDetails transactionDetails) throws Exception {
		log.debug("attaching clean TransactionDetails instance");
		double balance = 0.0;
		Connection conn = null;
		Statement statement = null;
		ResultSet rst = null;
		try {
			conn = session.connection();
			statement = conn.createStatement();
			rst = statement
					.executeQuery("SELECT SUM(CASE WHEN TRANSACTION_CODE = 'BANK INCOME' and trans_type = '"+transactionDetails.getTransactionType()+"' THEN abs(AMOUNT) ELSE 0 END) - SUM(CASE WHEN TRANSACTION_CODE = 'BANK EXPENSE' and trans_type = '"+transactionDetails.getTransactionType()+"' THEN abs(AMOUNT) ELSE 0 END) BALANCE FROM transaction_details t");
			while (rst.next()) {
				balance = rst.getDouble("BALANCE");
			}
			log.debug("attach successful");
		} catch (SQLException re) {
			log.error("attach failed", re);
			throw re;
		} finally {
			rst.close();
			statement.close();
			conn.close();
		}
		return balance;
	}

}
