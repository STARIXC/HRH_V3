<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Leave Applications</title>
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

        <%@include file="/_includes/header_sup.jsp"%>


    <div class="main-content container-fluid">
     <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-auto">
                            <div class="page-header-title">
                                <h4 class="m-b-10">
                                    Manage Leave Applications
                                </h4>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="./">Home</a></li>
                                <li class="breadcrumb-item">Leave Applications</li>
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
        <!-- Basic Vertical form layout section start -->
        <div class="row">
            <div class="col-md-12 pt-5">
                <div class="card">
                 
                    <div class="card-body pt-3">
                        <form  id="multiple_leave_approval">
                            <section class="section">
                                <div class="leave_section">
                                    <div class=" table-responsive">

                                        <table class='table table-hover datatable responsive' id="pending_leave_table">
                                            <thead>
                                                <tr>
                                                    <th><input type="checkbox" id="checkAl"> Select All</th>
                                                    <th>Name</th>
                                                    <th>Employee Id</th>
                                                    <th>Application Start Date</th>
                                                    <th>Application End date</th>
                                                    <th>Application Date</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="pending_leave_table_data">

                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </section>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-6 order-md-2 order-last">
                                        <a data-id="Approve" href="javascript:void(0)" class="btn btn-success float-start m-l-20 hidden-xs hidden-sm waves-effect waves-light" id="all_approved">
                                            <i class="fa fa-paper-plane" aria-hidden="true"></i> Approve All</a>
                                    </div>
                                    <!--                                                <div class="col-md-6 order-md-2 order-first">
                                    
                                                                                        <a data-id="Reject" href="javascript:void(0)" class="btn btn-danger float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light" id="reject_all">
                                                                                            <i class="fa fa-times" aria-hidden="true"></i> Reject All</a>
                                    
                                                                                    </div>-->
                                </div>
                            </div>
                        </form>

                    </div>

                </div>
            </div>

        </div>
        <!-- // Basic Vertical form layout section end -->
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
<script src="../assets/js/pages/pending_leave.js"></script>
<script>
    $(document).ready(function () {

        $("#checkAl").click(function () {
            $('input:checkbox').not(this).prop('checked', this.checked);
        });
        $(document).on('click', '#all_approved', function (e) {
            e.preventDefault();
            var leave = $(this).data('id');
            console.log("action: " + leave);
            SwalApprove(leave);
        });
        $(document).on('click', '#reject', function (e) {
            e.preventDefault();
            var leave = $(this).data('id');
            console.log("action: " + leave);
            SwalReject(leave);
            //deleteConfirmation(leave);
        });

    function SwalApprove(leave) {


        swal({
            title: 'Are you sure?',
            text: "Your Are About to Approve Multiple Applications",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6', //sweetalert confirm dialouge 
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, Approve!',
            showLoaderOnConfirm: true,
            preConfirm: function () {
                return new Promise(function (resolve) {    //Promise() function take care delete process done by ajax
                    var form = $("#multiple_leave_approval");
                    var action = "approve_leave";
                    var app="/hrh";
                    var data = form.serialize() + "&action=" + action;
                    var url = url;
                    $.ajax({
                        url: app+'/LeaveApplication', //ajax codes start for delete data
                        type: 'POST',
                        data: data,
                        dataType: 'JSON'
                    })
                            .done(function (response) {
                                swal('Success!', response.message, response.status); //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                                var url_ = "pending_leave.jsp";
                                $(location).attr('href', url_);
                                //  readFruit();
                            })
                            .fail(function () {
                                swal('Oops...', 'Something went wrong with ajax !', 'error'); //if process fail on delete.jsp file get JSON response display message "Unable to delete fruit"
                            });
                });
            },
            allowOutsideClick: false
        });
    }
    function SwalReject(leave) {


        swal({
            title: "Reason Rejected!",
            text: "Write something :",
            html: '<textarea class="swal2-textarea" placeholder="Write something" id="reason"  ></textarea>',
            showCancelButton: true,
            confirmButtonText: 'Proceed',
            showLoaderOnConfirm: true,
            closeOnConfirm: false,
            animation: "slide-from-top",
            preConfirm: function () {
                return new Promise(function (resolve) {    //Promise() function take care delete process done by ajax
                    var reason = document.getElementById('reason').value;
                    var application_id = leave;
                    var action = "reject";
                    var data = "reason=" + reason + "&action=" + action + "&application=" + application_id;
                    var url = './ProcessLeaveApplications';
                    $.ajax({
                        url: url, //ajax codes start for delete data
                        type: 'POST',
                        data: data,
                        dataType: 'JSON'
                    })
                            .done(function (response) {
                                swal('Success!', response.message, response.status); //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                                var url_ = "all_leave.jsp";
                                $(location).attr('href', url_);
                                //  readFruit();
                            })
                            .fail(function () {
                                swal('Oops...', 'Something went wrong with ajax !', 'error'); //if process fail on delete.jsp file get JSON response display message "Unable to delete fruit"
                            });
                });
            },
            allowOutsideClick: false
        });
    }
    function deleteConfirmation(id) {
        swal({
            title: "Reason Rejected!",
            input: 'textarea',
            inputPlaceholder: "Write something",
            type: "warning",
            showCancelButton: !0,
            confirmButtonText: "Proceed!",
            cancelButtonText: "No, cancel!",
            reverseButtons: !0,
            allowOutsideClick: false
        }).then(function (e) {

            if (e.value === true) {
                var reason = e.value;
                var application_id = id;
                var action = "reject";
                var data = reason + "&action=" + action + "&application=" + application_id;
                var url = url;
                $.ajax({
                    url: './ProcessLeaveApplications', //ajax codes start for delete data
                    type: 'POST',
                    data: data,
                    dataType: 'JSON'
                })
                        .done(function (response) {
                            swal('Success!', response.message, response.status); //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                            var url_ = "pending_leave.jsp";
                            $(location).attr('href', url_);
                            //  readFruit();
                        })
                        .fail(function () {
                            swal('Oops...', 'Something went wrong with ajax !', 'error'); //if process fail on delete.jsp file get JSON response display message "Unable to delete fruit"
                        });



            } else {
                e.dismiss;
            }

        }, function (dismiss) {
            return false;
        });
    }
    });
</script>
<%@include file="/_includes/include_footer.jsp"%>
</body>

</html>