<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Leave Policies</title>
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

            <div class="row  bg-title">
                <div class="col-md-8 order-md-1 order-last">
                    <nav aria-label="breadcrumb" class='breadcrumb-header'>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp" class="text-success"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Leave Policies</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-md-4 order-md-2 order-first">

                    <a href="leave-entitlement.jsp" class="btn btn-success float-end ms-2 hidden-xs hidden-sm waves-effect waves-light">
                        <i class="fa fa-plus" aria-hidden="true"></i> Add New</a>

                </div>
            </div>

            <div class="row">


                <div class="col-sm-12">
                    <div class="card text-white">
                        <div class="card-header bg-info"><i class="fa fa-table fa-fw"></i> Leave Entitlements</div>
                        <div class="card-wrapper " aria-expanded="true">
                            <div class="card-body">
                                <div class="table-responsive ">
                                    <table width="100%" class="leave_policies_table table  table-bordered table-hover " id="leave_policies_table">
                                        <thead class='mt-3'>
                                            <tr>
                                                <td id="cb" >
                                                    <label class="screen-reader-text" for="cb-select-all-1">Select All</label>
                                                    <input id="cb-select-all-1" type="checkbox">
                                                </td>
                                                <th>Policy Name</th>
                                                <th>Year</th>
                                                <th>Description</th>
                                                <th>Days</th>
                                                <th>Employee Type</th>
                                                <th>Gender</th>
                                                <th>Marital Status</th>
                                               </tr>
                                        </thead>
                                        <tbody id="leave_policies_table_data">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <div id="spinner-div" class="pt-5">
            <div class="d-flex justify-content-center">
                <div class="spinner-border" role="status">
                    <span class="visually-hidden">Loading...</span>
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

<script src="../assets/js/main.js"></script>
<!--<script src="../assets/js/pages/employees.js"></script>-->
<!--
<script type="text/javascript">
    $(document).ready(function () {


        $(document).on('click', '#delete_staff', function (e) {
            e.preventDefault();
            var emp_id = $(this).data('emp');
            console.log("Type id: " + emp_id);
            SwalDelete(emp_id);

        });



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
                        url: './ProcessStaff', //ajax codes start for delete data
                        type: 'POST',
                        data: data,
                        dataType: 'JSON'
                    })
                            .done(function (response) {
                                swal('Deleted!', response.message, response.status);    //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                                var url_ = "manage_employee.jsp";
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
</script>-->
<%@include file="/_includes/include_footer.jsp"%>
</body>

</html>