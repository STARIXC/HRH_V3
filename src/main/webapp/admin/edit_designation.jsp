<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Designation</title>
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <link rel="stylesheet" href="../assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="../assets/css/toggle.css">
        <link rel="stylesheet" href="../assets/vendor/DataTables/datatables.css">
        <script defer src="../assets/fontawesome/js/all.min.js"></script>
        <link rel="stylesheet" href="../assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <script src="../assets/vendor/jquery/jquery.min.js"></script>
        <script src="../assets/vendor/calender/lib/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
        <style type="text/css">
            .notif:hover {
                background-color: rgba(0, 0, 0, 0.1);
            }
        </style>
        <script src="../assets/vendor/jquery/jquery.min.js"></script>
    </head>
    <body>

        <%@include file="/_includes/header.jsp"%>

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
        <div class="row mb-2">
            <div class="col-md-8 order-md-1 order-last">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp" class="text-success"><i class="fa fa-home"></i> Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Add Designation/Position</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-4 order-md-2 order-first">
                <a href="manage_designation.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light">
                    <i class="fa fa-list-ul" aria-hidden="true"></i> View Designation/Position</a>

            </div>
        </div>


        <!-- Basic Vertical form layout section start -->
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header bg-success text-white"><i class="mdi mdi-clipboard-text fa-fw"></i>
                        Add Designation/Position
                    </div>
                    <div class="card-body">
                        <form method="POST"  class="form-horizontal" id="designForm_" enctype="multipart/form-data">

                            <div class="form-body">

                                <div class="form-group">
                                    <label for="inputcadrecat">Cadre Category</label>
                                    <select name="inputcadrecat" id="inputcadrecat" class="form-control">
                                        <option selected>Choose...</option>
                                    </select>
                                </div>
                                <!--                                            <div class="form-group">
                                                                                <label for="inputcadrecat">Cadre Type</label> <select
                                                                                    id="inputcadrecattype"  name="inputcadrecattype" class="form-control">
                                                                                    <option selected>Choose...</option>
                                                                                </select>
                                                                            </div>-->
                                <div class="form-group">
                                    <label for="inputStandCadre">Standardized Cadre</label> <select
                                        id="inputStandCadre" name="inputStandCadre" class="form-control">
                                        <option selected>Choose...</option>
                                        <option>...</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="inputPosition">Position</label> <input
                                        type="text" class="form-control" id="inputPosition" name="inputPosition"
                                        placeholder="Designation">
                                </div>
                                <div class="form-group">
                                    <label for="inputBasic">Basic Pay</label> <input
                                        type="text" class="form-control" id="inputBasic" name="inputBasic"
                                        placeholder="Designation">
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
        <!-- // Basic Vertical form layout section end -->
    </div>


</div>
</div>


<script src="../assets/vendor/DataTables/datatables.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/feather-icons/feather.min.js"></script>
<script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="../assets/js/app.js"></script>
<script src="../assets/js/pages/postion_create.js"></script>
<script src="../assets/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<%@include file="/_includes/include_footer.jsp"%>
</body>
</html>
