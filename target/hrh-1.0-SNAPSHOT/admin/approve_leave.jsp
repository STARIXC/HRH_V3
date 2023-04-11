<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Not Approved</title>


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
        <link rel="shortcut icon" href="../assets/images/favicon.svg" type="image/x-icon">
    </head>

    <body>

        <%@include file="/_includes/header.jsp"%>
        <div class="main-content container-fluid">
            <div class="page-title">
                <div class="row">
                    <div class="col-12 col-md-6 order-md-1 order-last">
                        <h3>Pending</h3>
                    </div>
                    <div class="col-12 col-md-6 order-md-2 order-first">
                        <nav aria-label="breadcrumb" class='breadcrumb-header'>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp" class="text-success">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Pending</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <section class="section">
                <div class="card">
                    <div class="card-body">
                        <table class='table table-hover datatable responsive' id="approved_leave_table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Employee Id</th>
                                    <th>Application Start Date</th>
                                    <th>Application End date</th>
                                    <th>Application Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody id="approved_leave_table_data">

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
<script src="../assets/js/bootstrap-toggle.min.js"></script>
<script src="../assets/js/app.js"></script>

<script src="../assets/vendor/DataTables/datatables.js"></script>


<script src="../assets/js/vendors.js"></script> 
<script src="../assets/js/custom_.js"></script>  

<script src="../assets/js/main.js"></script>
<script src="../assets/js/pages/approved_leave.js"></script>
<%@include file="/_includes/include_footer.jsp"%>
</body>

</html>