<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Leave</title>
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
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

        <%@include file="/_includes/header.jsp"%>
        <!-- END SIDEBAR MENU -->
        <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
    </div>
</div>
<div id="main">
    <nav class="navbar navbar-header navbar-expand navbar-light">
        <a class="sidebar-toggler" href="#"><span class="navbar-toggler-icon"></span></a>
        <button class="btn navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav d-flex align-items-center navbar-light ms-auto">
                <li class="dropdown nav-icon">
                    <a href="#" data-bs-toggle="dropdown"
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
                                        <a href="leave_details.jsp"><h6 class='text-bold'>John Doe</h6>
                                            <p class='text-xs'>
                                                applied for leave at 05-21-2021
                                            </p></a>
                                    </div>
                                    <div class="col-md-12 notif">
                                        <a href="leave_details.jsp"><h6 class='text-bold'>Jane Doe</h6>
                                            <p class='text-xs'>
                                                applied for leave at 05-21-2021
                                            </p></a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="dropdown">
                    <a href="#" data-bs-toggle="dropdown"
                       class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                        <div class="avatar me-1">
                            <img src="../assets/images/admin.png" alt="" srcset="">
                        </div>
                        <div class="d-none d-md-block d-lg-inline-block">Hi, Admin</div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end">
                        <a class="dropdown-item" href="#"><i data-feather="user"></i> Account</a>
                        <a class="dropdown-item" href="#"><i data-feather="settings"></i> Settings</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="login.jsp"><i data-feather="log-out"></i> Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <div class="main-content container-fluid">
        <div class="row mb-2">
            <div class="col-md-8 order-md-1 order-last">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp" class="text-success"><i class="fa fa-home"></i> Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Requested Application</li>
                    </ol>
                </nav>
            </div>

        </div>


        <!-- Basic Vertical form layout section start -->
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header bg-success text-white">
                        <i class="fa fa-th fa-fw"></i> 
                        Requested Application
                    </div>
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
<script src="../assets/js/feather-icons/feather.min.js"></script>
<script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="../assets/js/bootstrap-toggle.min.js"></script>
<script src="../assets/js/app.js"></script>
<script src="../assets/vendor/DataTables/datatables.js"></script>
<script src="../assets/js/vendors.js"></script> 
<!--<script src="../assets/js/custom_.js"></script>-->  
<script src="../assets/js/main.js"></script>
<script src="../assets/js/pages/all_leave.js"></script>
<%@include file="/_includes/include_footer.jsp"%>
</body>

</html>