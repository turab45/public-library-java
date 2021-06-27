<%@page import="com.models.User"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Category</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" integrity="">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" integrity="">
<link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css" integrity="">
<link rel="stylesheet" href="assets/fonts/ionicons.min.css" integrity="">
<link rel="stylesheet" href="assets/fonts/material-icons.min.css" integrity="">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="" crossorigin="anonymous">
	

</head>
<body>
<%
User u = (User) session.getAttribute("user");
if(u != null){
	
%>

	<div id="wrapper">

		<jsp:include page="navbar.jsp" />

		<div class="container-fluid">
			<div class="card shadow">
				<div class="card-header py-3">
					<p class="text-primary m-0 font-weight-bold">CAtegory</p>
				</div>
				<div class="card-body">





					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModal" data-whatever="@mdo"><b>NEW</b></button>
					<div class="table-responsive-sm">
						<table class="table">
							<table class="table table-sm" id="authorTable">
								<thead>
									<tr>
										
										<th scope="col">Category</th>
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
	</div>





<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="" crossorigin="anonymous"></script>
<script src="bootstrap-alerts/jquery.bootstrap-growl.min.js" integrity=""></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.5.2/bootbox.min.js" integrity=""></script>

	<script>
		$(document).ready(function(){

	
			$('#updateBtn').hide();
			

			$.ajax({

						url : '../AuthorServletAdmin?action=getAll-category',
						type : 'GET',
						success : function(data) {
							for (var i = 0; i < data.length; i++) {
								$('#authorTable').append('<tr id='+data[i].id+'><td data-target=name>'+ data[i].categoryName+'</td><td>'+data[i].createdBy+ '</td><td>'+data[i].createDate+ '</td><td>'+data[i].updatedBy+ '</td><td>'+data[i].updateDate+ '</td><td> <button type="button" data-id='+data[i].id+' class="edit btn btn-primary btn-sm">Edit</button><button id="deleteBtn" type="button" data-id='+data[i].id+' class="delete btn btn-danger btn-sm">Delete</button></td></tr>');

								//console.log(data[i].authorName);

								}

						}

					});


			$('#closeBtn').on('click', function(){
				$('#author_form')[0].reset();
				
			});

		$('#addBtn').on('click', function(){
			var name = $('#category_name').val();
			
			$.ajax({
				url:'../AuthorServletAdmin?action=create-category&&name='+name,
				type: "POST",
				success:function(data){

					$('#exampleModal').modal('hide');
					$('#author_form')[0].reset();
					
					$('#authorTable').append('<tr id='+data.id+'><td data-target=name>'+ data.categoryName+'</td><td>'+data.createdBy+ '</td><td>'+data.createDate+ '</td><td>'+data.updatedBy+ '</td><td>'+data.updateDate+ '</td><td> <button type="button" data-id='+data.id+' class="edit btn btn-primary btn-sm">Edit</button><button id="deleteBtn" type="button" data-id='+data.id+' class="delete btn btn-danger btn-sm">Delete</button></td></tr>');

					$.bootstrapGrowl("Category has been added successfully.", {
						  ele: 'body', // which element to append to
						  type: 'success', // (null, 'info', 'error', 'success')
						  offset: {from: 'top', amount: 30}, // 'top', or 'bottom'
						  align: 'center', // ('left', 'right', or 'center')
						  width: 'auto', // (integer, or 'auto')
						  delay: 4000,
						  allow_dismiss: true,
						  stackup_spacing: 10 // spacing between consecutively stacked growls.
						});
							
							
							
							
					},

				});
		});



		$(document).on('click', '.edit',function(){
			$('#addBtn').hide();
			$('#updateBtn').show();
			
					var currentRow = $(this).closest("tr");
					

					var id = $(this).data('id'); // get current row 1st TD value
					var name = currentRow.find("td:eq(0)")
							.text(); // get current row 2nd TD

					console.log('Name '+name)

					$('#category_name').val(name);
					
					
					$('#exampleModal').modal('show');

					$(document).on('click','#updateBtn', function(){
						name = $('#category_name').val();
						$.ajax({
							url:'../AuthorServletAdmin?action=update-category&&id='+id+'&&name='+name,
							type: "POST",
							success:function(data){

								$('#exampleModal').modal('hide');
								$('#author_form')[0].reset();
								
										$('#'+id).children('td[data-target=name]').text(data.categoryName);
										$('#'+id).children('td[data-target=update-date]').text(data.updateDate);


										$.bootstrapGrowl("Category has been updated successfully.", {
											  ele: 'body', // which element to append to
											  type: 'success', // (null, 'info', 'error', 'success')
											  offset: {from: 'top', amount: 30}, // 'top', or 'bottom'
											  align: 'center', // ('left', 'right', or 'center')
											  width: 'auto', // (integer, or 'auto')
											  delay: 4000,
											  allow_dismiss: true,
											  stackup_spacing: 10 // spacing between consecutively stacked growls.
											});
										
										
										
								},

							});
					});

			});

		$(document).on('click', '.delete',function(){
			var id = $(this).data('id');
			
			bootbox.confirm({
			    title: "Delete Category.",
			    message: "Do you want to delete this category?.",
			    buttons: {
			        cancel: {
			            label: '<i class="fa fa-times"></i> Cancel'
			        },
			        confirm: {
			            label: '<i class="fa fa-check"></i> Confirm'
			        }
			    },
			    callback: function (result) {
			        if(result == true){
			        	$.ajax({

							url: '../AuthorServletAdmin?action=delete-category&&id='+id,
							type: 'Post',
							success:function(data, status){
								if(status == 'success'){
									
									$('#'+id).remove();
									$.bootstrapGrowl("Category has been deleted successfully.", {
										  ele: 'body', // which element to append to
										  type: 'success', // (null, 'info', 'error', 'success')
										  offset: {from: 'top', amount: 30}, // 'top', or 'bottom'
										  align: 'center', // ('left', 'right', or 'center')
										  width: 'auto', // (integer, or 'auto')
										  delay: 4000,
										  allow_dismiss: true,
										  stackup_spacing: 10 // spacing between consecutively stacked growls.
										});
									}
					
								}		

							});
				        }
			    }
			});
			
		
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
				<h5 class="modal-title" id="exampleModalLabel">Create Category</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post" id="author_form">
				<div class="modal-body">


					<div class="form-group">
						<label for="recipient-name" class="col-form-label">Category
							</label> <input type="text" class="form-control" id="category_name">
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

<%}else{
	response.sendRedirect("login.jsp");
}%>

