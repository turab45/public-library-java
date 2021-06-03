<!DOCTYPE html>
<html>
<head>


<!-- Include all css files  -->

<link href="jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css">
<link href="jtable/themes/metro/blue/jtable.css" rel="stylesheet" type="text/css">

<!-- Include all js files  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="jtable/jquery.jtable.min.js" type="text/javascript"></script>

<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Users</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/fonts/material-icons.min.css">
    
    
    <script src="assets/js/chart.min.js"></script>
<script src="assets/js/bs-init.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="assets/js/theme.js"></script>

</head>
<body>

<div id="wrapper">

		<jsp:include page="navbar.jsp" />

		<div class="container-fluid">
			<div class="card shadow">
				<div class="card-header py-3">
					<p class="text-primary m-0 font-weight-bold">Users</p>
				</div>
				<div class="card-body">

					<div id="UsersTableContainer"></div>

				</div>
			</div>
		</div>
	</div>
	<footer class="bg-white sticky-footer">
		<div class="container my-auto">
			<div class="text-center my-auto copyright">
				<span>Copyright © Brand 2021</span>
			</div>
		</div>
	</footer>
	</div>
	<a class="border rounded d-inline scroll-to-top" href="#page-top"><i
		class="fas fa-angle-up"></i></a>
	</div>



<script type="text/javascript">
    $(document).ready(function () {
        $('#UsersTableContainer').jtable({
            title: 'Users Information',
            actions: {
                listAction: "../AdminServlet?action=getAllBook",
                createAction: './AdminServlet?action=create-book',
                updateAction: '#',
                deleteAction: '#'
            },
            fields: {
                id: {
                    key: true,
                    list: false
                },
                title: {
                    title: 'User Name',
                    type: 'text',
                    width: '20%',
                    create: true
                },
                author: {
                    title: 'Email',
                    type: "email",
                    width: '20%',
                    create: true,
                    
                },
                category: {
                    title: 'Password',
                    type: "text",
                    width: '20%',
                    create: true,
                    create: true
                }
                }
            
        });
        
        $('#UsersTableContainer').jtable('load');
    });
</script>



</body>
</html>