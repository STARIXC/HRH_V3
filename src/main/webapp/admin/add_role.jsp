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
            .validateRq {
                color: red;
            }
        </style>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    </head>
    <body>

        <%@include file="/_includes/header.jsp"%>
        <% String role_id = request.getParameter("id");%>
        <div class="main-content container-fluid">
            <div class="row mb-2">
                <div class="col-md-8 order-md-1 order-last">
                    <nav aria-label="breadcrumb" class='breadcrumb-header'>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp" class="text-success"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Add Role</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-md-4 order-md-2 order-first">
                    <a href="manage_role.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light">
                        <i class="fa fa-list-ul" aria-hidden="true"></i> View Roles</a>

                </div>
            </div>


            <!-- Basic Vertical form layout section start -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-success text-white"><i class="mdi mdi-clipboard-text fa-fw"></i>
                            Add Role
                        </div>
                        <div class="card-body">
                            <form method="POST"  accept-charset="UTF-8" enctype="multipart/form-data" class="form-horizontal">
                                <input name="_id" id="role_id" type="hidden" value="<%=role_id%>">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-4 offset-md-2"></div>
                                        <div class="col-md-8 ">
                                            <div class="form-group">
                                                <label class="control-label col-md-4">Role Name<span class="validateRq">*</span></label>
                                                <div class="col-md-8">
                                                    <input class="form-control required role_name" id="role_name" placeholder="Role Name" name="role_name" type="text">
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="row">
                                                <div class="col-md-offset-4 col-md-8">
                                                    <button type="submit" class="btn btn-info btn_style"><i class="fa fa-check"></i>Save</button>
                                                    <!--<button type="hidden" class="btn btn-info btn_style"><i class="fa fa-check"></i>Save</button>-->
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
<script src="../assets/js/pages/roles.js"></script>
<script src="../assets/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<%@include file="/_includes/include_footer.jsp"%>
</body>
</html>
