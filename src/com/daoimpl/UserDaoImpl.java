package com.daoimpl;

import java.util.ArrayList;
import java.util.List;

import javax.jws.soap.SOAPBinding.Use;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.dao.UserDao;
import com.models.User;
import com.utils.Database;

public class UserDaoImpl implements UserDao{

	@Override
	public Integer addUser(User user) {
		Integer row = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();

			row = (Integer) session.save(user);

			
			
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
	public Integer updateUser(User user) {
		Integer row = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();

			session.update(user);

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
	public Integer deleteUser(User user) {
		Integer row = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();

			session.remove(user);
			
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
	public Integer getUserIdByName(String name) {
		Integer row = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();

			User user  = (User) session.createQuery("from User where userName='"+name+"'").getSingleResult();

			row = user.getId();
			
			transaction.commit();
			System.out.println("Successfully fetched user id by name.");
			
			session.close();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return row;
	}

	@Override
	public List<User> getAllUser() {
		List<User> allUser = new ArrayList<User>();
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();
			
			int status = 1;
			allUser =  session.createQuery("from User where status='"+status+"'").list();

			
			transaction.commit();
			System.out.println("Successfully fetched all users.");
			
			session.close();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return allUser;
	}

	@Override
	public User getUserById(Integer id) {
		User user = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();

			user  = session.get(User.class, id);
			
			transaction.commit();
			System.out.println("Successfully fetched user id by name.");
			
			session.close();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return user;
	}

	@Override
	public User getUserByEmailandPassword(String email, String password) {
		User user = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();
			Query query = session.createQuery("from User where email=:e and password=:p");
			query.setParameter("e", email);
			query.setParameter("p", password);
			
			user  = (User) query.uniqueResult();

		
			transaction.commit();
			System.out.println("Successfully fetched user id by name.");
			
			session.close();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return user;
	}

}
