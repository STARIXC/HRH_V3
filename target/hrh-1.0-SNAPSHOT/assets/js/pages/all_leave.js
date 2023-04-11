/**
 * 
 */
jQuery(document).ready(function () {
    var jsonData;
    var i = 1;
    var app="/hrh";
    $('#all_leave_table').DataTable({

        "ajax": {
            "url": app+'/LeaveApplication?action=allLeave',
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
                    if (data === 2) {
                        return '<span class="badge bg-success">Approved</span>';
                    } else if (data === 1) {
                        return '<span class="badge bg-info">Pending</span>';
                    } else if (data === 3) {
                        return ' <span class="badge bg-danger">Rejected</span>';
                    } else {
                        return '<span class="badge bg-danger">Not Applicable</span>';
                    }
                }
            }, {
                "targets": 0,
                "data": "application_id",
                "render": function (data, type, row, meta) {
                    return 	'';
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


