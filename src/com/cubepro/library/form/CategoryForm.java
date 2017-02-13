package com.cubepro.library.form;

import java.util.ArrayList;
import java.util.List;

import com.cubepro.components.CubeProActionForm;
import com.cubepro.hostel.BuildingInf;
import com.cubepro.library.Category;

public class CategoryForm extends CubeProActionForm{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8844212585878335945L;

	/**
	 * 
	 */
	

	private Category category = new Category();
	
	private List<Category> categoryList = new ArrayList<Category>();
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

}
