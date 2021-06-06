<!DOCTYPE html>
<%@page import="com.transformers.BookDtoTransformer"%>
<%@page import="com.daoimpl.BookDaoImpl"%>
<%@page import="com.dao.BookDao"%>
<%@page import="com.dto.BookDTO"%>
<%@page import="java.util.List"%>
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



<link rel="stylesheet" href="//cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">



<%
		BookDao bookDaoImpl = new BookDaoImpl();
		List<BookDTO> bookDTOs = BookDtoTransformer.toBookDTO(bookDaoImpl.getAllBook());

%>

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
				<div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <div class="container-fluid">
                    <div class="row mb-3">
                        <div class="col-lg-4">
                            <div class="card mb-3">
                                <div class="card-body text-center shadow"><img class="img-thumbnail mb-3 mt-4" src="/dogs/image2.jpeg" width="160" height="160">
                                    <div class="mb-3"><input type="file"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="row mb-3 d-none">
                                <div class="col">
                                    <div class="card text-white bg-primary shadow">
                                        <div class="card-body">
                                            <div class="row mb-2">
                                                <div class="col">
                                                    <p class="m-0">Peformance</p>
                                                    <p class="m-0"><strong>65.2%</strong></p>
                                                </div>
                                                <div class="col-auto"><i class="fas fa-rocket fa-2x"></i></div>
                                            </div>
                                            <p class="text-white-50 small m-0"><i class="fas fa-arrow-up"></i>&nbsp;5% since last month</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="card text-white bg-success shadow">
                                        <div class="card-body">
                                            <div class="row mb-2">
                                                <div class="col">
                                                    <p class="m-0">Peformance</p>
                                                    <p class="m-0"><strong>65.2%</strong></p>
                                                </div>
                                                <div class="col-auto"><i class="fas fa-rocket fa-2x"></i></div>
                                            </div>
                                            <p class="text-white-50 small m-0"><i class="fas fa-arrow-up"></i>&nbsp;5% since last month</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="card shadow mb-3"></div>
                                    <div class="card shadow">
                                        <div class="card-body">
                                            <form>
                                                <div class="form-row">
                                                    <div class="col">
                                                        <div class="form-group"><label for="city"><strong>Title</strong></label><input class="form-control" type="text" name="city"></div>
                                                        <div class="form-group"><label for="city"><strong>Author</strong></label><select class="form-control"><optgroup label="Select Author"><option value="12" selected="">This is item 1</option><option value="13">This is item 2</option><option value="14">This is item 3</option></optgroup></select></div>
                                                        <div
                                                            class="form-group"><label for="city"><strong>Rent</strong></label><input class="form-control" type="number"></div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group"><label for="country"><strong>Copies</strong></label><input class="form-control" type="number"></div>
                                                    <div class="form-group"><label for="country"><strong>Category</strong></label><select class="form-control"><optgroup label="Select Category"><option value="12" selected="">This is item 1</option><option value="13">This is item 2</option><option value="14">This is item 3</option></optgroup></select></div>
                                                </div>
                                        </div>
                                        <div class="form-group"><button class="btn btn-primary btn-sm" type="submit" style="width: 100px;">Save&nbsp;</button></div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
				
					<table id="book_table" >

						<thead>
							<tr>
								<th width="15%">Image</th>
								<th width="30%">Title</th>
								<th width="30%">Author</th>
								<th width="15%">Category</th>
								<th width="10%">Rent</th>
								<th width="10%">Copies</th>
								<th width="5%" >Edit</th>
								<th width="5%" >Delete</th>
								
							</tr>
						</thead>
						
						
					</table>
					
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
	
	<a class="border rounded d-inline scroll-to-top" href="#page-top"><i
		class="fas fa-angle-up"></i></a>
	


<div id="userModal" class="modal fade">
 <div class="modal-dialog">
  <form method="post" id="user_form" enctype="multipart/form-data">
   <div class="modal-content">
    <div class="modal-header">
     <button type="button" class="close" data-dismiss="modal">&times;</button>
     <h4 class="modal-title">Add User</h4>
    </div>
    <div class="modal-body">
     <label>Enter First Name</label>
     <input type="text" name="first_name" id="first_name" class="form-control" />
     <br />
     <label>Enter Last Name</label>
     <input type="text" name="last_name" id="last_name" class="form-control" />
     <br />
     <label>Select User Image</label>
     <input type="file" name="user_image" id="user_image" />
     <span id="user_uploaded_image"></span>
    </div>
    <div class="modal-footer">
     <input type="hidden" name="user_id" id="user_id" />
     <input type="hidden" name="operation" id="operation" />
     <input type="submit" name="action" id="action" class="btn btn-success" value="Add" />
     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    </div>
   </div>
  </form>
 </div>
</div>

	<script type="text/javascript">

	

	var editor; // use a global for the submit and return data rendering in the examples
	 
	$(document).ready(function() {

		$('#book_table').DataTable({
			"searching":true,
			"ordering":false,
			"processing": true,
		    "serverSide": true,
		    "ajax":{
					url:"../AdminServlet?action=getAllBook",
					type: "GET"
			    },
			    "columns": [
		            { "data": "bookImg"},
		            { "data": "title" },
		            { "data": "author.authorName" },
		            { "data": "category.categoryName" },
		            { "data": "bookRent" },
		            { "data": "noOfCopies" }
		        ],
		        "columnDefs": [ {
		            "targets": 0,
		            "data": "bookImg", // Use the full data source object for the renderer's source
		            "render": function(data, type, row, meta){
							return '<img src="../WebContent/uploads/'+data+'" height="30px" width="30px"></img>'
			            }
		          },{
			            "targets": 6,
			            "data": "bookId", // Use the full data source object for the renderer's source
			            "render": function(data, type, row, meta){
								return '<button name="update" id="'+data+'" class="btn btn-warning btn-xs update">Edit</button>'
				            }
			          },
			          {
				            "targets": 7,
				            "data": "bookId", // Use the full data source object for the renderer's source
				            "render": function(data, type, row, meta){
									return '<button name="delete" id="'+data+'" class="btn btn-danger btn-xs delete">Delete</button>'
					            }
				          },
		           ],
		           
		    });



		 $(document).on('submit', '#user_form', function(event){
		  event.preventDefault();
		  var firstName = $('#first_name').val();
		  var lastName = $('#last_name').val();
		  var extension = $('#user_image').val().split('.').pop().toLowerCase();
		  if(extension != '')
		  {
		   if(jQuery.inArray(extension, ['gif','png','jpg','jpeg']) == -1)
		   {
		    alert("Invalid Image File");
		    $('#user_image').val('');
		    return false;
		   }
		  } 
		  if(firstName != '' && lastName != '')
		  {
		   $.ajax({
		    url:"insert.php",
		    method:'POST',
		    data:new FormData(this),
		    contentType:false,
		    processData:false,
		    success:function(data)
		    {
		     alert(data);
		     $('#user_form')[0].reset();
		     $('#userModal').modal('hide');
		     dataTable.ajax.reload();
		    }
		   });
		  }
		  else
		  {
		   alert("Both Fields are Required");
		  }
		 });

	} );
	</script>
	
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="assets/js/theme.js"></script>
<script src="//cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

</body>
</html>
