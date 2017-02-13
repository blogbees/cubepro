package com.cubepro.library.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.library.Book;
import com.cubepro.library.Category;
import com.cubepro.library.StudentLendDetails;
import com.cubepro.student.StudentDetails;

public class StudentLendDetailsForm extends CubeProActionForm {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2971812313606475754L;
	private List<Book> bookList = new ArrayList<Book>();
	private List<Category> categoryList = new ArrayList<Category>();
	private List<StudentLendDetails> lendDetailsList = new ArrayList<StudentLendDetails>();
	private StudentLendDetails lendDetailsDetail = new StudentLendDetails();
	private StudentDetails studentDetails = new StudentDetails();
	private Integer studentId;
	private Integer categoryId;

	public List<Book> getBookList() {
		return bookList;
	}

	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}

	public List<StudentLendDetails> getLendDetailsList() {
		return lendDetailsList;
	}

	public void setLendDetailsList(List<StudentLendDetails> lendDetailsList) {
		this.lendDetailsList = lendDetailsList;
	}

	public StudentLendDetails getLendDetailsDetail() {
		return lendDetailsDetail;
	}

	public void setLendDetailsDetail(StudentLendDetails lendDetailsDetail) {
		this.lendDetailsDetail = lendDetailsDetail;
	}

	public StudentDetails getStudentDetails() {
		return studentDetails;
	}

	public void setStudentDetails(StudentDetails studentDetails) {
		this.studentDetails = studentDetails;
	}

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
}
