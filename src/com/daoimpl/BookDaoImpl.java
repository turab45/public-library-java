package com.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.dao.BookDao;
import com.models.Author;
import com.models.Book;
import com.utils.Database;

public class BookDaoImpl implements BookDao{

	@Override
	public Integer addBook(Book book) {
		Integer row = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();

			session.save(book);

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
	public Integer updateBook(Book book) {
		Integer row = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();

			session.update(book);

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
	public Integer deleteBook(Book book) {
		Integer row = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();

			session.remove(book);

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
	public Integer getBookIdByName(String name) {
		Integer row = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();

			Book book  = (Book) session.createQuery("from Book b where b.title='"+name+"'").getSingleResult();

			row = book.getBookId();
			
			transaction.commit();
			System.out.println("Successfully fetched book id by name.");
			
			session.close();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return row;
	}

	@Override
	public List<Book> getAllBook() {
		List<Book> allBook = new ArrayList<Book>();
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();
			
			int status = 1;
			allBook =  session.createQuery("from Book where status='"+status+"'").list();

			
			transaction.commit();
			System.out.println("Successfully fetched all books.");
			
			session.close();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return allBook;
	}

	@Override
	public Book getBookById(Integer id) {
		Book book = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();

			book  = session.get(Book.class, id);

			transaction.commit();
			System.out.println("Successfully fetched book by id.");
			
			session.close();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return book;
	}

	@Override
	public Integer getAllBookUsingCount() {
		Integer number = null;
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();
			
			int status = 1;
			number = Integer.parseInt(session.createQuery("select sum(b.noOfCopies) from Book b where b.status='"+status+"'").getSingleResult().toString());

			
			transaction.commit();
			System.out.println("Successfully fetched all books.");
			
			session.close();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return number;
	}

	@Override
	public List<Book> getAllBookofCategory(Integer categoryId) {
		List<Book> allBook = new ArrayList<Book>();
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();
			
			int status = 1;
			allBook =  session.createQuery("from Book where status='"+status+"' and category.id='"+categoryId+"'").list();

			
			transaction.commit();
			System.out.println("Successfully fetched all books.");
			
			session.close();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return allBook;
	}

	@Override
	public List<Book> getAllBookofAuthor(Integer authorId) {
		List<Book> allBook = new ArrayList<Book>();
		try {
			
			SessionFactory factory = Database.getConnection();
			Session session = factory.openSession();

			Transaction transaction = session.beginTransaction();
			
			int status = 1;
			allBook =  session.createQuery("from Book where status='"+status+"' and author.id='"+authorId+"'").list();

			
			transaction.commit();
			System.out.println("Successfully fetched all books of an author.");
			
			session.close();

		} catch (Exception ex) {
			System.out.println("ERROR: " + ex.getMessage());
			ex.printStackTrace();
		}
		return allBook;
	}

}
