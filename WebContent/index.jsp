<!DOCTYPE html>
<%@page import="com.models.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.daoimpl.BookDaoImpl"%>
<%@page import="com.dao.BookDao"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | Public Library</title>
     
     <jsp:include page="allCss.jsp" />
     
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>

<%
	BookDao bookDaoImpl = new BookDaoImpl();

	List<Book> allBooks = bookDaoImpl.getAllBook();

%>

	<header id="header"><!--header-->
		
		<jsp:include page="navbar.jsp" />
	
		
	</header><!--/header-->
	
	
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						
					<jsp:include page="category-component.jsp" />
						
						<div class="shipping text-center"><!--shipping-->
							<img src="images/home/shipping.jpg" alt="" />
						</div><!--/shipping-->
					
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Featured Books</h2>
						
						<% for(int i=0; i<9; i++){ %>
						<!-- Book card start -->
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="uploads/<%=allBooks.get(i).getBookImg() %>" alt="" style="width: 210px;height: 250px;"/>
											<h2>Rs: <%=allBooks.get(i).getBookRent() %></h2>
											<p><%=allBooks.get(i).getTitle() %></p>
											<button data-id='<%=allBooks.get(i).getBookId() %>' id="addToCart" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
										</div>
<!-- 										<div class="product-overlay"> -->
<!-- 											<div class="overlay-content"> -->
<%-- 												<h2>Rs: <%=allBooks.get(i).getBookRent() %></h2> --%>
<%-- 												<p><%=allBooks.get(i).getTitle() %></p> --%>
<%-- 												<button data-id='<%=allBooks.get(i).getBookId() %>' id="addToCart" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button> --%>
<!-- 											</div> -->
<!-- 										</div> -->
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a style="cursor: pointer;" data-id='<%=allBooks.get(i).getBookId() %>' id='addToWishlist'><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a style="cursor: pointer;" href="book-details.jsp?id=<%=allBooks.get(i).getBookId() %>" id='viewDetails'><i class="fa fa-plus-circle"></i>View Details</a></li>
									</ul>
								</div>
							</div>
						</div>
<!-- 						Book card end -->
						<%} %>
						
						
						
						
					</div><!--features_items-->
					
					<div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">recommended Books</h2>
						
						<% for(int i=0; i<6; i++){ %>
						<!-- Book card start -->
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
											<img src="uploads/<%=allBooks.get(i).getBookImg() %>" alt="" style="width: 210px;height: 250px;"/>
											<h2>Rs: <%=allBooks.get(i).getBookRent() %></h2>
											<p><%=allBooks.get(i).getTitle() %></p>
											<button data-id='<%=allBooks.get(i).getBookId() %>' id="addToCart" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
										</div>
<!-- 										<div class="product-overlay"> -->
<!-- 											<div class="overlay-content"> -->
<%-- 												<h2>Rs: <%=allBooks.get(i).getBookRent() %></h2> --%>
<%-- 												<p><%=allBooks.get(i).getTitle() %></p> --%>
<%-- 												<button data-id='<%=allBooks.get(i).getBookId() %>' id="addToCart" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button> --%>
<!-- 											</div> -->
<!-- 										</div> -->
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a style="cursor: pointer;" data-id='<%=allBooks.get(i).getBookId() %>' id='addToWishlist'><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a style="cursor: pointer;" href="book-details.jsp?id=<%=allBooks.get(i).getBookId() %>" id='viewDetails'><i class="fa fa-plus-circle"></i>View Details</a></li>
									</ul>
								</div>
							</div>
						</div>
<!-- 						Book card end -->
						<%} %>
					</div><!--/recommended_items-->
					
				</div>
			</div>
		</div>
	</section>
	
	<footer id="footer"><!--Footer-->
		<jsp:include page="footer.jsp"></jsp:include>
		
	</footer><!--/Footer-->
	

  
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/cart.js"></script>
</body>
</html>