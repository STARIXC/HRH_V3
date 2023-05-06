<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Leave Type</title>
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
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-auto">
                            <div class="page-header-title">
                                <h4 class="m-b-10">
                                    Manage Leave Type
                                </h4>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="./">Home</a></li>
                                <li class="breadcrumb-item">Leave Type</li>
                            </ul>
                        </div>
                        <div class="col">
                            <div class="float-end ">

                                <a href="javascript:void(0);" data-title="Create New Leave Type" data-bs-toggle="tooltip" title="" class="btn btn-sm btn-info create_new" data-bs-original-title="Create">
                                    <i class="fa fa-plus"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="success-popup" class="alert alert-success d-none" role="alert">
                Your operation was successful!
            </div>


            <!-- Basic Vertical form layout section start -->
            <div class="row">
                <div class="col-sm-12 pt-5">
                    <div class="card">

                        <div class="card-body pt-3">
                            <section class="section">
                                <div class="leave_section">
                                    <div class=" table-responsive">
                                        <table width="100%" class='table table-striped table-bordered table-hover' id="leave_type_table">
                                            <thead>
                                                <tr>
                                                    <th>Leave Name</th>
                                                    <th>Description</th>
                                                    <th>Days Allowed</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="leave_type_data">

                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </section>
                        </div>

                    </div>
                </div>
            </div>
            <!-- // Basic Vertical form layout section end -->
        </div>


    </div>
</div>


<%@include file="/_includes/modals.jsp"%>
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

<script src="../assets/js/main.js"></script>

<script src="../assets/js/pages/leave_type.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var app_ = "/hrh";
        $(document).on('click', '.delete_leave_type', function (e) {
            e.preventDefault();
            var typeId = $(this).data('id');
            console.log("Type id: " + typeId);
            SwalDelete(typeId);

        });

        $(document).on('click', '.create_new', function (e) {
            $('#simpleModalLeaveType form')[0].reset();
            $("#simpleModalLeaveType").modal('show');
        });

        $(document).on('click', '.edit-lt', function (e) {
            e.preventDefault();
            var typeId = $(this).data('id');
            console.log("Type id: " + typeId);
            OpenBootstrapPopup(typeId);

        });
        // When the select input changes value
        $(document).on('change', '#is_accrued', function () {
            // If the selected option value is "yes"
            if ($(this).val() === '1') {
                // Show the div
                $('#leave-accrual').show();
            } else {
                // Otherwise, hide the div
                $('#leave-accrual').hide();
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
                            url: app_ + '/ProcessLeaves', //ajax codes start for delete data
                            type: 'POST',
                            data: data,
                            dataType: 'JSON'
                        })
                                .done(function (response) {
                                    swal('Deleted!', response.message, response.status);    //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                                    var url_ = "manage_leave_type.jsp";
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
        function OpenBootstrapPopup(id) {

            var type_id = id;
//         $('#simpleModalLeaveType form').attr('id', 'editRecordForm');
            $('#simpleModalLeaveType .modal-title').text('Edit Record');
            $('#simpleModalLeaveType .btn_save').text('Save Changes');
            $.ajax({
                type: "GET",
                url: app_ + '/ProcessLeaves?action=getLeave&id=' + type_id,
                contentType: "application/json; charset-utf-8",
                dataType: "json",
//                            data: {
//                                'id': holiday_id
//                            },
                success: function (data) {
                    console.log(eval(data));
                    document.getElementById('type_id').value = data.leave_id;
                    document.getElementById('leave_name').value = data.leave_type;
                    document.getElementById('leave_description').value = data.description;
                    let accrued = data.is_accrued;
                    let accrued_value = 0;
                    if (accrued === true) {
                        accrued_value = 1;

                    } else {
                        accrued_value;
                    }
                    $('#is_accrued option[value="' + accrued_value + '"]').attr("selected", "selected");
                    document.getElementById('max_days').value = data.max_days;
//                        document.getElementById('comment').value = data.comment;
                },
                complete: function () {
                    $("#simpleModalLeaveType").modal('show');
                }
            });

        }
    });
</script>
<%@include file="/_includes/include_footer.jsp"%>
</body>

</html>