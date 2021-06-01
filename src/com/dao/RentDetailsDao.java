package com.dao;

import java.util.List;

import com.models.RentDetails;

public interface RentDetailsDao {
	public Integer addRentDetails(RentDetails rentDetails);
	public Integer updateRentDetails(RentDetails rentDetails);
	public Integer deleteRentDetails(RentDetails rentDetails);
	public Integer getRentDetailsIdByName(String name);
	public List<RentDetails> getAllRentDetails();
}
