package com.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AuthorDao;
import com.daoimpl.AuthorDaoImpl;
import com.dto.AuthorDTO;
import com.google.gson.Gson;
import com.models.Author;
import com.transformers.AuthorTranformer;

/**
 * Servlet implementation class AuthorServlet
 */
@WebServlet("/AuthorServletAdmin")
public class AuthorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AuthorDao authorDaoImpl = new AuthorDaoImpl();
    AuthorTranformer authorTranformer = new AuthorTranformer();
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
