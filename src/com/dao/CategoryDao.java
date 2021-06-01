package com.dao;

import java.util.List;

public interface CategoryDao {
	public Integer addCategory(CategoryDao category);
	public Integer updateCategory(CategoryDao category);
	public Integer deleteCategory(CategoryDao category);
	public Integer getCategoryIdByName(String name);
	public List<CategoryDao> getAllCategory();
}
