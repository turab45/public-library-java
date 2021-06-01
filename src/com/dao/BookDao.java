package com.dao;

import java.util.List;

public interface BookDao {
	public Integer addBook(BookDao book);
	public Integer updateBook(BookDao book);
	public Integer deleteBook(BookDao book);
	public Integer getBookIdByName(String name);
	public List<BookDao> getAllBook();
}
