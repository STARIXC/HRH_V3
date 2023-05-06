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
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../assets/css/style.css">


        <style type="text/css">
            .notif:hover {
                background-color: rgba(0, 0, 0, 0.1);
            }

            .fade:not(.show) {
                opacity: 1 !important;
            }
            .select2-container--open .select2-dropdown {
                z-index: 9999;
            }
            .select2 {
                width: 100% !important;
            }


        </style>
    </head>

    <body>

        <%@include file="/_includes/header.jsp"%>

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


                                <a href="javascript:void(0);" data-title="Recreate Leave Balances" data-bs-toggle="tooltip" title="Leave Balances" class="btn btn-sm btn-info lb_new" data-bs-original-title="Create">
                                    <i class="fa fa-plus"></i> Refresh Leave Balances
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


      

            <!-- Basic Vertical form layout section start -->
            <div class="row">
                <div id="updateLeaveBalanceResponse"></div>
                <div class="col-md-12 pt-5">
                    <div class="card">

                        <div class="card-body pt-3">
                            <section class="section">
                                <div class="leave_section">
                                    <div class=" table-responsive">
                                        <table class='table table-hover datatable responsive' id="all_leave_table">
                                            <thead>
                                                <tr>
                                                <tr>
                                                    <th>S/L</th>
                                                    <th>Employee Name</th>
                                                    <th>Leave Type</th>
                                                    <th>Request Duration</th>
                                                    <th>Request Date</th>
                                                    <th>Number of Day</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                                </tr>
                                            </thead>
                                            <tbody id="all_leave_table_data">

                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </section>
                        </div>

                    </div>
                </div>
            </div>
            <!-- // Basic Vertical form layout section end -->
        </div>


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
<script src="../assets/js/pages/all_leave.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('.employeeSelect').select2({
            dropdownParent: $('#simpleModalLB')
        });
        var app = "/hrh";

        // Enable/disable the employee select dropdown based on the selected radio button
        $("input[name=employee]").change(function () {
            if ($(this).val() === "select") {
                $("#employeeSelect").prop("disabled", false);
            } else {
                $("#employeeSelect").prop("disabled", true);
            }
        });
        $(document).on('click', '.lb_new', function (e) {
            $('#simpleModalLB form')[0].reset();
            $('#modal-title').text('Add /Recreate Leave Balances');
            $('#saveButton').data('action', 'create');
            $("#simpleModalLB").modal('show');
        });

        loadYearList();
        loadActiveEmployees();
        function loadYearList() {
            var currentYear = new Date().getFullYear();
            $.ajax({
                url: app + '/ProcessFinancialYear',
                data: {action: "getYears"},
                contentType: "application/json; charset-utf-8",
                dataType: "json",
                success: function (data) {
                    // Parse the data as JSON
                    var options = data;
                    var select = $('#yearSelect');
                    // Loop through the options and append them to the select element
                    $.each(options, function (index, option) {
                        var optionElement = $("<option>")
                                .val(option.year)
                                .text(option.name)
                                .appendTo(select);
//                        console.log(option.year+"="+currentYear);
                        // Mark the option as selected if its value matches the variable
                        if (option.year === currentYear) {
                            optionElement.attr("selected", "selected");
                        }
                    });


                }
            });
        }
        function loadActiveEmployees() {
            var currentYear = new Date().getFullYear();
            $.ajax({
                type: "GET",
                url: app + "/employee",
                data: {action: "allActiveStaff"},
                contentType: "application/json; charset-utf-8",
                dataType: "json",
                success: function (data) {
                    // Parse the data as JSON
                    var options = data;
                    var select = $('#employeeSelect');
                    // Loop through the options and append them to the select element
                    $.each(options, function (index, option) {
                        var optionElement = $("<option>")
                                .val(option.emp_no)
                                .text(option.full_name)
                                .appendTo(select);
//                        console.log(option.year+"="+currentYear);
                        // Mark the option as selected if its value matches the variable
                        if (option.year === currentYear) {
                            optionElement.attr("selected", "selected");
                        }
                    });


                }
            });
        }


        $("#lbForm").submit(function (event) {
            event.preventDefault(); // Prevent the default form submission
            $("#simpleModalLB").modal('hide');
//            $("div.spanner").addClass("show");
            $("div.overlay").addClass("show");
            var year = $("#yearSelect").val();
            var employeeOption = $("input[name=employee]:checked").val();
            var employeeId = "-1";

            if (employeeOption === "select") {
                employeeId = $("#employeeSelect").val();
            }

            // Send an AJAX request to update the leave balances
            $.ajax({
                type: "POST",
                url: app + "/leaveBalance",
                data: {year: year, employeeOption: employeeOption, employeeId: employeeId},
                success: function (data) {
                    $("div.spanner").addClass("hide");
                    $("div.overlay").addClass("hidde");
                    var message = "success";
                    $("#updateLeaveBalanceResponse").html(message);
                },
                error: function () {
                    $("div.spanner").addClass("hide");
                    $("div.overlay").addClass("hide");
                    alert("Error updating leave balances.");
                }
            });
        });



    });


</script>

<%@include file="/_includes/include_footer.jsp"%>
</body>

</html>