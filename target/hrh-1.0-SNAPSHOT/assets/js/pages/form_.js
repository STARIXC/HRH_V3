$(document).ready(function (e) {

    "use strict";
    var app = "/hrh";
// jQuery ajax form submit example, runs when form is submitted
    $("#AddEmpForm_").submit(function (e) {
        e.preventDefault(); // prevent actual form submit
        var form = $("#AddEmpForm_");

        let action = "save_employee";
        var data = form.serialize() + "&action=" + action;
        var url = app + '/employee'; //get submit url [replace url here if desired]
        //screenLock();
        $.ajax({
            type: "POST",
            url: url,
            dataType: 'json',
            data: data, // serializes form input
            beforeSend: function beforeSend() {
                //	startLoader();
          
            },
            success: function (response) {
                      console.log(response);
                // Check the status field and display the message
                if (response.status === 'success') {
                    $('#simpleModal form')[0].reset();
                    $("#simpleModal").modal('hide');
                    $('#message').text(response.message);
                    $('#message').addClass('alert-success');
                } else if (response.status === 'error') {
                    $('#message_modal').text(response.message);
                    $('#message_modal').addClass('error');
                }else{
                    $('#simpleModal form')[0].reset();
                    $("#simpleModal").modal('hide');
                    $('#message').text(response.message);
                    $('#message').addClass('alert-info');
                }

            }
        });
    });
    $("#AddWorkForm_").submit(function (e) {
        e.preventDefault(); // prevent actual form submit
        var form = $("#AddWorkForm_");
        let action = "add_work";
        var data = form.serialize() + "&action=" + action;
        var url = app + '/employeeHistory'; //get submit url [replace url here if desired]
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

//            console.log(data);
//            var url_ = "manage_employee.jsp";
//            $(location).attr('href', url_);
            },
            error: function error(result) {

            },
            complete: function complete() {
                //	stopLoader();
                event.preventDefault();
            }
        });
    });
// jQuery ajax form submit example, runs when form is submitted
    $("#updateEmployee").submit(function (e) {
        e.preventDefault(); // prevent actual form submit
        var form = $("#updateEmployee");
        let action = "update_employee";
        var data = form.serialize() + "&action=" + action;
        var url = app + '/StaffUpdate'; //get submit url [replace url here if desired]
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

                console.log(data);
                var url_ = "manage_employee.jsp";
                $(location).attr('href', url_);
            },
            error: function error(result) {

            },
            complete: function complete() {
                //	stopLoader();
                event.preventDefault();
            }
        });
    });


    var i = 1;
    get_FY();
    function get_FY() {
        $.ajax({
            type: "GET",
            url: app + '/ProcessFinancialYear?action=all',
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            success: function (data) {
                $('#ddlFY').empty();
                $('#wddlFY').empty();
                $('#wddlFY').append('<option value="">--- Select One---</option>');
                $('#ddlFY').append('<option value="">--- Select One---</option>');
                $.each(data, function (key, value)
                {
                    $('#ddlFY').append('<option value="' + value.id + '">' + value.name + '</option>');
                    $('#wddlFY').append('<option value="' + value.id + '">' + value.name + '</option>');
                });

            },
            complete: function () {

            }

        });
        getDocTypes();
        function getDocTypes() {
            $.ajax({
                type: "GET",
                url: app + '/document?action=get_docs',
                contentType: "application/json; charset-utf-8",
                dataType: "json",
                success: function (data) {
                    $('#ddlDocType').empty();
                    $('#ddlDocType').append('<option value="">--- Select One---</option>');

                    $.each(data, function (key, value)
                    {
                        $('#ddlDocType').append('<option value="' + value.id + '">' + value.name + '</option>');

                    });

                },
                complete: function () {

                }

            });
        }



    }
});
