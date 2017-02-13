package com.cubepro.library.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.library.Book;
import com.cubepro.library.Category;
import com.cubepro.library.StaffLendDetails;
import com.cubepro.staff.StaffDetails;

public class StaffLendDetailsForm extends CubeProActionForm{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Book> bookList = new ArrayList<Book>();
	private List<StaffLendDetails> lendDetailsList = new ArrayList<StaffLendDetails>();
	private StaffLendDetails lendDetailsDetail = new StaffLendDetails();
	private StaffDetails staffDetails = new StaffDetails();
	private Integer staffId;
	private Integer categoryId;
	private List<Category> categoryList = new ArrayList<Category>();
	public List<Book> getBookList() {
		return bookList;
	}
	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}
	public List<StaffLendDetails> getLendDetailsList() {
		return lendDetailsList;
	}
	public void setLendDetailsList(List<StaffLendDetails> lendDetailsList) {
		this.lendDetailsList = lendDetailsList;
	}
	public StaffLendDetails getLendDetailsDetail() {
		return lendDetailsDetail;
	}
	public void setLendDetailsDetail(StaffLendDetails lendDetailsDetail) {
		this.lendDetailsDetail = lendDetailsDetail;
	}
	public StaffDetails getStaffDetails() {
		return staffDetails;
	}
	public void setStaffDetails(StaffDetails staffDetails) {
		this.staffDetails = staffDetails;
	}
	public Integer getStaffId() {
		return staffId;
	}
	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public List<Category> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

}
