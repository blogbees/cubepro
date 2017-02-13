package com.cubepro.transaction.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cubepro.general.components.Log;
import com.cubepro.transaction.AssetAndLiabilityDetails;
import com.cubepro.transaction.TransactionDetails;
import com.cubepro.transaction.dao.AssetAndLiabilityDAO;
import com.cubepro.transaction.dao.TransactionDetailDAO;

public class TransactionDetailService {
	/**
	 * @param session
	 * @return
	 * @throws HibernateException
	 */
	public List<TransactionDetails> findAll(Session session) throws HibernateException {
		List<TransactionDetails> TransactionDetails = null;
		try {

			TransactionDetailDAO transactionDetailDAO = new TransactionDetailDAO(session);
			TransactionDetails = transactionDetailDAO.findAll();

		} catch (HibernateException e) {
			Log.error(getClass(),"EXCEption occured ...", e);
			throw e;
		}
		return TransactionDetails;
	}
	
	public TransactionDetails findById(Session session, Integer id) throws HibernateException {
		TransactionDetails TransactionDetails = null;
		try {

			TransactionDetailDAO transactionDetailDAO = new TransactionDetailDAO(session);
			TransactionDetails = transactionDetailDAO.findById(id);

		} catch (HibernateException e) {
			Log.error(getClass(),"EXCEption occured ...", e);
			throw e;
		}
		return TransactionDetails;
	}
	
	public double findCashBalance(TransactionDetails transactionDetails,Session session) throws Exception {
		double balance = 0.0;
		try {

			TransactionDetailDAO transactionDetailDAO = new TransactionDetailDAO(session);
			balance = transactionDetailDAO.findCashBalance(transactionDetails);

		} catch (HibernateException e) {
			Log.error(getClass(),"EXCEption occured ...", e);
			throw e;
		}
		return balance;
	}
	
	public double findBankBalance(TransactionDetails transactionDetails,Session session) throws Exception {
		double balance = 0.0;
		try {

			TransactionDetailDAO transactionDetailDAO = new TransactionDetailDAO(session);
			balance = transactionDetailDAO.findBankBalance(transactionDetails);

		} catch (HibernateException e) {
			Log.error(getClass(),"EXCEption occured ...", e);
			throw e;
		}
		return balance;
	}

	public boolean saveTransactionDetails(Session session,
			TransactionDetails transactionDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		TransactionDetails transactionDetailsMerged = null;
		try {
			transaction.begin();
			TransactionDetailDAO transactionDetailDAO = new TransactionDetailDAO(session);
			transactionDetailsMerged = (TransactionDetails) session.merge(transactionDetails);
			transactionDetailDAO.save(transactionDetailsMerged);
			if(transactionDetails.getTransactionSubType()!=null && transactionDetails.getTransactionSubType().equals("ASSET") && (transactionDetails.getTransactionId()==null || transactionDetails.getTransactionId().intValue() == 0 )){
				AssetAndLiabilityDetails asset = new AssetAndLiabilityDetails();
				asset.setAssAndLiaId(Integer.valueOf(0));
				asset.setDate(transactionDetails.getTransactionDate());
				asset.setType("ASSET");
				asset.setAmount(String.valueOf(transactionDetails.getAmount()));
				asset.setDesc(transactionDetails.getTransactionDesc());
				AssetAndLiabilityDAO assAndLiaDAO = new AssetAndLiabilityDAO(session);
				assAndLiaDAO.save(asset);

			}
			if(transactionDetails.getTransactionSubType()!=null && transactionDetails.getTransactionSubType().equals("LIABILITY") && (transactionDetails.getTransactionId()==null || transactionDetails.getTransactionId().intValue() == 0 )){
				AssetAndLiabilityDetails liability = new AssetAndLiabilityDetails();
				liability.setAssAndLiaId(Integer.valueOf(0));
				liability.setDate(transactionDetails.getTransactionDate());
				liability.setDesc(transactionDetails.getTransactionDesc());
				liability.setAmount(String.valueOf(transactionDetails.getAmount()));
				liability.setType("LIABILITY");			
				AssetAndLiabilityDAO assAndLiaDAO = new AssetAndLiabilityDAO(session);
				assAndLiaDAO.save(liability);
			}
			
			if(transactionDetails.getTransactionSubType()!=null && transactionDetails.getTransactionSubType().equals("BUDGET") && (transactionDetails.getTransactionId()==null || transactionDetails.getTransactionId().intValue() == 0 )){
				AssetAndLiabilityDetails asset = new AssetAndLiabilityDetails();
				asset.setAssAndLiaId(Integer.valueOf(0));
				asset.setDate(transactionDetails.getTransactionDate());
				asset.setType("BUDGET");
				asset.setSubType(transactionDetails.getTransactionSubType());
				asset.setAmount(String.valueOf(transactionDetails.getAmount()));
				asset.setDesc(transactionDetails.getTransactionDesc());
				AssetAndLiabilityDAO assAndLiaDAO = new AssetAndLiabilityDAO(session);
				assAndLiaDAO.save(asset);

			}

			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}
	public boolean saveAssetAndLiabilityDetails(Session session,
			AssetAndLiabilityDetails TransactionDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		AssetAndLiabilityDetails transactionDetailsMerged = null;
		try {
			transaction.begin();
			AssetAndLiabilityDAO transactionDetailDAO = new AssetAndLiabilityDAO(session);
			transactionDetailsMerged = (AssetAndLiabilityDetails) session.merge(TransactionDetails);
			transactionDetailDAO.save(transactionDetailsMerged);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}
	public List<AssetAndLiabilityDetails> findAssetAndLiability(Session session) throws HibernateException {
		List<AssetAndLiabilityDetails> assetAndLiabilityDAO = null;
		try {

			AssetAndLiabilityDAO transactionDetailDAO = new AssetAndLiabilityDAO(session);
			assetAndLiabilityDAO = transactionDetailDAO.findAll();

		} catch (HibernateException e) {
			Log.error(getClass(),"EXCEption occured ...", e);
			throw e;
		}
		return assetAndLiabilityDAO;
	}
	public List<AssetAndLiabilityDetails> findBudget(Session session) throws HibernateException {
		List<AssetAndLiabilityDetails> budgetDAO = null;
		try {

			AssetAndLiabilityDAO transactionDetailDAO = new AssetAndLiabilityDAO(session);
			budgetDAO = transactionDetailDAO.findAll();

		} catch (HibernateException e) {
			Log.error(getClass(),"EXCEption occured ...", e);
			throw e;
		}
		return budgetDAO;
	}
	public boolean saveBudgetDetails(Session session,
			AssetAndLiabilityDetails TransactionDetails) throws HibernateException {
		boolean status = false;
		Transaction transaction = session.getTransaction();
		AssetAndLiabilityDetails transactionDetailsMerged = null;
		try {
			transaction.begin();
			AssetAndLiabilityDAO transactionDetailDAO = new AssetAndLiabilityDAO(session);
			transactionDetailsMerged = (AssetAndLiabilityDetails) session.merge(TransactionDetails);
			transactionDetailDAO.save(transactionDetailsMerged);
			transaction.commit();
			status = true;
		} catch (HibernateException e) {
			transaction.rollback();
			throw e;
		}
		return status;
	}
}
