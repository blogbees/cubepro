package com.cubepro.library;

import com.cubepro.staff.StaffDetails;

public class StaffLendDetails {
	private Integer staffLendDetailsId = Integer.valueOf(0);
	private String status;
	private Book bookDetails = new Book();
	private StaffDetails staffDetails = new StaffDetails();
	private String lendDate;
	private String returnDate;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public StaffDetails getStaffDetails() {
		return staffDetails;
	}

	public void setStaffDetails(StaffDetails staffDetails) {
		this.staffDetails = staffDetails;
	}

	public Book getBookDetails() {
		return bookDetails;
	}

	public void setBookDetails(Book bookDetails) {
		this.bookDetails = bookDetails;
	}

	public String getLendDate() {
		return lendDate;
	}

	public void setLendDate(String lendDate) {
		this.lendDate = lendDate;
	}

	public String getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}

	public Integer getStaffLendDetailsId() {
		return staffLendDetailsId;
	}

	public void setStaffLendDetailsId(Integer staffLendDetailsId) {
		this.staffLendDetailsId = staffLendDetailsId;
	}

}
