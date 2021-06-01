package com.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.dao.RentDao;
import com.models.Category;
import com.models.Rent;
import com.utils.Database;

public class RentDaoImpl implements RentDao{

	@Override
	public Integer addRent(Rent rent) {
		Integer row = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();

			session.remove(rent);

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
	public Integer updateRent(Rent rent) {
		Integer row = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();

			session.remove(rent);

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
	public Integer deleteRent(Rent rent) {
		Integer row = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();

			session.remove(rent);

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
	public Integer getRentIdByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Rent> getAllRent() {
		List<Rent> allRent = new ArrayList<Rent>();
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();
			
			int status = 1;
			allRent =  session.createQuery("from Rent where status='"+status+"'").list();

			
			transaction.commit();
			System.out.println("Successfully fetched all categories.");
			
			session.close();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return allRent;
	}

}
