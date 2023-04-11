/**
 * 
 */
jQuery(document).ready(function () {
    var jsonData;
    var i = 1;
    var app="/hrh";
    $('#pending_leave_table').DataTable({

        "ajax": {
            "url": app+'/LeaveApplication?action=pendingapproval',
            "type": "GET",
            dataType: "json",
            dataSrc: "",
            "data": function (d) {
                $("#pending_leave_table_data").html(d);
            }
        },

        "columns": [

            {
                "targets": 0,
                "data": "application_id",
                "render": function (data, type, row, meta) {
                    return 	'<input type="checkbox" id="checkItem_'+data+'" name="leave[]" value="'+data+'">';
                
            }},
            {

                "data": "employee_name"
            },
            {
                "data": "employee_id"
            },
            {
                "data": "start_date"
            }
            ,
            {
                "data": "end_date"
            },
            {
                "data": "date_of_application"
            },
            {
                "targets": 0,
                "data": "leave_status",
                "render": function (data, type, row, meta) {
                    if (data === 2) {
                        return '<span class="badge bg-success">Approved</span>';
                    } else if (data === 1) {
                        return '<span class="badge bg-info">Pending</span>';
                    } else if (data === 3) {
                        return ' <span class="badge bg-danger">Not Approved</span>';
                    } else {
                        return '<span class="badge bg-danger">Not Applicable</span>';
                    }
                }
            },
            {
                "targets": 0,
                "data": "application_id",
                "render": function (data, type, row, meta) {
                    return 	'<a  data-id="'+data+'" href="javascript:void(0)" class="btn btn-danger m-s-20 hidden-xs hidden-sm waves-effect waves-light" id="reject"><i class="fa fa-times"></i></a>';
                }
            }
        ]

    });

    // jQuery ajax form submit example, runs when form is submitted
    $("#positionForm").submit(function (e) {
        e.preventDefault(); // prevent actual form submit
        var form = $("#timesheetForm");
        var action = "save_log";
        var data = form.serialize() + "&action=" + action;
        var url = app+'/PositionServlet'; //get submit url [replace url here if desired]
        // screenLock();
        $.ajax({
            type: "POST",
            url: url,
            data: data, // serializes form input
            beforeSend: function beforeSend() {
                //	startLoader();
                console.log(data);
            },
            success: function (data) {
                var url_ = "manage_timesheet.jsp";
                $(location).attr('href', url_);
            },
            error: function error(result) {

            },
            complete: function complete() {
                //	stopLoader();

            }
        });

    });

});




