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
        <link href="../assets/vendor/swal2/sweetalert2.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="../assets/vendor/calender/lib/jquery-ui.min.css" />
        <link rel="stylesheet" href="../assets/vendor/calender/lib/bootstrap-datepicker.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="../assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="../assets/css/style.css">

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

        <%@include file="/_includes/header.jsp"%>
        <!-- END SIDEBAR MENU -->
        <button class="sidebar-toggler btn x">
            <i data-feather="x"></i>
        </button>
    </div>
</div>
<div id="main">
  
    <nav class="navbar navbar-header navbar-expand navbar-light">
        <a class="sidebar-toggler" href="#"><span
                class="navbar-toggler-icon"></span></a>
        <button class="btn navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul
                class="navbar-nav d-flex align-items-center navbar-light ms-auto">
                <li class="dropdown nav-icon"><a href="#"
                                                 data-bs-toggle="dropdown"
                                                 class="nav-link  dropdown-toggle nav-link-lg nav-link-user">
                        <div class="d-lg-inline-block">
                            <i data-feather="bell"></i><span class="badge bg-info">2</span>
                        </div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end dropdown-menu-large">
                        <h6 class='py-2 px-4'>Notifications</h6>
                        <ul class="list-group rounded-none">
                            <li class="list-group-item border-0 align-items-start">
                                <div class="row mb-2">
                                    <div class="col-md-12 notif">
                                        <a href="leave_details.jsp"><h6 class='text-bold'>John
                                                Doe</h6>
                                            <p class='text-xs'>applied for leave at 05-21-2021</p></a>
                                    </div>
                                    <div class="col-md-12 notif">
                                        <a href="leave_details.jsp"><h6 class='text-bold'>Jane
                                                Doe</h6>
                                            <p class='text-xs'>applied for leave at 05-21-2021</p></a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div></li>
                <li class="dropdown"><a href="#" data-bs-toggle="dropdown"
                                        class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                        <div class="avatar me-1">
                            <img src="../assets/images/admin.png" alt="" srcset="">
                        </div>
                        <div class="d-none d-md-block d-lg-inline-block">Hi, Admin</div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end">
                        <a class="dropdown-item" href="#"><i data-feather="user"></i>
                            Account</a> <a class="dropdown-item" href="#"><i
                                data-feather="settings"></i> Settings</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="login.jsp"><i
                                data-feather="log-out"></i> Logout</a>
                    </div></li>
            </ul>
        </div>
    </nav>


    <div class="main-content container-fluid">

        <section class="section profile">
            <input type="hidden" class="form-control"  id="employee_id" value="<%=user_id%>">
            <div class="row">
                <div class="col-xl-2">


                    <div class="card sidemenu">
                        <div class="card-body">
                            <div class="profile-card pt-4 d-flex flex-column align-items-center">

                                <img src="../assets/img/user_image.png" alt="Profile" class="rounded-circle emp_image" id="emp_image">
                                <h5 class="name">Kevin Anderson</h5>
                                <h6 class="designation text-center">Web Designer</h6>
                                <div class="social-links mt-2">
                                    <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                                    <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                                    <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                                    <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                                </div>
                            </div>
                            <!-- Tabs nav -->
                            <div class="nav flex-column nav-pills nav-pills-custom" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                <a class="nav-link mb-3 p-3 shadow active" id="v-pills-basic-tab" data-bs-toggle="pill" href="#v-pills-basic" role="tab" aria-controls="v-pills-estatus" aria-selected="true">
                                    <i class="fa fa-user-circle mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">Basic Information</span></a>

                                <a class="nav-link mb-3 p-3 shadow" id="v-pills-contacts-tab" data-bs-toggle="pill" href="#v-pills-contacts" role="tab" aria-controls="v-pills-equalification" aria-selected="false">
                                    <i class="fa fa-calendar-minus mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">Contacts</span></a>

                                <a class="nav-link mb-3 p-3 shadow" id="v-pills-ehistory-tab" data-bs-toggle="pill" href="#v-pills-ehistory" role="tab" aria-controls="v-pills-ehistory" aria-selected="false">
                                    <i class="fa fa-star mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">Employment</span></a>
                                <a class="nav-link mb-3 p-3 shadow" id="v-pills-login-tab" data-bs-toggle="pill" href="#v-pills-login" role="tab" aria-controls="v-pills-login     " aria-selected="false">
                                    <i class="fa fa-star mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">User Login</span></a>
                                <a class="nav-link mb-3 p-3 shadow" id="v-pills-qualification-tab" data-bs-toggle="pill" href="#v-pills-qualification" role="tab" aria-controls="v-pills-qualification" aria-selected="false">
                                    <i class="fa fa-star mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">Qualification</span></a>
                                <a class="nav-link mb-3 p-3 shadow" id="v-pills-docs-tab" data-bs-toggle="pill" href="#v-pills-docs" role="tab" aria-controls="v-pills-docs" aria-selected="false">
                                    <i class="fa fa-star mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">Documents</span></a>
                                <a class="nav-link mb-3 p-3 shadow" id="v-pills-statutory-tab" data-bs-toggle="pill" href="#v-statutory-docs" role="tab" aria-controls="v-pills-docs" aria-selected="false">
                                    <i class="fa fa-star mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">Statutory Info</span></a>
                                <a class="nav-link mb-3 p-3 shadow" id="v-pills-accounts-tab" data-bs-toggle="pill" href="#v-statutory-accounts" role="tab" aria-controls="v-pills-docs" aria-selected="false">
                                    <i class="fa fa-star mr-2"></i>
                                    <span class="font-weight-bold small text-uppercase">Accounts</span></a>


                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-xl-10">
                    <div class="tab-content" id="v-pills-tabContent">

                        <div class="tab-pane  show active p-1" id="v-pills-basic" role="tabpanel" aria-labelledby="v-pills-basic-tab">
                            <div class="row">
                                <div class="col-lg-12 col-md-12  col-4 col-sm-12 col-xs-12 mt-2">
                                    <nav aria-label="breadcrumb" class='breadcrumb-header'>
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="index.jsp" class="text-info"><i class="fa fa-home"></i> Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"><a href="manage_employee.jsp" class="text-info">Employee</a></li>
                                            <li class="name breadcrumb-item active" aria-current="page"><a href="index.jsp" class="text-info">Name</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Basic</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <div class="row mb-2">

                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ">
                                    <h3>Basic</h3>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                    <a href="manage_employee.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"><i class="fa fa-list-ul" aria-hidden="true"></i> Edit Employee</a>
                                </div>
                            </div>

                            <div class="card shadow">
                                <div class="card-body">

                                    <dl class="row row-cols-3 g-5 g-lg-3">
                                        <div class="col">
                                            <dt class="font-medium text-sm text-gray-500">Employee Code</dt>
                                            <dd class="mt-1 text-sm text-gray-900 ecode">ESM002</dd>
                                        </div>
                                        <div class="col">
                                            <dt class="font-medium text-sm text-gray-500">Date of Joining</dt>
                                            <dd class="mt-1 text-sm text-gray-900 date-joining">ESM002</dd>
                                        </div>
                                        <div class="col">
                                            <dt class="font-medium text-sm text-gray-500">Employee Type</dt>
                                            <dd class="mt-1 text-sm text-gray-900 etype">ESM002</dd>
                                        </div>
                                        <div class="col">
                                            <dt class="font-medium text-sm text-gray-500">Designation</dt>
                                            <dd class="mt-1 text-sm text-gray-900 designation">ESM002</dd>
                                        </div>
                                        <div class="col">
                                            <dt class="font-medium text-sm text-gray-500">Facility</dt>
                                            <dd class="mt-1 text-sm text-gray-900 facility">ESM002</dd>
                                        </div>
                                        <div class="col">
                                            <dt class="font-medium text-sm text-gray-500">Date of Birth</dt>
                                            <dd class="mt-1 text-sm text-gray-900 dob">ESM002</dd>
                                        </div>
                                        <div class="col">
                                            <dt class="font-medium text-sm text-gray-500">Gender</dt>
                                            <dd class="mt-1 text-sm text-gray-900 gender">ESM002</dd>
                                        </div>
                                        <div class="col">
                                            <dt class="font-medium text-sm text-gray-500">KRA PIN</dt>
                                            <dd class="mt-1 text-sm text-gray-900 kra">ESM002</dd>
                                        </div>
                                        <div class="col">
                                            <dt class="font-medium text-sm text-gray-500">NHIF No</dt>
                                            <dd class="mt-1 text-sm text-gray-900 nhif">ESM002</dd>
                                        </div>
                                        <div class="col">
                                            <dt class="font-medium text-sm text-gray-500">NSSF ID</dt>
                                            <dd class="mt-1 text-sm text-gray-900 nssf">ESM002</dd>
                                        </div>
                                        <div class="col">
                                            <dt class="font-medium text-sm text-gray-500">Nationality</dt>
                                            <dd class="mt-1 text-sm text-gray-900 nationality">ESM002</dd>
                                        </div>

                                    </dl>

                                </div>
                            </div>

                        </div>
                        <div class="tab-pane " id="v-pills-contacts" role="tabpanel" aria-labelledby="v-pills-contacts-tab">
                            <div class="row">
                                <div class="col-lg-12 col-md-12  col-4 col-sm-12 col-xs-12 mt-2">
                                    <nav aria-label="breadcrumb" class='breadcrumb-header'>
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="index.jsp" class="text-info"><i class="fa fa-home"></i> Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"><a href="manage_employee.jsp" class="text-info">Employee</a></li>
                                            <li class="name breadcrumb-item active" aria-current="page"><a href="index.jsp" class="text-info">Name</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Contact</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <div class="row mb-2">

                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ">
                                    <h3>Contact</h3>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                    <a href="manage_employee.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"><i class="fa fa-list-ul" aria-hidden="true"></i> Edit Employee</a>
                                </div>
                            </div>

                            <div class="card shadow">
                                <div class="card-body">
                                    <dl class="row row-cols-2 gap-5 gap-lg-5">
                                        <div class="col">
                                            <dt class="font-medium text-sm text-gray-500 ">Contact Number</dt>
                                            <dd class="mt-1 text-sm text-gray-900 phone">ESM002</dd>
                                        </div>
                                        <div class="col">
                                            <dt class="font-medium text-sm text-gray-500">Alternate Contact Number</dt>
                                            <dd class="mt-1 text-sm text-gray-900 alt_phone">ESM002</dd>
                                        </div>
                                        <div class="col">
                                            <dt class="font-medium text-sm text-gray-500">Email</dt>
                                            <dd class="mt-1 text-sm text-gray-900 email">ESM002</dd>
                                        </div>
                                        <div class="col">
                                            <dt class="font-medium text-sm text-gray-500">Alternate Email</dt>
                                            <dd class="mt-1 text-sm text-gray-900 alt_email">ESM002</dd>
                                        </div>
                                        <div class="col">
                                            <dt class="font-medium text-sm text-gray-500">Present Address</dt>
                                            <dd class="mt-1 text-sm text-gray-900 present_add">ESM002</dd>

                                            <dt class="font-medium text-sm text-gray-500">Permanent Address</dt>
                                            <dd class="mt-1 text-sm text-gray-900 permanent_add">ESM002</dd>
                                        </div>



                                    </dl>

                                </div>
                            </div>

                        </div>
                        <div class="tab-pane " id="v-pills-ehistory" role="tabpanel" aria-labelledby="v-pills-ehistory-tab">
                            <div class="row">
                                <div class="col-lg-12 col-md-12  col-4 col-sm-12 col-xs-12 mt-2">
                                    <nav aria-label="breadcrumb" class='breadcrumb-header'>
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="index.jsp" class="text-info"><i class="fa fa-home"></i> Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"><a href="index.jsp" class="text-info">Employee</a></li>
                                            <li class="name breadcrumb-item active" aria-current="page"><a href="index.jsp" class="text-info">Name</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Employment</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <div class="row mb-2">

                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ">
                                    <h3>Employment</h3>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                    <a href="manage_employee.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"><i class="fa fa-list-ul" aria-hidden="true"></i> Edit Employee</a>
                                </div>
                            </div>

                            <div class="card shadow">
                                <div class="card-body">
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

                        </div>
                        <div class="tab-pane" id="v-pills-login" role="tabpanel" aria-labelledby="v-pills-login-tab">

                            <div class="row">
                                <div class="col-lg-12 col-md-12  col-4 col-sm-12 col-xs-12 mt-2">
                                    <nav aria-label="breadcrumb" class='breadcrumb-header'>
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="index.jsp" class="text-info"><i class="fa fa-home"></i> Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"><a href="index.jsp" class="text-info">Employee</a></li>
                                            <li class="name breadcrumb-item active" aria-current="page"><a href="index.jsp" class="text-info">Name</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"><span 
                                                    class="text-sm font-medium text-gray-400">User Login</span></li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <div class="row mb-2">

                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ">
                                    <h3 class="text-xl font-bold leading-7 text-sm-2xl ">User Login</h3>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                    <a href="manage_employee.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"><i class="fa fa-list-ul" aria-hidden="true"></i> Edit
                                        User Login</a>
                                </div>
                            </div>

                            <div class="card shadow">
                                <div class="card-body">
                                    <dl class="row row-cols-2 gx-4 gy-8 ">
                                        <div class="col-6">
                                            <dt class="font-medium text-sm text-gray-500 ">Email</dt>
                                            <dd class="mt-1 text-sm text-gray-900 lemail ">ceo@ceo.com</dd>
                                        </div>
                                        <div class="col-6">
                                            <dt class="font-medium text-sm text-gray-500 ">Username</dt>
                                            <dd class="mt-1 text-sm text-gray-900 username">ceo</dd>
                                        </div>
                                        <div class="col-6">
                                            <dt class="font-medium text-sm text-gray-500 ">Password</dt>
                                            <dd class="mt-1 text-sm text-gray-900 "> xxxxxxxxx </dd>
                                        </div>
                                        <div class="col-6">
                                            <dt class="font-medium text-sm text-gray-500 ">Role</dt>
                                            <dd class="mt-1 text-sm text-gray-900 ">
                                                <div class="space-x-1">
                                                    <span
                                                        class="inline-flex items-center font-medium  text-xs leading-4 rounded-md btn btn-md bg-primary  text-white role "
                                                        style=""> Admin</span>
                                                </div>
                                            </dd>
                                        </div>
                                    </dl>
                                </div>
                            </div>

                        </div>

                        <div class="tab-pane" id="v-pills-docs" role="tabpanel" aria-labelledby="v-pills-docs-tab">
                            <div class="row">
                                <div class="col-lg-12 col-md-12  col-4 col-sm-12 col-xs-12 mt-2">
                                    <nav aria-label="breadcrumb" class='breadcrumb-header'>
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="index.jsp" class="text-info"><i class="fa fa-home"></i> Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"><a href="manage_employee.jsp" class="text-info">Employee</a></li>
                                            <li class="name breadcrumb-item active" aria-current="page"><a href="index.jsp" class="text-info">Name</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Basic</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <input type="hidden" class="form-control"  id="employee_id" value="<%=user_id%>">
                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ">
                                    <h3>Basic</h3>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                    <a href="manage_employee.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"><i class="fa fa-list-ul" aria-hidden="true"></i> Edit Employee</a>
                                </div>
                            </div>

                            <div class="card shadow">
                                <div class="card-body"></div>
                            </div>

                        </div>
                        <div class="tab-pane" id="v-pills-createdocs" role="tabpanel" aria-labelledby="v-pills-createdocs-tab">
                            <div class="row">
                                <div class="col-lg-12 col-md-12  col-4 col-sm-12 col-xs-12 mt-2">
                                    <nav aria-label="breadcrumb" class='breadcrumb-header'>
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="index.jsp" class="text-info"><i class="fa fa-home"></i> Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"><a href="manage_employee.jsp" class="text-info">Employee</a></li>
                                            <li class="name breadcrumb-item active" aria-current="page"><a href="index.jsp" class="text-info">Name</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Documents</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <input type="hidden" class="form-control"  id="employee_id" value="<%=user_id%>">
                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ">
                                    <h3>Basic</h3>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                    <a href="manage_employee.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"><i class="fa fa-list-ul" aria-hidden="true"></i> Edit Employee</a>
                                </div>
                            </div>

                            <div class="card shadow">
                                <div class="card-body"></div>
                            </div>

                        </div>
                        <div class="tab-pane fade shadow rounded bg-white p-5" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                            <div class="row">
                                <div class="col-lg-12 col-md-12  col-4 col-sm-12 col-xs-12 mt-2">
                                    <nav aria-label="breadcrumb" class='breadcrumb-header'>
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="index.jsp" class="text-info"><i class="fa fa-home"></i> Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"><a href="manage_employee.jsp" class="text-info">Employee</a></li>
                                            <li class="name breadcrumb-item active" aria-current="page"><a href="index.jsp" class="text-info">Name</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Basic</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <input type="hidden" class="form-control"  id="employee_id" value="<%=user_id%>">
                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 ">
                                    <h3>Basic</h3>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                    <a href="manage_employee.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"><i class="fa fa-list-ul" aria-hidden="true"></i> Edit Employee</a>
                                </div>
                            </div>

                            <div class="card shadow">
                                <div class="card-body"></div>
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
<%@include file="/_includes/footer.jsp"%>

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
<script src="../assets/js/pages/employees_view.js"></script>
<%@include file="/_includes/include_footer.jsp"%>

</body>

</html>