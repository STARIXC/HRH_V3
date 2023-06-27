/**
 * 
 */
jQuery(document).ready(function () {
    var jsonData;
  var app="/hrh";
getEmpDet();
"use strict";
function getEmpDet() {

    var leave_type_id = $("#leave_type_id").val();
    ;

    $.ajax({
        url: app+"/ProcessLeaves?action=getLeave",
        method: 'GET',
        dataType: 'json',
        data: {
            'leave_type_id': leave_type_id
        },
        success: function (data) {
            console.log(data);
            
            document.getElementById('leave_name').value = data.leave_type_name;
            document.getElementById('leave_description').value = data.leave_description;
            document.getElementById('number_days_allowed').value = data.total_days;

        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }

    });
}
;



    // jQuery ajax form submit example, runs when form is submitted
    $("#leaveTypeForm").submit(function (e) {
        e.preventDefault(); // prevent actual form submit
        var form = $("#leaveTypeForm");
        var action = "update_leave_type";
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
                var url_ = "manage_leave_type.jsp";
                $(location).attr('href', url_);
            },
            error: function error(result) {

            },
            complete: function complete() {
                //	stopLoader();

            }
        });

    });

});           