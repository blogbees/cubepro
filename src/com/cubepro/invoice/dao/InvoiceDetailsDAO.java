package com.cubepro.invoice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;

import com.cubepro.fees.FeesMaster;
import com.cubepro.general.BaseHibernateDAO;
import com.cubepro.invoice.InvoiceDetails;
import com.cubepro.util.StringUtils;

/**
 * Data access object (DAO) for domain model class InvoiceDetails.
 * 
 * @see InvoiceDetails
 * @author MyEclipse Persistence Tools
 */

public class InvoiceDetailsDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(InvoiceDetailsDAO.class);

	// property constants
	public static final String INVOICE_NO = "invoiceNo";

	public static final String TOTAL_AMT_PAID = "totalAmtPaid";

	public static final String CREATE_USER_ID = "createUserId";

	public static final String CHANGE_USER_ID = "changeUserId";
	
	private static final String SQL_PRINT_INVOICE = "SELECT fm.fees_type, fees_name, fees_amt , id.paid_amt, id.conc, id.fine, id.fees_date, id.hostel_fee,id.transport_fee,id.gross_amt, id.scholar_amt FROM fees_master"
			+ " fm left join invoice_details id on fm.fees_type = id.fees_type and fm.fees_name = id.sub_type and "
			+ " invoice_no =? where fm.fees_type in ( select distinct fees_type from invoice_details where invoice_no =? ) and fm.status = 'ACTIVE' and fm.class_id = ? "
			+ " group by fm.fees_type, fees_name, total_amt_paid, conc, fine, id.fees_date UNION "
			+ " SELECT distinct id.fees_type, fees_type fees_name,paid_amt fees_amt ,0.00 paid_amt, id.conc, id.fine, id.fees_date, id.hostel_fee,id.transport_fee,id.gross_amt, id.scholar_amt FROM "
			+ " invoice_details id WHERE invoice_no =? and fees_type in ('HOSTEL FEES','TRANSPORT FEES')"
			+ " group by fees_type, fees_name, total_amt_paid, conc, fine, id.fees_date";
	private static final String SQL_GET_NEXT_INV_NO = "SELECT max(fees_id) next_inv_no from invoice_details";
	
	public InvoiceDetailsDAO(Session session){
		super(session);
	}
	
	public int getMaxInvoiceNo(Connection conn) throws SQLException {
		int invoiceNo = 0;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = conn.prepareStatement(SQL_GET_NEXT_INV_NO);
			rs = st.executeQuery();
			if(rs.next()){
				invoiceNo = rs.getInt("next_inv_no");
			}
		} catch (SQLException re) {
			log.error("save failed", re);
			throw re;
		}finally{
			if(rs!=null)
				rs.close();
				if(st!=null)
				st.close();
			}
			return invoiceNo;
	}
	
	
	public List<FeesMaster> printInvoice(String invoiceId, int classId, Connection conn) throws Exception{
		List<FeesMaster> feesMasterList = new ArrayList<FeesMaster>();
		ResultSet rs = null;
		PreparedStatement st = null;
		try {
			st = conn.prepareStatement(SQL_PRINT_INVOICE);
			st.setString(1, invoiceId);
			st.setString(2, invoiceId);
			st.setInt(3, classId);
			st.setString(4, invoiceId);
			rs = st.executeQuery();
			FeesMaster feesMaster = null;
			while(rs.next()){
				feesMaster = new FeesMaster();
				feesMaster.setFeesType(rs.getString("fees_type"));
				feesMaster.setFeesName(rs.getString("fees_name"));
				feesMaster.setFeesAmt(StringUtils.nullToZeroDouble(rs.getString("fees_amt")));
				feesMaster.setConc(StringUtils.nullToZeroDouble(rs.getString("conc")));
				feesMaster.setFine(StringUtils.nullToZeroDouble(rs.getString("fine")));
				feesMaster.setHostelFee(StringUtils.nullToZeroDouble(rs.getString("hostel_fee")));
				feesMaster.setTransportFee(StringUtils.nullToZeroDouble(rs.getString("transport_fee")));
				feesMaster.setGrossAmt(StringUtils.nullToZeroDouble(rs.getString("gross_amt")));
				feesMaster.setScholarAmt(StringUtils.nullToZeroDouble(rs.getString("scholar_amt")));
				feesMaster.setPaidAmt(StringUtils.nullToZeroDouble(rs.getString("paid_amt")));
				feesMaster.setFeesDate(rs.getString("fees_date"));
				feesMasterList.add(feesMaster);
			}
		} catch (SQLException re) {
			log.error("save failed", re);
			throw re;
		}finally{
			if(rs!=null)
				rs.close();
				if(st!=null)
				st.close();
			}
			return feesMasterList;
	}

	public void save(InvoiceDetails transientInstance) {
		log.debug("saving InvoiceDetails instance");
		try {
			session.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(InvoiceDetails persistentInstance) {
		log.debug("deleting InvoiceDetails instance");
		try {
			session.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public InvoiceDetails findById(java.lang.Integer id) {
		log.debug("getting InvoiceDetails instance with id: " + id);
		try {
			InvoiceDetails instance = (InvoiceDetails) session.get(
					"InvoiceDetails", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(InvoiceDetails instance) {
		log.debug("finding InvoiceDetails instance by example");
		try {
			List results = session.createCriteria("InvoiceDetails")
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
		log.debug("finding InvoiceDetails instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from InvoiceDetails as model where model."
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
	public List<InvoiceDetails> findByStudent(int studentId) {
		log.debug("finding InvoiceDetails instance with property: "
				+ studentId );
		try {
			String queryString = "from com.cubepro.invoice.InvoiceDetails as model where model.studentDetails.studentId = ? ";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, studentId);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByInvoiceNo(Object invoiceNo) {
		return findByProperty(INVOICE_NO, invoiceNo);
	}

	public List findByTotalAmtPaid(Object totalAmtPaid) {
		return findByProperty(TOTAL_AMT_PAID, totalAmtPaid);
	}

	public List findByCreateUserId(Object createUserId) {
		return findByProperty(CREATE_USER_ID, createUserId);
	}

	public List findByChangeUserId(Object changeUserId) {
		return findByProperty(CHANGE_USER_ID, changeUserId);
	}

	public List findAll() {
		log.debug("finding all InvoiceDetails instances");
		try {
			Criteria queryObject = session.createCriteria(
					InvoiceDetails.class)
					.addOrder(Order.desc("invoiceId"));
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public InvoiceDetails merge(InvoiceDetails detachedInstance) {
		log.debug("merging InvoiceDetails instance");
		try {
			InvoiceDetails result = (InvoiceDetails) session.merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(InvoiceDetails instance) {
		log.debug("attaching dirty InvoiceDetails instance");
		try {
			session.saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(InvoiceDetails instance) {
		log.debug("attaching clean InvoiceDetails instance");
		try {
			session.lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}