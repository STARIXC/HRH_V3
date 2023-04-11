
$(document).ready(function () {
    setTimeout(function () {
        var jsonData;
        var emp_no = document.getElementById("__STAFFID").value;

//var sampledata={
//    Employee No:0014[{"date_of_application":"2022-46-10"
//},"start_date":"2022-04-18","end_date":"2022-46-10","leave_type_name":"Annual Leave","application_id":1,"employee_id":0,"leave_type_id":0,"leave_status":1,"user_id":0}]}

        $('#leave_table').DataTable({
            "ajax": {
                "url": './LeaveApplication?emp_no=' + emp_no,
                "type": "GET",
                dataType: "json",
                dataSrc: "",
                "data": function (d) {
                    $("#leave_table_data").html(d);
                }
            }, "columns": [
                {
                    "data": "leave_type_name"
                },
                {
                    "data": "start_date"
                },
                {
                    "data": "end_date"
                },
                {
                    "data": "date_of_application"
                }, {
                    "targets": 0,
                    "data": "leave_status",
                    "render": function (data, type, row, meta) {
                        if (data === 1) {
                            return 'waiting for approval';
                        } else if (data === 2) {
                            return 'Rejected';
                        }else {
                            return 'Approved';
                        }
                    }
                },
                
               {
                    "targets": 0,
                    "data": "leave_status",
                    "render": function (data, type, row, meta) {
                        if (data === 1) {
                            return '<span class="badge bg-info">Pending</span>';
                        } else if (data === 2) {
                            return '<span class="badge bg-danger">Rejected</span>';
                        }else {
                            return '<span class="badge bg-success">Approved</span>';
                        }
                    }
                }],

            responsive: true
        });
    }, 500);
});
