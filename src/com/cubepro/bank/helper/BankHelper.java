package com.cubepro.bank.helper;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.cubepro.bank.Bank;
import com.cubepro.bank.service.BankService;
import com.cubepro.general.components.Log;

public class BankHelper {

	public boolean saveBankDetail(Bank subjectDetails,
			Session session) throws HibernateException {
		BankService subjectDetailService = new BankService();
		subjectDetailService.saveBankDetail(session, subjectDetails);
		return true;
	}

	public boolean deleteBankDetail(String classId, Session session)
			throws HibernateException {
		BankService subjectDetailService = new BankService();
		subjectDetailService.deleteBankDetail(session, findByBankId(
				Integer.valueOf(classId), session));
		return true;
	}

	public Bank findByBankId(int subjectId, Session session)
			throws HibernateException {
		Bank subjectDetails = null;
		try {

			BankService subjectDetailService = new BankService();
			subjectDetails = subjectDetailService.findByBankId(Integer
					.valueOf(subjectId), session);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return subjectDetails;
	}
	
	public List<Bank> findAll(Session session) throws HibernateException {
		List<Bank> subjectDetails = null;
		try {
			BankService subjectDetailService = new BankService();
			subjectDetails = subjectDetailService.findAll(session);
		} catch (HibernateException e) {
			Log.error(this.getClass(), "exception occured e-", e);
			throw e;
		}
		return subjectDetails;
	}


}
