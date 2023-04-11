/**
 * 
 */
jQuery(document).ready(function () {
    var jsonData;
      var app="/hrh";
get_leave_types();

    var i = 1;
    function get_leave_types(){
        $('#leave_type_table').DataTable({
        "ajax": {
            "url": app+'/LeaveType',
            "type": "GET",
            dataType: "json",
            dataSrc: "",
            "data": function (d) {
                $("#leave_type_data").html(d);
            }
        },
        //{"id":2,"carder_category_id":0,"standardized_cadre_id":0,"position_title":"CLINICAL MENTOR","cadre_type_id":0,"basic_pay":0}

        "columns": [
            {
                "data": "leave_type"
            },

            {
                "data": "description"
            },
            {
                "data": "max_days"
            },
            {
                "targets": 0,
                "data": "leave_id",
                "render": function (data, type, row, meta) {
                    return '<div class="d-flex">  <a href="javascript:void(0);"  data-id="' + data + '" class="btn btn-success btn-xs btnColor edit-lt"> <i class="fa fa-edit" ></i></a> <a href="javascript:void(0);"  data-id="' + data + '" class="delete delete_leave_type btn btn-danger btn-xs deleteBtn btnColor"><i class="fa fa-trash" aria-hidden="true" title="Delete" ></i></a></div>';
                }
            }]
    });  
    }
  


   


    // jQuery ajax form submit example, runs when form is submitted
    $("#leaveTypeForm").submit(function (e) {
        e.preventDefault(); // prevent actual form submit
        var form = $("#leaveTypeForm");
        var action = "save_leave_type";
        var data = form.serialize() + "&action=" + action;
        var url = app+'/ProcessLeaves'; //get submit url [replace url here if desired]
        // screenLock();
        $.ajax({
            type: "POST",
            url: url,
            data: data, // serializes form input
            beforeSend: function beforeSend() {
                //	startLoader();
                console.log(data);
            },
            success: function (data) {
                   if (data.status === 'success') {
                $("#success-popup").removeClass("d-none");
                $("#leaveTypeForm")[0].reset();
                $("#simpleModalLeaveType").modal('hide');
                $('#success-popup').text(data.message);
                $('#success-popup').addClass('success');
                get_leave_types();
            } else if (data.status === 'error') {
                $('#success-popup').text(data.message);
                $('#success-popup').addClass('error');
            }
            },
            error: function error(result) {

            },
            complete: function complete() {
                e.preventDefault();

            }
        });

    });




}); 
