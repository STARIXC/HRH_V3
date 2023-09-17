/**
 * 
 */
jQuery(document).ready(function () {
    var jsonData;
    var i = 1;
    var app="/hrh";
    $('#all_leave_table').DataTable({

        "ajax": {
            "url":  app+'/LeaveApplication?action=all_leaves',
            "type": "GET",
            dataType: "json",
            dataSrc: "",
            "data": function (d) {
                $("#all_leave_table_data").html(d);
            }
        },

        "columns": [
            {
                "data": null,
                "render": function (data, type, row, meta) {
                    return i++;
                }
            },
            {
                "data": "employee_name"
            }, {
                "data": "leave_type_name"
            }, {
                "data": "duration"
            },
            {
                "data": "date_of_application"
            },
            {
                "data": "number_days"
            },
            {
                "targets": 0,
                "data": "leave_status",
                "render": function (data, type, row, meta) {
                    if (data === 1) {
                        return '<span class="badge bg-success">Approved</span>';
                    } else if (data === 0) {
                        return '<span class="badge bg-info">Pending</span>';
                    } else if (data === 2) {
                        return ' <span class="badge bg-danger">Rejected</span>';
                    } else {
                        return '<span class="badge bg-danger">Not Applicable</span>';
                    }
                }
            }, {
                "targets": 0,
                "data": "application_id",
                "render": function (data, type, row, meta) {
                    var action ='<td class="text-center"><a href="./leave_details.jsp?id='+data+'"><i class="icon fa fa-file-alt"></i> Details</a></td>';
                    return 	action;
                }
            }
        ]

    });

 
});


