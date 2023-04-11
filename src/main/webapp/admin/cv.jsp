<%-- 
    Document   : cv
    Created on : May 8, 2022, 12:59:55 PM
    Author     : CBWAHYI
--%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Employee</title>

        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <link rel="stylesheet" href="../assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="../assets/css/toggle.css">
        <link rel="stylesheet" href="../assets/vendor/DataTables/datatables.css">

        <script defer src="../assets/fontawesome/js/all.min.js"></script>
        <link rel="stylesheet"
              href="../assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <script src="../assets/vendor/jquery/jquery.min.js"></script>
        <script src="../assets/vendor/calender/lib/jquery-ui.min.js"></script>
        <style type="text/css">
            .notif:hover {
                background-color: rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>

    <body>
        <div id="app">
            <div id="sidebar" class='active'>
                <div class="sidebar-wrapper active">
                    <div class="sidebar-header" style="height: 50px; margin-top: -30px">
                        <i class="fa fa-users text-success me-4"></i> <span>HRH</span>
                    </div>
                    <div class="sidebar-menu">
                        <ul class="menu">
                            <li class="sidebar-item active "><a href="index.jsp"
                                                                class='sidebar-link'> <i class="fa fa-home text-success"></i>
                                    <span>Dashboard</span>
                                </a></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-building text-success"></i>
                                    <span>Department</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="add_department.jsp">Add Department</a></li>
                                    <li><a href="./PositionTypeController/new">Manage Department</a></li>
                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-table text-success"></i>
                                    <span>Designation</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="add_designation.jsp">Add Designation</a></li>
                                    <li><a href="manage_designation.jsp">Manage Designation</a>
                                    </li>
                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-users text-success"></i>
                                    <span>Employees</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="add_employee.jsp">Add Employee</a></li>
                                    <li><a href="manage_employee.jsp">Manage Employee</a></li>
                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-table text-success"></i>
                                    <span>Leave Type</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="add_leave_type.jsp">Add Leave Type</a></li>
                                    <li><a href="manage_leave_type.jsp">Manage Leave Type</a></li>
                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-table text-success"></i>
                                    <span>Leave Management</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="all_leave.jsp">All Leaves</a></li>
                                    <li><a href="pending_leave.jsp">Pending Leaves</a></li>
                                    <li><a href="approve_leave.jsp">Approve Leaves</a></li>
                                    <li><a href="not_approve_leave.jsp">Not Approve Leaves</a>
                                    </li>
                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="javascript:void(0)" class='sidebar-link'>
                                    <i class="fa fa-user text-success"></i> <span>Attendance</span></i>
                                    </span>
                                </a>

                                <ul class="submenu" style="display: block;">
                                    <li class=""><a
                                            href="monthly_manual_attendance.jsp">Monthly
                                            Attendance</a></li>

                                    <li class=""><a
                                            href="missing_attendance">Missing
                                            Attendance</a></li>


                                    <!-- single level menu/link -->
                                    <li class=""><a
                                            href="att_log_report">Attendance
                                            Log</a></li>

                                </ul></li>
                            <li class="sidebar-item  has-sub"><a href="#"
                                                                 class='sidebar-link'> <i class="fa fa-user text-success"></i>
                                    <span>Users</span>
                                </a>
                                <ul class="submenu ">
                                    <li><a href="add_user.jsp">Add User</a></li>
                                    <li><a href="manage_user.jsp">Manage Users</a></li>
                                </ul></li>
                            <li class="sidebar-item "><a href="reports.jsp"
                                                         class='sidebar-link'> <i class="fa fa-chart-bar text-success"></i>
                                    <span>Reports</span>
                                </a></li>
                        </ul>
                    </div>
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
                    <div class="page-title">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Manage Employee</h3>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.jsp"
                                                                       class="text-success">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Manage
                                            Employee</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-4 employee-cv">

                            <div class="card-header resume">

                                <div><img src="https://newhrm.bdtask.com/hrm_v4.4_demo/./application/modules/employee/../assets/images/2021-07-03/fm1.jpg" width="100px;" height="100px;" class="img-circle"></div>

                            </div>
                            <div class="card-content">
                                <div class="card-content-member">
                                    <h4 class="m-t-0">lorem  ipsom<span class="preformancerating"> <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star-o"></span>

                                        </span></h4>
                                    <h5>Department: Demo Department</h5>
                                    <p class="m-0"><i class="fa fa-mobile" aria-hidden="true"></i>
                                        0864515651</p>
                                </div>
                                <div class="card-content-languages">
                                    <div class="card-content-languages-group"></div>
                                    <div class="card-content-languages-group">
                                        <table class="table table-hover" width="100%">
                                            <caption class="resumecaption">Personal Information</caption>
                                            <tbody><tr>
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
                                            </tbody></table>

                                    </div>
                                    <div class="card-content-languages-group">
                                        <table class="table table-hover" width="100%">
                                            <caption class="resumecaption">Bio-Graphical Information</caption>
                                            <tbody><tr>
                                                    <th>Date of Birth</th>
                                                    <td>1993-03-18</td>
                                                </tr>
                                                <tr>
                                                    <th>Gender</th>
                                                    <td>Male</td>
                                                </tr>
                                                <tr>
                                                    <th>Marital Status</th>
                                                    <td>Married</td>
                                                </tr>
                                                <tr>

                                                    <th>Ethnic Group </th>
                                                    <td></td>
                                                </tr>
                                                <tr>

                                                    <th>EEO Class</th>
                                                    <td></td>
                                                </tr>
                                                <tr>

                                                    <th>SSN</th>
                                                    <td>346</td>
                                                </tr>
                                                <tr>

                                                    <th>Work in State</th>
                                                    <td>Yes</td>
                                                </tr>
                                                <tr>

                                                    <th>Live in State</th>
                                                    <td>Yes</td>
                                                </tr>
                                            </tbody></table>

                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="card-footer-stats">
                                        <div>
                                            <p></p><span class="stats-small"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-8 employee-cv-info">
                            <div class="row">
                                <div class="col-sm-12 col-md-12 rating-block">

                                    <table class="table table-hover" width="100%">


                                        <caption class="resumecaption">Positional Information</caption>
                                        <tbody><tr>
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
                                        </tbody></table>      

                                </div>  

                                <div class="col-sm-12 col-md-12 rating-block">

                                    <table class="table table-hover" width="100%">


                                        <caption class="resumecaption">Benefits</caption>
                                        <tbody><tr>
                                                <th>Benefit Class code</th>
                                                <td>456461</td>
                                            </tr>
                                            <tr>
                                                <th>Benefit Description</th>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <th>Benefit Accrual Date</th>
                                                <td>2020-05-01</td>
                                            </tr>

                                        </tbody></table>      

                                </div> 
                                <div class="col-sm-12 col-md-12 rating-block">

                                    <table class="table table-hover" width="100%">


                                        <caption class="resumecaption">Emergency Contact</caption>
                                        <tbody><tr>
                                                <th>Emergency Contact</th>
                                                <td>456132468665</td>
                                            </tr>
                                            <tr>
                                                <th>Emergency Home Phone</th>
                                                <td>4561346531</td>
                                            </tr>

                                            <tr>
                                                <th>Emergency Work Phone</th>
                                                <td>46531453114</td>
                                            </tr>
                                        </tbody></table>      

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
    <script src="../assets/js/bootstrap-toggle.min.js"></script>
    <script src="../assets/js/app.js"></script>

    <script src="../assets/vendor/DataTables/datatables.js"></script>
    <!-- <script src="../assets/js/vendors.js"></script>  -->

    <script src="../assets/js/main.js"></script>
    <script src="../assets/js/pages/employees.js"></script>


</body>

</html>
