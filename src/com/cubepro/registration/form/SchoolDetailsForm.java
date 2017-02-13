package com.cubepro.registration.form;

import org.apache.struts.upload.FormFile;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.registration.SchoolDetails;

public class SchoolDetailsForm extends CubeProActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4565631480669894203L;
	SchoolDetails schoolDetails = new SchoolDetails();
	
	private FormFile schoolPhoto;

	public SchoolDetails getSchoolDetails() {
		return schoolDetails;
	}

	public void setSchoolDetails(SchoolDetails schoolDetails) {
		this.schoolDetails = schoolDetails;
	}

	public FormFile getSchoolPhoto() {
		return schoolPhoto;
	}

	public void setSchoolPhoto(FormFile schoolPhoto) {
		this.schoolPhoto = schoolPhoto;
	}

}
