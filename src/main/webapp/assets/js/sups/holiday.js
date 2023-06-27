$(function () {
    $(".datepicker").datepicker();
    $(".select2").select2();
//     $('#myTable').DataTable();
 var app="/hrh";

var i = 1;
get_holidays();
function get_holidays() {
    $.ajax({
        type: "GET",
        url: app+'/ManageHolidays?action=listHolidays',
        contentType: "application/json; charset-utf-8",
        dataType: "json",
        success: function (data) {
            $('#tbl_holidays').empty();


            $.each(data, function (key, value)
            {
                let index=key+1;
                $('#tbl_holidays').append('<tr><td>' + index + '</td><td>' + value.holiday_name + '</td>  <td>' + value.start_date + '</td> <td>' + value.end_date + '</td> <td>' + value.no_of_days + '</td> <td>  <a href="javascript:void(0);"  data-id="' + value.id + '" class="btn btn-success btn-xs btnColor edit-hols"> <i class="fa fa-edit" ></i></a> <a href="javascript:void(0);"  data-id="' + value.id + '" class="delete btn btn-danger btn-xs deleteBtn btnColor"><i class="fa fa-trash" aria-hidden="true" title="Delete" ></i></a> </td></tr>');
            });

        },
        complete: function () {

        }
    });

}
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
$(document).on("focus", ".datepicker", function () {
    $(this).datepicker({
        format: 'yyyy-mm-dd',
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
});
$("#from_date").datepicker({
    dateFormat: "yy-mm-dd",
    numberOfMonths: 1,
    minDate: 0,
    changeMonth: true,
    changeYear: true,
    onSelect: function (selected) {
        var dt = new Date(selected);
        dt.setDate(dt.getDate());
        $("#to_date").datepicker("option", "minDate", dt);
        $(this).change();
    }

}).on("change", function () {
    showDays();
});
$("#to_date").datepicker({
    dateFormat: "yy-mm-dd",
    changeMonth: true,
    changeYear: true,
    numberOfMonths: 1,
    onSelect: function (selected) {
        var dt = new Date(selected);
        dt.setDate(dt.getDate() - 1);
        $(this).change();
    }
}).on("change", function () {
    showDays();
});

function showDays() {
    var start = $('#from_date').datepicker('getDate');
    var end = $('#to_date').datepicker('getDate');
    if (!start || !end)
        return;
    var days = (end - start) / 1000 / 60 / 60 / 24;
    $('#no_of_days').val(days + 1);

}

// jQuery ajax form submit example, runs when form is submitted
$("#publicHolidayForm").submit(function (e) {
    e.preventDefault(); // prevent actual form submit
    var form = $("#publicHolidayForm");
    var leave_status = 1;
    let action = "submit";
    var data = form.serialize() + "&action=" + encodeURIComponent(action) + '&leave_status=' + encodeURIComponent(leave_status);
    var url = app+"/ManageHolidays"; //get submit url [replace url here if desired]
    //screenLock();
    $.ajax({
        type: "POST",
        url: url,
        dataType: 'json',
        data: data, // serializes form input
        beforeSend: function beforeSend() {
            //	startLoader();
            console.log("This Data is been tranmited" + data);
        },
        success: function (data) {
            // Check the status field and display the message
            if (data.status === 'success') {
                $("#success-popup").removeClass("d-none");
                $("#publicHolidayForm")[0].reset();
                $("#simpleModalLHoliday").modal('hide');
                $('#success-popup').text(data.message);
                $('#success-popup').addClass('success');
                get_holidays();
            } else if (data.status === 'error') {
                $('#success-popup').text(data.message);
                $('#success-popup').addClass('error');
            }
//            console.log(data);
//            var url_ = "manage_employee.jsp";
//            $(location).attr('href', url_);
        },
        error: function error(result) {

        },
        complete: function complete() {
            //	stopLoader();
            e.preventDefault();
//             $('#success-popup"').text(data.message);
        }
    });
});

});