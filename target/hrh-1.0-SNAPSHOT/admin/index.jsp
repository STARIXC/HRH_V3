<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <link rel="stylesheet" href="../assets/css/custom.css">
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <link rel="stylesheet" href="../assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="../assets/css/toggle.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
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
            /*for yellow bg*/

            .bg-title .breadcrumb {
                background: 0 0;
                margin-bottom: 0;
                float: none;
                padding: 0;
                margin-bottom: 9px;
                font-weight: 700;
                color: #777;
            }

            .select2-container .select2-selection--single .select2-selection__rendered {
                height: auto;
                margin-top: -6px;
                padding-left: 0;
                padding-right: 0;
            }

            .select2-container .select2-selection--single {
                box-sizing: border-box;
                cursor: pointer;
                display: block;
                height: 35px;
            }

            .select2-container--default .select2-selection--single, .select2-selection .select2-selection--single {
                border: 1px solid #d2d6de;
                border-radius: 0;
                padding: 8px 11px;
            }

            .select2-container--default .select2-selection--single .select2-selection__arrow {
                height: 26px;
                position: absolute;
                top: 4px;
                right: 1px;
                width: 20px;
            }

            .breadcrumbColor a {
                color: #41b3f9 !important;
            }

            tr td {
                color: black !important;
            }

            .tr_header {
                background-color: #EDF1F5;
            }

            table.dataTable thead th, table.dataTable thead td {
                padding: 10px 18px;
                border-bottom: 1px solid #e4e7ea;
            }

            .btnColor {
                color: #fff !important;
            }

            .validateRq {
                color: red;
            }

            .panel .panel-heading {
                border-radius: 0;
                font-weight: 500;
                font-size: 16px;
                padding: 10px 25px;
            }

            .btn_style {
                width: 106px;
            }

            .error {
                color: red;
            }

            .dash_image {


                width: 60px !important;
            }

            .noticeBord {
                overflow-x: hidden;
                height: 210px;
            }

        </style>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="../_includes/header.jsp"%>


        <div class="main-content">



            <div class="container-fluid">

                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <ol class="breadcrumb">
                            <li class="active breadcrumbColor"><a href="#"><i class="fa fa-home"></i> Dashboards</a></li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <div class="white-box card analytics-info">
                            <h3 class="box-title flex-shrink-0"> Total Employee </h3>
                            <ul class="list-group list-group-horizontal-sm two-part">
                                <li class="list-group-item border-0">
                                    <img class="dash_image" src="../assets/img/employee.png">
                                </li>
                                <li class="text-end list-group-item border-0"><i class="ti-arrow-up text-success"></i> <span class="counter " ><h1 class="text-success" id="counter_emp">00</h1></span></li>
                            </ul>

                            <h5 class="box-title flex-shrink-0"> 0 This Month </h5>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <div class="white-box card analytics-info">
                            <h3 class="box-title">Total Leave Requests</h3>
                            <ul class="list-group list-group-horizontal-sm two-part">
                                <li class="list-group-item border-0">
                                    <img class="dash_image" src="../assets/img/department.png">
                                </li>
                                <li class="text-end list-group-item border-0"><i class="ti-arrow-up text-purple"></i> <span class="counter "><h1 class="text-purple" id="leave_app">00</h1></span></li>
                            </ul>
                            <h5 class="box-title flex-shrink-0"> 0 This Month </h5>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="card">

                            <div class="card-body">
                                <h3 class="box-title">Recent Leave Applications</h3>
                                <hr>
                                <div class="table-responsive">
                                    <table class="main-table mobile-optimised table  table-hover ">
                                        <thead>
                                            <tr>
                                                <th scope="col" >Employee</th>
                                                <th scope="col" >Leave Type</th>
                                                <th scope="col" >Period</th>
                                                <th scope="col"  >Status</th>
                                            </tr>

                                        </thead>
                                        <tbody id="leave_application_data">

                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <!-- upcoming Holidays  -->
                    <div class="col-md-6">
                        <div class="white-box card">
                            <h3 class="box-title">Upcoming Holidays</h3>
                            <hr>
                            <div class="noticeBord" id="comment_holidays calendar">

                            </div>
                        </div>
                    </div>

                    <!-- upcoming Holidays   -->



                    <div class="col-md-6">
                        <div class="white-box card">
                            <h3 class="box-title">Notice Board</h3>
                            <hr>
                            <div class="noticeBord">
                                <div class="comment-center pt-10">
                                    <div class="comment-body">

                                        <div class="user-img"><i style="font-size: 31px" class="fa fa-flag-checkered text-info"></i></div>



                                        <div class="mail-contnet">
                                            <h5 class="text-danger">testttcs..</h5><span class="time">Published Date:  23 Mar 2022 </span>
                                            <br /><span class="mail-desc">
                                                Publish By: SKT sdfsd<br>
                                                Description: gthnbhtn..
                                            </span>
                                            <a href="javascript:void()" class="btn m-r-5 btn-rounded btn-outline btn-info">Read More</a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- /.container-fluid -->

        </div>
    </div>
    <%@include file="../_includes/footer.jsp"%>
</div>

<script src="../assets/vendor/jquery/jquery.min.js" type="text/javascript"></script>
<script src="../assets/vendor/calender/lib/jquery-ui.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>

<script src="../assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<script defer src="../assets/fontawesome/js/all.min.js" type="text/javascript"></script>
<script src="../assets/js/feather-icons/feather.min.js"></script>
<script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="../assets/js/main.js"></script>
<!--<script src="assets/js/custom_.js"></script>-->
<script src="../assets/js/pages/dashboard.js"></script>

<%@include file="../_includes/include_footer.jsp"%>

    <script>
        $(document).ready(function() {
            // Initialize FullCalendar
            $('#calendar').fullCalendar({
                events: [
                    {
                        title: 'Meeting',
                        start: '2023-05-15T10:00:00',
                        end: '2023-05-15T12:00:00'
                    },
                    {
                        title: 'Holiday',
                        start: '2023-05-20',
                        end: '2023-05-21'
                    }
                    // Add more events as needed
                ]
                // Additional configuration options can be added here
            });
        });
    </script>
</body>
</html>

