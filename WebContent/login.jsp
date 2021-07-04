<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>E-Shopper - User Login</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    
    
    
</head><!--/head-->

<body>
	<header id="header"><!--header-->
		
		<jsp:include page="navbar.jsp" />
		
	
		
	</header><!--/header-->
	
	<section id="form" style="margin-top: 60px!important;"><!--form-->
		<div class="container">
			<div class="col-md-9 col-lg-12 col-xl-10 text-left align-self-center">
                <div class="card shadow-lg o-hidden border-0 my-5" style="width: 533px;margin: 48px auto; border: 2px solid #ccc; padding: 15px;">
                    <div class="card-body">
                        <div class="p-5">
                            <div class="signup-form"><!--sign up form-->
						<h2 style="text-align: center">User Login</h2>
						<form action="#">
							<input type="email" placeholder="Email Address"/>
							<input type="password" placeholder="Password"/>
							<button type="submit" class="btn btn-default">Sign In</button>
							<div style="margin-top: 5px">
								Don't have an account? <a href="signup.jsp"> Sign Up</a>
							</div>
						</form>
					</div><!--/sign up form-->
                            <div id="alertDiv">
  								
							</div>
                        </div>
                    </div>
                </div>
            </div>
		</div>
	</section><!--/form-->
	
	
	<footer id="footer"><!--Footer-->
		<jsp:include page="footer.jsp"></jsp:include>
	</footer><!--/Footer-->
	

  
    <script src="js/jquery.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>