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
                            <form method="POST"  class="form-horizontal" id="designationForm_" enctype="multipart/form-data">

                                <div class="form-body">

                                    <div class="form-group">
                                        <label for="inputcadrecat">Cadre Category</label>
                                        <select name="carder_category_id" id="inputcadrecat" class="form-control" onchange='pataStandard();'>
                                            <option selected>Choose...</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputStandCadre">Standardized Cadre</label> <select
                                            id="inputStandCadre" name="standardized_cadre_id" class="form-control" >
                                            <option selected>Choose...</option>
                                            <option>...</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPosition">Position</label> <input
                                            type="text" class="form-control" id="inputPosition" name="position_title"
                                            placeholder="Designation">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputBasic">Basic Pay</label> <input
                                            type="text" class="form-control" id="inputBasic" name="basic_pay"
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
