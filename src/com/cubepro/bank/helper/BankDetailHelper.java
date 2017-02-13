package com.cubepro.bank.helper;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.cubepro.bank.BankDetails;
import com.cubepro.bank.service.BankDetailService;
import com.cubepro.classes.ClassDetails;
import com.cubepro.general.components.Log;

public class BankDetailHelper {


	public boolean saveBankDetail(BankDetails bankDetails,
			Session session) throws HibernateException {
		BankDetailService bankDetailService = new BankDetailService();
		bankDetailService.saveBankDetail(session, bankDetails);
		return true;
	}

	public boolean deleteBankDetail(String classId, Session session)
			throws HibernateException {
		BankDetailService bankDetailService = new BankDetailService();
		bankDetailService.deleteBankDetail(session, findByBankId(
				Integer.valueOf(classId), session));
		return true;
	}

	public BankDetails findByBankId(int subjectId, Session session)
			throws HibernateException {
		BankDetails bankDetails = null;
		try {

			BankDetailService bankDetailService = new BankDetailService();
			bankDetails = bankDetailService.findByBankId(Integer
					.valueOf(subjectId), session);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return bankDetails;
	}
	
	public List<BankDetails> findAll(Session session) throws HibernateException {
		List<BankDetails> bankDetails = null;
		try {
			BankDetailService bankDetailService = new BankDetailService();
			bankDetails = bankDetailService.findAll(session);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "exception occured e-", e);
			throw e;
		}
		return bankDetails;
	}


}
