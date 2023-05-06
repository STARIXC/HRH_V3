<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Leave Report</title>
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">

        <link rel="stylesheet"
              href="../assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <!--<link rel="stylesheet" href="../assets/css/custom.css">-->
        <style type="text/css">
            .notif:hover {
                background-color: rgba(0, 0, 0, 0.1);
            }
        </style>

        <link rel="stylesheet" href="../assets/vendor/calender/lib/jquery-ui.min.css" />
        <link rel="stylesheet" href="../assets/vendor/calender/lib/bootstrap-datepicker.css" />
        <link rel="stylesheet" href="../assets/css/select2.min.css" />
    </head>

    <body>

        <%@include file="/_includes/header.jsp"%>
        <!-- END SIDEBAR MENU -->
        <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
    </div>
</div>
<div id="main">
    <nav class="navbar navbar-header navbar-expand navbar-light">
        <a class="sidebar-toggler" href="#"><span class="navbar-toggler-icon"></span></a>
        <button class="btn navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav d-flex align-items-center navbar-light ms-auto">

                <li class="dropdown">
                    <a href="#" data-bs-toggle="dropdown"
                       class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                        <div class="avatar me-1">
                            <img src="../assets/images/admin.png" alt="" srcset="">
                        </div>
                        <div class="d-none d-md-block d-lg-inline-block">Hi, Employee</div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end">
                        <a class="dropdown-item" href="update.jsp"><i data-feather="user"></i> Account</a>
                        <a class="dropdown-item" href="update_password.jsp"><i data-feather="settings"></i> Settings</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="login.jsp"><i data-feather="log-out"></i> Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <div class="main-content container-fluid">
        <div class="row mb-2">
            <div class="col-md-8 order-md-1 order-last">

                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp" class="text-success"><i class="fa fa-home"></i> Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Employee Leave Report</li>
                    </ol>
                </nav>
            </div>

        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="card text-white">
                    <div class="card-header bg-info"><i class="fa fa-th fa-fw"></i>Employee Leave Report</div>
                    <div class="card-wrapper" >
                        <div class="card-body">

                            <div id="searchBox">
                                <form method="POST"  accept-charset="UTF-8" id="leaveReport" novalidate="novalidate">
                                    <div class="row">
                                        <div class="col-md-1"></div>
                                        <div class="col-md-3">
                                            <div class="form-group employeeName">
                                                <label class="control-label" for="email">Employee Name<span class="validateRq">*</span></label>
                                                <select class="form-control employee_id select2" required="" name="employee_id" id="employee_id" >

                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="control-label" for="email">From Date<span class="validateRq">*</span></label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                <input type="text" class="form-control dateField required" readonly="" placeholder="From Date" name="from_date"  aria-required="true">
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <label class="control-label" for="email">To Date<span class="validateRq">*</span></label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                <input type="text" class="form-control start_date dateField required" readonly="" placeholder="From Date" name="to_date"  aria-required="true">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <input type="submit" id="filter" style="margin-top: 25px; width: 100px;" class="btn btn-info " value="Filter">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <hr>
                            <div class="report_output" style="display: none;" id="report_output">
                                <h4 class="text-end">
                                    <a class="btn btn-success" style="color: #fff" href="downloadLeaveReport?employee_id=37&amp;from_date=01/01/2022&amp;to_date=22/06/2022"><i class="fa fa-download fa-lg" aria-hidden="true"></i> Download PDF</a>
                                </h4>
                                <div class="table-responsive">
                                    <table id="" class="table table-bordered">
                                        <thead class="tr_header">
                                            <tr>
                                                <th style="width:100px;">S/L</th>
                                                <th>Name</th>
                                                <th>PFNo#</th>
                                                <th>Total Months Worked</th>
<!--                                                <th>Total Days Worked</th>-->
                                                <th>Annual Leave</th>
                                                <th>Sick Leave</th>
                                                <th>Maternity/Paternity</th>
                                                <th>Approve Date</th>
                                                <th>Number of Day</th>

                                            </tr>
                                        </thead>
                                        <tbody id="tbl_leave_report_datat">


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script src="../assets/vendor/jquery/jquery.min.js"></script>
<script defer src="../assets/fontawesome/js/all.min.js"></script>
<script src="../assets/vendor/calender/lib/jquery-ui.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/pages/leave_report.js"></script>
<!--    <script src="../assets/js/pages/employee.js"></script>-->
<script src="../assets/js/select2.min.js"></script>
<!-- JavaScript files-->
<script>
    $(document).ready(function () {
        var d = new Date();
        var currMonth = d.getMonth();
        var currYear = d.getFullYear();
        var startDate = new Date(currYear, currMonth, 1);
        $(".datepicker").datepicker();
        $(".start_date").datepicker("setDate", startDate);
        $(function () {
            //                $(".select2").select2();
            //                $('#myTable').DataTable({
            //                    "ordering": false,
            //                });

        });


        $(".alert-success").delay(2000).fadeOut("slow");
        //   $(".alert-danger").delay(2000).fadeOut("slow");
        $(document).on("focus", ".yearPicker", function () {
            $(this).datepicker({
                format: 'yyyy',
                minViewMode: 2
            }).on('changeDate', function (e) {
                $(this).datepicker('hide');
            });
        });
        $(document).on("focus", ".dateField", function () {
            $(this).datepicker({
                format: 'dd/mm/yyyy',
                todayHighlight: true,
                clearBtn: true
            }).on('changeDate', function (e) {
                $(this).datepicker('hide');
            });
        });
        $(document).on("focus", ".timePicker", function () {
            $(this).timepicker({
                showInputs: false,
                minuteStep: 1
            });
        });
        $(".monthField").datepicker({
            format: "yyyy-mm",
            viewMode: "months",
            minViewMode: "months"
        }).on('changeDate', function (e) {
            $(this).datepicker('hide');
        });

        $(document).on('click', '.delete', function () {

            swal({
                title: "Error!",
                text: "Disabled in Demo.",
                type: "error"
            });
            // var actionTo = $(this).attr('href');
            // var token = $(this).attr('data-token');
            // var id = $(this).attr('data-id');
            // swal({
            //         title: "Are you sure?",
            //         text: "You will not be able to recover this imaginary file!",
            //         type: "warning",
            //         showCancelButton: true,
            //         confirmButtonColor: "#DD6B55",
            //         confirmButtonText: "Yes, delete it!",
            //         closeOnConfirm: false
            //     },
            //     function (isConfirm) {
            //         if (isConfirm) {
            //             $.ajax({
            //                 url: actionTo,
            //                 type: 'post',
            //                 data: {_method: 'delete', _token: token},
            //                 success: function (data) {
            //                     if (data == 'hasForeignKey') {
            //                         swal({
            //                             title: "Oops!",
            //                             text: "This data is used anywhere",
            //                             type: "error"
            //                         });
            //                     } else if (data == 'success') {
            //                         swal({
            //                                 title: "Deleted!",
            //                                 text: "Your information delete successfully.",
            //                                 type: "success"
            //                             },
            //                             function (isConfirm) {
            //                                 if (isConfirm) {
            //                                     $('.' + id).fadeOut();
            //                                 }
            //                             });
            //                     } else {
            //                         swal({
            //                             title: "Error!",
            //                             text: "Something Error Found !, Please try again.",
            //                             type: "error"
            //                         });
            //                     }
            //                 }

            //             });
            //         } else {
            //             swal("Cancelled", "Your data is safe .", "error");
            //         }
            //     });
            return false;
        });
    });
</script>
<script src="../assets/js/feather-icons/feather.min.js"></script>
<script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="../assets/js/app.js"></script>

<script src="../assets/js/main.js"></script>
<%@include file="/_includes/include_footer.jsp"%>
</body>

</html>