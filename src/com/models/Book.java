package com.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "book")
public class Book extends AbstractEntity{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "book_id")
	private Integer bookId;
	
	@Column(name = "title")
	private String title;
	
	@ManyToOne
	@JoinColumn(name = "author_id")
	private Author author;
	
	@Column(name = "book_img")
	private String bookImg;
	
	@Column(name = "no_of_copies")
	private Integer noOfCopies;
	
	@Column(name = "book_rent")
	private Double bookRent;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;
	

	
	

}
