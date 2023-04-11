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
        <div class="main-content container-fluid dash-container">
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
                            <div class="card-header card-body table-border-style">
                                <div class="table-responsive ">
                                    <table width="100%" class="employee_table table  table-bordered table-hover " id="employee_table">
                                        <thead class='mt-3'>
                                            <tr>
                                                <th>Employee PF_NO</th>
                                                <th>Employee Name</th>
                                                <!--<th>Position</th>-->
                                                <th>Phone</th>
                                                <th>Email Address</th>
                                                <th>Country</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="employee-table-data">

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
    <div id="spinner-div" class="pt-5">
        <div class="d-flex justify-content-center">
            <div class="spinner-border" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    </div>

</div>
</div>
</div>


<!-- Modal -->

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

<script src="../assets/js/pages/employees.js"></script>
<script src="../assets/js/pages/position_cadre_loader.js"></script>
<script src="../assets/js/pages/employee.js"></script>
<script src="../assets/js/pages/form_.js"></script>
<script src="../assets/js/pages/front.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var app = "/hrh";
        $("#wizard-picture").change(function () {
            readURL(this);
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#wizardPicturePreview').attr('src', e.target.result).fadeIn('slow');
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

        $('#ddlSupervisor').empty();
        $('#ddlFacility').change(function () {
            // Get the selected facility's mflcode
            const mflcode = $(this).val();

            // Make an AJAX request to retrieve the supervisors for the selected facility
            $.ajax({
                url: app + '/supervisors',
                data: {mflcode: mflcode},
                type: 'get',
                contentType: "application/json; charset-utf-8",
                dataType: "json",
                success: function (data) {
                    $('#ddlSupervisor').empty();
//                    const keys = Object.keys(data);
//                    console.log(keys);
//                    for (const key in data) {
//                        console.log(key); // prints the key
//                        console.log(data[key]); // prints the value associated with the key
//                    }
                    $('#ddlSupervisor').append('<option value="">--- Select Supervisor---</option>');
                    $.each(data, function (key, value)
                    {
                        $('#ddlSupervisor').append('<option id="' + key + '" value="' + value.supervisor_id + '">' + value.name + '</option>');
                    });

                },
                complete: function () {

                }


            });
//                                                                            $.ajax({
//                                                                                url: app+'/supervisors',
//                                                                                data: {mflcode: mflcode},
//                                                                                type: 'get',
//                                                                                success: function (data) {
//                                                                                    // Clear the existing options in the select field
//                                                                                   
//
//                                                                                    // Add the first option (Select Supervisor)
//                                                                                    $('#ddlSupervisor').append(
//                                                                                            `<option value="">Select Supervisor</option>`
//                                                                                            );
//
//                                                                                    // Loop through the supervisors and add each one as an option in the select field
//                                                                                    for (const supervisor of data) {
//                                                                                        $('#ddlSupervisor').append(
//                                                                                                `<option value="${supervisor.supervisor_id}">${supervisor.name}</option>`
//                                                                                                );
//                                                                                    }
//                                                                                }
//                                                                            });
        });



        $(".datepicker").datepicker({
            dateFormat: "yy-mm-dd"
        });
        $("#txtJoinDate").datepicker({
            dateFormat: "yy-mm-dd"
        });
        $("#txtTerminateDate").datepicker({
            dateFormat: "yy-mm-dd"
        });
        $("#txtRehiredate").datepicker({
            dateFormat: "yy-mm-dd"
        });
        $("#txtBirthDate").datepicker({
            format: 'yyyy-mm-dd',
            minViewMode: 'months'
        });
        // Hide the additional form inputs by default
        $('.extra-options').hide();

        // Show/hide the additional form inputs when the checkbox is selected/deselected
        // Show/hide the additional form inputs when the checkbox is selected/deselected
        $('#show-more').change(function () {
            if (this.checked) {
                $('.extra-options').show();
            } else {
                $('.extra-options').hide();
            }
        });
        $(document).on('click', '.create_new', function (e) {
            $('#simpleModal form')[0].reset();
            $("#simpleModal").modal('show');
        });

        $(document).on('click', '#delete_staff', function (e) {
            e.preventDefault();
            var emp_id = $(this).data('emp');
            console.log("Type id: " + emp_id);
            SwalDelete(emp_id);
        });
        $(document).on('click', '.edit_emp', function (e) {
            e.preventDefault();
            var emp_no = $(this).data('id');
            console.log("Employee_no: " + emp_no);
            OpenBootstrapPopup(emp_no);

        });



        function OpenBootstrapPopup(emp_no) {

            var emp_no = emp_no;
            $('#simpleModal form').attr('id', 'editRecordForm');
            $('#simpleModal .modal-title').text('Edit Record');
            $('#simpleModal .btn_save').text('Save Changes');
            $.ajax({
                type: "GET",
                url: app+"/employee",
                data: {emp_no: emp_no, action: "getEmployee"},
                contentType: "application/json; charset-utf-8",
                dataType: "json",
                success: function (data) {

                    $('#txtSurname').val(data.employee.surname);
                    $('#txtFirstName').val(data.employee.first_name);
                    $('#txtMiddleName').val(data.employee.other_name);
                    $('#txtEmail').val(data.employee.email);
                    $('#txtNationalID').val(data.employee.national_id);
                    $('#txtEmployeeNumber').val(data.employee.emp_no);
//                                                                            $('#ddlEmployeeType option[value="' + data.currentPosition.emp_type + '"]').attr("selected", "selected");
                    $('#eStatus option[value="' + data.employee.status + '"]').attr("selected", "selected");
                    $('#hiredate').val(data.employee.date_started);
                    $('#endDate').val(data.employee.date_ended);
                    // $('ddlCadreCategory option[value="' + data.emp_type + '"]').attr("selected", "selected");
                    // $('ddlPos option[value="' + data.emp_type + '"]').attr("selected", "selected");
                    // $('ddlCounty option[value="' + data.emp_type + '"]').attr("selected", "selected");
                    // $('ddlSubcounty option[value="' + data.emp_type + '"]').attr("selected", "selected");
                    // $('ddlFacility option[value="' + data.emp_type + '"]').attr("selected", "selected");
                    // $('ddlSupervisor option[value="' + data.emp_type + '"]').attr("selected", "selected");
                    // $('ddlFY option[value="' + data.emp_type + '"]').attr("selected", "selected");
                    // $('contract_period').val(data.id);
                    // $('end_date').val(data.id);
                    // $('contract_no_months').val(data.id);
                    // $('year').val(data.id);
                    // $('contractStartDate').val(data.id);
                    // $('contractEndDate').val(data.id);
                    $('#txtHomeAddress').val(data.employee.home_address);
                    $('#txtPostalCode').val(data.employee.postal_code);
                    $('#txtNationality').val(data.employee.nationality);
                    $('#txtBirthDate').val(data.employee.dob);
                    if (data.employee.gender === "Female") {
                        $("#rbtnMale").prop("checked", false);
                        $("#rbtnFeMale").prop("checked", true);
                    } else {
                        $("#rbtnMale").prop("checked", true);
                        $("#rbtnFeMale").prop("checked", false);
                    }
                    // $('ddlMaratialStatus option[value="' + data.employee.marital_status + '"]').attr("selected", "selected");
                    $('#txtAltEmail').val(data.employee.alt_email);
                    $('#txtPhone').val(data.employee.phone);
                    $('#txtAltPhone').val(data.employee.alt_phone);
                    if (data.employee.disability === "1") {
                        $("#rbtnDisability_yes").prop("checked", true);
                        $("#rbtnDisability_no").prop("checked", false);
                    } else {
                        $("#rbtnDisability_yes").prop("checked", false);
                        $("#rbtnDisability_no").prop("checked", true);
                    }

                    $('#txtDisabilityExplain').val(data.employee.disability_explain);
                    $('#txtPinCode').val(data.employee.kra_pin);
                    $('#txtNSSF').val(data.employee.nssf_no);
                    $('#txtNHIF').val(data.employee.nhif_no);
                    $('#txtGoodConduct').val(data.employee.cert_good_conduct_no);
                    if (data.employee.helb_benefitiary === 1) {
                        $("#rbtnHelb").prop("checked", true);
                        $("#rbtnHelb_no").prop("checked", false);
                    } else {
                        $("#rbtnHelb").prop("checked", false);
                        $("#rbtnHelb_no").prop("checked", true);
                    }

                    $('#txtHelbClearance').val(data.employee.helb_clearance_no);
                    $('#txtBankName').val(data.employee.bank_name);
                    $('#txtBranchName').val(data.employee.branch);
                    $('#txtAccountName').val(data.employee.account_name);
                    $('#txtAccountNumber').val(data.employee.acount_number);



                },
                complete: function () {
                    $("#simpleModal").modal('show');
                }
            });

        }
        function SwalDelete(typeId) {

            swal({
                title: 'Are you sure?',
                text: "It will be deleted permanently",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6', //sweetalert confirm dialouge 
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!',
                showLoaderOnConfirm: true,

                preConfirm: function () {
                    return new Promise(function (resolve) {    //Promise() function take care delete process done by ajax
                        var action = "delete";
                        var data = "deleteId=" + typeId + "&action=" + action;
                        var url = url;
                        $.ajax({
                            url: app + '/ProcessStaff', //ajax codes start for delete data
                            type: 'POST',
                            data: data,
                            dataType: 'JSON'
                        })
                                .done(function (response) {
                                    swal('Deleted!', response.message, response.status);    //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                                    var url_ = "manage_employee.jsp";
                                    $(location).attr('href', url_);
                                    //  readFruit();
                                })
                                .fail(function () {
                                    swal('Oops...', 'Something went wrong with ajax !', 'error');    //if process fail on delete.jsp file get JSON response display message "Unable to delete fruit"
                                });
                    });
                },
                allowOutsideClick: false
            });
        }
        // Prepare the preview for profile picture

    }
    );
</script>
<%@include file="/_includes/include_footer.jsp"%>
</body>

</html>