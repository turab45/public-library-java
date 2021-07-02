package com.dto;

import java.util.List;

public class CategoryDTO extends AbstractEntityDTO{
	
	private String id;
	private String categoryName;
	private List<BookDTO> bookDTOs;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public List<BookDTO> getBookDTOs() {
		return bookDTOs;
	}
	public void setBookDTOs(List<BookDTO> bookDTOs) {
		this.bookDTOs = bookDTOs;
	}
	
	

}
