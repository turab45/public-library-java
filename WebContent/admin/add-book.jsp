
	<jsp:include page="head.jsp" />
	

<body>
    <div id="wrapper">
    
       <jsp:include page="navbar.jsp" />
       
            <div class="container-fluid">
                <h3 class="text-dark mb-4">Book</h3>
                <div class="row mb-3">
                    <div class="col-lg-4">
                        <div class="card mb-3">
                            <div class="card-body text-center shadow"><img class="img-thumbnail img-fluid mb-3 mt-4" src="assets/img/dogs/image2.jpeg" width="205" height="166">
                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Upload Photo</button></div>
                            </div>
                        </div>
                        <div class="card shadow mb-4"></div>
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
                                <div class="card shadow mb-3">
                                    <div class="card-header py-3">
                                        <p class="text-primary m-0 font-weight-bold">Book Information</p>
                                    </div>
                                    <div class="card-body">
                                        <form>
                                            <div class="form-row">
                                                <div class="col">
                                                    <div class="form-group"><label for="username"><strong>Title</strong></label><input class="form-control" type="text" placeholder="user.name" name="username"></div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group"><label for="email"><strong>Author</strong></label><select class="custom-select" required="" name="author_combo"><optgroup label="Select Author"><option value="12" selected="">This is item 1</option><option value="13">This is item 2</option><option value="14">This is item 3</option></optgroup></select></div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col">
                                                    <div class="form-group"><label for="first_name"><strong>No of Copies</strong><br></label><input class="form-control" type="number"></div>
                                                    <div class="form-group"><label for="first_name"><strong>Book Rent</strong><br></label><input class="form-control" type="number"></div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group"><label for="last_name"><strong>Category</strong><br></label><select class="custom-select" name="category_combo" value="value"><optgroup label="Select Category"><option value="12" selected="">This is item 1</option><option value="13">This is item 2</option><option value="14">This is item 3</option></optgroup></select></div>
                                                </div>
                                            </div>
                                            <div class="form-group"><button class="btn btn-primary btn-sm" type="submit" style="width: 100px;height: 31px;">Save&nbsp;</button></div>
                                        </form>
                                    </div>
                                </div>
                                <div class="card shadow"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card shadow"></div>
            </div>
        </div>
        <footer class="bg-white sticky-footer">
            <div class="container my-auto">
                <div class="text-center my-auto copyright"><span>Copyright © Brand 2021</span></div>
            </div>
        </footer>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
    
    <jsp:include page="scripts.jsp" />
    
</body>

</html>