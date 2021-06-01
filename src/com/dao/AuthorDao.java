package com.dao;

import java.util.List;

public interface AuthorDao {
	public Integer addAuthor(AuthorDao author);
	public Integer updateAuthor(AuthorDao author);
	public Integer deleteAuthor(AuthorDao author);
	public Integer getAuthorIdByName(String name);
	public List<AuthorDao> getAllAuthor();

}
