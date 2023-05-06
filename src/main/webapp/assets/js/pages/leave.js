



$(document).ready(function (e) {
    
    "use strict";
        var app = "/hrh";
        var leave_id=$("#leave_id").val();
    function holidaycalculation() {
     
        var date1 = new Date($('#start_date').val());
        var date2 = new Date($('#end_date').val());
        var from = new Date($('#start_date').val());
        var to = new Date($('#end_date').val());

        var DAYS = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

        var d = from;
        var count = 0;
        var weekend = "<%out.println('Weekend')%>";
        var w = weekend.split(',');
        while (d <= to) {
            d = new Date(d.getTime() + (24 * 60 * 60 * 1000));
            if (DAYS[d.getDay()] === w[0] || DAYS[d.getDay()] === w[1] || DAYS[d.getDay()] === w[2]) {
                count += 1;
            }
        }

        var timeDiff = Math.abs(date2.getTime() - date1.getTime());
        var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)) - count;
        $('#no_of_days').val(diffDays + 1);
    }
    $('#start_date,#end_date').change(holidaycalculation);
    function leaveapprovecalculation() {
        var date1 = new Date($('.leave_aprv_strt_date').val());
        var date2 = new Date($('.leave_aprv_end_date').val());
        var from = new Date($('.leave_aprv_strt_date').val());
        var to = new Date($('.leave_aprv_end_date').val());
        var DAYS = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

        var d = from;
        var count = 0;
        var weekend = "<?php echo $weekend ?>";
        var w = weekend.split(',');

        while (d <= to) {
            d = new Date(d.getTime() + (24 * 60 * 60 * 1000));
            if (DAYS[d.getDay()] === w[0] || DAYS[d.getDay()] === w[1] || DAYS[d.getDay()] === w[2]) {
                count += 1;
            }
        }

        var timeDiff = Math.abs(date2.getTime() - date1.getTime());
        var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)) - count;
        $('.num_aprv_day').val(diffDays + 1);
    }
    $('.leave_aprv_strt_date,.leave_aprv_end_date').change(leaveapprovecalculation);



    function applyday() {

        var from = new Date($('.apply_start').val());
        var to = new Date($('.apply_end').val());
        var DAYS = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

        var d = from;
        var count = 0;
        var weekend = "<?php echo $weekend ?>";
        var w = weekend.split(',');

        while (d <= to) {
            d = new Date(d.getTime() + (24 * 60 * 60 * 1000));
            if (DAYS[d.getDay()] === w[0] || DAYS[d.getDay()] === w[1] || DAYS[d.getDay()] === w[2]) {
                count += 1;
            }
        }
        var date1 = new Date($('#apply_start').val());
        var date2 = new Date($('#apply_end').val());
        var timeDiff = Math.abs(date2.getTime() - date1.getTime());
        var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)) - count;
        $('#apply_day').val(diffDays + 1);
    }


    $('#apply_start,#apply_end').change(applyday);


"use strict";
function leavetypechange(id) {
    var leave_type = id;
    var employee_id = $('#employee_id').val();
    var base_url = $("#base_url").val();
    var csrf_test_name = $('[name="csrf_test_name"]').val();
    $.ajax({
        url: app + "leave/Leave/free_leave",
        method: 'post',
        dataType: 'json',
        data: {
            'employee_id': employee_id,
            'leave_type': id,
            csrf_test_name: csrf_test_name
        },
        success: function (data) {
            document.getElementById('enjoy').innerHTML = 'You Enjoyed : ' + data.enjoy + ' Ds';
            document.getElementById('checkleave').innerHTML = 'Total Leave : ' + data.due + ' Ds';
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }
    });
}

    function datecheck() {
        var date = new Date($('#apply_start').val());
        var date1 = new Date($('#leave_aprv_strt_date').val());
        var date2 = new Date($('#leave_aprv_end_date').val());
        if (date > date1 || date > date2) {
            alert('Can not greater than');
            document.getElementById('leave_aprv_strt_date').value = '';
            document.getElementById('leave_aprv_end_date').value = '';
        }
    }
    $('.leave_aprv_strt_date,.leave_aprv_end_date').change(datecheck);


    function leavecalculation() {
        var date1 = new Date($('.leave_aprv_strt_date').val());
        var date2 = new Date($('.leave_aprv_end_date').val());
        var from = new Date($('.leave_aprv_strt_date').val());
        var to = new Date($('.leave_aprv_end_date').val());
        var DAYS = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

        var d = from;
        var count = 0;
        var weekend = "<?php echo $weekend ?>";
        var w = weekend.split(',');

        while (d <= to) {
            d = new Date(d.getTime() + (24 * 60 * 60 * 1000));
            if (DAYS[d.getDay()] === w[0] || DAYS[d.getDay()] === w[1] || DAYS[d.getDay()] === w[2]) {
                count += 1;
            }
        }

        var timeDiff = Math.abs(date2.getTime() - date1.getTime());
        var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)) - count;
        $('.num_aprv_day').val(diffDays + 1);
    }
    $('.leave_aprv_strt_date,.leave_aprv_end_date').change(leavecalculation);
    
    getLeaveDet();
    function getLeaveDet() {

        console.log("leave_id:" + leave_id);
        $.ajax({
            type: "GET",
            url: app+'/LeaveApplication?action=getleavedetails',
            data: { id: leave_id},
            dataType: "json",
            success: function (data) {
//                var data = data;
//                if (data.employee.gender === "Female") {
//                    document.getElementById("emp_image").src = "assets/images/female.png";
//                } else {
//                    document.getElementById("emp_image").src = "assets/images/male.png";
//                }
////                console.log("|Processing 2 Done:");
//                let status_active = '<span class="label label-success">Active</span>';
//                let status_not_active = '<span class="label label-danger">In Active</span>';
//                let status_terminated = '<span class="label label-danger">Terminated</span>';
//                let status_deceased = '<span class="label label-warning">Deceased</span>';
//                let status_resigned = '<span class="label label-warning">Resigned</span>';
//                let status_not_defined = '<span class="label label-info">Not Defined</span>';
//                let status = data.employee.isActive;
//                let staff_status = "";
////                console.log(status);
//                if (status === "Active") {
//                    staff_status = status_active;
//                } else if (status === "Inactive") {
//                    staff_status = status_not_active;
//                } else if (status === "Terminated") {
//                    staff_status = status_terminated;
//                } else if (status === "Deceased") {
//                    staff_status = status_deceased;
//                } else if (status === "Resigned") {
//                    staff_status = status_resigned;
//                } else {
//                    staff_status = status_not_defined;
//                }
////                console.log("|Processing 3 Starts:");
//                var full_name = data.employee.surname + " " + data.employee.first_name;
////            console.log("Title:" + jobTitle);
//                $("#emp_name").text(data.employee.surname + " " + data.employee.first_name);
//                $(".text_info").text(data.employee.surname + " " + data.employee.first_name);
//                $("#sum_name").text(data.employee.surname + " " + data.employee.first_name);
//                $("#full_name").text(full_name);
//                var position = data.employee.positionTitle;
//                if (position === null || position === "") {
//                    $("#designation").text("N/A");
//                    $("#_designation").text("N/A");
//                    $("#designation_").text("N/A");
//                } else {
//                    $("#designation").text(position);
//                    $("#_designation").text(position);
//                    $("#designation_").text(position);
//                }
////                $("#designation").text();
////                $("#_designation").text(data.currentPosition.position);
//                $("#fname").text(data.employee.first_name);
//                $("#lname").text(data.employee.surname);
//                $("#employeeNo").text(data.employee.emp_no);
//                $("#wemp_record").val(data.employee.emp_no);
//                $("#doc_emp_record").val(data.employee.emp_no);
//                $("#email").text(data.employee.email);
        

            },
            error: function (error) {
                console.log("Error: " + error);
            }
        });
    }
  
    
});