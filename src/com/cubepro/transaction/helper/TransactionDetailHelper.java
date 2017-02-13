package com.cubepro.transaction.helper;

import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import bsh.StringUtil;

import com.cubepro.general.components.Log;
import com.cubepro.general.database.HibernateSessionFactory;
import com.cubepro.transaction.AssetAndLiabilityDetails;
import com.cubepro.transaction.TransactionDetails;
import com.cubepro.transaction.TransactionMaster;
import com.cubepro.transaction.service.TransactionDetailService;
import com.cubepro.transaction.service.TransactionMasterService;
import com.cubepro.util.StringUtils;

public class TransactionDetailHelper {

	public static final String TRANSACTION_TYPE_CREDIT = "CREDIT";

	public static final String TRANSACTION_TYPE_DEBIT = "DEBIT";

	public List<TransactionDetails> findAll(Session session)
			throws HibernateException {
		List<TransactionDetails> transactionDetails = null;
		try {
			TransactionDetailService transactionDetailsService = new TransactionDetailService();
			transactionDetails = transactionDetailsService.findAll(session);
		} catch (HibernateException e) {
			Log.error(getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return transactionDetails;
	}

	public TransactionDetails findById(Session session, String id)
			throws HibernateException {
		TransactionDetails transactionDetails = null;
		try {
			TransactionDetailService transactionDetailsService = new TransactionDetailService();
			transactionDetails = transactionDetailsService.findById(session,
					Integer.valueOf(id));
		} catch (HibernateException e) {
			Log.error(getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return transactionDetails;
	}

	public Double findCashBalance(TransactionDetails transactionDetails, Session session) throws Exception {
		double balance = 0.0;
		try {
			TransactionDetailService transactionDetailsService = new TransactionDetailService();
			if (StringUtils.isEmpty(transactionDetails
							.getTransactionType())) {
				transactionDetails.setTransactionType("MANAGEMENT A/C");
			}
			balance = transactionDetailsService.findCashBalance(transactionDetails,session);
		} catch (HibernateException e) {
			Log.error(getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return Double.valueOf(balance);
	}

	public Double findBankBalance(TransactionDetails transactionDetails,Session session) throws Exception {
		double balance = 0.0;
		try {
			TransactionDetailService transactionDetailsService = new TransactionDetailService();
			if (StringUtils.isEmpty(transactionDetails
							.getTransactionType())) {
				transactionDetails.setTransactionType("MANAGEMENT A/C");
			}
			balance = transactionDetailsService.findBankBalance(transactionDetails,session);
		} catch (HibernateException e) {
			Log.error(getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return Double.valueOf(balance);
	}

	public List<TransactionMaster> getTransDescList(
			TransactionDetails transactionDetail, Session session)
			throws HibernateException {
		List<TransactionMaster> transactionDetails = null;
		try {
			TransactionMasterService transService = new TransactionMasterService();
			if (StringUtils.isEmpty(transactionDetail.getTransactionCode())
					&& StringUtils.isEmpty(transactionDetail
							.getTransactionType())) {
				transactionDetails = transService.findTransDesc("CASH INCOME",
						"MANAGEMENT A/C", session);
			} else {
				transactionDetails = transService.findTransDesc(
						transactionDetail.getTransactionCode(),
						transactionDetail.getTransactionType(), session);
			}
		} catch (HibernateException e) {
			Log.error(getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return transactionDetails;
	}

	public String getTransDescList(String subType) throws Exception {
		List<TransactionMaster> transactionDetails = null;
		StringBuffer transDetails = new StringBuffer();
		try {
			TransactionMasterService transService = new TransactionMasterService();
			if (StringUtils.isEmpty(subType) == false) {
				transactionDetails = transService.findTransDesc(subType,
						HibernateSessionFactory.getSession());
			}

			for (TransactionMaster transactionMaster : transactionDetails) {
				transDetails.append(transactionMaster.getDesc()).append("~");
			}
		} catch (Exception e) {
			Log.error(getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return transDetails.toString();
	}

	public List<TransactionMaster> getTransDescForBudget(
			TransactionDetails transactionDetail, Session session)
			throws HibernateException {
		List<TransactionMaster> transactionDetails = null;
		try {
			TransactionMasterService transService = new TransactionMasterService();
			transactionDetails = transService.getTransDescForBudget(session,
					transactionDetail.getTransactionSubType());
		} catch (HibernateException e) {
			Log.error(getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return transactionDetails;
	}

	public List<AssetAndLiabilityDetails> findAssetandLiability(Session session)
			throws HibernateException {
		List<AssetAndLiabilityDetails> transactionDetails = null;
		try {
			TransactionDetailService transactionDetailsService = new TransactionDetailService();
			transactionDetails = transactionDetailsService
					.findAssetAndLiability(session);
		} catch (HibernateException e) {
			Log.error(getClass(), "EXCEption occured ...", e);
			throw e;
		}
		return transactionDetails;
	}
	
	public List<AssetAndLiabilityDetails> findBudget(Session session)
	throws HibernateException {
List<AssetAndLiabilityDetails> transactionDetails = null;
try {
	TransactionDetailService transactionDetailsService = new TransactionDetailService();
	transactionDetails = transactionDetailsService
			.findBudget(session);
} catch (HibernateException e) {
	Log.error(getClass(), "EXCEption occured ...", e);
	throw e;
}
return transactionDetails;
}

	public boolean saveTransactionDetails(
			TransactionDetails transactionDetails, Session session)
			throws HibernateException {
		TransactionDetailService transactionDetailsService = new TransactionDetailService();
		transactionDetails.setCreateUserId(Integer.valueOf(1));
		transactionDetails.setCreateDate(new Date());

		if (TRANSACTION_TYPE_CREDIT.equals(transactionDetails
				.getTransactionCode())) {
			transactionDetails.setBalance(transactionDetails.getLastBalance()
					+ transactionDetails.getAmount());
		} else if (TRANSACTION_TYPE_DEBIT.equals(transactionDetails
				.getTransactionCode())) {
			transactionDetails.setBalance(transactionDetails.getLastBalance()
					- transactionDetails.getAmount());
		}
		transactionDetailsService.saveTransactionDetails(session,
				transactionDetails);
		return true;
	}

	private void copy(TransactionDetails from, TransactionDetails to,
			boolean isAmountNegative) {
		to.setTransactionId(Integer.valueOf(0));
		if (isAmountNegative)
			to.setAmount(-(from.getAmount()));
		else
			to.setAmount(from.getAmount());
		to.setPaymentType(from.getPaymentType());
		to.setRemarks(from.getRemarks());
		to.setTransactionCode(from.getTransactionCode());
		to.setTransactionDate(from.getTransactionDate());
		to.setTransactionDesc(from.getTransactionDesc());
		to.setTransactionSubType(from.getTransactionSubType());
		to.setTransactionType(from.getTransactionType());
		to.setCreateUserId(Integer.valueOf(1));
		to.setCreateDate(new Date());
	}

	public boolean remittance(TransactionDetails transactionDetails,
			Session session) throws HibernateException {
		TransactionDetails remittance = new TransactionDetails();
		TransactionDetails bankIncome = new TransactionDetails();
		TransactionDetailService transactionDetailsService = new TransactionDetailService();
		transactionDetails.setCreateUserId(Integer.valueOf(1));
		transactionDetails.setCreateDate(new Date());

		copy(transactionDetails, remittance, true);
		copy(transactionDetails, bankIncome, false);

/*		if (TRANSACTION_TYPE_CREDIT.equals(transactionDetails
				.getTransactionCode())) {
			transactionDetails.setBalance(transactionDetails.getLastBalance()
					+ transactionDetails.getAmount());
		} else if (TRANSACTION_TYPE_DEBIT.equals(transactionDetails
				.getTransactionCode())) {
			transactionDetails.setBalance(transactionDetails.getLastBalance()
					- transactionDetails.getAmount());
		}
		transactionDetailsService.saveTransactionDetails(session,
				transactionDetails);*/
		transactionDetailsService.saveTransactionDetails(session, remittance);
		session.clear();
		bankIncome.setTransactionCode("BANK INCOME");
		transactionDetailsService.saveTransactionDetails(session, bankIncome);
		return true;
	}

	public boolean withdrawal(TransactionDetails transactionDetails,
			Session session) throws HibernateException {
		TransactionDetails withdrawal = new TransactionDetails();
		TransactionDetails cashIncome = new TransactionDetails();
		TransactionDetailService transactionDetailsService = new TransactionDetailService();
		transactionDetails.setCreateUserId(Integer.valueOf(1));
		transactionDetails.setCreateDate(new Date());
		copy(transactionDetails, withdrawal, true);
		copy(transactionDetails, cashIncome, false);

/*		if (TRANSACTION_TYPE_CREDIT.equals(transactionDetails
				.getTransactionCode())) {
			transactionDetails.setBalance(transactionDetails.getLastBalance()
					+ transactionDetails.getAmount());
		} else if (TRANSACTION_TYPE_DEBIT.equals(transactionDetails
				.getTransactionCode())) {
			transactionDetails.setBalance(transactionDetails.getLastBalance()
					- transactionDetails.getAmount());
		}
		transactionDetailsService.saveTransactionDetails(session,
				transactionDetails);*/
		transactionDetailsService.saveTransactionDetails(session, withdrawal);
		session.clear();
		cashIncome.setTransactionCode("CASH INCOME");
		transactionDetailsService.saveTransactionDetails(session, cashIncome);
		return true;
	}
	/*public boolean saveBudgetDetails(
			AssetAndLiabilityDetails transactionDetails, Session session)
			throws HibernateException {
		TransactionDetailService transactionDetailsService = new TransactionDetailService();
		transactionDetailsService.saveBudgetDetails(session,
				transactionDetails);
		return true;
	}*/
	public boolean saveAssetAndLiabilityDetails(
			AssetAndLiabilityDetails transactionDetails, Session session)
			throws HibernateException {
		TransactionDetailService transactionDetailsService = new TransactionDetailService();
		transactionDetailsService.saveAssetAndLiabilityDetails(session,
				transactionDetails);
		return true;
	}

}
