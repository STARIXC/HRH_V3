<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Department</title>
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">

        <link rel="stylesheet" href="../assets/css/bootstrap.css">

        <link rel="stylesheet" href="../assets/vendor/DataTables/datatables.css">

        <script defer src="../assets/fontawesome/js/all.min.js"></script>
        <link rel="stylesheet"
              href="../assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <script src="../assets/vendor/jquery/jquery.min.js"></script>
        <script src="../assets/vendor/calender/lib/jquery-ui.min.js"></script>

        <style type="text/css">
            .notif:hover{
                background-color: rgba(0,0,0,0.1);
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
        <div class="page-title">
            <div class="row">
                <div class="col-12 col-md-6 order-md-1 order-last">
                    <h3>Manage Department</h3>
                </div>
                <div class="col-12 col-md-6 order-md-2 order-first">
                    <nav aria-label="breadcrumb" class='breadcrumb-header'>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp" class="text-success">Dashboard</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Manage Department</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <section class="section">
            <div class="card">
                <div class="card-body">
                    <table class='table' id="cadre_table">
                        <thead>
                            <tr role="row">
                                <th>SL</th>
                                <th>Department Name</th>
                                <th>Action</th>

                            </tr>
                        </thead>
                        <tbody id="carder_data_">
                            <c:forEach items="${listDepartments}" var="department">
                                <tr>
                                    <td><c:out value="${department.dept_id}" /></td>
                                    <td><c:out value="${department.dept_name}" /></td>

                                    <td><a class="btn btn-md btn-success"
                                           href="DepartmentController?action=edit&dept_id=<c:out value="${department.dept_id}"/>">Update</a>
                                        <a class="btn btn-md btn-danger"
                                           href="DepartmentController?action=delete&dept_id=<c:out value="${department.dept_id}"/>">Delete</a>
                                    </td>


                                </tr>


                            </c:forEach>






                        </tbody>
                    </table>
                </div>
            </div>

        </section>
    </div>
</div>
</div>
<script src="../assets/js/feather-icons/feather.min.js"></script>
<script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="../assets/js/app.js"></script>
<script src="../assets/vendor/DataTables/datatables.js"></script>
<script src="../assets/js/main.js"></script>
<script src="../assets/js/pages/department.js"></script>
<%@include file="/_includes/include_footer.jsp"%>
</body>

</html>