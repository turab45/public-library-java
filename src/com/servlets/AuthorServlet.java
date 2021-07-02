package com.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.Case;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AuthorDao;
import com.dao.BookDao;
import com.dao.CategoryDao;
import com.dao.UserDao;
import com.daoimpl.AuthorDaoImpl;
import com.daoimpl.BookDaoImpl;
import com.daoimpl.CategoryDaoImpl;
import com.daoimpl.UserDaoImpl;
import com.dto.AuthorDTO;
import com.dto.BookDTO;
import com.dto.CategoryDTO;
import com.dto.UserDTO;
import com.google.gson.Gson;
import com.models.Author;
import com.models.Book;
import com.models.Category;
import com.models.User;
import com.transformers.AuthorTranformer;
import com.transformers.BookDtoTransformer;
import com.transformers.CategoryTransformer;
import com.transformers.UserTransformer;

/**
 * Servlet implementation class AuthorServlet
 */
@MultipartConfig
@WebServlet("/AuthorServletAdmin")
public class AuthorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AuthorDao authorDaoImpl = new AuthorDaoImpl();
    AuthorTranformer authorTranformer = new AuthorTranformer();
    CategoryDao categoryDaoImpl = new CategoryDaoImpl();
    UserDao userDaoImpl = new UserDaoImpl();
    BookDao bookDaoImpl = new BookDaoImpl();
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		System.out.println("Action : "+action);
		
		Gson gson = new Gson();
		String jsonlist = "";
		
		String name = null;
		Integer id = null;
		Integer noOfPublications = null;
		
		switch (action) {
		case "getAll":
			
			List<AuthorDTO> allAuthors = authorTranformer.toAuthorDTO(authorDaoImpl.getAllAuthor());
			
			
			jsonlist = gson.toJson(allAuthors);
			
			System.out.println(jsonlist);
			
			response.setContentType("application/json");
			response.getWriter().print(jsonlist);
			break;

		case "create":
			name = request.getParameter("name");
			noOfPublications = Integer.parseInt(request.getParameter("publications"));
			
			Author author = new Author();
			author.setAuthorName(name);
			author.setNoOfPublications(noOfPublications);
			author.setStatus(1);
			
			authorDaoImpl.addAuthor(author);
			
			author = authorDaoImpl.getAuthorById(authorDaoImpl.getAuthorIdByName(name));
			AuthorDTO authorDTO = authorTranformer.toAuthorDTO(author);
			
			jsonlist = gson.toJson(authorDTO);
			response.setContentType("application/json");
			response.getWriter().print(jsonlist);
			
			break;
			
		case "update":
			id = Integer.parseInt(request.getParameter("id"));
			
			name = request.getParameter("name");
			noOfPublications = Integer.parseInt(request.getParameter("publications"));
			
			author = authorDaoImpl.getAuthorById(id);
			author.setAuthorName(name);
			author.setNoOfPublications(noOfPublications);
			
			
			authorDaoImpl.updateAuthor(author);
			
			
			authorDTO = authorTranformer.toAuthorDTO(author);
			
			jsonlist = gson.toJson(authorDTO);
			response.setContentType("application/json");
			response.getWriter().print(jsonlist);
			
			break;
		case "delete":
			id = Integer.parseInt(request.getParameter("id"));
			
			author = authorDaoImpl.getAuthorById(id);
			
			authorDaoImpl.deleteAuthor(author);
			
			
			authorDTO = authorTranformer.toAuthorDTO(author);
			
			jsonlist = gson.toJson(authorDTO);
			response.setContentType("application/json");
			response.getWriter().print(jsonlist);
			
			break;
			
		case "create-category":
			name = request.getParameter("name");
			
			Category category = new Category();
			category.setCategoryName(name);
			category.setStatus(1);
			
			categoryDaoImpl.addCategory(category);
			
			CategoryDTO categoryDTO = CategoryTransformer.toCategoryDTO(category);
			
			jsonlist = gson.toJson(categoryDTO);
			response.setContentType("application/json");
			response.getWriter().print(jsonlist);
			
			break;
			
		case "getAll-category":
			List<CategoryDTO> allCategory = CategoryTransformer.toCategoryDTO(categoryDaoImpl.getAllCategory());
			
			
			
			
			jsonlist = gson.toJson(allCategory);
			
			System.out.println(allCategory);
			response.setContentType("application/json");
			response.getWriter().print(jsonlist);
			
			break;
		case "update-category":
			id = Integer.parseInt(request.getParameter("id"));
			name = request.getParameter("name");
			
			category = categoryDaoImpl.getCategoryById(id);
			category.setCategoryName(name);
			
			categoryDaoImpl.updateCategory(category);
			
			categoryDTO = CategoryTransformer.toCategoryDTO(category);
			jsonlist = gson.toJson(categoryDTO);
			
			response.setContentType("application/json");
			response.getWriter().print(jsonlist);
			
			break;
		case "delete-category":
			id = Integer.parseInt(request.getParameter("id"));
			
			category = categoryDaoImpl.getCategoryById(id);
			
			categoryDaoImpl.deleteCategory(category);
			
			categoryDTO = CategoryTransformer.toCategoryDTO(category);
			jsonlist = gson.toJson(categoryDTO);
			
			response.setContentType("application/json");
			response.getWriter().print(jsonlist);
			
			break;
			
		case "getAll-users":
			List<UserDTO> allUsers = UserTransformer.toUserDTO(userDaoImpl.getAllUser());
			
			jsonlist = gson.toJson(allUsers);
			
			response.setContentType("application/json");
			response.getWriter().print(jsonlist);
			
			break;
			
		case "create-user":
			name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			User user = new User();
			user.setUserName(name);
			user.setEmail(email);
			user.setPassword(password);
			user.setStatus(1);
			
			userDaoImpl.addUser(user);
			
			user = userDaoImpl.getUserById(userDaoImpl.getUserIdByName(user.getUserName()));
			UserDTO userDTO = UserTransformer.toUserDTO(user);
			
			jsonlist = gson.toJson(userDTO);
			
			response.setContentType("application/json");
			response.getWriter().print(jsonlist);
			
			break;
			
		case "update-user":
			id = Integer.parseInt(request.getParameter("id"));
			name = request.getParameter("name");
			email = request.getParameter("email");
			password = request.getParameter("password");
			
			user = userDaoImpl.getUserById(id);
			user.setUserName(name);
			user.setEmail(email);
			user.setPassword(password);
			
			userDaoImpl.updateUser(user);
			
			
			userDTO = UserTransformer.toUserDTO(user);
			
			jsonlist = gson.toJson(userDTO);
			
			response.setContentType("application/json");
			response.getWriter().print(jsonlist);
			
			break;
		case "delete-user":
			id = Integer.parseInt(request.getParameter("id"));
	
			user = userDaoImpl.getUserById(id);
			
			userDaoImpl.deleteUser(user);
			
			
			userDTO = UserTransformer.toUserDTO(user);
			
			jsonlist = gson.toJson(userDTO);
			
			response.setContentType("application/json");
			response.getWriter().print(jsonlist);
			
			break;
		case "create-book":
			
			String title = request.getParameter("bookTitle");
			Integer noOfCopies = Integer.parseInt(request.getParameter("noOfCopies"));
			Double bookRent = Double.parseDouble(request.getParameter("bookRent"));
			
			author = authorDaoImpl.getAuthorById(authorDaoImpl.getAuthorIdByName(request.getParameter("author")));
			category = categoryDaoImpl.getCategoryById(categoryDaoImpl.getCategoryIdByName(request.getParameter("category")));
			javax.servlet.http.Part part = request.getPart("bookImg");
			
			String filename = part.getSubmittedFileName();
			
			Book book = new Book();
			book.setTitle(title);
			book.setNoOfCopies(noOfCopies);
			book.setBookRent(bookRent);
			book.setBookImg(filename);
			book.setAuthor(author);
			book.setCategory(category);
			book.setStatus(1);
			
			bookDaoImpl.addBook(book);
			
			
			
			// upload...
			// Read the file data
			InputStream iStream = part.getInputStream();
			byte []data = new byte[iStream.available()];
			
			iStream.read(data);
			
			String path = request.getRealPath("uploads")+File.separator+filename;
			
			System.out.println("Real Path Is : "+path);
			
			// write data
			FileOutputStream fileOutputStream = new FileOutputStream(path);
			fileOutputStream.write(data);
			
			
			book = bookDaoImpl.getBookById(bookDaoImpl.getBookIdByName(book.getTitle()));
			BookDTO bookDTO = BookDtoTransformer.toBookDTO(book);
			
			jsonlist = gson.toJson(bookDTO);
			
			response.setContentType("application/json");
			response.getWriter().print(jsonlist);
			
			break;
			
		case "getAll-book":
			List<BookDTO> allDtos = BookDtoTransformer.toBookDTO(bookDaoImpl.getAllBook());
			
			jsonlist = gson.toJson(allDtos);
			System.out.println(jsonlist);
			
			response.setContentType("application/json");
			response.getWriter().print(jsonlist);
			
			break;
		case "update-book":
			
			book = bookDaoImpl.getBookById(Integer.parseInt(request.getParameter("id")));
			
			title = request.getParameter("bookTitle");
			noOfCopies = Integer.parseInt(request.getParameter("noOfCopies"));
			bookRent = Double.parseDouble(request.getParameter("bookRent"));
			
			author = authorDaoImpl.getAuthorById(authorDaoImpl.getAuthorIdByName(request.getParameter("author")));
			category = categoryDaoImpl.getCategoryById(categoryDaoImpl.getCategoryIdByName(request.getParameter("category")));
			
			part = request.getPart("bookImg");
			
			filename = part.getSubmittedFileName();
			
			System.out.println("Title : "+title);
			System.out.println("No of Copies : "+noOfCopies);
			System.out.println("book rent : "+bookRent);
			System.out.println("author : "+author.getAuthorName());
			System.out.println("category : "+category.getCategoryName());
			
			book.setTitle(title);
			book.setNoOfCopies(noOfCopies);
			book.setBookRent(bookRent);
			book.setAuthor(author);
			book.setCategory(category);
			book.setStatus(1);
			
			if (filename != null) {
				book.setBookImg(filename);
			}
			
			bookDaoImpl.updateBook(book);
			
			
			
			// upload...
			// Read the file data
			iStream = part.getInputStream();
			data = new byte[iStream.available()];
			
			iStream.read(data);
			
			path = request.getRealPath("uploads")+File.separator+filename;
			
			System.out.println("Real Path Is : "+path);
			
			// write data
			fileOutputStream = new FileOutputStream(path);
			fileOutputStream.write(data);
			
			bookDTO = BookDtoTransformer.toBookDTO(book);
			
			jsonlist = gson.toJson(bookDTO);
			
			response.setContentType("application/json");
			response.getWriter().print(jsonlist);

			break;
		case "delete-book":
			id = Integer.parseInt(request.getParameter("id"));
	
			book = bookDaoImpl.getBookById(id);
			
			bookDaoImpl.deleteBook(book);
			
			
			bookDTO = BookDtoTransformer.toBookDTO(book);
			
			jsonlist = gson.toJson(bookDTO);
			
			response.setContentType("application/json");
			response.getWriter().print(jsonlist);
			break;
		case "admin-login":
			email = request.getParameter("email");
			password = request.getParameter("password");
			
			user = userDaoImpl.getUserByEmailandPassword(email, password);
			System.out.println("User = "+user);
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
			}else {
				jsonlist = gson.toJson("error");
				
				response.setContentType("application/json");
				response.getWriter().print(jsonlist);
			}
			
			
			break;
		case "logout":
			
				HttpSession session = request.getSession();
				session.invalidate();
				
				jsonlist = gson.toJson("success");
				
				response.setContentType("application/json");
				response.getWriter().print(jsonlist);
			
			
			break;
		}
	}

	/**https://marketplace.eclipse.org/marketplace-client-intro?mpc_install=4552545
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
