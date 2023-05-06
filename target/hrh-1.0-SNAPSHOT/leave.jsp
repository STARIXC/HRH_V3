<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Leave Applications</title>
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
        <link rel="stylesheet" href="./assets/vendor/calender/lib/bootstrap-datepicker.css" />
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
                                    Leave Applications
                                </h4>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="./">Home</a></li>
                                <li class="breadcrumb-item">Leave Application</li>
                            </ul>
                        </div>
                        <div class="col">
                            <div class="float-end ">
                                <a href="javascript:void(0);" data-title="New Document Type" data-bs-toggle="tooltip" title="" class="btn btn-sm btn-info create_new" data-bs-original-title="Create">
                                    <i class="fa fa-plus"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row pt-5">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-body table-border-style">
                            <div class="table-responsive">
                                <table class="main-table mobile-optimised table  table-hover ">
                                    <thead>
                                        <tr>
                                            <th scope="col" >Employee</th>
                                            <th scope="col" >Leave Type</th>
                                            <th scope="col" >Period</th>
                                            <th scope="col"  >Status</th>
                                            <th scope="col"  >Action</th>
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

            <div id="leave_application" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modal-title">Create Absence</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="body">
                            <form class="form" id="LeaveApplication" autocomplete="off">
                                <div class="modal-body">

                                    <div class="row">
                                        <div id="ajaxResponse"></div>
                                        <div class="col-md-6 col-12">
                                            <div class="form-group has-icon-left">
                                                <label for="first-name-icon">Days Applied</label>
                                                <div class="position-relative">
                                                    <input type="hidden" class="form-control" id="fy_id" value="2023">
                                                    <input type="hidden" class="form-control" id="supervisor_id" value="<%=session.getAttribute("supervisor_id")%>">
                                                    <input type="hidden" class="form-control" id="technical_monitor_id" value="<%=session.getAttribute("technical_monitor_id")%>">
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
                                                            <option value="">Select Leave Type</option>
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
                                </div>
                            </form>

                        </div>
                    </div>

                </div>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="./assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
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
<script src="assets/js/staff_pages/leave.js"></script>
<script type="text/javascript">
                                                                    $(document).ready(function () {
                                                                        var app = "/hrh";
//                                                                        loadList();
                                                                        getLeaves();
                                                                        function getLeaves() {
                                                                            $.ajax({
                                                                                url: app + '/ProcessLeaves?action=getAllTypes',
                                                                                type: 'get',
                                                                                contentType: "application/json; charset-utf-8",
                                                                                dataType: "json",
                                                                                success: function (data) {

                                                                                    $('#leave_type_id').empty();
                                                                                    $('#leave_type_id').append('<option>---Select Leave Type---</option>');

                                                                                    $.each(data, function (key, value)
                                                                                    {
                                                                                        $('#leave_type_id').append('<option value="' + value.leave_id + '">' + value.leave_type + '</option>');
                                                                                    });

                                                                                }
                                                                            });


                                                                        }


                                                                        $(document).on('click', '.create_new', function (e) {
                                                                            $('#leave_application form')[0].reset();
                                                                            $('#modal-title').text('Create Leave Request');
                                                                            $('#saveButton').data('action', 'create');
                                                                            $("#leave_application").modal('show');
                                                                        }
                                                                        );



                                                                    });

</script>
<script src="assets/js/staff_pages/applications_leave.js"></script>
<%@include file="/_includes/include_footer.jsp"%>
</body>

</html> 