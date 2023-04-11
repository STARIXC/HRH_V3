$(function () {
getDefaultMonth();
var app="/hrh";
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
        var now = new Date();
        var month = (now.getMonth() + 1);
        var year = now.getFullYear();
        if (month < 10)
            month = "0" + month;
          $.ajax({
            url: app+"/TimesheetSummary?year=" + year + "&&month=" + month,
            type: 'get',
            dataType: 'html',
            success: function (data) {
                document.getElementById("timesheet_table").innerHTML = data;
                // $('#timesheet_table').val(data);

            }


        });
       // if (day < 10)
        //    day = "0" + day;
       // var today =  + '-' + month;
        
    }
    ;
    function gethours() {
        // $('#table_timesheet').empty();
        var date_ = document.getElementById("month").value;
        var dt = new Date(date_);
        var year = dt.getFullYear();
        var month = (dt.getMonth() < 10 ? '0' : '') + (dt.getMonth() + 1);
        // var day = (dt.getDate() < 10 ? '0' : '') + dt.getDate();

        //   var year = document.getElementById("Tyear").value;
        //  var month = document.getElementById("TMonth").value;

        $.ajax({
            url: app+"/TimesheetSummary?year=" + year + "&&month=" + month,
            type: 'get',
            dataType: 'html',
            success: function (data) {
                document.getElementById("timesheet_table").innerHTML = data;
                // $('#timesheet_table').val(data);

            }


        });
    }
    ;
});




