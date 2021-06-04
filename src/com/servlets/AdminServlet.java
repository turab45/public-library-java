package com.servlets;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AuthorDao;
import com.dao.BookDao;
import com.dao.CategoryDao;
import com.daoimpl.AuthorDaoImpl;
import com.daoimpl.BookDaoImpl;
import com.daoimpl.CategoryDaoImpl;
import com.dto.AuthorDTO;
import com.dto.BookDTO;
import com.dto.CategoryDTO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import com.models.Author;
import com.models.Book;
import com.models.Category;
import com.transformers.AuthorTranformer;
import com.transformers.BookDtoTransformer;
import com.transformers.CategoryTransformer;


/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BookDao bookDaoImpl = new BookDaoImpl();
	AuthorDao authorDaoImpl = new AuthorDaoImpl();
	CategoryDao categoryDaoImpl = new CategoryDaoImpl();
	
	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		
		System.out.println("Action = "+action);
		
		Gson gson = new Gson();
		String listData = "";

		switch (action) {
		case "getAllBook":
			List<Book> books = bookDaoImpl.getAllBook();
			
			List<BookDTO> bookDTOs = BookDtoTransformer.toBookDTO(books);
			
			
			
			response.setContentType("application/json");

			String jsonList = gson.toJson(bookDTOs);
			
			System.out.println(jsonList);


			listData = "{\"Result\":\"OK\", \"Records\":" + jsonList + "}";
			
			//System.out.println(listData);

			response.getWriter().print(listData);

			break;

		case "create-book":
			
			Book book = new Book();
			
			book.setTitle(request.getParameter("title"));
			book.setBookRent(Double.parseDouble(request.getParameter("rent")));
			
			
			response.setContentType("javascript/json");

			// Convert java object to json

			//String json = gson.toJson(book);

			// Return json in the format required by jTable plugin

			//listData = "{\"Result\":\"OK\", \"Record\":" + json + "}";

			//response.getWriter().print(listData);

			break;

		case "update-book":

			break;

		case "delete-book":

			break;
		case "getAllAuthors":
			List<Author> authors = authorDaoImpl.getAllAuthor();
			
			List<String> authorStrings = new ArrayList<String>();
			
			for(Author author : authors) {
				authorStrings.add(author.getAuthorName());
			}
			
			
			response.setContentType("application/json");

			jsonList = gson.toJson(authorStrings);
			
			System.out.println(jsonList);


			//listData = "{\"Result\":\"OK\", \"Records\":" + jsonList + "}";
			
			//System.out.println(listData);

			response.getWriter().print(jsonList);

			break;
			
		case "getAllCategories":
			List<Category> categories = categoryDaoImpl.getAllCategory();
			
			List<String> categoryStrings = new ArrayList<String>();
			
			for(Category category : categories) {
				categoryStrings.add(category.getCategoryName());
			}
			
			
			
			response.setContentType("application/json");

			jsonList = gson.toJson(categoryStrings);
			
			System.out.println(jsonList);


			//listData = "{\"Result\":\"OK\", \"Records\":" + jsonList + "}";
			
			//System.out.println(listData);

			response.getWriter().print(jsonList);

			break;

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	


}
