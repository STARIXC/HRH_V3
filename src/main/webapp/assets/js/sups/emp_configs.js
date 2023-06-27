jQuery(document).ready(function () {
    //var jsonData;

var app="/hrh";
    var i = 1;
    getDocTypes();
    function getDocTypes() {
        $.ajax({
            type: "GET",
            url: app+'/EmployeeConfig?action=get_all_docs',
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            success: function (data) {
                $('#docs_data').empty();
                $.each(data, function (key, value)
                {
                    $('#docs_data').append('<tr><td>' + i++ + '</td><td>' + value.name + '</td> <td>' + value.desc__ + '</td><td>' + value.created + '</td><td>  <a  href="javascript:void(0);"  data-id="' + value.id + '" class="btn btn-success btn-xs btnColor edit-hols"> <i class="fa fa-edit" ></i></a> <a id="delete_doc" href="javascript:void(0);"  data-id="' + value.id + '" class="delete btn btn-danger btn-xs deleteBtn btnColor"><i class="fa fa-trash" aria-hidden="true" title="Delete" ></i></a> </td></tr>');
                });

            },
            complete: function () {

            }
        });

    }


//    save carder
//    $("#ScarderForm_").submit(function (e) {
//        // alert("submited");
//        e.preventDefault(); // prevent actual form submit
//        var form = $("#ScarderForm_");
//        var action = "process_Scarder";
//        var data = form.serialize() + "&action=" + action;
//        var url = app+'/StandardizedCarder';
//        // screenLock();
//        $.ajax({
//            type: "POST",
//            url: url,
//            data: data, // serializes form input
//            beforeSend: function beforeSend() {
//                //startLoader();
//                console.log(data);
//            },
//            success: function (data) {
//                var url_ = "manage_standardised_carder.jsp";
//                $(location).attr('href', url_);
//                console.log(data);
//            },
//            error: function error(result) {
//
//            },
//            complete: function complete() {
//                //	stopLoader();
//
//            }
//        });
//    });
////    update submit
//
//// 
//    function loademptype() {
//        $.ajax({
//            url: app+'/EmpTypeServlet',
//            type: 'post',
//            dataType: 'html',
//            success: function (data) {
//
//                $("#emp_type").html(data);
//                //pataStandard();
//
//            }
//        });
//
//    }
//  pataCarder();
//
//    function pataCarder() {
//     $.ajax({
//        type: "GET",
//        url: app+'/CarderCat?action=all',
//        contentType: "application/json; charset-utf-8",
//        dataType: "json",
//        success: function (data) {
//            $('#carder_category_id').empty();
//            $('#carder_category_id').append('<option value="">--- Select One---</option>');
//            $.each(data, function (key, value)
//            {
//                $('#carder_category_id').append('<option value="' + value.id + '">'+ value.cadre_category_name + '</option>');
//            });
//
//        },
//        complete: function () {
//
//        }
//
//    });
//    }


  //  loademptype();
});

