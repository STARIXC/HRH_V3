var i = 1;
var app="/hrh";
		$('#cadre_table').DataTable({
			"ajax": {
				"url": app+'/DepartmentController',
				"type": "GET",
				dataType: "json",
				dataSrc: "",
				"data": function(d) {
					$("#carder_data_").html(d);
				}
			},

			"columns": [{
				"render": function(data, type, full, meta) {
					return i++;
				}
			}, {
				"data": "dept_name"
			}, {
				"targets": 0,
				"data": "emp_no",
				"render": function(data, type, row, meta) {
					return '<div class="d-flex"><a  class="badge bg-success" href="./AllStaffServlet?id=' + data + '&action=edit"><i class="fa fa-pen text-white"></i></a><a class="badge bg-primary" href="./AllStaffServlet?id=' + data + '&action=view"><i class="fa fa-eye text-white"></i></a> <a class="badge bg-danger" href="./AllStaffServlet?id=' + data + '&action=delete"><i class="fa fa-trash text-white"></i></a></div>';
				}
			}]
		});

	
