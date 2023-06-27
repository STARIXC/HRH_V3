jQuery(document).ready(function () {
    var jsonData;
    var i = 1;
    var app="/hrh";

 getCarderType();
    "use strict";
    function getCarderType() {

        var carder_id = $("#carder_id").val();
        ;

        $.ajax({
            url: app+"/CarderTypeUpdates?action=edit",
            method: 'GET',
            dataType: 'json',
            data: {
                'ctype_id':carder_id 
            },
            success: function (data) {
                console.log(data);

                document.getElementById('carder_name').value = data.cadre_type_name;
                document.getElementById('hrs_per_week').value = data.hrs_per_week;
               

            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Error get data from ajax');
            }

        });
    }
    ;

//    update carder
    $("#editcarderForm_").submit(function (e) {
       // alert("submited");
        e.preventDefault(); // prevent actual form submit
        var form = $("#editcarderForm_");
        var action = "update_carder";
        var data = form.serialize() + "&action=" + action;
        var url = app+'/CarderTypeUpdates';
        // screenLock();
        $.ajax({
            type: "POST",
            url: url,
            data: data, // serializes form input
            beforeSend: function beforeSend() {
                //startLoader();
                console.log(data);
            },
            success: function (data) {
                var url_ = "manage_carder_type.jsp";
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
    });