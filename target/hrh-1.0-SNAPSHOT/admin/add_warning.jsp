<%-- 
    Document   : manage_notification
    Created on : May 24, 2022, 12:31:23 AM
    Author     : CBWAHYI
--%>
<!DOCTYPE html>

<html lang="en">
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Warning</title>
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <script defer src="../assets/fontawesome/js/all.min.js"></script>
        <link rel="stylesheet" href="../assets/css/style.css">
        <link rel="stylesheet" href="../assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
        <style type="text/css">
            .notif:hover{
                background-color: rgba(0,0,0,0.1);
            }
        </style>

        <link rel="stylesheet" href="../assets/vendor/calender/lib/jquery-ui.min.css" />
        <link rel="stylesheet"
              href="../assets/vendor/calender/lib/bootstrap-datepicker.css" />
        <link rel="stylesheet" href="../assets/css/select2.min.css" />
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    </head>
    <body>

        <%@include file="/_includes/header.jsp"%>

        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                    <nav aria-label="breadcrumb" class='breadcrumb-header'>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp" class="text-info"><i class="fa fa-home"></i> Dashboard</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Manage Holidays</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                    <a href="manage_warning.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"><i class="fa fa-list-ul" aria-hidden="true"></i>  View Public Holiday</a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card text-white ">
                        <div class="card-header bg-success"><i class="mdi mdi-clipboard-text fa-fw"></i> Add Warning
                        </div>
                        <div class="card-wrapper">
                            <div class="card-body">
                                <form method="POST"  accept-charset="UTF-8" enctype="multipart/form-data" class="form-horizontal" autocomplete="off">

                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-md-offset-2 col-md-6">
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4">Employee Name<span class="validateRq">*</span></label>
                                                    <div class="col-md-8">
                                                        <select class="form-control warning_to  required " name="warning_to" >
                                                            <option value="" >---- Please select ----</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4">Warning Type<span class="validateRq">*</span></label>
                                                    <div class="col-md-8">
                                                        <input class="form-control required warning_type" id="warning_type" placeholder="Warning Type" name="warning_type" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4">subject<span class="validateRq">*</span></label>
                                                    <div class="col-md-8">
                                                        <input class="form-control required subject" id="subject" placeholder="subject" name="subject" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4">Warning By<span class="validateRq">*</span></label>
                                                    <div class="col-md-8">
                                                        <select class="form-control warning_by  required " name="warning_by" >
                                                            <option value="" >---- Please select ----</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4">Warning Date<span class="validateRq">*</span></label>
                                                    <div class="col-md-8">
                                                        <div class="input-group">
                                                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                            <input class="form-control required dateField" id="warning_date" placeholder="Warning Date" readonly="readonly" name="warning_date" type="text">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4">Description</label>
                                                    <div class="col-md-8">

                                                        <textarea class="form-control description" id="warning_date" name="description" cols="50" rows="10" placeholder="Description" ></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <div class="row">
                                                        <div class="col-md-offset-4 col-md-8">
                                                            <button type="submit" class="btn btn-info btn_style"><i class="fa fa-check"></i> Save</button>
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
            </div>
        </div>
        <script src="../assets/vendor/jquery/jquery.min.js"></script>
        <script src="../assets/vendor/calender/lib/jquery-ui.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/feather-icons/feather.min.js"></script>
        <script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="../assets/js/app.js"></script>
        <script src="../assets/js/pages/holiday.js"></script>
        <script src="../assets/js/main.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <%@include file="/_includes/include_footer.jsp"%>
    </body>
</html>

