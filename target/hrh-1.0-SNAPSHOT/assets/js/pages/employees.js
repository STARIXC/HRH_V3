/**
 * 
 */
jQuery(document).ready(function () {
    var jsonData;
    var i = 1;
    var app = "/hrh";
    get_all_staff();
    function get_all_staff() {
        $('#spinner-div').show();
        $.ajax({
            type: "GET",
            url: app + "/employee",
            data: {action: "allStaff"},
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            success: function (data) {
                $('#employee-table-data').empty();
                $.each(data, function (key, value)

                {
                    let status_active = '<span class="label label-success">Active</span>';
                    let status_not_active = '<span class="label label-danger">In Active</span>';
                    let status_terminated = '<span class="label label-danger">Terminated</span>';
                    let status_deceased = '<span class="label label-warning">Deceased</span>';
                    let status_resigned = '<span class="label label-warning">Resigned</span>';
                    let status_not_defined = '<span class="label label-info">Not Defined</span>';
                    let status = value.isActive;
                    let staff_status = "";
                    let estat = value.isActive;
                    let edit_tr = "";
                    let sl = null;
                    sl = key + 1;
                    var diff = moment(value.date_started).fromNow();

//                    $("#dateDifference").text(diff);

                    if (status === "Active") {
                        staff_status = status_active;

                    } else if (status === "Inactive") {
                        staff_status = status_not_active;
                    } else if (status === "Terminated") {
                        staff_status = status_terminated;
                    } else if (status === "Deceased") {
                        staff_status = status_deceased;
                    } else if (status === "Resigned") {
                        staff_status = status_resigned;
                    } else {
                        staff_status = status_not_defined;
                    }

                    let action = '<span class="d-flex justify-content-evenly" >'
                            + ' <div class="action-btn bg-primary">'
                            + '<a title="Profile" href="employee_view.jsp?employee_id=' + value.emp_no + '" class = "btn btn-primary btn-xs btnColor" > '
                            + ' <i class="fa fa-th-large" aria-hidden="true"></i></a>'
                            + '</div>'
                            + ' <div class="action-btn bg-info ">'
                            + ' <a href="javascript:void(0);"  data-id="' + value.emp_no + '" class="btn btn-info btn-xs btnColor edit_emp" title="Edit">'
                            + '<i class="fa fa-edit text-white"></i>'
                            + '</a>'
                            + '</div>'
                            + ' <div class="action-btn bg-danger">'
                            + '<a href="javascript:void(0);"  data-emp="' + value.emp_no + '" data-id="' + value.emp_no + '" class="delete btn btn-danger btn-xs btnColor" title="Delete" aria-label="Delete"><i class="fa fa-trash text-white text-white"></i></a>'
                            + '   </div>'
                            + '</span>';


//                    var encodedEmpNo = value.emp_no;
//                    var decodedEmpNo = atob(encodedEmpNo);
                    if (estat === "Active") {
                        edit_tr = action;
                    } else {
                        edit_tr = '<i class="fa fa-lock"></i>';
                    }
                    let table_row = '<tr class="30">'
                            + '<td >' + sl + '</td>'
                            + '<td>'
                            + '<a href="employee_view.jsp?employee_id=' + value.emp_no + '" class="user_info" ><img style=" width: 70px; " src="../assets/uploads/employeePhoto/employee.png" alt="user-img" class="img-circle"></a>'
                            + '</td>'
                            + '<td>'
                            + '<span class="font-medium">'
                            + '<a href="employee_view.jsp?employee_id=' + value.emp_no + '"><strong>' + value.full_name + '</strong></a>'
                            + '</span>'
                            + ' <br><span class="text-muted">Role :   Employee</span>'
                            + '<br><span class="text-muted">SuperVisor : ' + value.supervisor + '</span>'
                            + '</td>'
                            + '<td>'
                            + '<span class="font-medium">' + value.standard_carder + '</span>'
                            + '<br><span class="text-muted">Designation :' + value.positionTitle + ' </span>'
                            + '<br><span class="text-muted">Facility : ' + value.current_facility + '</span>'
                            + '</td>'
                            + '<td>'
                            + '<span class="font-medium"> ' + value.phone + '</span>'
                            + '<br><span class="text-muted">email :' + value.email + '</span>'
                            + '</td>'
                            + '<td> <span class="font-medium">' + value.emp_no + '</span>'
                            + '</td>'
                            + '<td>'
                            + '<span class="font-medium"> ' + value.date_started + ' </span>'
                            + '<br><span class="text-muted"> '+diff+' </span>'
                            + '<br><span class="text-muted">Job Status: Probation Period </span>'
                            + '</td>'
                            + '<td>' + staff_status
                            + '</td>'

                            + '<td >'
                            + edit_tr
                            + '</td>'
                            + '</tr>';
                    $('#employee-table-data').append(table_row);
                });
            },
            complete: function () {
                var table = $('#employee_table').DataTable(
                        {
                            responsive: true
//                            processing: true
                        });
                new $.fn.dataTable.FixedHeader(table);
                $('#spinner-div').hide(); //Request is complete so hide spinner
            }
        });
    }


});

 
