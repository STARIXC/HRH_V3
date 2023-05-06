<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Employee</title>
        <link rel="stylesheet" href="./assets/css/custom.css">
        <link rel="shortcut icon" href="./assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="./assets/css/bootstrap.css">
        <link rel="stylesheet" href="./assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="./assets/css/toggle.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
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
            <div class="alert alert-success d-none" role="alert" id="alert">
                Your file was uploaded successfully!
            </div>
            <div id="loader" class="loader"></div>

            <section class="section profile">
                <div class=" emp-profile">
                    <input type="hidden" class="form-control"  id="employee_id" value="<% out.println(id);%>" />
                    <div class="row">
                        <div class="col-md-4">
                            <div class="profile-img">
                                <img src="./assets/img/user_image.png" alt="Profile" class=" emp_image" id="emp_image" width="200"/>
                                <div class="file btn btn-lg btn-primary">
                                    Change Photo
                                    <input type="file" name="file"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="profile-head">
                                <h4 class="name" id="sum_name">
                                    Kshiti Ghelani
                                </h4>
                                <h5  class="designation" id="designation_">
                                    Web Developer and Designer
                                </h5>
                                <h5  class="email" id="sumEmail">
                                    Web Developer and Designer
                                </h5>
                                <h5  class="phone" id="_phone">
                                    Web Developer and Designer
                                </h5>
                                <h5  class="facility" id="_facility">
                                    Web Developer and Designer
                                </h5>
                                <p class="proile-rating ">Supervisor : <span id="supervisor"></span></p>

                            </div>
                        </div>
                        <div class="col-md-2">
                            <input type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile"/>
                        </div>
                    </div>
                    <div class="row">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="basic-tab" data-bs-toggle="tab" href="#basic" role="tab" aria-controls="basic" aria-selected="true">
                                    <i class="fa fa-user-circle mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">General Info</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " id="work-tab" data-bs-toggle="tab" href="#work" role="tab" aria-controls="work" aria-selected="false">
                                    <i class="fa fa-calendar-minus mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">Jobs</span></a>
                            </li>
                            <li class="nav-item">
                                <a class=" nav-link" id="leave-tab" data-bs-toggle="tab" href="#leave" role="tab" aria-controls="leave" aria-selected="false">
                                    <i class="fa fa-star mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">Leave</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="note-tab" data-bs-toggle="tab" href="#v-note" role="tab" aria-controls="note     " aria-selected="false">
                                    <i class="fa fa-star mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">Notes</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="performance-tab" data-bs-toggle="tab" href="#performance" role="tab" aria-controls="performance" aria-selected="false">
                                    <i class="fa fa-star mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">Performance</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="docs-tab" data-bs-toggle="tab" href="#docs" role="tab" aria-controls="docs" aria-selected="false">
                                    <i class="fa fa-star mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">Documents</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="training-tab" data-bs-toggle="tab" href="#training" role="tab" aria-controls="training" aria-selected="false">
                                    <i class="fa fa-star mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">Training</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="payslip-tab" data-bs-toggle="tab" href="#v-payslip" role="tab" aria-controls="payslip" aria-selected="false">
                                    <i class="fa fa-star mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">Payslip</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="payroll-tab" data-bs-toggle="tab" href="#v-payrolls" role="tab" aria-controls="payroll" aria-selected="false">
                                    <i class="fa fa-star mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">Payroll</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="attendance-tab" data-bs-toggle="tab" href="#v-attendance" role="tab" aria-controls="attendance" aria-selected="false">
                                    <i class="fa fa-star mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">Attendance</span></a>
                            </li>
                        </ul>
                    </div>
                    <div class="row mt-5">

                        <div class="col-xl-12">
                            <div class="tab-content" id="tabContent">

                                <div class="tab-pane  show active" id="basic" role="tabpanel" aria-labelledby="basic-tab">

                                    <div class="card shadow">

                                        <div class="card-body">
                                            <div class="title">
                                                <h3>Basic Info</h3>
                                            </div>
                                            <dl class="row row-cols-2 g-2 g-lg-2">
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500">First Name</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 fname" id="fname">ESM002</dd>
                                                </div>
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500">Last Name</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 lname" id="lname">ESM002</dd>
                                                </div>
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500">Employee ID</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 employeeNo " id="employeeNo">ESM002</dd>
                                                </div>
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500">Email</dt>
                                                    <dd class="mt-1 text-sm text-gray-900" ><a id="email" class="email" href='mailto:'></a></dd>
                                                </div>



                                            </dl>

                                        </div>
                                    </div>
                                    <div class="card shadow">

                                        <div class="card-body">
                                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ">
                                                <h3>Work</h3>
                                            </div>
                                            <dl class="row row-cols-2 g-2 g-lg-2">
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500 ">Employee Type</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 etype" id="etype">ESM002</dd>
                                                </div>
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500">Title</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 title" id="title">ESM002</dd>
                                                </div>
                                                <!--                                                <div class="col">
                                                                                                    <dt class="font-medium text-sm text-gray-500">Reporting To</dt>
                                                                                                    <dd class="mt-1 text-sm text-gray-900 supervisor" id="supervisor">ESM002</dd>
                                                                                                </div>-->
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500">Date of Hire</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 hireDate" id="hireDate">ESM002</dd>
                                                </div>
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500">Employee Status</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 estatus" id="estatus"></dd>

                                                </div>



                                            </dl>

                                        </div>
                                    </div>
                                    <div class="card shadow">

                                        <div class="card-body">
                                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ">
                                                <h3>Personal Details</h3>
                                            </div>
                                            <dl class="row row-cols-2 g-2 g-lg-2">
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500 ">Nationality</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 nationality" id="nationality">ESM002</dd>
                                                </div>
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500 ">Home Address</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 homeAddress" id="home_address">ESM002</dd>
                                                </div>
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500">Postal Code</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 postalcode" id="postal_code">ESM002</dd>
                                                </div>
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500">Present Address</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 supervisor" id="pressent_address">ESM002</dd>
                                                </div>
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500">Alternative Email</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 email" id="alt_email">ESM002</dd>
                                                </div>
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500">Mobile</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 phone" id="phone">ESM002</dd>

                                                </div>
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500">Phone</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 alt_phone" id="alt_phone">ESM002</dd>

                                                </div>
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500">Date of Birth</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 dob" id="dob">ESM002</dd>

                                                </div>
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500">Gender</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 gender" id="gender">ESM002</dd>

                                                </div>
                                                <div class="col">
                                                    <dt class="font-medium text-sm text-gray-500">Marital Status</dt>
                                                    <dd class="mt-1 text-sm text-gray-900 mstatus" id="marital_status">ESM002</dd>

                                                </div>



                                            </dl>

                                        </div>
                                    </div>
                                    <div class="card shadow">

                                        <div class="card-body">
                                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ">
                                                <h3>Work Experience</h3>
                                            </div>
                                            <table class="table rounded-table hidden md:table min-w-full divide-y divide-gray-200 ">
                                                <thead class="bg-gray-50 dark:bg-neutral-700">
                                                    <tr>
                                                        <th scope="col" class="sm-px-2 px-4 py-3 text-left text-xs font-medium text-gray-500  uppercase tracking-wider cursor-pointer"><!----> Period <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                        <th scope="col" class=" py-3 text-left text-xs font-medium text-gray-500  uppercase tracking-wider"><!----> Department <!----></th>
                                                        <th scope="col" class=" py-3 text-left text-xs font-medium text-gray-500  uppercase tracking-wider"><!----> Designation <!----></th>
                                                        <th scope="col" class=" py-3 text-left text-xs font-medium text-gray-500  uppercase tracking-wider"><!----> Branch <!----></th>
                                                        <th scope="col" class=" py-3 text-left text-xs font-medium text-gray-500  uppercase tracking-wider"><!----> Employment Status <!----></th>
                                                        <th scope="col" class=" py-3 text-left text-xs font-medium text-gray-500  uppercase tracking-wider"><!---->  <!----></th>
                                                    </tr>                </thead>
                                                <tbody class="bg-white divide-y divide-gray-200 " id="emp_hist">

                                                </tbody>
                                                <!---->
                                            </table>
                                            
                                        </div>
                                    </div>
                                    <div class="card shadow">

                                        <div class="card-body">
                                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ">
                                                <h3>Education </h3>
                                            </div>
                                            <table class="table rounded-table hidden md:table min-w-full divide-y divide-gray-200 ">
                                                <thead class="bg-gray-50 dark:bg-neutral-700">
                                                    <tr>
                                                        <th scope="col" class="sm-px-2 px-4 py-3 text-left text-xs font-medium text-gray-500  uppercase tracking-wider cursor-pointer"><!----> Period <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                        <th scope="col" class=" py-3 text-left text-xs font-medium text-gray-500  uppercase tracking-wider"><!----> Year <!----></th>
                                                        <th scope="col" class=" py-3 text-left text-xs font-medium text-gray-500  uppercase tracking-wider"><!----> School <!----></th>
                                                        <th scope="col" class=" py-3 text-left text-xs font-medium text-gray-500  uppercase tracking-wider"><!----> Major <!----></th>
                                                    </tr>                </thead>
                                                <tbody class="bg-white divide-y divide-gray-200 " id="education">

                                                </tbody>
                                                <!---->
                                            </table>
                                            
                                        </div>
                                    </div>
                                    <div class="card shadow">

                                        <div class="card-body">
                                            <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ">
                                                <h3>Dependents </h3>
                                            </div>
                                            <table class="table rounded-table hidden md:table min-w-full divide-y divide-gray-200 ">
                                                <thead class="bg-gray-50 dark:bg-neutral-700">
                                                    <tr>
                                                        <th scope="col" class="sm-px-2 px-4 py-3 text-left text-xs font-medium text-gray-500  uppercase tracking-wider cursor-pointer"><!----> Period <span class="hidden xl:inline-block"><i class="fas fa-arrows-alt-v"></i></span></th>
                                                        <th scope="col" class=" py-3 text-left text-xs font-medium text-gray-500  uppercase tracking-wider"><!----> Year <!----></th>
                                                        <th scope="col" class=" py-3 text-left text-xs font-medium text-gray-500  uppercase tracking-wider"><!----> School <!----></th>
                                                        <th scope="col" class=" py-3 text-left text-xs font-medium text-gray-500  uppercase tracking-wider"><!----> Major <!----></th>
                                                    </tr>                </thead>
                                                <tbody class="bg-white divide-y divide-gray-200 " id="education">

                                                </tbody>
                                                <!---->
                                            </table>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane " id="work" role="tabpanel" aria-labelledby="work-tab">
                                    <div class="card shadow">

                                        <div class="card-body">
                                            <div class="">
                                                <h3>Employee Status</h3>


                                            </div>
                                            <hr />
                                            <table class="table rounded-table hidden md:table min-w-full divide-y divide-gray-200">
                                                <thead>
                                                    <tr>
                                                        <th>Date</th>
                                                        <th>Employee Status</th>
                                                        <th>Comment</th>
                                                        <th class="action">&nbsp;</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                </tbody>
                                            </table>






                                        </div>
                                    </div>
                                    <div class="card shadow">

                                        <div class="card-body">

                                            <h3>Employment Type</h3>

                                            <a href="#" id="erp-empl-type" class="action btn" data-id=""
                                               data-template="erp-employment-type"
                                               data-title="Employment Type">Update Type</a>
                                            <hr />
                                            <table class="table rounded-table hidden md:table min-w-full divide-y divide-gray-200">
                                                <thead>
                                                    <tr>
                                                        <th>Date</th>
                                                        <th>Employment Type</th>
                                                        <th>Comment</th>
                                                        <th class="action">&nbsp;</th>
                                                    </tr>
                                                </thead>
                                                <tbody>


                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                    <div class="card shadow">

                                        <div class="card-body">

                                            <h3>Employment Type</h3>

                                            <a href="#" id="erp-empl-type" class="action btn" data-id=""
                                               data-template="erp-employment-type"
                                               data-title="Employment Type">Update Type</a>
                                            <hr />
                                            <table class="table rounded-table hidden md:table min-w-full divide-y divide-gray-200">
                                                <thead>
                                                    <tr>
                                                        <th>Date</th>
                                                        <th>Employment Type</th>
                                                        <th>Comment</th>
                                                        <th class="action">&nbsp;</th>
                                                    </tr>
                                                </thead>
                                                <tbody>


                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                    <div class="card shadow">

                                        <div class="card-body">

                                            <h3>Employment Type</h3>

                                            <a href="#" id="erp-empl-type" class="action btn" data-id=""
                                               data-template="erp-employment-type"
                                               data-title="Employment Type">Update Type</a>
                                            <hr />
                                            <table class="table rounded-table hidden md:table min-w-full divide-y divide-gray-200">
                                                <thead>
                                                    <tr>
                                                        <th>Date</th>
                                                        <th>Employment Type</th>
                                                        <th>Comment</th>
                                                        <th class="action">&nbsp;</th>
                                                    </tr>
                                                </thead>
                                                <tbody>


                                                </tbody>
                                            </table>

                                        </div>
                                    </div>

                                </div>
                                <div class="tab-pane " id="leave" role="tabpanel" aria-labelledby="leave-tab">
                                </div>

                                <div class="tab-pane" id="note" role="tabpanel" aria-labelledby="note-tab">


                                </div>
                                <div class="tab-pane " id="performance" role="tabpanel" aria-labelledby="performance-tab">
                                </div>
                                <div class="tab-pane" id="docs" role="tabpanel" aria-labelledby="docs-tab">
                                    <div class="card shadow">

                                        <div class="card-body">

                                            <h3>Documents</h3>


                                            <hr />
                                            <table class="table rounded-table hidden md:table min-w-full divide-y divide-gray-200">
                                                <thead>
                                                    <tr>
                                                        <th>Document Name</th>
                                                        <th class="action">&nbsp;</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="docTable">


                                                </tbody>
                                            </table>
                                            <a href="#" id="add_doc_record" class="btn btn-outline-primary add_doc_record" data-bs-id=""
                                               data-template="employ-doc"
                                               data-title="Add Document"><i class="fa fa-plus"></i> Add Record</a>

                                        </div>
                                    </div>

                                </div>
                                <div class="tab-pane" id="training" role="tabpanel" aria-labelledby="training-tab">

                                </div>
                                <div class="tab-pane fade shadow rounded bg-white p-5" id="payslip" role="tabpanel" aria-labelledby="payslip-tab">

                                </div>
                            </div>
                        </div>

                    </div>


                </div>




            </section>

        </div>
        <!-- // Basic Vertical form layout section end -->
    </div>
</div>
</div>
</div>
<%@include file="/_includes/modals.jsp"%>
<%@include file="/_includes/footer.jsp"%>

<script src="./assets/vendor/jquery/jquery.min.js" type="text/javascript"></script>
<script src="./assets/vendor/calender/lib/jquery-ui.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="./assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<script defer src="./assets/fontawesome/js/all.min.js" type="text/javascript"></script>
<script src="./assets/js/feather-icons/feather.min.js"></script>
<script src="./assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="./assets/js/main.js"></script>
<!--<script src="./assets/js/pages/position_cadre_loader.js"></script>-->
<script src="./assets/js/pages/form_.js"></script>
<!--<script src="./assets/js/pages/employees_view.js"></script>-->
<script src="./assets/js/staff_pages/profile.js"></script>
<%@include file="/_includes/include_footer.jsp"%>

<script type="text/javascript">
    $(document).ready(function () {
        var app = "/hrh";
  
        $(document).on('click', '.add_doc_record', function (e) {
            let creater = document.getElementById("StaffID").value;
            document.getElementById('created_by').value = creater;
            $('#simpleModalDoc form')[0].reset();
            $("#simpleModalDoc").modal('show');
        });


        $(document).on('click', '.edit_doc', function (e) {
            e.preventDefault();
            $('#simpleModalDoc form')[0].reset();
            var emp_no = $(this).data('empno');
            var docName = $(this).data('name');
            var doc_id = $(this).data('id');
            console.log("Employee_no: " + emp_no);
            OpenDocForm(emp_no, docName, doc_id);

        });
        $("#uploadForm").submit(function (e) {
            e.preventDefault(); // prevent actual form submit
            var form = $("#uploadForm");
//            var action = "uploadDoc";
//            var url_=
            // Create form data object to send file as multipart/form-data
            var formData = new FormData(form[0]);
//            formData.append("action", action); // add action parameter
            // Send AJAX request
            $.ajax({
                type: "POST",
                processData: false,
                contentType: false,
                cache: false,
//                enctype: 'multipart/form-data',
                url:app+ "/documentUploads",
                data: formData,

                beforeSend: function () {
                    console.log("Sending form data...");
                },
                success: function (data) {
                    // Close modal
                    $("#simpleModalDoc").modal("hide");
                    // Display success message
                    // Get the alert element
                    var alertElement = document.getElementById("alert");

                    // Set the message text
                    alertElement.innerHTML = " Your file was uploaded successfully!";
                    // Show the alert
                    alertElement.classList.remove("d-none");
                    alertElement.classList.add("show");
                    // Hide the alert after 5 seconds
                    setTimeout(function () {
                        alertElement.classList.remove("show");
                        alertElement.classList.add("d-none");
                    }, 5000);

                },
                error: function (xhr, status, error) {
                    // Handle error response
                    console.log(xhr.responseText + status + error);
                },
                complete: function () {
                    console.log("Form data sent.");
                }
            });
        });
   
     

        function OpenDocForm(emp_no, fileName, id) {
            $.ajax({
                url: "documentUploads?action=get_document",
                type: "GET",
                dataType: "json",
                data: {
                    empno: emp_no,
                    filename: fileName,
                    id: id
                },
                success: function (response) {
                    if (response.content) {
                        // Populate form fields
                        $("#emp_no").val(response.emp_no);
                        $("#ddlDocType").val(response.dtid);

                        var fileInput = $("#documentFile");
                        fileInput.val(""); // Reset the file input element
                        var fileType = getFileType(response.filename);
                        var file = base64toBlob(response.content, fileType);
                        var fileUrl = URL.createObjectURL(file);

                        var fileList = [new File([file], response.document_value)];

                        Object.defineProperty(fileList, "item", {
                            value: function (i) {
                                return this[i];
                            }
                        });

                        // Reset the value property of the file input element
                        fileInput[0].value = "";

                        // Reset the files property of the file input element
                        try {
                            Object.defineProperty(fileInput[0], "files", {
                                value: fileList
                            });
                        } catch (err) {
                            console.log(err);
                        }

                        fileInput.attr("data-file-url", fileUrl);

                        // Show the modal
                        $("#simpleModalDoc").modal("show");
                    } else {
                        alert("Unable to retrieve document data");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("AJAX error: " + textStatus + " " + errorThrown);
                }
            });
        }

        function base64toBlob(base64Data, contentType) {
            var sliceSize = 1024;
            var byteCharacters = atob(base64Data);
            var byteArrays = [];
            for (var offset = 0; offset < byteCharacters.length; offset += sliceSize) {
                var slice = byteCharacters.slice(offset, offset + sliceSize);
                var byteNumbers = new Array(slice.length);
                for (var i = 0; i < slice.length; i++) {
                    byteNumbers[i] = slice.charCodeAt(i);
                }
                var byteArray = new Uint8Array(byteNumbers);
                byteArrays.push(byteArray);
            }
            var blob = new Blob(byteArrays, {type: contentType});
            console.log(blob);
            return blob;
        }

        function getFileType(filename) {
            var lastDotIndex = filename.lastIndexOf(".");
            if (lastDotIndex === -1) {
                return null;  // no dot in filename
            }
            var extension = filename.substr(lastDotIndex + 1).toLowerCase();
            switch (extension) {
                case "pdf":
                    return "application/pdf";
                case "doc":
                case "docx":
                    return "application/msword";
                case "xls":
                case "xlsx":
                    return "application/vnd.ms-excel";
                case "ppt":
                case "pptx":
                    return "application/vnd.ms-powerpoint";
                case "jpg":
                case "jpeg":
                    return "image/jpeg";
                case "png" :
                    return "image/png";
                case "gif" :
                    return "image/gif";
                default:
                    return null;  // unrecognized file type
            }
        }
    });

</script>
</body>

</html>