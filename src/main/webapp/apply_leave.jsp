<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Apply Leave</title>
        <link rel="stylesheet" href="./assets/css/custom.css">
        <link rel="shortcut icon" href="./assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="./assets/css/bootstrap.css">
        <link rel="stylesheet" href="./assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="./assets/css/toggle.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.2.4/css/fixedHeader.bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">
        <link rel="stylesheet" href="assets/vendor/DataTables/datatables.css">
        <link href="./assets/vendor/swal2/sweetalert2.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="./assets/vendor/calender/lib/jquery-ui.min.css" />
        <link rel="stylesheet" href="./assets/vendor/calender/lib/bootstrap-datepicker.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="./assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="./assets/css/style.css">
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

        <%@include file="/_includes/header_.jsp"%>
        <%            String id = (String) session.getAttribute("user_id");
            String fy_id = (String) session.getAttribute("financial_year");

        %>


        <div class="main-content">
            <div class="main-content container-fluid dash-container">
                <div class="page-header">
                    <div class="page-block">
                        <div class="row align-items-center">
                            <div class="col-auto">
                                <div class="page-header-title">
                                    <h4 class="m-b-10">
                                        Leave
                                    </h4>
                                </div>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="./">Home</a></li>
                                    <li class="breadcrumb-item">Leave Requests</li>
                                </ul>
                            </div>
                            <div class="col">
                                <div class="float-end ">
                                    <a href="javascript:void(0);" data-title="Create New Leave" data-bs-toggle="tooltip" title="" class="btn btn-sm btn-info create_new" data-bs-original-title="Create">
                                        <i class="fa fa-plus"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row pt-5">
                     <input type="hidden" name="__STAFFID" id="__STAFFID"	value="<%=session.getAttribute("user_id")%>" />
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-body">
                                <!-- // Basic multiple Column Form section start -->
                                <section id="multiple-column-form">
                                    <div class="row match-height">
                                        <div class="col-12">
                                            <div class="card">
                                                <div class="card-content">
                                                    <div class="card-body">
                                                        <table class='table' id="leave_table">
                                                            <thead>
                                                                <tr>
                                                                    <th>Leave Type</th>
                                                                    <th>From</th>
                                                                    <th>To</th>
                                                                    <th>Posting Date</th>
                                                                    <th>Remark</th>
                                                                    <th>Status</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="leave_table_data">
                                                                <tr>
                                                                    <td>Casual Leave</td>
                                                                    <td>2021-11-02</td>
                                                                    <td>2021-11-05</td>
                                                                    <td>2021-11-01</td>
                                                                    <td>waiting for approval</td>
                                                                    <td><span class="badge bg-info">Pending</span></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                <!-- // Basic multiple Column Form section end -->
                                <input type="hidden" name="" id="base_url" value="/hrh">

                            </div>
                        </div>
                    </div>

                </div>

                <div id="simpleModal" class="modal" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modal-title">Create Time Off</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="body">
                                <form class="form" id="leave_application" autocomplete="off">
                                    <div class="row">
                                        <div id="ajaxResponse"></div>
                                        <div class="col-md-6 col-12">
                                            <div class="form-group has-icon-left">
                                                <label for="first-name-icon">Days Applied</label>
                                                <div class="position-relative">
                                                    <input type="hidden" class="form-control"
                                                           id="fy_id" value="<%=fy_id%>">
                                                    <input type="hidden" class="form-control"
                                                           id="employee_id" value="<%=id%>">
                                                    <input type="text" class="form-control" id="days_applied"  value="0" readonly>
                                                    <div class="form-control-icon">
                                                        <i class="fa fa-table"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-12">
                                            <div class="form-group has-icon-left">
                                                <label for="first-name-icon">Select Leave Type</label>
                                                <div class="position-relative">
                                                    <fieldset class="form-group">

                                                        <select class="form-select" id="leave_type_id"
                                                                name="basicSelectLeaveType" onchange="leavetypechange();">

                                                        </select>
                                                        <span id="enjoy">You Enjoyed : 0 Ds</span>
                                                        <span id="checkleave">Total Leave : 12 Ds</span>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-12">
                                            <div class="form-group has-icon-left">
                                                <label for="calender-icon">From Date</label>
                                                <div class="position-relative">
                                                    <input type="text" class="form-control" placeholder="Start Date" id="start_date" name="start_date" value="" data-date-format="yyyy-mm-dd"  />
                                                    <div class="form-control-icon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-12">
                                            <div class="form-group has-icon-left">
                                                <label for="calender-icon">To Date</label>
                                                <div class="position-relative">
                                                    <input type="text" class="form-control" placeholder="End Date" id="end_date"  name="end_date" value="" data-date-format="yyyy-mm-dd"  />
                                                    <div class="form-control-icon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 d-flex justify-content-end">
                                            <button type="submit" class="btn btn-primary me-1 mb-1">Submit</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <%@include file="/_includes/footer.jsp"%>

    </div>

    <!-- JavaScript files-->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/DataTables/datatables.js"></script>
    <script src="assets/vendor/calender/lib/jquery-ui.min.js"></script>
    <script defer src="./assets/fontawesome/js/all.min.js"></script>
    <script src="assets/js/staff_pages/applications_leave.js"></script>
    <script src="assets/js/pages/leave.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script src="assets/vendor/popper.js/umd/popper.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/vendor/jquery.cookie/jquery.cookie.js"></script>
    <script src="assets/vendor/chart.js/Chart.min.js"></script>
    <script src="assets/vendor/jquery-validation/jquery.validate.min.js"></script>

    <script defer src="assets/fontawesome/js/all.min.js"></script>
    <script src="assets/vendor/additional/additional.js"></script>
    <script src="assets/js/feather-icons/feather.min.js"></script>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/app.js"></script>

    <script src="assets/js/main.js"></script>


    <script>

                                                                    $(document).ready(function () {
                                                                        //

                                                                    });
    </script>

</body>
</html>
