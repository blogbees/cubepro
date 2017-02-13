package com.cubepro.bank.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.bank.Bank;
import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;

public class BankForm extends CubeProActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4067647211313028139L;

	/**
	 * 
	 */

	private Bank subjectDetail = new Bank();
	
	private List<Bank> bankList = new ArrayList<Bank>();
	
	public Bank getBankDetail() {
		return subjectDetail;
	}

	public void setBankDetail(Bank subjectDetail) {
		this.subjectDetail = subjectDetail;
	}

	public List<Bank> getBankList() {
		return bankList;
	}

	public void setBankList(List<Bank> bankList) {
		this.bankList = bankList;
	}

}
