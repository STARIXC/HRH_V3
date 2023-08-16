<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Designation</title>
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
        <div class="main-content container-fluid">
            <div class="row mb-2">
                <div class="col-md-8 order-md-1 order-last">
                    <nav aria-label="breadcrumb" class='breadcrumb-header'>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp" class="text-success"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Manage Designation</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-md-4 order-md-2 order-first">
                    <a href="add_designation.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light">
                        <i class="fa fa-plus" aria-hidden="true"></i> Add Designation</a>

                </div>
            </div>


            <!-- Basic Vertical form layout section start -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-success text-white">
                            <i class="mdi mdi-table fa-fw"></i> 
                            Designation/Position List
                        </div>
                        <div class="card-body pt-3">
                            <div class="table-responsive">
                                <table id="position_table" class="table mt-3">
                                    <thead>
                                        <tr>
                                            <th>Designation Name</th>
                                            <th>Description</th>
                                            <!-- 	<th>Creation Date</th> -->
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="position_table_data">


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

<div id="simpleModal" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Designation/Position Update Form</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">

                </button>
            </div>
            <form method="POST"  enctype="multipart/form-data" id="carder_cat_EForm_" class="form-horizontal" autocomplete="off">
                <div class="modal-body">

                    <div class="form-body">
                        <input type="hidden" class="form-control e_designation_id input-width-xlarge" name="e_designation_id" id="e_designation_id" >
                        <div class="form-group">
                            <label for="inputcadrecat">Cadre Category</label>
                            <select name="carder_category_id" id="inputcadrecat" class="form-control" onchange='pataStandard();'>
                                <option selected>Choose...</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="inputStandCadre">Standardized Cadre</label> <select
                                id="inputStandCadre" name="standardized_cadre_id" class="form-control" >
                                <option selected>Choose...</option>
                                <option>...</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="inputPosition">Position</label> <input
                                type="text" class="form-control" id="inputPosition" name="position_title"
                                placeholder="Designation">
                        </div>
                        <div class="form-group">
                            <label for="inputBasic">Basic Pay</label> <input
                                type="text" class="form-control" id="inputBasic" name="basic_pay"
                                placeholder="Designation">
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
<script src="../assets/js/pages/position.js"></script>
<script src="../assets/js/pages/positions.js"></script>
<script type="text/javascript">
                                $(document).ready(function () {
                                    var base_url = "/hrh";
                                    $(document).on('click', '.edit-designation', function (e) {
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
                                        var url = base_url + '/StandardizedCarder';
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
                                        var designation_id = id;

                                        $.ajax({
                                            type: "GET",
                                            url: base_url + '/Designation?action=edit&designation_id=' + designation_id,
                                            contentType: "application/json; charset-utf-8",
                                            dataType: "json",
                                            //                            data: {
                                            //                                'id': holiday_id
                                            //                            },
                                            success: function (data) {
                                                console.log(eval(data));

                                                // Pre-select the options when editing
                                                var category_id = data.carder_category_id; // Replace with the value from your data
                                                var standard_id = data.standardized_cadre_id; // Replace with the value from your data

                                                document.getElementById('e_designation_id').value = data.id;
                                                $('#inputcadrecat option[value="' + category_id + '"]').attr("selected", "selected");
                                                // Wait for options to be populated before selecting the second option
                                                setTimeout(function () {
                                                    $('#inputStandCadre option[value="' + standard_id + '"]').attr("selected", "selected");

                                                }, 500);
                                                document.getElementById('inputPosition').value = data.position_title;
                                                document.getElementById('inputBasic').value = data.basic_pay;

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
                                                        url: './StandardizedCarder', //ajax codes start for delete data
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

<%@include file="/_includes/include_footer.jsp"%>

</body>

</html>