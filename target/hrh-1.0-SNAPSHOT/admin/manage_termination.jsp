<%-- 
    Document   : edit_termination
    Created on : May 18, 2022, 10:36:43 AM
    Author     : CBWAHYI
--%>
<!DOCTYPE html>

<html lang="en">
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Terminations</title>
        <link rel="stylesheet" href="../assets/css/custom.css">
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <link rel="stylesheet" href="../assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="../assets/css/toggle.css">
        <link rel="stylesheet" href="../assets/vendor/DataTables/datatables.css">
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
            #spinner-div {
                position: fixed;
                display: none;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                text-align: center;
                background-color: rgba(255, 255, 255, 0.8);
                z-index: 2;
            }
            .fade:not(.show) {
                opacity: 1 !important;
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
                    <button class="btn navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
                                    <li class="breadcrumb-item active" aria-current="page">Manage Terminations</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="col-md-4 order-md-2 order-first">
                            <a href="add_termination.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light">
                                <i class="fa fa-plus" aria-hidden="true"></i> Add Termination</a>

                        </div>
                    </div>


                    <!-- Basic Vertical form layout section start -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header bg-success text-white">
                                    <i class="mdi mdi-table fa-fw"></i> 
                                    Termination List
                                </div>
                                <div class="card-body pt-3">
                                    <div class="table-responsive">
                                        <table id="myTable" class="table mt-3 table table-striped table-bordered table-hover">
                                            <thead>
                                                <tr class="tr_header">
                                                    <th>S/L</th>
                                                    <th>Employee Name</th>
                                                    <th>Termination Type</th>
                                                    <th>Notice Date</th>
                                                    <th>Termination Date</th>
                                                    <!--                                                    <th>Status</th>-->
                                                    <th style="text-align: center;">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="termination_data">


                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- // Basic Vertical form layout section end -->
                </div>
            </div>
        </div>
        <%@include file="/_includes/footer.jsp"%>

        <script src="../assets/vendor/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../assets/vendor/calender/lib/jquery-ui.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
        <script src="../assets/vendor/DataTables/datatables.js"></script>
        <script defer src="../assets/fontawesome/js/all.min.js" type="text/javascript"></script>
        <script src="../assets/js/feather-icons/feather.min.js"></script>
        <script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script src="../assets/js/main.js"></script>
        <script src="../assets/js/pages/termination.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {


                $(document).on('click', '#delete_termination', function (e) {
                    e.preventDefault();
                    var t_id = $(this).data('id');
                    var t_emp=$(this).data('emp');
                    console.log("Type id: " + t_id);
                    SwalDelete(t_id,t_emp);

                });



            });

            function SwalDelete(t_id,t_emp) {

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
                            var data = "deleteId=" + t_id + "&action=" + action+ "&empno=" + t_emp;
                            var url = url;
                            $.ajax({
                                url: './Terminations', //ajax codes start for delete data
                                type: 'POST',
                                data: data,
                                dataType: 'JSON'
                            })
                                    .done(function (response) {
                                        swal('Deleted!', response.message, response.status);    //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                                        var url_ = "manage_termination.jsp";
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
        </script>
 <%@include file="/_includes/include_footer.jsp"%>
    </body>
</html>

