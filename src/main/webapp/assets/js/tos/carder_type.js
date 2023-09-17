jQuery(document).ready(function () {
    var jsonData;

    var app="/hrh";
    var i = 1;
    get_carder_type();
function get_carder_type() {
    $.ajax({
        type: "GET",
        url: app+'/CadreTypeServlet',
        contentType: "application/json; charset-utf-8",
        dataType: "json",
        success: function (data) {
            $('#cadre_type_data').empty();


            $.each(data, function (key, value)
            {
                $('#cadre_type_data').append('<tr><td>' + i++ + '</td><td>' + value.cadre_type_name + '</td><td>' + value.hrs_per_week + '</td> <td>  <a href="javascript:void(0);"  data-id="' + value.id + '" class="btn btn-success btn-xs btnColor edit-hols"> <i class="fa fa-edit" ></i></a> <a id="delete_carder_type" href="javascript:void(0);"  data-id="' + value.id + '" class="delete btn btn-danger btn-xs deleteBtn btnColor"><i class="fa fa-trash" aria-hidden="true" title="Delete" ></i></a> </td></tr>');
            });

        },
        complete: function () {
  $('#cadre_type_table').DataTable();
        }
    });

}
 $("#carderForm_").submit(function (e) {
                    alert("submited");
                    e.preventDefault(); // prevent actual form submit
                    var form = $("#carderForm_");
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