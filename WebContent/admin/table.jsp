
<jsp:include page="head.jsp" />


<body id="page-top">
	<div id="wrapper">

		<jsp:include page="navbar.jsp" />

		<div class="container-fluid">
			<div class="card shadow">
				<div class="card-header py-3">
					<p class="text-primary m-0 font-weight-bold">Books</p>
				</div>
				<div class="card-body">

					<div id="BooksTableContainer"></div>

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
		$(document).ready(function() {
			$('#BooksTableContainer').jtable({
				title : 'Books',
				actions : {
					listAction : '#',
					createAction : '#',
					updateAction : '#',
					deleteAction : '#'
				},
				fields : {
					id : {
						key : true,
						list : false
					},
					name : {
						title : 'Name',
						width : '40%',
						create : true
					},
					email : {
						title : 'Email',
						width : '20%',
						create : true
					},
					contact : {
						title : 'Contact',
						width : '20%',
						create : true
					},
					gender : {
						title : 'Gender',
						width : '20%',
						create : true
					},
					country : {
						title : 'Country',
						width : '20%',
						create : true
					}
				}

			});

			$('#BooksTableContainer').jtable('load');
		});
	</script>
	<jsp:include page="scripts.jsp" />
</body>

</html>