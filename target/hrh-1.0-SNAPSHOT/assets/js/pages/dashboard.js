
jQuery(document).ready(function () {
var app="/hrh";
    var todayDate = new Date().toISOString().slice(0, 10);
//    console.log(todayDate);
    // counter
    var i = 1;
    function get_active_staff() {
        $.ajax({
            type: 'GET',
            url: app+'/Dashboard?action=staff',
            dataType: 'json',
            success: function (data)
            {
                //   alert(data.staff);
                var container = $('#counter_emp');
                container.html(data.staff);
            }

        });
    }
    ;

    function get_upcoming_holidays() {

        var action = "upcomingHolidays";
        var data_req = {
            action: action,
            today_: todayDate

        };
        $.ajax({
            type: "GET",
            url: app+'/ManageHolidays',
            contentType: "application/json; charset-utf-8",
            data: data_req,
            dataType: "json",
            success: function (data) {
                $('#comment_holidays').empty();

                

                $.each(data, function (key, value)
                {
                    
             var comment='   <div class="comment-center p-t-10">'
                   +' <div class="comment-body">'
                   +'     <div class="user-img">'
                   +'         <i style="font-size: 31px" class="fa fa-solid fa-calendar-day text-info"></i>'
                
                   +'     </div>'
                   +'     <div class="mail-contnet">'
                    +'        <h5>'+value.holiday_name+'</h5>'
                    +'        <span class="time"> Date:  ' + value.start_date + ' </span>'
                    +'     </div>'
                   +' </div>'
               +' </div>';
                    $('#comment_holidays').append(comment);
                });

            },
            complete: function () {

            }
        });
    }
    ;
    function get_leave_data() {

//    $('#leave_app').DataTable({
//
//        "ajax": {
//            "url":  app+'/LeaveApplication?action=all_leaves',
//            "type": "GET",
//            dataType: "json",
//            dataSrc: "",
//            "data": function (d) {
//                $("#leave_application_data").html(d);
//            }
//        },
//
//        "columns": [
//            {
//                "data": null,
//                "render": function (data, type, row, meta) {
//                    return i++;
//                }
//            },
//            {
//                "data": "employee_name"
//            }, {
//                "data": "leave_type_name"
//            }, {
//                "data": "duration"
//            },
//            {
//                "data": "date_of_application"
//            },
//            {
//                "data": "number_days"
//            },
//            {
//                "targets": 0,
//                "data": "leave_status",
//                "render": function (data, type, row, meta) {
//                    if (data === 1) {
//                        return '<span class="badge bg-success">Approved</span>';
//                    } else if (data === 0) {
//                        return '<span class="badge bg-info">Pending</span>';
//                    } else if (data === 2) {
//                        return ' <span class="badge bg-danger">Rejected</span>';
//                    } else {
//                        return '<span class="badge bg-danger">Not Applicable</span>';
//                    }
//                }
//            }, {
//                "targets": 0,
//                "data": "application_id",
//                "render": function (data, type, row, meta) {
//                    var action ='<td class="text-center"><a href="./leave_details.jsp?id='+data+'"><i class="icon fa fa-file-alt"></i> Details</a></td>';
//                    return 	action;
//                }
//            }
//        ]
//
//    });

 
        $.ajax({
            type: 'GET',
            url: app+'/LeaveApplication?action=all_leaves',
            dataType: 'json',
            success: function (data) {
                var container__ = $('#leave_app');
                container__.html(data.length);
                $('#leave_application_data').empty();
                $.each(data, function (key, value)
                {
                    var status_approved = '<span class="label label-success">Approved</span>';
                    var status_rejected = '<span class="label label-danger">Rejected</span>';
                    var status_pending = '<span class="label label-info">Pending</span>';
                    if (value.leave_status === 0) {
                        var status = status_pending;
                    } else if (value.leave_status === 1) {
                        var status = status_approved;
                    } else {
                        var status = status_rejected;
                    }
                    var data__ = '<tr>'
                            + '<td data-th="Employee">'
                            + '<div class="text-md text-gray-900 dark:text-gray-400" > ' + value.employee_name + ' <span   class="block text-xs"> (UTJ00' + value.employee_id + ' )</span></div>'
                            + '</td>'
                            + '<td data-th="Leave Type">'
                            + '<div class="text-md text-gray-900 dark:text-gray-400">' + value.leave_type_name + '</div>'
                            + ' </td>'
                            + ' <td data-th="Period">'
                            + ' <div class="text-md text-gray-900 dark:text-gray-400">' + value.duration + '</div>'
                            + '</td>'
                            + '<td data-th="Status">'
                            + '<div class="text-md text-gray-900 dark:text-gray-400">' + status + '</div>'
                            + '</td>'
                            + '</tr>';



                    $('#leave_application_data').append(data__);
                });
            }
        });
    }
    function getData() {
        get_active_staff();
    }
    function getLeaveData() {
        get_leave_data();
    }
    getData();
    getLeaveData();
    get_upcoming_holidays();
    
    
});