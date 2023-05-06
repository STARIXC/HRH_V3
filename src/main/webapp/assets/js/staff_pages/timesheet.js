$(document).ready(function () {
    var app = "/hrh";
    var now = new Date();
    var month = (now.getMonth() + 1);
    var hourTotal = 0;
    var day = now.getDate();
    if (month < 10)
        month = "0" + month;
    if (day < 10)
        day = "0" + day;
    var today = now.getFullYear() + '-' + month;
    console.log(today);
    $('.monthField').val(today);

    $(".monthField").datepicker({
        format: "yyyy-mm",
        viewMode: "months",
        minViewMode: "months"
    }).on('changeDate', function (e) {
        $(this).datepicker('hide');
        gethours();
        retrivetimesheet();
    });
    retrivetimesheet();

    $("#timesheetForm_").submit(function (e) {
        e.preventDefault(); // prevent actual form submit
        var form = $("#timesheetForm_");
        var action = "save_log";
        var data = form.serialize() + "&action=" + action;
        var url = app + '/LogTimesheet'; //get submit url [replace url here if desired]
//        screenLock();
        $.ajax({
            type: "POST",
            url: url,
            data: data, // serializes form input
            beforeSend: function beforeSend() {
                //startLoader();
                console.log(data);
            },
            success: function (data) {
                var url_ = "manage_timesheet.jsp";
                $(location).attr('href', url_);
                console.log(data);
            },
            error: function error(result) {

            },
            complete: function complete() {
                //	stopLoader();

            }
        });
    });


    function gethours() {

        const str = document.getElementById("monthyear").value;
        const split = str.split('-');
        var year = split[0];
        var month = split[split.length - 1];
        var firstDay = new Date(year, month, 1);
        var lastDay = new Date(year, month + 1, 0);
        $.ajax({
            url: app + "/GetHours?year=" + year + "&&month=" + month,
            type: 'get',
            dataType: 'html',
            success: function (data) {
                document.getElementById("exp_hour").innerHTML = data;
                $('#exp_hour_').val(data);
            }


        });
    }
    ;

    function retrivetimesheet() {

        $('#table_timesheet').empty();
        const str = document.getElementById("monthyear").value;
        const split = str.split('-');
        var year = split[0];
        var month = split[split.length - 1];
        var emp_no = document.getElementById("__STAFFID").value;
        $.ajax({
            url: app + "/timesheetController?year=" + year + "&&month=" + month + "&&emp_no=" + emp_no + "&&action=getEmployeeEntries",
            type: "get",
            dataType: "json",
            success: function (data) {
                var arr = eval(data);
                $.each(arr, function (index, content) {
                    var currentDate = new Date(); // get the current date
                    var inputDate = new Date(content.date_field); // convert the input date string to a Date object
                    let x = Math.floor((Math.random() * 10000) + 1);
                    let log_no = content.log_no;
                    if (log_no === "0") {

                        document.getElementById("logno").innerHTML = x;
                        $('#TSID').val(x);
                        $('#log_id').val(x);
                    } else {
                        document.getElementById("logno").innerHTML = log_no;
                        $('#TSID').val(log_no);
                        $('#log_id').val(log_no);
                    }

                    // console.log(content);
                    const date_day = content.date_name + ', ' + content.date_field;
                    const isWeekday = content.isWeekday;
                    const isHoliday = content.isHoliday;
                    const onLeave = content.onLeave;

                    var html_code = '<tr bgcolor="#f5f5f5">';
                    html_code += '<td><input type="hidden" name="date_" value="' + content.date_field + '" class="data form-control-sm">&nbsp;' + date_day + '&nbsp;</td>';

                    if (content.isWeekday === 1 && content.isHoliday === 0 && content.onLeave === 0) {
                        html_code += '<td align="center" title=""><input type="number" name="hours_worked" min="0" max="8" value="' + content.hours_worked + '" maxlength="2" class="hours_worked data form-control-sm"></td>';
                    } else {
                        html_code += '<td align="center" title=""><input type="number" name="hours_worked" min="0" max="8" value="' + content.hours_worked + '" maxlength="2" class="hours_worked data form-control-sm" disabled></td>';
                    }

                    html_code += '<td align="center" title=""><input type="number" name="leave" min="0" max="8" value="' + content.leave_hours + '" maxlength="2" class="leave data form-control-sm" disabled></td>';
                    html_code += '<td align="center" title=""><input type="number" name="pHoliday" min="0" max="8" value="' + content.public_holiday + '" maxlength="2" class="pHoliday data form-control-sm" disabled></td>';

                    if (content.isWeekday === 1 && content.isHoliday === 0 && content.onLeave === 0) {
                        html_code += '<td align="center" title=""><input type="number" name="extra_hours_worked" min="0" max="8" value="' + content.extra + '" maxlength="2" class="extra_hours_worked data form-control-sm"></td>';
                    } else {
                        html_code += '<td align="center" title=""><input type="number" name="extra_hours_worked" min="0" max="8" value="' + content.extra + '" maxlength="2" class="extra_hours_worked data form-control-sm" disabled></td>';
                    }

                    html_code += '<td><textarea name="activity_desc" class="activity_desc form-control" style="text-align:left;width:200px;height:30px;">' + content.activity_desc + '</textarea></td>';
                    html_code += '</tr>';



                    $('#table_timesheet').append(html_code);
                    calculateAndsetTotalHours();
                    calculateLeaveTotalHours();
                    calculateHolidayTotalHours();
                    calculateExtraTotalHours();
                });

            }

        }
        );



    }

//getActivities();
    changeHour();
    calculateAndsetTotalHours();
    calculateLeaveTotalHours();
    function calculateAndsetTotalHours() {
        var totalHours = 0;
        $('#table_timesheet > tr').each(function () {
            var hourTotal = $(this).find('.hours_worked').val();
            hourTotal = ($.trim(hourTotal).length === 0) ? 0 : parseFloat(hourTotal);
            totalHours += hourTotal;
        });
        totalHours = parseFloat(totalHours);
        if (isNaN(totalHours)) {
            totalHours = 0;
        }
        $('#tstotal').val(totalHours);
        document.getElementById("THours").innerHTML = totalHours;
    }

//	calculateLeaveTotalHours();
    function calculateLeaveTotalHours() {
        var totalHours = 0;
        $('#table_timesheet > tr').each(function () {
            var hourTotal = $(this).find('.leave').val();
            hourTotal = ($.trim(hourTotal).length === 0) ? 0 : parseFloat(hourTotal);
            totalHours += hourTotal;
        });
        totalHours = parseFloat(totalHours);
        if (isNaN(totalHours)) {
            totalHours = 0;
        }
        $('#ltotal').val(totalHours);
        document.getElementById("leave_tot").innerHTML = totalHours;
    }

    calculateHolidayTotalHours();
    function calculateHolidayTotalHours() {
        var totalHours = 0;
        $('#table_timesheet > tr').each(function () {
            var hourTotal = $(this).find('.pHoliday').val();
            hourTotal = ($.trim(hourTotal).length === 0) ? 0 : parseFloat(hourTotal);
            totalHours += hourTotal;
        });
        totalHours = parseFloat(totalHours);
        if (isNaN(totalHours)) {
            totalHours = 0;
        }
        $('#phtotal').val(totalHours);
        document.getElementById("pholiday_tot").innerHTML = totalHours;
    }

    calculateExtraTotalHours();
    function calculateExtraTotalHours() {
        var totalHours = 0;
        var ehourTotal = 0;
        $('#table_timesheet > tr').each(function () {
            ehourTotal = $(this).find('.extra_hours_worked').val();
//            ehourTotal = $.trim(ehourTotal);
            ehourTotal = ($.trim(ehourTotal).length === 0) ? 0 : parseFloat(ehourTotal);
            totalHours += ehourTotal;
        });
        totalHours = parseFloat(totalHours);
        if (isNaN(totalHours)) {
            totalHours = 0;
        }
        $('#extotal').val(totalHours);
        document.getElementById("ETotal").innerHTML = totalHours;
    }


    $(document).on('keyup', '.hours_worked',
            function () {
                calculateAndsetTotalHours();
                changeHour();
            });
    $(document).on('keyup', '.leave',
            function () {
                calculateLeaveTotalHours();
                changeHour();
            });
    $(document).on('keyup', '.pHoliday',
            function () {
                calculateHolidayTotalHours();
                changeHour();
            });
    $(document).on('keyup', '.extra_hours_worked',
            function () {
                calculateExtraTotalHours();
                changeHour();
            });


    function changeHour() {
        var totalHours = 0;
        var hours_worked = parseInt($("#tstotal").val());
        var leave = parseInt($("#ltotal").val());
        var pholiday = parseInt($("#phtotal").val());
        var extra_hours = parseInt($("#extotal").val());
        var totalHours = hours_worked + leave + pholiday + extra_hours;

        $('#ttotal').val(totalHours);
        //document.getElementById("").innerHTML = totalHours;
        document.getElementById("labelTotalH").innerHTML = totalHours;

    }



    function getTotals() {
        $.ajax({
            url: './GetTotals',
            type: 'get',
            dataType: 'html',
            success: function (data) {
//        $('#tstotal').val(hoursw);
//  $('#phtotal').val(holiday);
//  $('#ltotal').val(leavehours);
//  $('#extotal').val(extra);
//  $('#ttotal').val(extra);
            }
        });

    }





});