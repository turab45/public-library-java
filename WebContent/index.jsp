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
						<h2 class="title text-center">Features Books</h2>
						
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
										<li><a style="cursor: pointer;" data-id='<%=allBooks.get(i).getBookId() %>' id='viewDetails'><i class="fa fa-plus-circle"></i>View Details</a></li>
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
										<li><a style="cursor: pointer;" data-id='<%=allBooks.get(i).getBookId() %>' id='viewDetails'><i class="fa fa-plus-circle"></i>View Details</a></li>
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
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="companyinfo">
							<h2><span>e</span>-shopper</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor</p>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe1.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe2.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe3.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe4.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="address">
							<img src="images/home/map.png" alt="" />
							<p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Service</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Online Help</a></li>
								<li><a href="#">Contact Us</a></li>
								<li><a href="#">Order Status</a></li>
								<li><a href="#">Change Location</a></li>
								<li><a href="#">FAQ’s</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Quock Shop</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">T-Shirt</a></li>
								<li><a href="#">Mens</a></li>
								<li><a href="#">Womens</a></li>
								<li><a href="#">Gift Cards</a></li>
								<li><a href="#">Shoes</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Policies</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Terms of Use</a></li>
								<li><a href="#">Privecy Policy</a></li>
								<li><a href="#">Refund Policy</a></li>
								<li><a href="#">Billing System</a></li>
								<li><a href="#">Ticket System</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>About Shopper</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="#">Company Information</a></li>
								<li><a href="#">Careers</a></li>
								<li><a href="#">Store Location</a></li>
								<li><a href="#">Affillate Program</a></li>
								<li><a href="#">Copyright</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2>About Shopper</h2>
							<form action="#" class="searchform">
								<input type="text" placeholder="Your email address" />
								<button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
								<p>Get the most recent updates from <br />our site and be updated your self...</p>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2013 E-SHOPPER Inc. All rights reserved.</p>
					<p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	

  
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>