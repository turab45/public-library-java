package com.dao;

import java.util.List;

import com.models.Category;

public interface CategoryDao {
	public Integer addCategory(Category category);
	public Integer updateCategory(Category category);
	public Integer deleteCategory(Category category);
	public Integer getCategoryIdByName(String name);
	public List<Category> getAllCategory();
}
