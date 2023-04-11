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
        <title>Add Termination</title>
        <link rel="stylesheet" href="../assets/css/custom.css">
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <link rel="stylesheet" href="../assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="../assets/css/toastr.min.css">
        <link rel="stylesheet" href="../assets/css/toggle.css">
        <link rel="stylesheet" href="../assets/vendor/DataTables/datatables.css">
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
        </style>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    </head>
    <body>

        <%@include file="/_includes/header.jsp"%>
        <div class="main-content container-fluid">
            <div class="row mb-2">
                <div class="col-md-8 order-md-1 order-last">
                    <nav aria-label="breadcrumb" class='breadcrumb-header'>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp" class="text-success"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Add Department</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-md-4 order-md-2 order-first">
                    <a href="/termination" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light">
                        <i class="fa fa-list-ul" aria-hidden="true"></i> View Termination</a>

                </div>
            </div>


            <!-- Basic Vertical form layout section start -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-success text-white"><i class="mdi mdi-clipboard-text fa-fw"></i>
                            Edit Termination
                        </div>
                        <div class="card-body">
                            <form method="POST" id="terminationForm" class="form-horizontal" enctype="multipart/form-data">

                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label col-md-4">Employee Name<span class="validateRq">*</span></label>
                                                <div class="col-md-12">
                                                    <input type="hidden" class="form-control  input-width-xlarge" name="terminationby" id="terminationby"  autocomplete="off" value="super-admin">
                                                    <select class="form-control  employee_t required" name="employee_t">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group ">
                                                <label for="work_hour">Notice Date </label>
                                                <input type="text" class="form-control datepicker input-width-xlarge" name="noticedate" id="ndate" placeholder="Notice date" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group ">
                                                <label for="work_hour">Termination Date </label>
                                                <input type="text" class="form-control datepicker input-width-xlarge" name="terminatedate" id="tdate" placeholder="Termination date" autocomplete="off">
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="work_hour">Termination Reason</label>
                                                <textarea class="form-control input-width-xlarge" name="termreason" id="treason" placeholder="Termination Reason"></textarea> 
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group ">
                                                <label for="period">Voluntary Termination</label>
                                                <select name="volunt_termination" class="form-control input-width-xlarge " >
                                                    <option value=""> Select One</option>
                                                    <option value="1"> Yes</option>
                                                    <option value="2">No</option>
                                                </select>

                                            </div>
                                        </div>
                                    </div>



                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="row">
                                                    <div class="col-md-offset-4 col-md-8">
                                                        <!--<input name="update" type="submit" class="btn btn-info btn_style" value="Update">-->
                                                        <input name="submit" type="submit" class="btn btn-info btn_style" value="Submit">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
<script src="../assets/js/pages/form_.js"></script>
<script src="../assets/js/pages/front.js"></script>
<script src="../assets/js/app.js"></script>
<script src="../assets/js/main.js"></script>
<script src="../assets/js/toastr.min.js"></script>
<script src="../assets/js/pages/termination.js"></script>
<script src="../assets/js/main.js"></script>
<%@include file="/_includes/include_footer.jsp"%>
</body>
</html>

