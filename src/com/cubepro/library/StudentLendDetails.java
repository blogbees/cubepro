package com.cubepro.library;

import com.cubepro.student.StudentDetails;

public class StudentLendDetails {
	private Integer studentLendDetailsId = Integer.valueOf(0);
	private String status;
	private Book bookDetails = new Book();
	private StudentDetails studentDetails = new StudentDetails();
	private String lendDate;
	private String returnDate;
	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

		public StudentDetails getStudentDetails() {
		return studentDetails;
	}

	public void setStudentDetails(StudentDetails studentDetails) {
		this.studentDetails = studentDetails;
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

	public Integer getStudentLendDetailsId() {
		return studentLendDetailsId;
	}

	public void setStudentLendDetailsId(Integer studentLendDetailsId) {
		this.studentLendDetailsId = studentLendDetailsId;
	}

}
