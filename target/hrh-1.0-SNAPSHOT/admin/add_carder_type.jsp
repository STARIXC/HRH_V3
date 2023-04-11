<!DOCTYPE html>

<html lang="en">
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Carder Type</title>
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
            .notif:hover{
                background-color: rgba(0,0,0,0.1);
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
                    <a href="manage_carder_type.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light">
                        <i class="fa fa-list-ul" aria-hidden="true"></i> View Carder Types</a>

                </div>
            </div>


            <!-- Basic Vertical form layout section start -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-success text-white"><i class="mdi mdi-clipboard-text fa-fw"></i>
                            Add Carder Type
                        </div>
                        <div class="card-body">
                            <form method="POST"  class="form-horizontal" id="carderForm_" enctype="multipart/form-data">

                                <div class="form-body">
                                    <div class="row">

                                        <div class="col-sm-12">
                                            <div class="form-group ">
                                                <label for="carder_name">Carder Name </label>
                                                <input type="text" class="form-control carder_name input-width-xlarge" name="e_carder_name" id="carder_name" placeholder="Carder Name" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group ">
                                                <label for="hrs_per_week">Hours per Week </label>
                                                <input type="text" class="form-control hrs_per_week input-width-xlarge" name="e_hrs_per_week" id="hrs_per_week" placeholder="Expected Work Hours Per Week" autocomplete="off">
                                            </div>
                                        </div>


                                    </div>



                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="row">
                                                    <div class="col-md-offset-4 col-md-8">
                                                        <!--                                                                <input name="update" type="submit" class="btn btn-info btn_style" value="Update">-->
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
<script src="../assets/vendor/DataTables/datatables.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/feather-icons/feather.min.js"></script>
<script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="../assets/js/app.js"></script>
<script src="../assets/js/pages/cader.js"></script>
<script src="../assets/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<%@include file="/_includes/include_footer.jsp"%>
</body>
</html>
