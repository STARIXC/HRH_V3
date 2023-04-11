<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Employee</title>

        <link rel="stylesheet" href="../assets/css/custom.css">
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <link rel="stylesheet" href="../assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="../assets/css/toggle.css">
        <link rel="stylesheet" href="../assets/vendor/DataTables/datatables.css">
        <link href="../assets/vendor/swal2/sweetalert2.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="../assets/vendor/calender/lib/jquery-ui.min.css" />
        <link rel="stylesheet" href="../assets/vendor/calender/lib/bootstrap-datepicker.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="../assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="../assets/css/style.css">

        <style type="text/css">
            .notif:hover{
                background-color: rgba(0,0,0,0.1);
            }
            .fade:not(.show) {
                opacity: 1 !important;
            }
        </style>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <!-- Font Awesome CSS-->
    </head>
    <body>

        <%@include file="/_includes/header.jsp"%>
        <div class="main-content container-fluid">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-md-12">
                        <div class="card text-white">

                            <div class="card-wrapper" >
                                <div class="card-body">
                                    <!-- Demo header-->
                                    <section class="header">
                                        <div class="">

                                            <div class="row">
                                                <div class="col-md-2">
                                                    <!-- Tabs nav -->
                                                    <div class="nav flex-column nav-pills nav-pills-custom" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                                        <a class="nav-link mb-3 p-3 shadow active" id="v-pills-estatus-tab" data-bs-toggle="pill" href="#v-pills-estatus" role="tab" aria-controls="v-pills-estatus" aria-selected="true">
                                                            <i class="fa fa-user-circle mr-2"></i>
                                                            <span class="font-weight-bold small text-uppercase">Employee Status</span></a>

                                                        <a class="nav-link mb-3 p-3 shadow" id="v-pills-equalification-tab" data-bs-toggle="pill" href="#v-pills-equalification" role="tab" aria-controls="v-pills-equalification" aria-selected="false">
                                                            <i class="fa fa-calendar-minus mr-2"></i>
                                                            <span class="font-weight-bold small text-uppercase">Employee Qualification</span></a>

                                                        <a class="nav-link mb-3 p-3 shadow" id="v-pills-docs-tab" data-bs-toggle="pill" href="#v-pills-docs" role="tab" aria-controls="v-pills-docs" aria-selected="false">
                                                            <i class="fa fa-star mr-2"></i>
                                                            <span class="font-weight-bold small text-uppercase">Document Type</span></a>


                                                    </div>
                                                </div>


                                                <div class="col-md-10">
                                                    <!-- Tabs content -->
                                                    <div class="tab-content" id="v-pills-tabContent">

                                                        <div class="tab-pane  show active p-1" id="v-pills-estatus" role="tabpanel" aria-labelledby="v-pills-estatus-tab">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12  mb-3">
                                                                    <a href="manage_employee.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"
                                                                       id="v-pills-estatus-tab" data-bs-toggle="pill" href="#v-pills-estatus" role="tab" aria-controls="v-pills-estatus" aria-selected="false"><i class="fa fa-list-ul" aria-hidden="true"></i> View Staff</a>
                                                                </div>
                                                            </div>
                                                            <div class="table-responsive rounded-table fade shadow rounded bg-white">
                                                                <table class="rounded-table table mt-3 ">
                                                                    <thead class="">
                                                                        <tr>
                                                                            <th scope="col" class=""><!---->  <!----></th>
                                                                            <th scope="col" class=""><!----> Name <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!----> Description <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!----> Created At <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!---->  <!----></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody class="bg-white divide-y divide-gray-200 dark:divide-gray-700" id="estatus_data"><!----></tbody>
                                                                </table>

                                                            </div>

                                                        </div>
                                                        <div class="tab-pane " id="v-pills-createstatus" role="tabpanel" aria-labelledby="v-pills-createstatus-tab">
                                                            <div class="row">

                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12  mb-3">
                                                                    <a href="manage_employee.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"
                                                                       id="v-pills-estatus-tab" data-bs-toggle="pill" href="#v-pills-estatus" role="tab" aria-controls="v-pills-estatus" aria-selected="false"><i class="fa fa-list-ul" aria-hidden="true"></i> View Staff</a>
                                                                </div>
                                                            </div>
                                                            <div class="table-responsive rounded-table fade shadow rounded bg-white p-5">
                                                                <table class="rounded-table table mt-3 ">
                                                                    <thead class="">
                                                                        <tr>
                                                                            <th scope="col" class=""><!---->  <!----></th>
                                                                            <th scope="col" class=""><!----> Name <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!----> Description <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!----> Created At <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!---->  <!----></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody class="bg-white divide-y divide-gray-200 dark:divide-gray-700" id="qualification_data"><!----></tbody>
                                                                </table>

                                                            </div>
                                                        </div>
                                                        <div class="tab-pane " id="v-pills-estatus" role="tabpanel" aria-labelledby="v-pills-estatus-tab">
                                                            <div class="row">

                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12  mb-3">
                                                                    <a href="manage_employee.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"
                                                                       id="v-pills-estatus-tab" data-bs-toggle="pill" href="#v-pills-estatus" role="tab" aria-controls="v-pills-estatus" aria-selected="false"><i class="fa fa-list-ul" aria-hidden="true"></i> View Staff</a>
                                                                </div>
                                                            </div>
                                                            <div class="table-responsive rounded-table fade shadow rounded bg-white p-5">
                                                                <table class="rounded-table table mt-3 ">
                                                                    <thead class="">
                                                                        <tr>
                                                                            <th scope="col" class=""><!---->  <!----></th>
                                                                            <th scope="col" class=""><!----> Name <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!----> Description <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!----> Created At <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!---->  <!----></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody class="bg-white divide-y divide-gray-200 dark:divide-gray-700" id="qualification_data"><!----></tbody>
                                                                </table>

                                                            </div>
                                                        </div>
                                                        <div class="tab-pane" id="v-pills-equalification" role="tabpanel" aria-labelledby="v-pills-equalification-tab">
                                                            <div class="row">

                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12  mb-3">
                                                                    <a href="manage_employee.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"
                                                                       id="v-pills-estatus-tab" data-bs-toggle="pill" href="#v-pills-estatus" role="tab" aria-controls="v-pills-estatus" aria-selected="false"><i class="fa fa-list-ul" aria-hidden="true"></i> View Staff</a>
                                                                </div>
                                                            </div>
                                                            <div class="table-responsive rounded-table  fade shadow rounded bg-white p-5">
                                                                <table class="rounded-table table mt-3 ">
                                                                    <thead class="">
                                                                        <tr>
                                                                            <th scope="col" class=""><!---->  <!----></th>
                                                                            <th scope="col" class=""><!----> Name <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!----> Description <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!----> Created At <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!---->  <!----></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody class="bg-white divide-y divide-gray-200 dark:divide-gray-700" id="qualification_data"><!----></tbody>
                                                                </table>

                                                            </div>
                                                        </div>

                                                        <div class="tab-pane" id="v-pills-docs" role="tabpanel" aria-labelledby="v-pills-docs-tab">
                                                            <div class="row">

                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12  mb-3">
                                                                    <a class="btn btn-success float-end m-l-20 mb-3 p-3 shadow"  data-bs-toggle="pill" href="#v-pills-createdocs" role="tab" aria-controls="v-pills-createdocs" aria-selected="false"><i class="fa fa-file-archive" aria-hidden="true"></i> Add Document Type</a>
                                                                </div>
                                                            </div>
                                                            <div class="table-responsive rounded-table fade shadow rounded bg-white p-0">
                                                                <table class="rounded-table table mt-3 ">
                                                                    <thead class="">
                                                                        <tr>
                                                                            <th scope="col" class=""><!---->  <!----></th>
                                                                            <th scope="col" class=""><!----> Name <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!----> Description <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!----> Created At <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!---->  <!----></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody class="bg-white divide-y divide-gray-200 dark:divide-gray-700" id="docs_data"><!----></tbody>
                                                                </table>

                                                            </div>
                                                        </div>
                                                        <div class="tab-pane" id="v-pills-createdocs" role="tabpanel" aria-labelledby="v-pills-createdocs-tab">

                                                            <div class="table-responsive rounded-table fade shadow rounded bg-white p-0">
                                                                <table class="rounded-table table mt-3 ">
                                                                    <thead class="">
                                                                        <tr>
                                                                            <th scope="col" class=""><!---->  <!----></th>
                                                                            <th scope="col" class=""><!----> Name <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!----> Description <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!----> Created At <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                                            <th scope="col" class=""><!---->  <!----></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody class="bg-white divide-y divide-gray-200 dark:divide-gray-700" id="docs_data"><!----></tbody>
                                                                </table>

                                                            </div>
                                                        </div>
                                                        <div class="tab-pane fade shadow rounded bg-white p-5" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                                                            <h4 class="font-italic mb-4">Confirm booking</h4>
                                                            <p class="font-italic text-muted mb-2">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- // Basic multiple Column Form section start -->

        </div>

    </div>
</div>
<div id="simpleModal" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Holiday Update Form</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">

                </button>
            </div>
            <form method="POST"  enctype="multipart/form-data" id="carderForm_" class="form-horizontal" autocomplete="off">
                <div class="modal-body">


                    <div class="form-body">
                        <div class="row">

                            <div class="col-sm-12">
                                <div class="form-group ">
                                    <label for="carder_name">Carder Name </label>

                                    <input type="hidden" class="form-control carder_t_id input-width-xlarge" name="e_carder_id" id="e_carder_id" >
                                    <input type="text" class="form-control carder_name input-width-xlarge" name="e_carder_name" id="e_carder_name" placeholder="Carder Name" autocomplete="off">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group ">
                                    <label for="hrs_per_week">Hours per Week </label>
                                    <input type="text" class="form-control hrs_per_week input-width-xlarge" name="e_hrs_per_week" id="e_hrs_per_week" placeholder="Expected Work Hours Per Week" autocomplete="off">
                                </div>
                            </div>


                        </div>


                    </div>
                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-offset-4 col-md-8">
                                        <button type="submit" class="btn btn-info btn_style"><i class="fa fa-check"></i> Save</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </form>
            <div class="modal-footer">
                <!--                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>-->
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>


    </div>
</div>

<%@include file="/_includes/footer.jsp"%>

<script src="../assets/vendor/jquery/jquery.min.js" type="text/javascript"></script>
<script src="../assets/vendor/calender/lib/jquery-ui.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
<script src="../assets/vendor/DataTables/datatables.js"></script>
<script defer src="../assets/fontawesome/js/all.min.js" type="text/javascript"></script>
<script src="../assets/js/feather-icons/feather.min.js"></script>
<script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="../assets/js/pages/form_.js"></script>
<script src="../assets/js/pages/front.js"></script>
<script src="../assets/js/app.js"></script>
<script src="../assets/js/main.js"></script>
<!--        <script src="../assets/js/pages/carder_type.js"></script>
        <script src="../assets/js/pages/position_cadre_loader.js"></script>-->
<script src="../assets/js/pages/emp_configs.js"></script>

<!-- JavaScript files-->
<script>
    $(document).ready(function () {
        $(".datepicker").datepicker();
        $("#txtJoinDate").datepicker();
        $("#txtTerminateDate").datepicker();
        $("#txtRehiredate").datepicker();
        $("#txtBirthDate").datepicker();


        $(document).on('click', '.edit-hols', function (e) {
            e.preventDefault();
            var typeId = $(this).data('id');
            console.log("Type id: " + typeId);
            OpenBootstrapPopup(typeId);

        });
        $(document).on('click', '#delete_carder_type', function (e) {
            e.preventDefault();
            var typeId = $(this).data('id');
            console.log("Type id: " + typeId);
            SwalDelete(typeId);

        });



    });
    function OpenBootstrapPopup(id) {
        var carder_id = id;
        $.ajax({
            type: "GET",
            url: './CarderTypeUpdates?action=edit&carder_id=' + carder_id,
            contentType: "application/json; charset-utf-8",
            dataType: "json",
//                            data: {
//                                'id': holiday_id
//                            },
            success: function (data) {
                console.log(eval(data));
                document.getElementById('e_carder_id').value = data.id;
                document.getElementById('e_carder_name').value = data.cadre_type_name;
                document.getElementById('e_hrs_per_week').value = data.hrs_per_week;

            },
            complete: function () {
                $("#simpleModal").modal('show');
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
                        url: './CarderTypeUpdates', //ajax codes start for delete data
                        type: 'POST',
                        data: data,
                        dataType: 'JSON'
                    })
                            .done(function (response) {
                                swal('Deleted!', response.message, response.status);    //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                                var url_ = "manage_carder_type.jsp";
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
</script>


<%@include file="/_includes/include_footer.jsp"%>
</body>
</html>
