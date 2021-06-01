package com.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "rent_details")
public class RentDetails extends AbstractEntity{
	@ManyToOne
	@JoinColumn(name = "user_id")
	@Column(name = "user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "rent_id")
	@Column(name = "rent_id")
	private Rent rent;
	
	@ManyToOne
	@JoinColumn(name = "book_id")
	@Column(name = "book_id")
	private Book book;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Rent getRent() {
		return rent;
	}

	public void setRent(Rent rent) {
		this.rent = rent;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
	
	
	


}
