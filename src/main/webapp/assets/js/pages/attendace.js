$(function () {
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
    $('#myTable').DataTable({
        "ordering": false,
    });

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
                    // Create the table data object with dates as keys and employees' hours worked as values
                    var tableData = {};
                    var employeeNames = {};
                    response.forEach(function (record) {
                        var date = record.date_field;
                        var fullName = record.firstName + ' ' + record.surname;
                        employeeNames[fullName] = true;
                        var hoursWorked = record.hours_worked;
                        if (!tableData[date]) {
                            tableData[date] = {};
                        }
                        tableData[date][fullName] = hoursWorked;
                    });

// Create the table header row with the dates
                    var dates = Object.keys(tableData).sort();
                    var headerRow = '<tr><th>Employee Name</th>';
                    dates.forEach(function (date) {
                        headerRow += '<th>' + date + '</th>';
                    });
                    headerRow += '</tr>';
   $("#timesheet_table thead").html(headerRow);
// Create the table data rows with the hours worked
                    var tableRows = '';
                    Object.keys(employeeNames).forEach(function (employeeName) {
                        tableRows += '<tr><td>' + employeeName + '</td>';
                        dates.forEach(function (date) {
                            var hoursWorked = tableData[date][employeeName] || '';
                            tableRows += '<td>' + hoursWorked + '</td>';
                        });
                        tableRows += '</tr>';
                    });
                    $("#timesheet_table tbody").html(tableRows);
                }
            },
            complete: function () {
                var table = $('#timesheet_table').DataTable(
                        {
                            responsive: true,
                            processing: true
                        });
                new $.fn.dataTable.FixedHeader(table);
//                $('#spinner-div').hide(); //Request is complete so hide spinner
            },
            error: function () {
                alert("Error fetching timesheet data.");
            }


        });
        // if (day < 10)
        //    day = "0" + day;
        // var today =  + '-' + month;

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
                    console.log(response);
                }
                // Get the unique dates from the response
//                var dates = [];
//                for (var i = 0; i < response.length; i++) {
//                    var date = response[i].date_field;
//                    if (!dates.includes(date)) {
//                        dates.push(date);
//                    }
//                }
//                console.log(dates);
//                // Sort the dates in ascending order
//                dates.sort();
//                var size_=dates.length;
//                console.log(size_);
                // Create the table header row with the dates as column headers
                var headerRow = "<tr><th>Date</th><th>Employee ID</th><th>First Name</th><th>Last Name</th>";
//                for (var i = 0; i < dates.length; i++) {
//                    headerRow += "<th>" + dates[i] + "</th>";
//                }
//                headerRow += "</tr>";
//
//                // Create the table body rows with the corresponding hours worked as cell values
//                var bodyRows = "";
//                for (var i = 0; i < response.length; i++) {
//                    var rowData = response[i];
//                    var date = rowData.date_field;
//                    var hoursWorked = rowData.hours_worked;
//                    var rowIndex = dates.indexOf(date) + 1;
//                    if (rowIndex === 1) {
//                        bodyRows += "<tr><td>" + rowData.date_name + "</td>";
//                    }
//                    if (rowIndex > 1) {
//                        bodyRows += "<td>" + hoursWorked + "</td>";
//                    }
//                    if (rowIndex === dates.length) {
//                        bodyRows += "</tr>";
//                    }
//                }
//
//                // Combine the table header and body rows and add it to the table element
//                var tableHtml = "<table>" + headerRow + bodyRows + "</table>";
//                $("#tableContainer").html(tableHtml);
            },
            error: function (xhr, status, error) {
                console.log("Error: " + error.message);
            }



        });
    }
    ;
});




