package com.cubepro.invoice.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.fees.FeesMaster;
import com.cubepro.general.components.Log;
import com.cubepro.invoice.InvoiceDetails;
import com.cubepro.invoice.dao.InvoiceDetailsDAO;

public class InvoiceDetailService {
	public boolean saveInvoiceDetail(Session session,
			InvoiceDetails InvoiceDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		InvoiceDetails invoiceDetailsMerged = null;
		try {
			transaction.begin();
			InvoiceDetailsDAO transactionDetailDAO = new InvoiceDetailsDAO(session);
			invoiceDetailsMerged = (InvoiceDetails) session.merge(InvoiceDetails);
			transactionDetailDAO.save(invoiceDetailsMerged);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}finally{
			session.clear();
		}
		return status;
	}
	
	public List<InvoiceDetails> findByStudent(int studentId, Session session) throws HibernateException {
		List<InvoiceDetails> invoiceDetails = null;
		try {

			InvoiceDetailsDAO transactionDetailDAO = new InvoiceDetailsDAO(session);
			invoiceDetails = transactionDetailDAO.findByStudent(studentId);

		} catch (HibernateException e) {
			Log.error(getClass(),"EXCEption occured ...", e);
			throw e;
		}
		return invoiceDetails;
	}
	
	public int getNextInvoiceNo(Session session) throws HibernateException,SQLException {
		int maxInvoiceNo;
		Connection conn = null;
		try {

			InvoiceDetailsDAO transactionDetailDAO = new InvoiceDetailsDAO(session);
			conn = session.connection();
			maxInvoiceNo = transactionDetailDAO.getMaxInvoiceNo(conn);

		} catch (HibernateException e) {
			Log.error(getClass(),"EXCEption occured ...", e);
			throw e;
		}finally{
			if(conn!=null)
			conn.close();
		}
		return maxInvoiceNo;
	}
		

	public List<FeesMaster> printInvoice(String invoiceId,int classId, Session session) throws Exception {
		List<FeesMaster> invoiceDetails = null;
		Connection conn = session.connection();
		try {
			InvoiceDetailsDAO transactionDetailDAO = new InvoiceDetailsDAO(session);
			invoiceDetails = transactionDetailDAO.printInvoice(invoiceId,classId,conn);

		} catch (HibernateException e) {
			Log.error(getClass(),"EXCEption occured ...", e);
			throw e;
		}finally{
			if(conn!=null)
				conn.close();
		}
		return invoiceDetails;
	}
	
	public boolean isInvoiceExists(String invoiceNo, Session session) throws Exception {
			boolean isInvoiceExists = false;
			List invoiceDetails  = null;
		try {
			InvoiceDetailsDAO transactionDetailDAO = new InvoiceDetailsDAO(session);
			invoiceDetails = transactionDetailDAO.findByInvoiceNo(invoiceNo);
			if(invoiceDetails!=null && invoiceDetails.size()>0){
				isInvoiceExists = true;
			}
		} catch (HibernateException e) {
			Log.error(getClass(),"EXCEption occured ...", e);
			throw e;
		}finally{
			session.clear();
		}
		return isInvoiceExists;
	}
}
