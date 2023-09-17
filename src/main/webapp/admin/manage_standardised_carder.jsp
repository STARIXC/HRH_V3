<%-- 
    Document   : edit_termination
    Created on : May 18, 2022, 10:36:43 AM
    Author     : CBWAHYI
--%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Carder Type</title>
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <link rel="stylesheet" href="../assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="../assets/css/toggle.css">
        <link rel="stylesheet" href="../assets/vendor/DataTables/datatables.css">
        <link href="../assets/vendor/swal2/sweetalert2.min.css" rel="stylesheet" type="text/css">
        <script defer src="../assets/fontawesome/js/all.min.js"></script>
        <link rel="stylesheet"
              href="../assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <script src="../assets/vendor/jquery/jquery.min.js"></script>
        <script src="../assets/vendor/calender/lib/jquery-ui.min.js"></script>
        <script src="../assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
        <style type="text/css">
            .notif:hover{
                background-color: rgba(0,0,0,0.1);
            }
            .fade:not(.show) {
                opacity: 1 !important;
            }
        </style>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="/_includes/header.jsp"%>
        <div class="main-content container-fluid">
          <div class="page-header mb-3">
                    <div class="page-block">
                        <div class="row align-items-center">
                            <div class="col-auto">
                                <div class="page-header-title">
                                    <h4 class="m-b-10">
                                        Manage Standardized Carders
                                    </h4>
                                </div>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="./">Home</a></li>
                                    <li class="breadcrumb-item">Standardized Carders</li>
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

            <!-- Basic Vertical form layout section start -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                     
                        <div class="card-body pt-3">
                            <div class="table-responsive">
                                <table id="s_cadre_table" class="table mt-3">
                                    <thead>
                                        <tr>
                                            <th>S/L</th>
                                            <th>Employee Type</th>
                                            <th>Carder Category Name</th>
                                            <th>Standardized Carder Name</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="s_cadre_data">


                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- // Basic Vertical form layout section end -->
        </div>
    </div>
</div>

<%@include file="/_includes/footer.jsp"%>
<script src="../assets/vendor/jquery/jquery.min.js"></script>
<script src="../assets/vendor/calender/lib/jquery-ui.min.js"></script>
<script src="../assets/vendor/DataTables/datatables.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/feather-icons/feather.min.js"></script>
<script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="../assets/js/app.js"></script>
<script src="../assets/js/main.js"></script>
<script src="../assets/js/pages/scader.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var app = "/hrh";

        $(document).on('click', '.create_new', function (e) {
            $('#sCarderModal form')[0].reset();
            $('.modal-title').text('New Standardized Carder');
            $('.saveButton').data('action', 'create');
            $("#sCarderModal").modal('show');
        });
        $(document).on('click', '.edit-hols', function (e) {
            e.preventDefault();
            var typeId = $(this).data('id');
            console.log("Type id: " + typeId);
            OpenBootstrapPopup(typeId);

        });
        $(document).on('click', '#delete_scarder', function (e) {
            e.preventDefault();
            var typeId = $(this).data('id');
            console.log("Type id: " + typeId);
            SwalDelete(typeId);

        });

        $("#scarder_cat_EForm_").submit(function (e) {
            //  alert("submited");
            e.preventDefault(); // prevent actual form submit
            var form = $("#scarder_cat_EForm_");
            var action = "process_Scarder";
            var data = form.serialize() + "&action=" + action;
            var url = app + '/StandardizedCarder';
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
                    var url_ = "manage_standardised_carder.jsp";
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
        function OpenBootstrapPopup(id) {
            var carder_id = id;
            $.ajax({
                type: "GET",
                url: app + '/StandardizedCarder?action=edit&carder_id=' + carder_id,
                contentType: "application/json; charset-utf-8",
                dataType: "json",
//                            data: {
//                                'id': holiday_id
//                            },
                success: function (data) {
                    console.log(eval(data));
                    document.getElementById('e_standard_category_id').value = data.id;
                    $('#emp_type option[value="' + data.emp_type + '"]').attr("selected", "selected");
                    $('#carder_category_id option[value="' + data.carder_category_id + '"]').attr("selected", "selected");
                    document.getElementById('standardized_cadre_name').value = data.standardized_cadre_name;

                },
                complete: function () {
                    $("#sCarderModal").modal('show');
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
                            url: app + '/StandardizedCarder', //ajax codes start for delete data
                            type: 'POST',
                            data: data,
                            dataType: 'JSON'
                        })
                                .done(function (response) {
                                    swal('Deleted!', response.message, response.status);    //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                                    var url_ = "manage_standardised_carder.jsp";
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
    });

</script>


<%@include file="/_includes/modals.jsp"%>
<%@include file="/_includes/include_footer.jsp"%>

</body>
</html>

