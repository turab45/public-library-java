package com.dao;

import java.util.List;

public interface UserDao {
	public Integer addUser(UserDao user);
	public Integer updateUser(UserDao user);
	public Integer deleteUser(UserDao user);
	public Integer getUserIdByName(String name);
	public List<UserDao> getAllUser();
}
