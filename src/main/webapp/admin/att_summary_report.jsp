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
        </style>
        <script src="../assets/vendor/jquery/jquery.min.js"></script>
    </head>

    <body>

        <%@include file="/_includes/header.jsp"%>
        <div id="app__" onload="getDefaultMonth();"></div>
        <div class="main-content container-fluid">
            <div class="row mb-2">
                <div class="col-md-12 order-md-1 order-last">
                    <nav aria-label="breadcrumb" class='breadcrumb-header'>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp" class="text-success"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Attendance Summary Report</li>
                        </ol>
                    </nav>
                </div>

            </div>


            <!-- Basic Vertical form layout section start -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-success text-white">
                            <i class="mdi mdi-table fa-fw"></i> 
                            Attendance Summary Report
                        </div>
                        <div class="card-body pt-3">
                            <form accept-charset="UTF-8" id="attendanceSummaryReport" >
                                <div class="row">

                                    <div class="col-6">
                                        <div class="form-group">
                                            <label class="control-label" for="email">Month<span class="validateRq">*</span></label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                <input type="text" class="form-control monthField required" readonly placeholder="Month"  name="month" id="month" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-2">


                                        <input type="submit" id="filter"  class="btn btn-info " value="Filter"/>

                                    </div>


                                </div>
                            </form>
                            <h4 class="text-end">
                                <a target="_blank" class="btn btn-success" style="color: #fff" href="https://hrms.braintricker.com/downloadAttendanceSummaryReport/2022-06"><i class="fa fa-download fa-lg" aria-hidden="true"></i> Download PDF</a>
                            </h4>
                            <div class="table-responsive" id="table-container">

                                <table  class="table table-bordered table-striped table-hover" id="timesheet_table" >
                                    <thead></thead>
                                    <tbody></tbody>

                                    <script>
                                        $('.totalCol').attr('colspan', 39 + 3);
                                    </script>

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
<script src="../assets/js/pages/form_.js"></script>
<script src="../assets/js/pages/front.js"></script>
<script src="../assets/js/pages/attendace.js"></script>  
<%@include file="/_includes/include_footer.jsp"%>
</body>

</html>