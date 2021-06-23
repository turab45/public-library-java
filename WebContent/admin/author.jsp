<!DOCTYPE html>
<html>
<head>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Author</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
<link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/fonts/ionicons.min.css">
<link rel="stylesheet" href="assets/fonts/material-icons.min.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

	<div id="wrapper">

		<jsp:include page="navbar.jsp" />

		<div class="container-fluid">
			<div class="card shadow">
				<div class="card-header py-3">
					<p class="text-primary m-0 font-weight-bold">Author</p>
				</div>
				<div class="card-body">





					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModal" data-whatever="@mdo">New</button>
					<div class="table-responsive-sm">
						<table class="table">
							<table class="table table-sm" id="authorTable">
								<thead>
									<tr>
										
										<th scope="col">Name</th>
										<th scope="col">Publications</th>
										<th scope="col">Created By</th>
										<th scope="col">Create Date</th>
										<th scope="col">Updated By</th>
										<th scope="col">update Date</th>
										<th scope="col" colspan="2">Actions</th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</table>
					</div>



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







	<script>
		$(document).ready(function(){

	
			$('#updateBtn').hide();

			$.ajax({

						url : '../AuthorServletAdmin?action=getAll',
						type : 'GET',
						success : function(data) {
							for (var i = 0; i < data.length; i++) {
								$('#authorTable').append('<tr id='+data[i].id+'><td data-target=name>'+ data[i].authorName+'</td><td data-target=publications>'+data[i].noOfPublications+ '</td><td>'+data[i].createdBy+ '</td><td>'+data[i].createDate+ '</td><td>'+data[i].updatedBy+ '</td><td data-target=publications>'+data[i].updateDate+ '</td><td> <a class="edit" data-id='+data[i].id+' title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a><a class="delete" data-id='+data[i].id+' title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a></td>');

								console.log(data[i].authorName);

								}

						}

					});
			
			});
	</script>

</body>
</html>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Create Author</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post" id="author_form">
				<div class="modal-body">


					<div class="form-group">
						<label for="recipient-name" class="col-form-label">Author
							Name</label> <input type="text" class="form-control" id="author_name">
					</div>
					<div class="form-group">
						<label for="recipient-name" class="col-form-label"
							data-toggle="tooltip" data-placement="top"
							title="No of publications">Publications</label> <input
							type="number" class="form-control" id="publications">
					</div>



				</div>
			</form>
			<div class="modal-footer">
				<button type="button" id="closeBtn" class="btn btn-secondary"
					data-dismiss="modal">Close</button>
				<button type="button" id="addBtn" class="btn btn-primary">Save</button>
				<button type="button" id="updateBtn" class="btn btn-primary">Update</button>
			</div>

		</div>
	</div>
</div>