<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Public Library - Admin Login</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
</head>

<body class="bg-gradient-primary">
    <div class="container text-left">
        <div class="row justify-content-center">
            <div class="col-md-9 col-lg-12 col-xl-10 text-left align-self-center">
                <div class="card shadow-lg o-hidden border-0 my-5" style="width: 533px;margin: 48px auto;">
                    <div class="card-body p-0">
                        <div class="p-5">
                            <div class="text-center">
                                <h4 class="text-dark mb-4">Admin Login</h4>
                            </div>
                            <form class="user_form">
                                <div class="form-group"><input id="email" class="form-control form-control-user" type="email" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter Email Address..." name="email"></div>
                                <div class="form-group"><input id="password" class="form-control form-control-user" type="password" id="exampleInputPassword" placeholder="Password" name="password"></div><button class="btn btn-primary btn-block text-white btn-user" type="submit">Login</button>
                                <hr>
                                <hr>
                            </form>
                            <div id="alertDiv">
  								
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>
    <script src="bootstrap-alerts/jquery.bootstrap-growl.min.js" integrity=""></script>
	
    
    
    <script>
	
$(document).ready(function(){


	$(".user_form").on('submit', function(event){

		event.preventDefault();

		var email = $('#email').val();
		var pass = $('#password').val();

		$.ajax({

			url:'../AuthorServletAdmin?action=admin-login&&email='+email+'&&password='+pass,
			type:"POST",
			success: function(data){
				if(data === 'error'){
					console.log('inside error')
					$.bootstrapGrowl("Incorrect username and password.",
							{
								ele : 'body', // which element to append to
								type : 'info', // (null, 'info', 'error', 'success')
								offset : {
									from : 'bottom',
									amount : 30
								}, // 'top', or 'bottom'
								align : 'left', // ('left', 'right', or 'center')
								width : 'auto', // (integer, or 'auto')
								delay : 4000,
								allow_dismiss : true,
								stackup_spacing : 10
							// spacing between consecutively stacked growls.
							});
					}else {
						window.location="index.jsp";
					}
				
				},
				error: function(data){
					if(data === 'error'){
						console.log('inside error 2')
						}
					
					}
			});

		});



});
    </script>
</body>

</html>