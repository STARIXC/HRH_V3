$(document).ready(function (e) {
    "use strict";

    getDefaultMonth();

    var now = new Date();
    var month = (now.getMonth() + 1);
    var day = now.getDate();
    if (month < 10)
        month = "0" + month;
    if (day < 10)
        day = "0" + day;
    var today = now.getFullYear() + '-' + month;
    console.log(today);
    $('.monthField').val(today);


    //   $(".select2").select2();
//    $('#timesheet_table').DataTable({
//        "ordering": false,
//    });
    //               $('#timesheet_table').DataTable(
//                       );

    $(".alert-success").delay(2000).fadeOut("slow");
    //   $(".alert-danger").delay(2000).fadeOut("slow");
    $(document).on("focus", ".yearPicker", function () {
        $(this).datepicker({
            format: 'yyyy',
            minViewMode: 2
        }).on('changeDate', function (e) {
            $(this).datepicker('hide');
        });
    });
    $(document).on("focus", ".dateField", function () {
        $(this).datepicker({
            format: 'dd/mm/yyyy',
            todayHighlight: true,
            clearBtn: true
        }).on('changeDate', function (e) {
            $(this).datepicker('hide');
        });
    });
    $(document).on("focus", ".timePicker", function () {
        $(this).timepicker({
            showInputs: false,
            minuteStep: 1
        });
    });
    $(".monthField").datepicker({
        format: "yyyy-mm",
        viewMode: "months",
        minViewMode: "months"
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        gethours();

    });
    function getDefaultMonth() {
        var app = "/hrh";
        var now = new Date();
        var month = (now.getMonth() + 1);
        var year = now.getFullYear();
        if (month < 10)
            month = "0" + month;

        $.ajax({
            url: app + "/timesheetController?year=" + year + "&month=" + month + "&action=getAllEntries",
            type: 'get',
            dataType: "json",
            success: function (response) {
                if (response && response.length) {
                    // Create the table data object with employee names as keys and data as values
                    var tableData = {};
                    response.forEach(function (record) {
                        var fullName = record.firstName + ' ' + record.surname;
                        var date = record.date_field;
                        var hoursWorked = record.hours_worked;
                        var leaveHours = record.leave_hours;
                        var publicHoliday = record.public_holiday;
                        if (!tableData[fullName]) {
                            tableData[fullName] = {
                                totalHours: 0,
                                leaveHours: 0,
                                publicHoliday: 0
                            };
                        }
                        if (hoursWorked) {
                            tableData[fullName].totalHours += hoursWorked;
                        }
                        if (leaveHours) {
                            tableData[fullName].leaveHours += leaveHours;
                        }
                        if (publicHoliday) {
                            tableData[fullName].publicHoliday += publicHoliday;
                        }
                        tableData[fullName][date] = hoursWorked || '-';
                    });
                    console.log(tableData);
                    // Create the table header row with the dates and total hours column
                    var dates = Object.keys(response.reduce(function (acc, record) {
                        acc[record.date_field] = true;
                        return acc;
                    }, {}));
                    dates.sort();
                    var headerRow = '<tr><th>Employee Name</th>';
                    dates.forEach(function (date) {
                        var trimmedDate = date.substring(5); // extract the month and date from the date string
                        headerRow += '<th>' + trimmedDate + '</th>';
                    });
                    headerRow += '<th>Total Hours</th><th>Leave Hours</th><th>Total Hours Worked</th></tr>';

// Create the table data rows with the hours worked, leave hours, and total hours
                    var tableRows = '';
                    Object.keys(tableData).forEach(function (employeeName) {
                        var totalHours = 0;
                        var leaveHours = 0;
                        tableRows += '<tr><td>' + employeeName + '</td>';
                        dates.forEach(function (date) {
                            var hoursWorked = tableData[employeeName][date];
                            if (hoursWorked && hoursWorked !== '-') {
                                totalHours += parseInt(hoursWorked, 10);
                            }
                            var leave = tableData[employeeName].leaveHours;
                            if (leave && leave !== '-') {
                                leaveHours += parseInt(leave, 10);
                            }
                            tableRows += '<td>' + hoursWorked + '</td>';
                        });
                        tableRows += '<td>' + (totalHours + leaveHours) + '</td>';
                        tableRows += '<td>' + leaveHours + '</td>';
                        tableRows += '<td>' + totalHours + '</td></tr>';
                    });

// Populate the table with the header row and data rows
                    $("#timesheet_table thead").html(headerRow);
                    $("#timesheet_table tbody").html(tableRows);



                }
            }
            ,
            error: function () {
                alert("Error fetching timesheet data.");
            }


        });


    }
    ;
    function gethours() {
        var app = "/hrh";
        // $('#table_timesheet').empty();
        var date_ = document.getElementById("month").value;
        var dt = new Date(date_);
        var year = dt.getFullYear();
        var month = (dt.getMonth() < 10 ? '0' : '') + (dt.getMonth() + 1);


        $.ajax({
            url: app + "/timesheetController?year=" + year + "&month=" + month + "&action=getAllEntries",
            type: 'get',
            dataType: "json",
            success: function (response) {
                if (response && response.length) {
                    // Create the table data object with employee names as keys and data as values
                    var tableData = {};
                    response.forEach(function (record) {
                        var fullName = record.firstName + ' ' + record.surname;
                        var date = record.date_field;
                        var hoursWorked = record.hours_worked;
                        var leaveHours = record.leave_hours;
                        var publicHoliday = record.public_holiday;
                        if (!tableData[fullName]) {
                            tableData[fullName] = {
                                totalHours: 0,
                                leaveHours: 0,
                                publicHoliday: 0
                            };
                        }
                        if (hoursWorked) {
                            tableData[fullName].totalHours += hoursWorked;
                        }
                        if (leaveHours) {
                            tableData[fullName].leaveHours += leaveHours;
                        }
                        if (publicHoliday) {
                            tableData[fullName].publicHoliday += publicHoliday;
                        }
                        tableData[fullName][date] = hoursWorked || '-';
                    });
                    console.log(tableData);
                    // Create the table header row with the dates
                    var dates = Object.keys(response.reduce(function (acc, record) {
                        if (record.isWeekday) {
                            acc[record.date_field] = true;
                        }
                        return acc;
                    }, {}));
                    dates.sort();
                    var headerRow = '<tr><th>Employee Name</th>';
                    dates.forEach(function (date) {
                        headerRow += '<th>' + date + '</th>';
                    });
                    headerRow += '<th>Total Hours</th><th>Leave Hours</th><th>Public Holiday</th></tr>';
// Create the table data rows with the hours worked, leave hours, and public holidays
                    var tableRows = '';
                    Object.keys(tableData).forEach(function (employeeName) {
                        tableRows += '<tr><td>' + employeeName + '</td>';
                        dates.forEach(function (date) {
                            var hoursWorked = tableData[employeeName][date];
                            tableRows += '<td>' + hoursWorked + '</td>';
                        });
                        tableRows += '<td>' + tableData[employeeName].totalHours + '</td>';
                        tableRows += '<td>' + tableData[employeeName].leaveHours + '</td>';
                        tableRows += '<td>' + tableData[employeeName].publicHoliday + '</td></tr>';
                    });
// Populate the table with the header row and data rows
                    $("#timesheet_table thead").html(headerRow);
                    $("#timesheet_table tbody").html(tableRows);
                }
            },
            complete: function () {
                let table = $('#timesheet_table').DataTable(
                        );
                new $.fn.dataTable.FixedHeader(table);
//                $('#spinner-div').hide(); //Request is complete so hide spinner
            },
            error: function () {
                alert("Error fetching timesheet data.");
            }


        });


    }
    ;

//               $('#timesheet_table').DataTable(
//                       );
//                new $.fn.dataTable.FixedHeader(table);
});




