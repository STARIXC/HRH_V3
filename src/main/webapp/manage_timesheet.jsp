<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Timesheet</title>
        <link rel="stylesheet" href="./assets/css/custom.css">
        <link rel="shortcut icon" href="./assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="./assets/css/bootstrap.css">
        <link rel="stylesheet" href="./assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="./assets/css/toggle.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.2.4/css/fixedHeader.bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">
        <link href="./assets/vendor/swal2/sweetalert2.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="./assets/vendor/calender/lib/jquery-ui.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="./assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <style type="text/css">
            .notif:hover{
                background-color: rgba(0,0,0,0.1);
            }
            .fade:not(.show) {
                opacity: 1 !important;
            }

            .sidemenu .card-body {
                padding: 10px;
            }
        </style>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    </head>

    <body>
        <%@include file="/_includes/header_.jsp"%>


        <% String id = (String) session.getAttribute("emp_no");%>
        <div class="main-content container-fluid">
            <input type="hidden" name="__STAFFID" id="__STAFFID"	value="<% out.println(id);%>" />
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-auto">
                            <div class="page-header-title">
                                <h4 class="m-b-10">
                                    Timesheet
                                </h4>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="./">Home</a></li>
                                <li class="breadcrumb-item">Timesheet</li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
            <div class="row pt-5">
                <!-- // Basic multiple Column Form section start -->
                <section id="multiple-column-form">
                    <div class="row match-height">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="table-responsive">

                                            <table class="table table-striped table-bordered table-hover" id="timesheetLogs" >
                                                <thead>
                                                    <tr>
                                                        <!-- <th>S#</th> -->
                                                        <th>Year</th>
                                                        <th>Month Name</th>
                                                        <th>Hours Worked</th>
                                                        <th>Leave </th> 
                                                        <th>Public Holiday</th> 
                                                        <th>Extra</th>
                                                        <th>Total Hours</th>
                                                        <th>Expected Hours</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="timesheetLogs_">





                                                </tbody>
                                            </table>


                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- // Basic multiple Column Form section end -->
            </div>
        </div>
        <!-- // Basic Vertical form layout section end -->
    </div>
</div>
</div>
</div>
<%@include file="/_includes/modals.jsp"%>
<script src="./assets/vendor/jquery/jquery.min.js" type="text/javascript"></script>
<script src="./assets/vendor/calender/lib/jquery-ui.min.js" type="text/javascript"></script>
<script src="./assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/fixedheader/3.2.4/js/dataTables.fixedHeader.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.3.0/js/responsive.bootstrap.min.js"></script>
<script defer src="./assets/fontawesome/js/all.min.js" type="text/javascript"></script>
<script src="./assets/js/feather-icons/feather.min.js"></script>
<script src="./assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="./assets/js/app.js"></script>
<script src="./assets/js/main.js"></script>

<script src="./assets/js/staff_pages/timesheet_logs.js"></script>
<%@include file="/_includes/include_footer.jsp"%>
</body>

</html> 







