jQuery(document).ready(function () {
    var jsonData;
    var i = 1;
      var app="/hrh";
    get_staff();
    function get_staff() {
        $.ajax({
            type: "GET",
            url: app+'/AllStaffServlet?action=get_basic',
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            success: function (data) {
                $('#employee_id').empty();
                $('#employee_id').append("<option value=''>--- Please Select ---</option>");
                $.each(data, function (i, item) {
                    var selecting = '';
                    $('#employee_id').append('<option ' + selecting + ' value="' + data[i].emp_no + '">' + data[i].full_name + '</optoin>');
                });
            },
            complete: function () {
                
            }
        });

    }
    //    update carder
    $("#leaveReport").submit(function (e) {
        // alert("submited");
        e.preventDefault(); // prevent actual form submit
        var form = $("#leaveReport");
        var action = "get_leave_empl";
        var data = form.serialize() + "&action=" + action;
        var url = app+'/LeaveApplication';
        // screenLock();
        $.ajax({
            type: "GET",
            url: url,
            data: data,
            contentType: "application/json; charset-utf-8",
            dataType: "json", // serializes form input
            beforeSend: function beforeSend() {
                //startLoader();
                console.log(data);
            },
            success: function (data) {
                $('#tbl_leave_report_datat').empty();

                $.each(data, function (key, value)
                {
                    $('#tbl_leave_report_datat').append('<tr><td>' + i++ + '</td><td>' + value.leave_type_name + '</td>  <td>' + value.date_of_application + '</td> <td>' + value.duration + '</td> <td>' + value.user_id + '</td> <td>' + value.date_of_application + '</td><td>' + value.number_days + '</td></tr>');
                });
            },
            error: function error(result) {

            },
            complete: function complete() {
               $('#report_output').css('display', '');

            }
        });
    });
 //    update carder
    $("#leaveSumReport").submit(function (e) {
        // alert("submited");
        e.preventDefault(); // prevent actual form submit
        var form = $("#leaveSumReport");
        var action = "get_leave_balance";
        var data = form.serialize() + "&action=" + action;
        var url = app+'/LeaveApplication';
        // screenLock();
        $.ajax({
            type: "GET",
            url: url,
            data: data,
            contentType: "application/json; charset-utf-8",
            dataType: "json", // serializes form input
            beforeSend: function beforeSend() {
                //startLoader();
                console.log(data);
            },
            success: function (data) {
                $('#tbl_leave_report_datat').empty();

                $.each(data, function (key, value)
                {
                     $('#tbl_leave_report_datat').append('<tr><td>' + i++ + '</td><td>' + value.leave_type + '</td>  <td>' + value.number_days + '</td> <td>' + value.number_consumed + '</td> <td>' + value.current_balance + '</td> </tr>');
               });
            },
            error: function error(result) {

            },
            complete: function complete() {
               $('#report_output').css('display', '');

            }
        });
    });
});


