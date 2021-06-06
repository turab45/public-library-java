$(document).ready(function() {

  var columnDefs = [
  {
    data: "title",
    title: "Title"
  },
  {
	    data: "author.authorName",
	    title: "Author"
	  },
	  {
		    data: "category.categoryName",
		    title: "Category",
		    type:'select',
		    options:{
		    	"a":"A", "b":"B", "c":"C"
		    }
		  },
 {
    data: "bookRent",
    title: "Rent"
  },
 {
    name: "image",
    data: "bookImg",
    render: function(data, type, row, meta) {
        return "<img src='./uploads/"+data+"' width='20px' height='20px'> </img>";
    },
    type: "file",
    title: "Avatar (base64 upload)"
  }];

  var myTable;

  // local URL's are not allowed
  var url_ws_mock_get = './AdminServlet?action=getAllBook';
  var url_ws_mock_ok = './mock_svc_ok.json';
  if (location.href.startsWith("file://")) {
    // local URL's are not allowed
    url_ws_mock_get = 'https://luca-vercelli.github.io/DataTable-AltEditor/example/10_file_upload/mock_svc_load.json';
    url_ws_mock_ok = 'https://luca-vercelli.github.io/DataTable-AltEditor/example/10_file_upload/mock_svc_ok.json';
  }
  
  myTable = $('#example').DataTable({
    "sPaginationType": "full_numbers",
    ajax: {
        url : url_ws_mock_get,
        // our data is an array of objects, in the root node instead of /data node, so we need 'dataSrc' parameter
        dataSrc : ''
    },
    columns: columnDefs,
    dom: 'Bfrtip',        // Needs button container
    select: 'single',
    altEditor:true,
    responsive: true,
    altEditor: true,     // Enable altEditor
    buttons: [{
            text: 'Add',
            name: 'add'        // do not change name
        },
        {
            extend: 'selected', // Bind to Selected row
            text: 'Edit',
            name: 'edit'        // do not change name
        },
        {
            extend: 'selected', // Bind to Selected row
            text: 'Delete',
            name: 'delete'      // do not change name
        },
        {
            text: 'Refresh',
            name: 'refresh'      // do not change name
        }],
    onAddRow: function(datatable, rowdata, success, error) {
        $.ajax({
            // a tipycal url would be / with type='PUT'
            url: url_ws_mock_ok,
            type: 'GET',
            data: rowdata,
            success: success,
            error: error
        });
    },
    onDeleteRow: function(datatable, rowdata, success, error) {
        $.ajax({
            // a tipycal url would be /{id} with type='DELETE'
            url: url_ws_mock_ok,
            type: 'GET',
            data: rowdata,
            success: success,
            error: error
        });
    },
    onEditRow: function(datatable, rowdata, success, error) {
        $.ajax({
            // a tipycal url would be /{id} with type='POST'
            url: './AdminServlet?action=update-book&id="'+rowdata+'"',
            type: 'GET',
            data: rowdata,
            success: success,
            error: error
        });
    }
  });


});