package com.models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "rent")
public class Rent extends AbstractEntity{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "rent_id")
	private Integer rentId;
	
	@Column(name = "rent_date")
	private java.util.Date rentDate;
	@Column(name = "due_date")
	private java.util.Date dueDate;
	
	@Column(name = "total_rent")
	private Double totalRent;
	@Column(name = "remarks")
	private String remarks;
	
	
	private List<Rent> rents;
	
	
	public Integer getRentId() {
		return rentId;
	}
	public void setRentId(Integer rentId) {
		this.rentId = rentId;
	}
	public java.util.Date getRentDate() {
		return rentDate;
	}
	public void setRentDate(java.util.Date rentDate) {
		this.rentDate = rentDate;
	}
	public java.util.Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(java.util.Date dueDate) {
		this.dueDate = dueDate;
	}
	public Double getTotalRent() {
		return totalRent;
	}
	public void setTotalRent(Double totalRent) {
		this.totalRent = totalRent;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public List<Rent> getRents() {
		return rents;
	}
	public void setRents(List<Rent> rents) {
		this.rents = rents;
	}
	
	
	
}
