<%@page import="com.models.User"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="ISO-8859-1">  
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Book</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"
	integrity="">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	integrity="">
<link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css"
	integrity="">
<link rel="stylesheet" href="assets/fonts/ionicons.min.css" integrity="">
<link rel="stylesheet" href="assets/fonts/material-icons.min.css"
	integrity="">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="" crossorigin="anonymous">


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
					<p class="text-primary m-0 font-weight-bold">Book</p>
				</div>
				<div class="card-body">





					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModal" data-whatever="@mdo">
						<b>NEW</b>
					</button>
					<div class="table-responsive-sm">
						<table class="table">
							<table class="table table-sm" id="authorTable">
								<thead>
									<tr>
										<th scope="col">Image</th>
										<th scope="col">Title</th>
										<th scope="col">Author</th>
										<th scope="col">Category</th>
										<th scope="col">No of Copies</th>
										<th scope="col">Rent</th>
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





	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="" crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="" crossorigin="anonymous"></script>
	<script src="bootstrap-alerts/jquery.bootstrap-growl.min.js"
		integrity=""></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.5.2/bootbox.min.js"
		integrity=""></script>

	<script>
		$(document).ready(function() {

							$('#updateBtn').hide();

							

							$.ajax({

										url : '../AuthorServletAdmin?action=getAll-book',
										type : 'GET',
										success : function(data) {
											for (var i = 0; i < data.length; i++) {
												$('#authorTable').append('<tr id='+data[i].bookId+'><td data-target=image><img src="../uploads/'+data[i].bookImg+'" width="60px" height="60px"></img></td><td data-target=title>'+ data[i].title+'</td><td data-target=author>'+data[i].author.authorName+ '</td><td data-target=category>'+data[i].category.categoryName+ '</td><td data-target=noOfCopies>'+data[i].noOfCopies+ '</td><td data-target=bookRent>'+data[i].bookRent+ '</td><td> <button type="button" data-id='+data[i].bookId+' class="edit btn btn-primary btn-sm">Edit</button><button id="deleteBtn" type="button" data-id='+data[i].bookId+' class="delete btn btn-danger btn-sm">Delete</button></td></tr>');

												//console.log(data[i].authorName);

											}

										}

									});


							$.ajax({
								url:'../AuthorServletAdmin?action=getAll',
								type: "GET",
								success:function(data){
									for (var i = 0; i < data.length; i++) {
										$('#author').append('<option value="'+data[i].authorName+'" selected="">'+data[i].authorName+'</option>');
									}
									}
								

								});

							$.ajax({
								url:'../AuthorServletAdmin?action=getAll-category',
								type: "GET",
								success:function(data){
									for (var i = 0; i < data.length; i++) {
										$('#category').append('<option value="'+data[i].categoryName+'" selected="">'+data[i].categoryName+'</option>');
									}
									},
								

								});

							$('#closeBtn').on('click', function() {
								$('#author_form')[0].reset();

							});

							$('#author_form').on('submit',function(event) {
								event.preventDefault();
								
												var f = new FormData(this);

												console.log(f);

												$.ajax({
															url : '../AuthorServletAdmin?action=create-book',
															type : "POST",
															data: f,
															success : function(data) {

																$('#exampleModal').modal('hide');
																$('#author_form')[0].reset();

																$('#authorTable').append('<tr id='+data.bookId+'><td data-target=image><img src="../uploads/'+data.bookImg+'" width="60px" height="60px"></img></td><td data-target=title>'+ data.title+'</td><td data-target=author>'+data.author.authorName+ '</td><td data-target=category>'+data.category.categoryName+ '</td><td data-target=noOfCopies>'+data.noOfCopies+ '</td><td data-target=bookRent>'+data.bookRent+ '</td><td> <button type="button" data-id='+data.bookId+' class="edit btn btn-primary btn-sm">Edit</button><button id="deleteBtn" type="button" data-id='+data.bookId+' class="delete btn btn-danger btn-sm">Delete</button></td></tr>');

																$.bootstrapGrowl(
																				"Book has been added successfully.",
																				{
																					ele : 'body', // which element to append to
																					type : 'success', // (null, 'info', 'error', 'success')
																					offset : {
																						from : 'top',
																						amount : 30
																					}, // 'top', or 'bottom'
																					align : 'center', // ('left', 'right', or 'center')
																					width : 'auto', // (integer, or 'auto')
																					delay : 4000,
																					allow_dismiss : true,
																					stackup_spacing : 10
																				// spacing between consecutively stacked growls.
																				});

															},
															processData: false,
															contentType: false

														});
											});

							$(document).on('click','.edit',function() {
												$('#addBtn').hide();
												$('#updateBtn').show();

												var currentRow = $(this).closest("tr");

												var id = $(this).data('id'); // get current row 1st TD value
												var title = currentRow.find("td:eq(1)").text(); // get current row 2nd TD
												var author = currentRow.find("td:eq(2)").text(); // get current row 3rd TD
												var category = currentRow.find("td:eq(3)").text();
												var noOfCopies = currentRow.find("td:eq(4)").text();
												var rent = currentRow.find("td:eq(5)").text();
												
												

												$('#book_title').val(title);
												$('#book_rent').val(rent);
												$('#no_of_copies').val(noOfCopies);
												$('#author').val(author);
												$('#category').val(category);

												$('#exampleModal').modal('show');

												$(document).on('click','#updateBtn',function() {

													
													
																	title = $('#book_title').val();
																	rent = $('#book_rent').val();
																	noOfCopies = $('#no_of_copies').val();
																	author = $('#author option:selected').val();
																	category = $('#category option:selected').val();
																	var fileToUpload = $('#fileUpload').prop('files')[0];

																	
																	
																	var f = new FormData();
																	f.append("id",id);
																	f.append("bookTitle",title);
																	f.append("bookRent",rent);
																	f.append("noOfCopies",noOfCopies);
																	f.append("author",author);
																	f.append("category",category);
																	f.append("bookImg",fileToUpload);
																	
																	$.ajax({
																		url : '../AuthorServletAdmin?action=update-book&&id='+id,
																				type : "POST",
																				data:f,
																				success : function(data) {

																					$('#exampleModal').modal('hide');
																					$('#author_form')[0].reset();

																					$('#'+ id).children('td[data-target=image]').html('<img src="../uploads/'+data.bookImg+'" width="60px" height="60px"></img>');
																					$('#'+ id).children('td[data-target=title]').text(data.title);
																					$('#'+ id).children('td[data-target=bookRent]').text(data.bookRent);
																					$('#'+ id).children('td[data-target=noOfCopies]').text(data.noOfCopies);
																					$('#'+ id).children('td[data-target=author]').text(data.author.authorName);
																					$('#'+ id).children('td[data-target=category]').text(data.category.categoryName);
																					$('#'+ id).children('td[data-target=update-date]').text(data.updateDate);

																					$.bootstrapGrowl("Book has been updated successfully.",
																									{ele : 'body', // which element to append to
																										type : 'success', // (null, 'info', 'error', 'success')
																										offset : {
																											from : 'top',
																											amount : 30
																										}, // 'top', or 'bottom'
																										align : 'center', // ('left', 'right', or 'center')
																										width : 'auto', // (integer, or 'auto')
																										delay : 4000,
																										allow_dismiss : true,
																										stackup_spacing : 10
																									// spacing between consecutively stacked growls.
																									});

																				},
																				processData: false,
																				   contentType: false,

																			});
																});

											});

							$(document).on('click','.delete',function() {
												var id = $(this).data('id');

												bootbox.confirm({
															title : "Delete Book.",
															message : "Do you want to delete this book?.",
															buttons : {
																cancel : {
																	label : '<i class="fa fa-times"></i> Cancel'
																},
																confirm : {
																	label : '<i class="fa fa-check"></i> Confirm'
																}
															},
															callback : function(result) {
																if (result == true) {
																	$.ajax({
																		url : '../AuthorServletAdmin?action=delete-book&&id='+ id,
																				type : 'Post',
																				success : function(data,status) {
																					if (status == 'success') {

																						$('#'+ id).remove();
																						$.bootstrapGrowl(
																										"Book has been deleted successfully.",
																										{
																											ele : 'body', // which element to append to
																											type : 'success', // (null, 'info', 'error', 'success')
																											offset : {
																												from : 'top',
																												amount : 30
																											}, // 'top', or 'bottom'
																											align : 'center', // ('left', 'right', or 'center')
																											width : 'auto', // (integer, or 'auto')
																											delay : 4000,
																											allow_dismiss : true,
																											stackup_spacing : 10
																										// spacing between consecutively stacked growls.
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
				<h5 class="modal-title" id="exampleModalLabel">Add New Book</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post" id="author_form">
				<div class="modal-body">


					<div class="form-group">
						<label for="recipient-name" class="col-form-label">Book
							Title</label> <input type="text" class="form-control" name='bookTitle' id="book_title">
						<label for="recipient-name" class="col-form-label">Book
							Rent</label> <input type="number" class="form-control" name='bookRent' id="book_rent">
						<label for="recipient-name" class="col-form-label">No of
							Copies</label> <input type="number" name='noOfCopies' class="form-control"
							id="no_of_copies">
					</div>
					<div class="form-group">
						<label for="recipient-name" class="col-form-label"
							data-toggle="tooltip" data-placement="top" title="Author">Author</label>
						<div>
							<select id="author" name="author" class="form-control">

							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="recipient-name" class="col-form-label"
							data-toggle="tooltip" data-placement="top" name="category" title="Category">Category</label>
						<div>
							<select id="category" name="category" class="form-control">

							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="recipient-name" class="col-form-label"
							data-toggle="tooltip" data-placement="top">Upload Image</label>
						<div class="custom-file">
							<input type="file" id='fileUpload' name='bookImg' class="custom-file-input"
								id="inputGroupFile04"> <label class="custom-file-label"
								for="inputGroupFile04">Choose file</label>
						</div>
					</div>



				</div>
				<div class="modal-footer">
				<button type="button" id="closeBtn" class="btn btn-secondary"
					data-dismiss="modal">Close</button>
				<button type="submit" id="addBtn" class="btn btn-primary">Save</button>
				<button type="button" id="updateBtn" class="btn btn-primary">Update</button>
			</div>
			</form>
			

		</div>
	</div>
</div>

<%}else{
	response.sendRedirect("login.jsp");
}%>

