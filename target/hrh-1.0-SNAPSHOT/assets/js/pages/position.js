/**
 * 
 */
jQuery(document).ready(function () {
var app="/hrh";
    var i = 1;
    $('#position_table').DataTable({
        "ajax": {
            "url": app+'/PositionServlet',
            "type": "GET",
            dataType: "json",
            dataSrc: "",
            "data": function (d) {
                $("#position_table_data").html(d);
            }
        },
        //{"id":2,"carder_category_id":0,"standardized_cadre_id":0,"position_title":"CLINICAL MENTOR","cadre_type_id":0,"basic_pay":0}

        "columns": [{
                "render": function (data, type, full, meta) {
                    return i++;
                }
            }, {
                "data": "position_title"
            }, {
                "targets": 0,
                "data": "id",
                "render": function (data, type, row, meta) {
                    return '<div class="d-flex"><a  data-id="' + data + '" href="javascript:void(0)" class="edit-designation btn btn-md btn-success ms-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"><i class="fa fa-pen text-white"></i></a> <a id="" data-id="' + data + '" href="javascript:void(0)" class="btn btn-md btn-danger ms-1 delete-designation" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"><i class="fa fa-trash text-white"></i></a></div>';
                }
            }]
    });


            // jQuery ajax form submit example, runs when form is submitted
    $("#positionForm").submit(function (e) {
        e.preventDefault(); // prevent actual form submit
        var form = $("#positionForm");
        var action = "process_Designation";
        var data = form.serialize() + "&action=" + action;
        var url = app+'/Designation'; //get submit url [replace url here if desired]
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
                var url_ = "manage_designation.jsp";
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