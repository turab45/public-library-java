package com.servlets;

import java.io.IOException;
import java.util.List;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.dao.BookDao;
import com.daoimpl.BookDaoImpl;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import com.models.Book;


/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BookDao bookDaoImpl = new BookDaoImpl();
	
	

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
			
			for(Book b: books) {
				System.out.println(b.getTitle());
				System.out.println(b.getAuthor().getAuthorName());
				System.out.println(b.getCategory().getCategoryName());
			}
			
			response.setContentType("javascript/json");

			String jsonList = gson.toJson(books);

			// Convert java object to json
			JsonElement element = gson.toJsonTree(books, new TypeToken<List<Book>>() {
			}.getType());
			JsonArray jsonArray = element.getAsJsonArray();
			listData = jsonArray.toString();

			// Return json in the format required by jTable plugin

			listData = "{\"Result\":\"OK\", \"Records\":" + listData + "}";

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
