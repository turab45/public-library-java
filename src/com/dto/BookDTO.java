package com.dto;

public class BookDTO extends AbstractEntityDTO{
	
	private String bookId;
	private String title;
	private AuthorDTO author;
	private String bookImg;
	private String noOfCopies;
	private String bookRent;
	private CategoryDTO category;
	
	
	public String getBookId() {
		return bookId;
	}
	public void setBookId(String bookId) {
		this.bookId = bookId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public AuthorDTO getAuthor() {
		return author;
	}
	public void setAuthor(AuthorDTO author) {
		this.author = author;
	}
	public String getBookImg() {
		return bookImg;
	}
	public void setBookImg(String bookImg) {
		this.bookImg = bookImg;
	}
	public String getNoOfCopies() {
		return noOfCopies;
	}
	public void setNoOfCopies(String noOfCopies) {
		this.noOfCopies = noOfCopies;
	}
	public String getBookRent() {
		return bookRent;
	}
	public void setBookRent(String bookRent) {
		this.bookRent = bookRent;
	}
	public CategoryDTO getCategory() {
		return category;
	}
	public void setCategory(CategoryDTO category) {
		this.category = category;
	}
	
	
	
	
	
}
