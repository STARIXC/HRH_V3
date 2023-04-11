jQuery(document).ready(function () {
    var jsonData;
    var i = 1;
    var app="/hrh";

 getCarderType();
    "use strict";
    function getCarderType() {

        var carder_cat_id = $("#carder_cat_id").val();
        ;

        $.ajax({
            url: app+"/CarderCatUpdates?action=edit",
            method: 'GET',
            dataType: 'json',
            data: {
                'carder_cat_id':carder_cat_id 
            },
            success: function (data) {
                console.log(data);

                document.getElementById('carder_category_name').value = data.cadre_type_name;
               
               

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
        var url = app+'/CarderCatUpdates';
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
                var url_ = "manage_carder_category.jsp";
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