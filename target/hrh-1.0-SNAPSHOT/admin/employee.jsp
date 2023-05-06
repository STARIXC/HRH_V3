<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Leave Management System</title>
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <script defer src="../assets/fontawesome/js/all.min.js"></script>
        <link rel="stylesheet" href="../assets/vendors/chartjs/Chart.min.css">
        <link rel="stylesheet" href="../assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <link rel="shortcut icon" href="../assets/images/favicon.svg" type="image/x-icon">
    </head>
    <body>

        <%@include file="/_includes/header.jsp"%>
        <!-- END SIDEBAR MENU -->
        <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
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


        <div class="page-title m-2">
            <div class="row justify-content-between align-items-center">
                <div class="col-xl-3 col-lg-3 col-md-12 d-flex align-items-center justify-content-between justify-content-md-start mb-3 mb-md-0">
                    <div class="d-inline-block">
                        <h5 class="h4 d-inline-block font-weight-400 mb-0 ">    Employee
                        </h5>
                    </div>
                </div>
                <!--                                <div class="col-xl-9 col-lg-9 col-md-12 d-flex ">
                                                    <div class="row d-flex justify-content-end">
                                                        <div class="col-xl-2 col-lg-2 col-md-4 col-sm-6 col-6">
                                                            <a href="/edit" class="btn btn-sm btn-info btn-icon-only width-auto">
                                                                <i class="fa fa-edit"></i> Edit
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>-->
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 ">
                <div class="employee-detail-wrap">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="mb-0">Personal Information</h6>
                        </div>
                        <div class="card-body table-responsive">
                            <table class="table table-hover" width="100%">

                            <tr>
                                <th>Name</th>
                                <td>lorem ipsom</td>
                            </tr>
                            <tr>
                                <th>Phone</th>
                                <td>0864515651</td>
                            </tr>
                            <tr>
                                <th>Email Address</th>
                                <td>lorem@email.com</td>
                            </tr>
                            <tr>
                                <th>Country</th>
                                <td>Australia</td>
                            </tr>
                            <tr>
                                <th>City</th>
                                <td>sydny</td>
                            </tr>
                            <tr>
                                <th>Zip Code</th>
                                <td>2456</td>
                            </tr>
                        </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6 ">
                <div class="employee-detail-wrap">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="mb-0">Positional Information</h6>
                        </div>
                        <div class="card-body employee-detail-body">

                            <table class="table table-hover" width="100%">

                                <tr>
                                    <th>Division</th>
                                    <td>New Division</td>
                                </tr>
                                <tr>
                                    <th>Position</th>
                                    <td>Engineer </td>
                                </tr>
                                <tr>
                                    <th>Duty Type</th>
                                    <td>Full Time</td>
                                </tr>

                                <tr>
                                    <th>Hire Date</th>
                                    <td>2020-03-10</td>
                                </tr>
                                <tr>
                                    <th>Original Hire Date</th>
                                    <td>2020-04-01</td>
                                </tr>
                                <tr>
                                    <th>Rate Type</th>
                                    <td>Salary</td>
                                </tr>
                                <tr>
                                    <th>Rate</th>
                                    <td>70000</td>
                                </tr>
                                <tr>
                                    <th>Pay Frequency</th>
                                    <td>Monthly</td>
                                </tr>
                                <tr>
                                    <th>Home Department</th>
                                    <td></td>
                                </tr>


                                <tr>
                                    <th>Supervisor Name</th>
                                    <td>Self</td>
                                </tr>
                                <tr>
                                    <th>Is Supervisor</th>
                                    <td>No</td>
                                </tr>
                            </table>  
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 ">
                <div class="employee-detail-wrap">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="mb-0">Document Detail</h6>
                        </div>
                        <div class="card-body employee-detail-body">

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 ">
                <div class="employee-detail-wrap">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="mb-0">Bank Account Detail</h6>
                        </div>
                        <div class="card-body employee-detail-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="info text-sm">
                                        <strong>Account Holder Name</strong>
                                        <span>Ida F. Mullen</span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="info text-sm font-style">
                                        <strong>Account Number</strong>
                                        <span>7845269652656</span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="info text-sm font-style">
                                        <strong>Bank Name</strong>
                                        <span>US BANK, NA</span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="info text-sm">
                                        <strong>Bank Identifier Code</strong>
                                        <span>123456</span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="info text-sm">
                                        <strong>Branch Location</strong>
                                        <span>Jefferson City</span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="info text-sm">
                                        <strong>Tax Payer Id</strong>
                                        <span>12345</span>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>




    </div>
</div>
</div>
<script src="../assets/js/feather-icons/feather.min.js"></script>
<script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="../assets/js/app.js"></script>
<script src="../assets/vendors/chartjs/Chart.min.js"></script>
<script src="../assets/vendors/apexcharts/apexcharts.min.js"></script>
<script src="../assets/js/pages/dashboard.js"></script>
<script src="../assets/js/main.js"></script>
<%@include file="/_includes/include_footer.jsp"%>
</body>
</html>