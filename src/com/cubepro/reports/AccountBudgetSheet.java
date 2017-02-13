package com.cubepro.reports;

public class AccountBudgetSheet {
	
	private String desc= "";
	
	private String prevBudget = "";
	
	private String actuals= "";
	
	private String est1= "";

	private String est2= "";
	
	private String nextBudget= "";

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getPrevBudget() {
		return prevBudget;
	}

	public void setPrevBudget(String prevBudget) {
		this.prevBudget = prevBudget;
	}

	public String getActuals() {
		return actuals;
	}

	public void setActuals(String actuals) {
		this.actuals = actuals;
	}

	public String getEst1() {
		return est1;
	}

	public void setEst1(String est1) {
		this.est1 = est1;
	}

	public String getEst2() {
		return est2;
	}

	public void setEst2(String est2) {
		this.est2 = est2;
	}

	public String getNextBudget() {
		return nextBudget;
	}

	public void setNextBudget(String nextBudget) {
		this.nextBudget = nextBudget;
	}
}
