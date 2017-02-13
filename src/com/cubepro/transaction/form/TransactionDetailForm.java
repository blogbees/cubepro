package com.cubepro.transaction.form;

import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.transaction.AssetAndLiabilityDetails;
import com.cubepro.transaction.TransactionDetails;
import com.cubepro.transaction.TransactionMaster;

public class TransactionDetailForm extends CubeProActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2164637532441379489L;
	
	private TransactionDetails transactionDetails = new TransactionDetails();
	
	private AssetAndLiabilityDetails assetAndLiability = new AssetAndLiabilityDetails();
	
	private AssetAndLiabilityDetails budgetEntry = new AssetAndLiabilityDetails();
	
	private List<TransactionDetails> transactionList;
	
	private List<TransactionMaster> transMasterList;
	
	private List<AssetAndLiabilityDetails> assetAndLiabilityList;
	
	private List<AssetAndLiabilityDetails> budgetList;
	
	private Double bankBalance = Double.valueOf(0);
	
	private Double cashBalance = Double.valueOf(0);

	public TransactionDetails getTransactionDetails() {
		return transactionDetails;
	}

	public void setTransactionDetails(TransactionDetails transactionDetails) {
		this.transactionDetails = transactionDetails;
	}

	public List<TransactionDetails> getTransactionList() {
		return transactionList;
	}

	public void setTransactionList(List<TransactionDetails> transactionList) {
		this.transactionList = transactionList;
	}

	public List<AssetAndLiabilityDetails> getAssetAndLiabilityList() {
		return assetAndLiabilityList;
	}

	public void setAssetAndLiabilityList(
			List<AssetAndLiabilityDetails> assetAndLiabilityList) {
		this.assetAndLiabilityList = assetAndLiabilityList;
	}

	public List<AssetAndLiabilityDetails> getBudgetDetailsList() {
		return budgetList;
	}

	public void setBudgetDetailList(
			List<AssetAndLiabilityDetails> budgetList) {
		this.budgetList = budgetList;
	}
	public AssetAndLiabilityDetails getAssetAndLiability() {
		return assetAndLiability;
	}

	public void setAssetAndLiability(AssetAndLiabilityDetails assetAndLiability) {
		this.assetAndLiability = assetAndLiability;
	}
	public AssetAndLiabilityDetails getBudgetEntry(){
		return budgetEntry;
	}
	public void setBudgetEntry(AssetAndLiabilityDetails budgetEntry) {
		this.budgetEntry = budgetEntry;
	}
	public List<TransactionMaster> getTransMasterList() {
		return transMasterList;
	}

	public void setTransMasterList(List<TransactionMaster> transMasterList) {
		this.transMasterList = transMasterList;
	}

	public Double getBankBalance() {
		return bankBalance;
	}

	public void setBankBalance(Double bankBalance) {
		this.bankBalance = bankBalance;
	}

	public Double getCashBalance() {
		return cashBalance;
	}

	public void setCashBalance(Double cashBalance) {
		this.cashBalance = cashBalance;
	}

}
