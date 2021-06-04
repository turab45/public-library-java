<!DOCTYPE html>
<html>
<head>


<!-- Include all css files  -->

<link href="jquery-ui/jquery-ui.min.css" rel="stylesheet"
	type="text/css">
<link href="jtable/themes/metro/blue/jtable.css" rel="stylesheet"
	type="text/css">

<!-- Include all js files  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="jtable/jquery.jtable.min.js" type="text/javascript"></script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Books</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
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
		$(document)
				.ready(
						function() {


							// Read a page's GET URL variables and return them as an associative array.
							function getVars(url)
							{
							    var formData = new FormData();
							    var split;
							    $.each(url.split("&"), function(key, value) {
							        split = value.split("=");
							        formData.append(split[0], decodeURIComponent(split[1].replace(/\+/g, " ")));
							    });

							    return formData;
							}

							// Variable to store your files
							var files;

							$( document ).delegate('#input-image','change', prepareUpload);

							// Grab the files and set them to our variable
							function prepareUpload(event)
							{
							    files = event.target.files;
							}
														
										 
								}

							$('#BooksTableContainer')
									.jtable(
											{
												title : 'Books Information',
												actions : {
													listAction : "../AdminServlet?action=getAllBook",
													createAction : "../AdminServlet?action=create-book",
													
													
									                updateAction: function (postData) {
									                    var formData = getVars(postData);

									                    if($('#input-image').val() !== ""){
									                        formData.append("userfile", $('#input-image').get(0).files[0]);
									                    }

									                    return $.Deferred(function ($dfd) {
									                        $.ajax({
									                            url: '../AdminServlet?action=update-book',
									                            type: 'POST',
									                            dataType: 'json',
									                            data: formData,
									                            processData: false, // Don't process the files
									                            contentType: false, // Set content type to false as jQuery will tell the server its a query string request
									                            success: function (data) {
									                                $dfd.resolve(data);
									                                $('#table-container').jtable('load');
									                            },
									                            error: function () {
									                                $dfd.reject();
									                            }
									                        });
									                    });
									                },
													deleteAction : './AdminServlet?action=deleteBook'
												},
												fields : {
													id : {
														key : true,
														list : false
													},
													Photo : {
														title : "Image",
														width : '20%',
														edit : false,
														create : false,
														display : function(data) {
															return '<img src=../Book_Images/' + data.record.bookImg + ' height="30px" width="30px"/>';
															//return "img";
														}
													},
													title : {
														title : 'Title',
														width : '20%',
														create : true
													},
													author : {
														title : 'Author',
														type : "multiselectddl",
														width : '20%',
														create : true,
														options :'http://localhost:8080/public-library/AdminServlet?action=getAllAuthors',
														display: function(data){
															return data.record.author.authorName;
															}
														
													},
													category : {
														title : 'Category',
														type : "multiselectddl",
														width : '20%',
														create : true,
														options :'http://localhost:8080/public-library/AdminServlet?action=getAllCategories',
														create : true,
														display: function(data){
															return data.record.category.categoryName;
															}
													},
													bookRent : {
														title : 'Rent',
														type : 'numeric',
														width : '20%',
														create : true
													},
													noOfCopies : {
														title : 'Copies',
														width : '20%',
														create : true
													},
													bookImg : {
														title : 'Image',
														list : false,
														create : true,
														edit : true,
														input : function(data) {
															 html = '<input type ="file" id="input-image" name="userfile" accept="image/*" />';
															return html;
															
														},
														onSuccess: uploadFile()
													}
												}

											});

							
							
							$('#BooksTableContainer').jtable('load');
						});
	</script>



</body>
</html>