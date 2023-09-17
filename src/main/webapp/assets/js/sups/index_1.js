
jQuery(document).ready(function () {
    var app = "/hrh";
    var todayDate = new Date().toISOString().slice(0, 10);
    const string = document.getElementById("__STAFFID").value;
    const emp_no = string.trim();
    var now = new Date();
    var month = (now.getMonth() + 1);
    var day = now.getDate();
    if (month < 10)
        month = "0" + month;
    if (day < 10)
        day = "0" + day;
    var today = now.getFullYear() + '-' + month;
    var year = now.getFullYear();
    console.log(today);
//    console.log(todayDate);
    // counter
    var i = 1;
    function get_active_staff() {
        $.ajax({
            type: 'GET',
            url: app + '/Dashboard?action=staff',
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
            url: app + '/ManageHolidays',
            contentType: "application/json; charset-utf-8",
            data: data_req,
            dataType: "json",
            success: function (data) {
                $('#comment_holidays').empty();



                $.each(data, function (key, value)
                {

                    var comment = '   <div class="comment-center p-t-10">'
                            + ' <div class="comment-body">'
                            + '     <div class="user-img">'
                            + '         <i style="font-size: 31px" class="fa fa-solid fa-calendar-day text-info"></i>'

                            + '     </div>'
                            + '     <div class="mail-contnet">'
                            + '        <h5>' + value.holiday_name + '</h5>'
                            + '        <span class="time"> Date:  ' + value.start_date + ' </span>'
                            + '     </div>'
                            + ' </div>'
                            + ' </div>';
                    $('#comment_holidays').append(comment);
                });

            },
            complete: function () {

            }
        });
    }
    ;
    function get_leave_data() {



        $.ajax({
            type: 'GET',
            url: app + '/LeaveApplication',
            data: {emp_no: emp_no, action: "all_leaves_by_employee"},
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


    function getChartData() {
        $.ajax({
            type: "GET",
            url: app + '/timesheetController',
            data: {emp_no: emp_no, month: month, year: year, action: "time_sheet_summary"},
            dataType: "json",
            success: function (data) {
                // Parse the data and pass it to Chart.js
                var hoursWorked = data.hoursWorked;
                var leaveHours = data.leaveHours;
                var holidayHours = data.holidayHours;
                var extraHours = data.extraHours;
                var totalHours = data.totalHours;
                var expectedHours = data.expectedHours;

                var chartData = {
                    labels: ["Hours Worked", "Leave Hours", "Holiday Hours", "Extra Hours", "Total Hours", "Expected Hours"],
                    datasets: [{
                            label: "Timesheet Summary",
                            backgroundColor: "rgba(54, 162, 235, 0.5)",
                            borderColor: "rgba(54, 162, 235, 1)",
                            borderWidth: 1,
                            data: [hoursWorked, leaveHours, holidayHours, extraHours, totalHours, expectedHours]
                        }]
                };

                var ctx = document.getElementById("myChart").getContext("2d");
                 new Chart(ctx, {
                    type: "bar",
                    data: chartData,
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                              
                                        beginAtZero: true
                                    
                                }
                        }
                    }
                });
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("AJAX Error: " + textStatus + ", " + errorThrown);
            }
        });

    }

    // Call the function to get the chart data
    getChartData();

});