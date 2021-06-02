package com.models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "author")
public class Author extends AbstractEntity{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "author_id")
	private Integer id;
	
	@Column(name = "author_name")
	private String authorName;
	
	@Column(name = "no_of_publications")
	private Integer noOfPublications;
	
	@OneToMany(mappedBy="author", fetch=FetchType.EAGER)
	private List<Book> books;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public Integer getNoOfPublications() {
		return noOfPublications;
	}
	public void setNoOfPublications(Integer noOfPublications) {
		this.noOfPublications = noOfPublications;
	}
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	
	
	
	
	
	
	
}
