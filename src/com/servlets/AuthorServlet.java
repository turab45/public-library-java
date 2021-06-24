package com.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.smartcardio.CardException;

import com.dao.AuthorDao;
import com.dao.CategoryDao;
import com.daoimpl.AuthorDaoImpl;
import com.daoimpl.CategoryDaoImpl;
import com.dto.AuthorDTO;
import com.dto.CategoryDTO;
import com.google.gson.Gson;
import com.models.Author;
import com.models.Category;
import com.transformers.AuthorTranformer;
import com.transformers.CategoryTransformer;

/**
 * Servlet implementation class AuthorServlet
 */
@WebServlet("/AuthorServletAdmin")
public class AuthorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AuthorDao authorDaoImpl = new AuthorDaoImpl();
    AuthorTranformer authorTranformer = new AuthorTranformer();
    CategoryDao categoryDaoImpl = new CategoryDaoImpl();
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
			List<CategoryDTO> allCategory = CategoryTransformer.tocategoryDTO(categoryDaoImpl.getAllCategory());
			
			
			
			
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
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
