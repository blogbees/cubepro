package com.cubepro.invoice.helper;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.cubepro.fees.FeesMaster;
import com.cubepro.general.components.Log;
import com.cubepro.invoice.InvoiceDetails;
import com.cubepro.invoice.form.InvoiceDetailForm;
import com.cubepro.invoice.service.InvoiceDetailService;

public class InvoiceDetailHelper {

	public boolean saveInvoiceDetail(InvoiceDetailForm invoiceDetailForm,
			Session session) throws HibernateException,SQLException {
		InvoiceDetailService invoiceDetailService = new InvoiceDetailService();
		String selectedName[] = invoiceDetailForm.getSelectedName().split(",");
		String selectedValue[] = invoiceDetailForm.getSelectedValue()
				.split(",");
		InvoiceDetails invoiceDetails = invoiceDetailForm.getInvoiceDetails();
		if(invoiceDetails.getPaidAmt()==null)
		{
			invoiceDetails.setPaidAmt("0");
			invoiceDetails.setBalanceAmt("0");
		}
		int maxInvNo = invoiceDetailService.getNextInvoiceNo(session);
		int nextInvNo = ++maxInvNo;
		invoiceDetails.setInvoiceNo("INV000"+(nextInvNo));
		
		for (int j = 0; j < selectedName.length; j++) {
			invoiceDetails.setCreateUserId(Integer.valueOf(1));
			invoiceDetails.setCreateDate(new Date());
			invoiceDetails.setInvoiceDate(new Date());
			invoiceDetails.setFeesId(nextInvNo);
			invoiceDetails.setSubType(selectedName[j]);
			invoiceDetails
					.setTotalAmtPaid(Double.parseDouble(selectedValue[j]));
			invoiceDetailService.saveInvoiceDetail(session, invoiceDetails);
		}
		//save transport and invoice as new fees 
		if (invoiceDetails.getTransportFee() != null
				&& invoiceDetails.getTransportFee().length() > 0
				&& Double.parseDouble(invoiceDetails.getTransportFee()) != 0) {
			
			InvoiceDetails transportDetails = new InvoiceDetails();
			transportDetails.setStudentDetails(invoiceDetails.getStudentDetails());
			transportDetails.setFeesType("TRANSPORT FEES");
			transportDetails.setInvoiceNo("INV000"+(nextInvNo));
			transportDetails.setFeesId(nextInvNo);
			transportDetails.setCreateUserId(Integer.valueOf(1));
			transportDetails.setPaidBy(invoiceDetails.getPaidBy());
			transportDetails.setPayBy(invoiceDetails.getPayBy());
			transportDetails.setPaidAmt(invoiceDetails.getTransportFee());
			transportDetails.setStudentType(invoiceDetails.getStudentType());
			transportDetails.setCreateDate(new Date());
			transportDetails.setInvoiceDate(new Date());
			transportDetails.setSubType("TRANSPORT FEES");
			transportDetails.setTotalAmtPaid(Double.parseDouble(invoiceDetails.getTransportFee()));
			invoiceDetailService.saveInvoiceDetail(session, transportDetails);
		}
		
		if (invoiceDetails.getHostelFee() != null
				&& invoiceDetails.getHostelFee().length() > 0
				&& Double.parseDouble(invoiceDetails.getHostelFee()) != 0) {
			InvoiceDetails hostelDetails = new InvoiceDetails();
			hostelDetails.setInvoiceNo("INV000"+(nextInvNo));
			hostelDetails.setStudentDetails(invoiceDetails.getStudentDetails());
			hostelDetails.setFeesType("HOSTEL FEES");
			hostelDetails.setFeesId(nextInvNo);
			hostelDetails.setCreateUserId(Integer.valueOf(1));
			hostelDetails.setPaidBy(invoiceDetails.getPaidBy());
			hostelDetails.setPayBy(invoiceDetails.getPayBy());
			hostelDetails.setPaidAmt(invoiceDetails.getHostelFee());
			hostelDetails.setStudentType(invoiceDetails.getStudentType());
			hostelDetails.setCreateDate(new Date());
			hostelDetails.setInvoiceDate(new Date());
			hostelDetails.setSubType("HOSTEL FEES");
			hostelDetails.setTotalAmtPaid(Double.parseDouble(invoiceDetails.getHostelFee()));
			invoiceDetailService.saveInvoiceDetail(session, hostelDetails);			
		}
		
		return true;
	}

	public List<InvoiceDetails> findByStudent(int studentId, Session session)
			throws HibernateException {
		List<InvoiceDetails> transactionDetails = null;
		try {
			InvoiceDetailService invoiceDetailService = new InvoiceDetailService();
			transactionDetails = invoiceDetailService.findByStudent(studentId,
					session);
		} catch (HibernateException e) {
			Log.error(getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return transactionDetails;
	}

	public boolean isInvoiceExists(String invoiceNo, Session session)
			throws Exception {
		try {
			InvoiceDetailService invoiceDetailService = new InvoiceDetailService();
			return invoiceDetailService.isInvoiceExists(invoiceNo, session);
		} catch (HibernateException e) {
			Log.error(getClass(), "EXCEption occured ...", e);
			throw e;
		} finally {
			session.clear();
		}
	}

	public List<FeesMaster> printInvoice(String invoiceId, int classId,
			Session session) throws Exception {
		List<FeesMaster> transactionDetails = null;
		try {
			InvoiceDetailService invoiceDetailService = new InvoiceDetailService();
			transactionDetails = invoiceDetailService.printInvoice(invoiceId,
					classId, session);
		} catch (HibernateException e) {
			Log.error(getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return transactionDetails;
	}

}
