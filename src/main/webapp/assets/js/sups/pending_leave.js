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
                    var action='<div class="btn-group" role="group" >'
                                +' <button type="button" id="actions" class="btn btn-primary  btn-flat dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">Action <span class="caret"></span>'
                                +'</button>'
                                +'<ul class="dropdown-menu" role="menu" aria-labelledby="actions">'
                                +'    <li><a class="dropdown-item" href="https://amazingsoft.live/amazing-hrm-payroll-v3/hrm/application_lists/150"><i class="icon fa fa-file-alt"></i> Details</a></li>'

                                +'     <li><a class="dropdown-item" href="https://amazingsoft.live/amazing-hrm-payroll-v3/hrm/application/download/150"><i class="icon fa fa-file-alt"></i> Download</a></li>'

                                 +'   <li><a class="dropdown-item" href="https://amazingsoft.live/amazing-hrm-payroll-v3/hrm/leave_application/approved/150"><i class="icon fa fa-file-alt"></i> Approved</a></li>'

                                  +'  <li><a class="dropdown-item" href="https://amazingsoft.live/amazing-hrm-payroll-v3/hrm/leave_application/not_approved/150"><i class="icon fa fa-file-alt"></i> Not Approed</a></li>'

                               +' </ul>'
                          +'  </div>';
                    return 	action;
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




