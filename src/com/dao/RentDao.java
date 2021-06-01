package com.dao;

import java.util.List;

import com.models.Rent;

public interface RentDao {
	public Integer addRent(Rent rent);
	public Integer updateRent(Rent rent);
	public Integer deleteRent(Rent rent);
	public Integer getRentIdByName(String name);
	public List<Rent> getAllRent();
}
