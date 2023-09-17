$(document).ready(function () {
    const app = "/hrh";
    retrivetimesheet();
    function retrivetimesheet() {
        const urlParams = new URLSearchParams(window.location.search);
        const year = urlParams.get('year');
        const month = urlParams.get('month');
        const emp_no = urlParams.get('emp_no');
        const action = urlParams.get('action');
        getEmployeeDetails(emp_no);
        $('#table_timesheet').empty();
        let totalHoursWorked = 0;
        let totalLeaveHours = 0;
        let totalPublicHolidayHours = 0;
        let totalExtraHours = 0;
        $.ajax({
            url: app + "/timesheetController?year=" + year + "&month=" + month + "&emp_no=" + emp_no + "&action=" + action,
            type: "get",
            dataType: "json",
            success: function (data) {
                var arr = eval(data);

                let month_year = month + "-" + year;
                document.getElementById("period").innerHTML = month_year;
                $.each(arr, function (index, content) {

                    let log_no = content.log_no;
                    let totalHours = content.hours_worked + content.leave_hours + content.public_holiday + content.extra;
                    // Update total hours
                    totalHoursWorked += content.hours_worked;
                    totalLeaveHours += content.leave_hours;
                    totalPublicHolidayHours += content.public_holiday;
                    totalExtraHours += content.extra;
                    // console.log(content);
                    const date_day = content.date_name + ', ' + content.date_field;
                    const isWeekday = content.isWeekday;
                    const isHoliday = content.isHoliday;
                    const onLeave = content.onLeave;
                    var html_code = '<tr bgcolor="#f5f5f5">';
                    html_code += '<td>' + content.date_field + '</td>';
                    html_code += '<td>' + content.date_name + '</td>';
                    html_code += '<td align="center" title="">' + content.hours_worked + '</td>';
                    html_code += '<td align="center" title="">' + content.leave_hours + '</td>';
                    html_code += '<td align="center" title="">' + content.public_holiday + '</td>';
                    html_code += '<td align="center" title="">' + content.extra + '</td>';
                    html_code += '<td align="center" title="">' + totalHours + '</td>';
                    html_code += '</tr>';
                    $('#table_timesheet_body').append(html_code);
                    document.getElementById("THours").innerHTML = totalHoursWorked;
                    document.getElementById("leave_tot").innerHTML = totalLeaveHours;
                    document.getElementById("pholiday_tot").innerHTML = totalPublicHolidayHours;
                    document.getElementById("ETotal").innerHTML = totalExtraHours;



                });
            }

        }
        );


    }
    ;

    function getEmployeeDetails(emp_no) {
        $.ajax({
            type: "GET",
            url: `${app}/profile?emp_no=${emp_no}&action=get_basic`,
            dataType: "json",
            success: function (response) {
                var full_name = response.surname + ' ' + response.first_name;
                document.getElementById("name").innerHTML = full_name;
                document.getElementById("pfNo").innerHTML = response.emp_no;
                document.getElementById("position").innerHTML = response.positionTitle;
                document.getElementById("facility").innerHTML = response.current_facility;
                document.getElementById("county").innerHTML = response.county;
            }});
    }

});


   