<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Employee</title>
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
                            <li class="breadcrumb-item active" aria-current="page">Manage Employees</li>
                        </ol>
                    </nav>
                </div>
           
            </div>
            <section class="section">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-12 col-md-12 pb-2">

                                <form action="https://newhrm.bdtask.com/hrm_v4.4_demo/attendance/Home/datebetween_attendance" class="form-inline" method="get" accept-charset="utf-8">

                                    <div class="form-group form-group-margin">
                                        <label for="employeelist">Employee:</label>

                                    </div> 
                                    <div class="form-group form-group-new empdropdown">

                                        <select name="employee_id" class="form-control select2-hidden-accessible" id="employee_id" required="" tabindex="-1" aria-hidden="true" autocomplete="off">
                                            <option value="" selected="selected">Select One...</option>

                                        </select>
                                    </div> 
                                    <div class="form-group form-group-new">
                                        <label for="start_date">Year :</label>
                                        <select required data-placeholder="Reporting Year" class="Tyear form-control" tabindex="-1" onchange="loadmonths();"  id="Tyear" name="Tyear">
                                            <option value=""></option>                                 

                                        </select>
                                    </div> 
                                    <div class="form-group form-group-new">
                                        <label for="end_date">Month :</label>
                                        <select required data-placeholder="Reporting Month" class="form-control" tabindex="-1"  id="TMonth" name="TMonth" onchange="retrivetimesheetlogs();">
                                            <option value="">Choose reporting year first</option>                                 

                                        </select>
                                    </div> 
                                    <button type="submit" class="btn btn-success" autocomplete="off">Search</button>

                                </form>                  
                            </div>
                            <!--  table area -->
                        </div>
                    </div>
                </div>

            </section>
            <section class="section">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-12">

                                <div class="table-responsive">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="timesheetLogs">
                                        <thead>
                                            <tr>
                                                <th>EMP</th> 
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
            </section>

        </div>
        <!--        <div id="spinner-div" class="pt-5">
                    <div class="d-flex justify-content-center">
                        <div class="spinner-border" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>
                </div>-->

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
<script src="../assets/js/pages/monthly_attendance.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    $.ajax({
        type: "GET",
        url: "TimesheetServlet",
        dataType: "json",
        success: function(data) {
            // Get the unique dates from the timesheet data
            var dates = [];
            for (var i = 0; i < data.length; i++) {
                if (dates.indexOf(data[i].date) === -1) {
                    dates.push(data[i].date);
                }
            }
            
            // Generate the table header with the unique dates as column titles
            var header = "<tr><th>Employee Name</th><th>Employee ID</th>";
            for (var i = 0; i < dates.length; i++) {
                header += "<th>" + dates[i] + "</th>";
            }
            header += "</tr>";
            $("#timesheet-table").append(header);
            
            // Loop through the timesheet data and generate the table rows
            var employees = [];
            for (var i = 0; i < data.length; i++) {
                var index = employees.indexOf(data[i].employeeId);
                if (index === -1) {
                    employees.push(data[i].employeeId);
                    var row = "<tr><td>" + data[i].employeeName + "</td><td>" + data[i].employeeId + "</td>";
                    for (var j = 0; j < dates.length; j++) {
                        if (dates[j] === data[i].date) {
                            row += "<td>" + data[i].hoursWorked + "</td>";
                        } else {
                            row += "<td></td>";
                        }
                    }
                    row += "</tr>";
                    $("#timesheet-table").append(row);
                } else {
                    var row = $("#timesheet-table tr").eq(index + 1);
                    for (var j = 0; j < dates.length; j++) {
                        if (dates[j] === data[i].date) {
                            row.find("td").eq(j + 2).html(data[i].hoursWorked);
                        }
                    }
                }
            }
        }
    });
});
</script>
</script>
<%@include file="/_includes/include_footer.jsp"%>
</body>

</html>