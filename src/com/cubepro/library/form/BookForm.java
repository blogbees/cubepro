package com.cubepro.library.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.library.Book;
import com.cubepro.library.Category;

public class BookForm extends CubeProActionForm{


	/**
	 * 
	 */
	private static final long serialVersionUID = -8764830695365820063L;

	/**
	 * 
	 */
	private Book bookDetail = new Book();
	
	private List<Book> bookList = new ArrayList<Book>();
	
	private List<Category> categoryList =  new ArrayList<Category>();

	public Book getbookDetail() {
		return bookDetail;
	}

	public void setbookDetail(Book bookDetail) {
		this.bookDetail = bookDetail;
	}

	public List<Book> getbookList() {
		return bookList;
	}

	public void setbookList(List<Book> bookList) {
		this.bookList = bookList;
	}

	public Book getBookDetail() {
		return bookDetail;
	}

	public void setBookDetail(Book bookDetail) {
		this.bookDetail = bookDetail;
	}

	public List<Book> getBookList() {
		return bookList;
	}

	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

}
