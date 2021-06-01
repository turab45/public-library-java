package com.dao;

import java.util.List;

import com.models.User;

public interface UserDao {
	public Integer addUser(User user);
	public Integer updateUser(User user);
	public Integer deleteUser(User user);
	public Integer getUserIdByName(String name);
	public List<User> getAllUser();
}
