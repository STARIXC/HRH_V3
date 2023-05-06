
$(document).ready(function () {
    var app = "/hrh";
    var jsonData;


    get_leave_applications();
    function get_leave_applications() {
        var emp_no = document.getElementById("__STAFFID").value;
//        var action = "get_leave_empl";
//        var data = {emp_no: emp_no, action: action};

        $.ajax({
            url: app + '/LeaveApplication?action=get_leave_empl&emp_no='+emp_no,
            type: 'POST',
            dataType: "json",
            success: function (response) {
                $('#leave_application_data').empty();
                 $.each(response, function (key, value)
                {
                    var status = "";
                    if (value.leave_status === 0) {
                        status = '<span class="badge bg-info">Pending</span>';
                    } else if (value.leave_status === 2) {
                        status = '<span class="badge bg-danger">Rejected</span>';
                    } else {
                        status = '<span class="badge bg-success">Approved</span>';
                    }
                    $('#leave_application_data').append('<tr><td>' + value.employee_name + '</td><td>' + value.leave_type_name + '</td><td>' + value.duration + '</td> <td>' + status + '</td><td class="text-center"><a class="btn btn-md btn-info "href="./leave_details.jsp?id='+value.application_id+'"><i class="icon fa fa-file-alt"></i> Details</a></td></tr>');
                });
            },
            error: function (xhr) {
                console.log(xhr.responseText);
            }
        });

    }
    ;
});