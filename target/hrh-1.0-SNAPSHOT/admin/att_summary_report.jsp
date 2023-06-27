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
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
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
      
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-auto">
                            <div class="page-header-title">
                                <h4 class="m-b-10">
                                    Manage Employee
                                </h4>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="./">Home</a></li>
                                <li class="breadcrumb-item">Employee</li>
                            </ul>
                        </div>
                        <div class="col">
                            <div class="float-end ">

                                <a href="/export/employee" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Export" class="btn btn-sm btn-info">
                                    <i class="fa fa-file-export"></i>
                                </a>

                                <a href="#" data-url="/employee/file" data-ajax-popup="true" data-title="Import  employee CSV file" data-bs-toggle="tooltip" title="" class="btn btn-sm btn-info" data-bs-original-title="Import">
                                    <i class="fa fa-file"></i>
                                </a>
                                <a href="javascript:void(0);" data-title="Create New Employee" data-bs-toggle="tooltip" title="" class="btn btn-sm btn-info create_new" data-bs-original-title="Create">
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

  <div class="row">
                <div class="col-sm-12 pt-5">
                    <div class="card text-white">
                        <!--<div class="card-header "><i class="fa fa-table fa-fw"></i> Staff List</div>-->
                        <div class="card-wrapper " aria-expanded="true">
                         <div class="card-body pt-3">
                            <form accept-charset="UTF-8" id="attendanceSummaryReport" >
                                <div class="row">

                                    <div class="col-8">
                                        <div class="form-group">
                                            <label class="control-label" for="email">Month<span class="validateRq">*</span></label>
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                                <input type="text" class="form-control monthField required" readonly placeholder="Month"  name="month" id="month" />
                                            </div>
                                        </div>
                                    </div>
<!--                                    <div class="col-2">


                                        <input type="submit" id="filter"  class="btn btn-info " value="Filter"/>

                                    </div>-->


                                </div>
                            </form>
                          
                            </div>
                       
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-sm-12 pt-2">
                    <div class="card text-white">
                        <!--<div class="card-header "><i class="fa fa-table fa-fw"></i> Staff List</div>-->
                        <div class="card-wrapper " aria-expanded="true">
                            <div class="card-header card-body table-border-style">
                                <div class="table-responsive ">
                                     <table width="100%" class="table table-bordered table-striped table-hover" id="timesheet_table" >
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
            </div>

            </div>
            <!-- // Basic Vertical form layout section end -->
        </div>
    </div>
</div>
<script src="../assets/vendor/jquery/jquery.min.js" type="text/javascript"></script>
<script src="../assets/vendor/calender/lib/jquery-ui.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
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