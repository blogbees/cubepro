package com.cubepro.transaction;

import java.util.Date;

public class TransactionDetails {

	private Integer transactionId;

	private String transactionCode;

	private String transactionDesc;
	
	private String transactionDate;
	
	private String transactionSubType;
	
	private String transactionType;
	
	private String regBookNo;

	private Double amount = Double.valueOf(0);

	private Double balance = Double.valueOf(0);;

	private Date createDate;

	private Integer createUserId;

	private Date changeDate;

	private Integer changeUserId;
	
	private String paymentType;
	
	private String remarks;
	
	private String debitNar;
	private String creditNar;

	private Double lastBalance = Double.valueOf(0);;

	public Integer getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(Integer transactionId) {
		this.transactionId = transactionId;
	}

	public String getTransactionCode() {
		return transactionCode;
	}

	public void setTransactionCode(String transactionCode) {
		this.transactionCode = transactionCode;
	}

	public String getTransactionDesc() {
		return transactionDesc;
	}

	public void setTransactionDesc(String transactionDesc) {
		this.transactionDesc = transactionDesc;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		if (amount == null) {
			amount = Double.valueOf(0);
		}
		this.amount = amount;
	}

	public Double getBalance() {
		return balance;
	}

	public void setBalance(Double balance) {
		if (balance == null) {
			balance = Double.valueOf(0);
		}
		this.balance = balance;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}

	public Date getChangeDate() {
		return changeDate;
	}

	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}

	public Integer getChangeUserId() {
		return changeUserId;
	}

	public void setChangeUserId(Integer changeUserId) {
		this.changeUserId = changeUserId;
	}

	public Double getLastBalance() {
		return lastBalance;
	}

	public void setLastBalance(Double lastBalance) {
		if (lastBalance == null) {
			lastBalance = Double.valueOf(0);
		}
		this.lastBalance = lastBalance;
	}

	public String getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(String transactionDate) {
		this.transactionDate = transactionDate;
	}

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public String getTransactionSubType() {
		return transactionSubType;
	}

	public void setTransactionSubType(String transactionSubType) {
		this.transactionSubType = transactionSubType;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getRegBookNo() {
		return regBookNo;
	}

	public void setRegBookNo(String regBookNo) {
		this.regBookNo = regBookNo;
	}

	public String getDebitNar() {
		return debitNar;
	}

	public void setDebitNar(String debitNar) {
		this.debitNar = debitNar;
	}

	public String getCreditNar() {
		return creditNar;
	}

	public void setCreditNar(String creditNar) {
		this.creditNar = creditNar;
	}

}