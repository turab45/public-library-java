package com.dao;

import java.util.List;

import com.models.Book;

public interface BookDao {
	public Integer addBook(Book book);
	public Integer updateBook(Book book);
	public Integer deleteBook(Book book);
	public Integer getBookIdByName(String name);
	public Book getBookById(Integer id);
	public List<Book> getAllBook();
	public Integer getAllBookUsingCount();
	public List<Book> getAllBookofCategory(Integer categoryId);
	public List<Book> getAllBookofAuthor(Integer authorId);
}
