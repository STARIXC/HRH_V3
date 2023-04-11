<!DOCTYPE html>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>--%>
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
        <%@include file="/_includes/header.jsp"%>
   

    <div class="main-content">



        <div class="container-fluid">

            <div class="row bg-title">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <ol class="breadcrumb">
                        <li class="active breadcrumbColor"><a href="#"><i class="fa fa-home"></i> Dashboards</a></li>
                    </ol>
                </div>
            </div>
             <div class="row match-height">
                            <div class="col-md-12 col-12">
                                <div class="card">
                                    <div class="card-content">
                                        <div class="card-body">
                                            <h1>Error</h1>
                                            <h2>
                                               
                                            </h2>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
        </div>


        <!-- /.container-fluid -->

    </div>
</div>
<%@include file="/_includes/footer.jsp"%>
</div>

<script src="../assets/vendor/jquery/jquery.min.js" type="text/javascript"></script>
<script src="../assets/vendor/calender/lib/jquery-ui.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<script defer src="../assets/fontawesome/js/all.min.js" type="text/javascript"></script>
<script src="../assets/js/feather-icons/feather.min.js"></script>
<script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="../assets/js/main.js"></script>
<script src="../assets/js/custom_.js"></script>
<script src="../assets/js/pages/dashboard.js"></script>

<%@include file="/_includes/include_footer.jsp"%>


</body>
</html>
