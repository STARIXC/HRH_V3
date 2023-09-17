/**
 * 
 */
jQuery(document).ready(function () {
    var jsonData;
    var i = 1;
    var app="/hrh";
    get_all_staff();
    function get_all_staff() {
        $('#spinner-div').show();
        $.ajax({
            type: "GET",
            url: app+"/employee",
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
//                    console.log(status);

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

                    let action =
                            '<span>'
                            + ' <div class="action-btn bg-info ms-2">'
                            + ' <a href="javascript:void(0);"  data-id="' + value.emp_no + '" class="mx-3 btn btn-sm  align-items-center edit_emp" title="Edit">'
                            + '<i class="fa fa-edit text-white"></i>'
                            + '</a>'
                            + '</div>'
                            + ' <div class="action-btn bg-danger ms-2">'
                            + '<a href="javascript:void(0);"  data-emp="' + value.emp_no + '" data-id="' + value.id + '" class="delete mx-3 btn btn-sm  align-items-center bs-pass-para" title="Delete" aria-label="Delete"><i class="fa fa-trash text-white text-white"></i></a>'
                            + '   </div>'
                            + '</span>';


//
//                    let position = value.current_position;
//
//                    if (position !== null) {
//                        position = value.current_position;
//                    } else {
//                        position = "N/A";
//                    }
                    var encodedEmpNo = value.emp_no;
                    var decodedEmpNo = atob(encodedEmpNo);
                    if (estat === "Active") {
                        edit_tr = action;
                    } else {
                        edit_tr = '<i class="fa fa-lock"></i>';
                    }
                    let edit_btn = '<a title="Profile" href="employee_view.jsp?employee_id=' + value.emp_no + '" class="btn btn-outline-primary">PFNo :' + decodedEmpNo + '</a>';

                    $('#employee-table-data').append('<tr><td>' + edit_btn + '</td><td>' + value.full_name + '</td><td>' + value.phone + '</td><td>' + value.email + '</td><td>' + value.nationality + '</td><td class="Action">' + staff_status + '</td><td>' + edit_tr + '  </td></tr>');
                });
            },
            complete: function () {
                var table = $('#employee_table').DataTable(
                        {
                            responsive: true,
                            processing: true
                        });
                new $.fn.dataTable.FixedHeader(table);
                $('#spinner-div').hide(); //Request is complete so hide spinner
            }
        });
    }


});

 