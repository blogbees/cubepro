package com.cubepro.fees.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.classes.ClassDetails;
import com.cubepro.components.CubeProActionForm;
import com.cubepro.fees.FeesMaster;

public class FeesForm extends CubeProActionForm {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1788303845137319474L;

	private FeesMaster feesMaster = new FeesMaster();
	
	private List<FeesMaster> feesMasterList = new ArrayList<FeesMaster>();
	
	private List<ClassDetails> classList = new ArrayList<ClassDetails>();

	public FeesMaster getFeesMaster() {
		return feesMaster;
	}

	public void setFeesMaster(FeesMaster feesMaster) {
		this.feesMaster = feesMaster;
	}

	public List<FeesMaster> getFeesMasterList() {
		return feesMasterList;
	}

	public void setFeesMasterList(List<FeesMaster> feesMasterList) {
		this.feesMasterList = feesMasterList;
	}

	public List<ClassDetails> getClassList() {
		return classList;
	}

	public void setClassList(List<ClassDetails> classList) {
		this.classList = classList;
	}

}
