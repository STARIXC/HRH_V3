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

            .fade:not(.show) {
                opacity: 1 !important;
            }
        </style>
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
                                    Manage Designations
                                </h4>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="./">Home</a></li>
                                <li class="breadcrumb-item">Designations</li>
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
                                <table id="position_table" class="table mt-3">
                                    <thead>
                                        <tr>
                                            <th>SN#</th>
                                            <th>Designation Name</th>
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
<!--<script src="../assets/js/pages/scader.js"></script>-->
<script src="../assets/js/pages/position.js"></script>
<script src="../assets/js/pages/positions.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var app = "/hrh";
        $(document).on('click', '.create_new', function (e) {
            $('#positionModal form')[0].reset();
            $('.modal-title').text('New Position / Designation');
            $('.saveButton').data('action', 'create');
            $("#positionModal").modal('show');
        });


        $(document).on('click', '.edit-designation', function (e) {
            e.preventDefault();
            var typeId = $(this).data('id');
            console.log("Type id: " + typeId);
            OpenBootstrapPopup(typeId);

        });
        $(document).on('click', '.delete-designation', function (e) {
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
            var url = './StandardizedCarder';
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
                url: app + '/Designation?action=edit&designation_id=' + designation_id,
                contentType: "application/json; charset-utf-8",
                dataType: "json",
                success: function (data) {
                    console.log(eval(data));
                    document.getElementById('e_designation_id').value = data.id;
                    $('#inputcadrecat').val(data.carder_category_id);
                    $('#inputcadrecat').trigger('change'); // Trigger the change event to fetch dependent options

                    // Delay setting the value of 'inputStandCadre' to allow dependent options to load
                    setTimeout(function () {
                        $('#inputStandCadre').val(data.standardized_cadre_id).trigger('change'); // Trigger the change event for selected value
                    }, 500); // Adjust the delay time (in milliseconds) if needed

                    document.getElementById('inputPosition').value = data.position_title;
                    document.getElementById('inputBasic').value = data.basic_pay;



                },
                complete: function () {
                    $('.modal-title').text('Edit Designation/Position');
                    $('#saveButton').data('action', 'update').text('Update');
                    $("#positionModal").modal('show');
                }
            });

        }
        $('#inputcadrecat').change(function () {
            var selectedValue = $(this).val();
            var selectedStandCadreValue = $('#inputStandCadre').val(); // Store the selected value of 'inputStandCadre'

            if (selectedValue) {
                $.ajax({
                    url: app + '/StandardizedCarder?action=getByET',
                    method: 'GET',
                    data: {standardCarder: selectedValue},
                    dataType: 'json',
                    success: function (response) {
                        $('#inputStandCadre').empty();
                        $.each(response, function (index, value) {
                            $('#inputStandCadre').append('<option value="' + value.id + '">' + value.standardized_cadre_name + '</option>');
                        });

                        // Trigger the change event for selected value if 'inputStandCadre' options are loaded
                        if (selectedStandCadreValue) {
                            $('#inputStandCadre').val(selectedStandCadreValue).trigger('change');
                        }
                    },
                    error: function (xhr, status, error) {
                        console.log(error);
                    }
                });
            }
        });





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
                            url: app + '/Designation', //ajax codes start for delete data
                            type: 'POST',
                            data: data,
                            dataType: 'JSON'
                        })
                                .done(function (response) {
                                    swal('Deleted!', response.message, response.status);    //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                                    var url_ = "manage_designation.jsp";
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