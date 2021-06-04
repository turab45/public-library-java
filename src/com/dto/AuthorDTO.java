package com.dto;

import java.util.List;



public class AuthorDTO extends AbstractEntityDTO{
	
	private String id;
	private String authorName;
	private String noOfPublications;
	private List<BookDTO> bookDTOs;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getNoOfPublications() {
		return noOfPublications;
	}
	public void setNoOfPublications(String noOfPublications) {
		this.noOfPublications = noOfPublications;
	}
	public List<BookDTO> getBookDTOs() {
		return bookDTOs;
	}
	public void setBookDTOs(List<BookDTO> bookDTOs) {
		this.bookDTOs = bookDTOs;
	}
	
	
	

}
