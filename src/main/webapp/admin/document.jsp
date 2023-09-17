<%-- 
    Document   : manage_notification
    Created on : May 24, 2022, 12:31:23 AM
    Author     : CBWAHYI
--%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Documents</title>
        <link rel="stylesheet" href="../assets/css/custom.css">
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <link rel="stylesheet" href="../assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="../assets/css/toggle.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.2.4/css/fixedHeader.bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">
        <link href="../assets/vendor/swal2/sweetalert2.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="../assets/vendor/calender/lib/jquery-ui.min.css" />
        <link rel="stylesheet" href="../assets/vendor/calender/lib/bootstrap-datepicker.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="../assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <style type="text/css">
            .notif:hover {
                background-color: rgba(0, 0, 0, 0.1);
            }
            /*            #spinner-div {
                            position: fixed;
                            display: none;
                            width: 100%;
                            height: 100%;
                            top: 0;
                            left: 0;
                            text-align: center;
                            background-color: rgba(255, 255, 255, 0.8);
                            z-index: 2;
                        }*/
            .fade:not(.show) {
                opacity: 1 !important;
            }
        </style>

    </head>
    <body>

        <%@include file="/_includes/header.jsp"%>

        <div class="main-content">
            <div class="main-content container-fluid dash-container">
                <div class="page-header">
                    <div class="page-block">
                        <div class="row align-items-center">
                            <div class="col-auto">
                                <div class="page-header-title">
                                    <h4 class="m-b-10">
                                        Manage Document Type
                                    </h4>
                                </div>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="./">Home</a></li>
                                    <li class="breadcrumb-item">Document Type</li>
                                </ul>
                            </div>
                            <div class="col">
                                <div class="float-end ">
                                    <a href="javascript:void(0);" data-title="New Document Type" data-bs-toggle="tooltip" title="" class="btn btn-sm btn-info create_new" data-bs-original-title="Create">
                                        <i class="fa fa-plus"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row pt-5">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-body table-border-style">

                                <div class="table-responsive">
                                    <table class="table" id="pc-dt-simple">
                                        <thead>
                                            <tr>
                                                <th>Document</th>
                                                <th>Description</th>
                                                <th>Required Field</th>
                                                <th width="200px">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>



                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <%@include file="/_includes/footer.jsp"%>
        <script src="../assets/vendor/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../assets/vendor/calender/lib/jquery-ui.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://cdn.datatables.net/fixedheader/3.2.4/js/dataTables.fixedHeader.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.3.0/js/responsive.bootstrap.min.js"></script>
        <script defer src="../assets/fontawesome/js/all.min.js" type="text/javascript"></script>
        <script src="../assets/js/feather-icons/feather.min.js"></script>
        <script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script src="../assets/js/app.js"></script>
        <script src="../assets/js/main.js"></script>
        <!--        <script src="../assets/js/pages/holiday.js"></script>-->
        <%@include file="/_includes/modals.jsp"%>
        <script type="text/javascript">
            $(document).ready(function () {
                var app = "/hrh";
                loadList();

                $(document).on('click', '.create_new', function (e) {
                    $('#docModal form')[0].reset();
                    $('#modal-title').text('Create Employee Document Type');
                    $('#saveButton').data('action', 'create');
                    $("#docModal").modal('show');
                });
                $(document).on('click', '.edit-doc', function (e) {
                    e.preventDefault();
                    var typeId = $(this).data('id');
                    console.log("Type id: " + typeId);
                    OpenBootstrapPopup(typeId);

                });
                $(document).on('click', '.deleteBtn', function (e) {
                    e.preventDefault();
                    var typeId = $(this).data('id');
                    console.log("Type id: " + typeId);
                    SwalDelete(typeId);

                });
                // Save or update employee document type
                $("#DocumentForm").submit(function (e) {
                    //  alert("submited");
                    e.preventDefault(); // prevent actual form submit
                    var form = $("#DocumentForm");
                    var action = "add_doc_type";
                    var data = form.serialize() + "&action=" + action;
                    var url = app + '/document';
                    // screenLock();
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: data,
                        beforeSend: function beforeSend() {
                            //startLoader();
                            console.log(data);
                        },
                        success: function (data) {

                            location.reload();
                        },
                        error: function error(result) {

                        },
                        complete: function complete() {
                            $('#docModal').modal('hide');

                        }
                    });

                });


                function OpenBootstrapPopup(id) {
                    var doc_id = id;
//                var app ="/hrh";
                    $.ajax({
                        type: "GET",
                        url: app + '/document?action=get_doc&id=' + doc_id,
                        contentType: "application/json; charset-utf-8",
                        dataType: "json",
//                            data: {
//                                'id': holiday_id
//                            },
                        success: function (docType) {
                            console.log(eval(docType));
                            document.getElementById('name').value = docType.name;
                            document.getElementById('description_').value = docType.description;
                            document.getElementById('doc_id').value = docType.id;
                            $('#is_required option[value="' + docType.isRequired + '"]').attr("selected", "selected");

//                        document.getElementById('e_to_date').value = data.end_date;
//                        document.getElementById('e_no_of_days').value = data.no_of_days;
//                        document.getElementById('e_comment').value = data.comment;
                        },
                        complete: function () {
                            $('#modal-title').text('Edit Document Type');
                            $('#saveButton').data('action', 'update').text('Update');
                            $("#docModal").modal('show');
                        }
                    });

                }
                function SwalDelete(typeId) {

                    swal({
                        title: 'Are you sure?',
                        text: "It will be deleted permanently",
                        type: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6', //sweetalert confirm dialouge 
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, delete it!',
                        showLoaderOnConfirm: true,

                        preConfirm: function () {
                            return new Promise(function (resolve) {    //Promise() function take care delete process done by ajax
                                var action = "delete";
                                var data = "deleteId=" + typeId + "&action=" + action;
                                var url = url;
                                $.ajax({
                                    url: app + '/document', //ajax codes start for delete data
                                    type: 'POST',
                                    data: data,
                                    dataType: 'JSON'
                                })
                                        .done(function (response) {
                                            swal('Deleted!', response.message, response.status);    //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                                            var url_ = "document.jsp";
                                            $(location).attr('href', url_);
                                            //  readFruit();
                                        })
                                        .fail(function () {
                                            swal('Oops...', 'Something went wrong with ajax !', 'error');    //if process fail on delete.jsp file get JSON response display message "Unable to delete fruit"
                                        });
                            });
                        },
                        allowOutsideClick: false
                    });
                }


                function loadList() {
                    $.ajax({
                        url: app + '/document',
                        data: {action: "get_docs"},
                        contentType: "application/json; charset-utf-8",
                        dataType: "json",
                        success: function (data) {
                            var tbody = $('#pc-dt-simple tbody');
                            tbody.empty();
                            $.each(data, function (i, docType) {
                                let required = '<div class="badge bg-success p-2 px-3 rounded status-badge">Required</div>';
                                let not_required = '<div class="badge bg-danger p-2 px-3 rounded status-badge">Not Required </div>';
                                let docStatus = docType.isRequired;
                                let status = "";
                                if (docStatus === "1") {
                                    status = required;
                                } else {
                                    status = not_required;
                                }
                                
                                 let action = '<span class="d-flex justify-content-evenly" >'
                                   + ' <div class="action-btn bg-info ">'
                            + ' <a href="javascript:void(0);"  data-id="' + docType.id + '" class="btn btn-info btn-xs btnColor edit-doc" title="Edit" data-title="Edit Document Type">'
                            + '<i class="fa fa-edit text-white"></i>'
                            + '</a>'
                            + '</div>'
                            + ' <div class="action-btn bg-danger">'
                            + '<a href="javascript:void(0);"   data-id="' + docType.id + '" class="delete btn btn-danger btn-xs btnColor" title="Delete" aria-label="Delete"><i class="fa fa-trash text-white text-white"></i></a>'
                            + '   </div>'
                            + '</span>';


                                let tb = '<tr><td>' + docType.name + '</td><td>' + docType.description + '</td><td><h6 class="float-left mr-1">' + status + '</h6> </td>'
                                        + '     <td class="Action">'+ action+' </td>'
                                        + '  </tr>';
                                $('#pc-dt-simple tbody').append(tb);
                            });
                        }
                    });
                }
            });
        </script>
        <%@include file="/_includes/include_footer.jsp"%>
    </body>
</html>

