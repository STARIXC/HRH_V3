
$(document).ready(function () {
    var i = 1;
    var app="/hrh";
    $(".datepicker").datepicker({dateFormat: 'yy-mm-dd'});
    $("#txtTerminateDate").datepicker({dateFormat: 'yy-mm-dd'});
    $("#txtRehiredate").datepicker({dateFormat: 'yy-mm-dd'});
    $("#txtBirthDate").datepicker({dateFormat: 'yy-mm-dd'});
    
    
     var jsonData;
    var i = 1;
    get_all_terminations();
    function get_all_terminations() {
     //   $('#spinner-div').show();
        $.ajax({
            type: "GET",
            url: app+'/Terminations?action=get_all_data',
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            success: function (data) {
                $('#termination_data').empty();
                $.each(data, function (key, value)

                {
//                    var status_active = '<span class="label label-success">Active</span>';
//                    var status_not_active = '<span class="label label-danger">In Active</span>';
//                    if (value.active === 1) {
//                        var status = status_active;
//                    } else {
//                        var status = status_not_active;
//                    }


                    var edit_tr = '<div class="d-flex" style="width: 150px;">'
                            + '<a title="Profile" href="termination_view.jsp?termination_id=' + value.t_id + '" class="btn btn-primary btn-xs btnColor ms-1">'
                            + '<i class="fa fa-th-large" aria-hidden="true"></i>'
                            + '</a>'
                            + ' <a href="update_termination_form.jsp?termination_id=' + value.t_id + '" class="btn btn-success btn-xs btnColor ms-1">'
                            + '<i class="fa fa-edit" aria-hidden="true"></i>'
                            + ' </a>'
                            + ' <a id="delete_termination" href="javascript:void(0);" data-emp="' + value.emp_no + '"  data-id="' + value.t_id + '" class="delete btn btn-danger btn-xs deleteBtn btnColor ms-1"><i class="fa fa-trash"'
                            + '        aria-hidden="true"></i></a>'
                            + ' </div>';
                    $('#termination_data').append('<tr><td>' + i++ + '</td><td>' + value.emp_name + '</td><td>' + value.voluntary_termination + '</td> <td>' + value.termination_date + '</td><td>' + value.termination_date + '</td><td>' + edit_tr + '  </td></tr>');
                });
            },
            complete: function () {
                $('#myTable').DataTable(
                        {
                            responsive: true,
                            dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>>tp",
                            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                            buttons: [
                                {extend: 'copy', className: 'btn-sm'},
                                {extend: 'csv', title: 'ExampleFile', className: 'btn-sm'},
                                {extend: 'excel', title: 'exportTitle', className: 'btn-sm'},
                                {extend: 'pdf', title: 'ExampleFile', className: 'btn-sm'},
                                {extend: 'print', className: 'btn-sm'}
                            ]
                        });
               // $('#spinner-div').hide();//Request is complete so hide spinner
            }
        });
    }
//    $('#myTable').DataTable({
//        responsive: true,
//        dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>>tp",
//        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
//        buttons: [
//            {extend: 'copy', className: 'btn-sm'},
//            {extend: 'csv', title: 'ExampleFile', className: 'btn-sm'},
//            {extend: 'excel', title: 'exportTitle', className: 'btn-sm'},
//            {extend: 'pdf', title: 'ExampleFile', className: 'btn-sm'},
//            {extend: 'print', className: 'btn-sm'}
//        ],
//        "ajax": {
//            "url": './Terminations?action=get_all_data',
//            "type": "GET",
//            dataType: "json",
//
//            "data": function (d) {
//                console.log(d);
//                $("#termination_data").html(d);
//            }
//            ,
//            dataSrc: ""
//        },
//        "columns": [
//            {
//                "render": function (data, type, row, meta) {
//                    return i++;
//                }
//            },
//            {
//                "data": "emp_name"
//            },
//
//            {
//                "data": "voluntary_termination"
//            },
//            {
//                "data": "termination_date"
//            },
//            {
//                "data": "termination_date"
//            },
//
//            {
//
//                "data": "t_id",
//                "render": function (data, type, row, meta) {
//                    return 	'<div class="center"><a  title="View Details" href="termination/8" class="btn btn-primary btn-xs btnColor">'
//                            + '<i class="glyphicon glyphicon-th-large" aria-hidden="true"></i></a>'
//                            + '<a href="termination/8/edit"  class="btn btn-success btn-xs btnColor"><i class="fa fa-edit-square-o" aria-hidden="true"></i></a>'
//                            + '<a href="termination/8/delete"  data-id="8" class="delete btn btn-danger btn-xs deleteBtn btnColor"><i class=" mdi mdi-trash-can-outline" aria-hidden="true"></i></a> </div>';
//                }
//            }
//        ]
//
//
//    });

    //   $('.employee_t').select2();
    loademp();
    function loademp() {
        $.ajax({
            url: './ProcessStaff?action=get_basic',
            type: 'get',
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            success: function (data) {
                $('.employee_t').empty();
                $('.employee_t').append('<option value="">--- Select One---</option>');
                $.each(data, function (key, value)
                {
                    $('.employee_t').append('<option value="' + value.emp_no + '">' + value.full_name + '</option>');
                });

            },
            complete: function () {
                $(".employee_t").select2({
                    allowClear: true
                });
            }
            // $('.employee_t');



        });

    }
// jQuery ajax form submit example, runs when form is submitted
    $("#terminationForm").submit(function (e) {
        e.preventDefault(); // prevent actual form submit
        var form = $("#terminationForm");
        let action = "terminate";
        var data = form.serialize() + "&action=" + action;
        var url = './ProcessStaff'; //get submit url [replace url here if desired]
        //screenLock();
        $.ajax({
            type: "POST",
            url: url,
            data: data, // serializes form input
            beforeSend: function beforeSend() {
                //	startLoader();
                console.log(data);
            },
            success: function (data) {
                setTimeout(() => {
                    toastr.success(data.status, data.message);
                }, 500);

                console.log(data);

            },
            error: function error(result) {
                 setTimeout(() => {
                    toastr.error(data.status, data.message);
                }, 500);
            },
            complete: function complete() {
                //	stopLoader();
                var url_ = "manage_termination.jsp";
                $(location).attr('href', url_);
                event.preventDefault();
            }
        });
    });
});


