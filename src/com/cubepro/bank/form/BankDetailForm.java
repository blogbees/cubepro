package com.cubepro.bank.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.bank.Bank;
import com.cubepro.bank.BankDetails;
import com.cubepro.components.CubeProActionForm;

public class BankDetailForm extends CubeProActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5729505445821961693L;
	
	private BankDetails bankDetail = new BankDetails();
	
	private List<Bank> bankNameList = new ArrayList<Bank>();
	
	private List<BankDetails> bankList = new ArrayList<BankDetails>();
	
	public BankDetails getBankDetail() {
		return bankDetail;
	}

	public void setBankDetail(BankDetails bankDetail) {
		this.bankDetail = bankDetail;
	}

	public List<BankDetails> getBankList() {
		return bankList;
	}

	public void setBankList(List<BankDetails> bankList) {
		this.bankList = bankList;
	}

	public List<Bank> getBankNameList() {
		return bankNameList;
	}

	public void setBankNameList(List<Bank> bankNameList) {
		this.bankNameList = bankNameList;
	}
}
