package com.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.dao.RentDetailsDao;
import com.models.Rent;
import com.models.RentDetails;
import com.utils.Database;

public class RentDetailsDaoImpl implements RentDetailsDao{

	@Override
	public Integer addRentDetails(RentDetails rentDetails) {
		Integer row = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();

			session.save(rentDetails);

			row = 1;
			
			transaction.commit();
			System.out.println("Successfully saved.");
			
			session.close();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return row;
	}

	@Override
	public Integer updateRentDetails(RentDetails rentDetails) {
		Integer row = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();

			session.update(rentDetails);

			row = 1;
			
			transaction.commit();
			System.out.println("Successfully updated.");
			
			session.close();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return row;
	}

	@Override
	public Integer deleteRentDetails(RentDetails rentDetails) {
		Integer row = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();

			session.remove(rentDetails);

			row = 1;
			
			transaction.commit();
			System.out.println("Successfully deleted.");
			
			session.close();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return row;
	}

	@Override
	public Integer getRentDetailsIdByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RentDetails> getAllRentDetails() {
		List<RentDetails> allRentDetails = new ArrayList<RentDetails>();
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();
			
			int status = 1;
			allRentDetails =  session.createQuery("from RentDetails where status='"+status+"'").list();

			
			transaction.commit();
			System.out.println("Successfully fetched all RentDetails.");
			
			session.close();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return allRentDetails;
	}

}
