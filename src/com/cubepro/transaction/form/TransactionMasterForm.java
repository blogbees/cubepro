package com.cubepro.transaction.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.transaction.TransactionMaster;

public class TransactionMasterForm extends CubeProActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6257455496594224656L;

	private TransactionMaster transactionMaster = new TransactionMaster();

	private List<TransactionMaster> transMasterList = new ArrayList<TransactionMaster>();

	public TransactionMaster getTransactionMaster() {
		return transactionMaster;
	}

	public void setTransactionMaster(TransactionMaster transactionMaster) {
		this.transactionMaster = transactionMaster;
	}

	public List<TransactionMaster> getTransMasterList() {
		return transMasterList;
	}

	public void setTransMasterList(List<TransactionMaster> transMasterList) {
		this.transMasterList = transMasterList;
	}
	

	
}