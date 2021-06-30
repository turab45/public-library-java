						<%@page import="com.models.Author"%>
<%@page import="com.daoimpl.AuthorDaoImpl"%>
<%@page import="com.dao.AuthorDao"%>
<%@page import="com.daoimpl.BookDaoImpl"%>
<%@page import="com.dao.BookDao"%>
<%@page import="com.models.Category"%>
<%@page import="com.models.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.daoimpl.CategoryDaoImpl"%>
<%@page import="com.dao.CategoryDao"%>
<%
	CategoryDao categoryBrandDaoImpl = new CategoryDaoImpl();
	AuthorDao authorBrandDaoImp = new AuthorDaoImpl();
	
	List<Category> alCategories = categoryBrandDaoImpl.getAllCategory();
	List<Author> alAuthor = authorBrandDaoImp.getAllAuthor();
%>
						
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							
							<% for(Category category: alCategories){ %>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#" id='category'><%=category.getCategoryName() %></a></h4>
								</div>
							</div>
							
							<%} %>
						</div><!--/category-products-->
						
<!-- 						This is books section -->
						<div class="brands_products"><!--brands_products-->
							<h2>Authors</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
								<%for(Author author: alAuthor){ %>
									<li><a href="#"> <span class="pull-right">(<%=author.getNoOfPublications() %>)</span><%=author.getAuthorName() %></a></li>
								<%} %>
								</ul>
							</div>
						</div><!--/brands_products-->
						