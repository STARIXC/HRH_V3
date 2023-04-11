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
                            <li class="breadcrumb-item active" aria-current="page">Leave Year</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-md-4 order-md-2 order-first">
                    <a href="leave_year.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light">
                        <i class="fa fa-list-ul" aria-hidden="true"></i> Leave Year</a>

                </div>
            </div>


            <!-- Basic Vertical form layout section start -->
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header bg-success text-white"><i class="mdi mdi-clipboard-text fa-fw"></i>
                            Add Financial Year
                        </div>
                        <div class="card-body">
                            <form method="POST"  class="form-horizontal" id="leaveYearForm_" enctype="multipart/form-data">

                                <div class="form-body">
                                    <div class="form-group">
                                        <label for="inputName">Name</label> <input
                                            type="text" class="form-control" id="inputName" name="name"
                                            >
                                    </div>
                                    <div class="form-group">
                                        <label for="inputYear">Year</label>
                                        <input type="text" class="form-control" id="inputYear" name="year"
                                            >
                                    </div>
                                    <div class="form-group">
                                        <label for="inputStartDate">Start Date</label> <input
                                            type="text" class="form-control" id="inputStartDate" name="startDate"
                                            placeholder="Start Date">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEndDate">End Date</label> <input
                                            type="text" class="form-control" id="inputEndDate" name="endDate"
                                            placeholder="End Date">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputContractPeriod">Contract Period</label> <input
                                            type="text" class="form-control" id="inputContractPeriod" name="contract_period"
                                            placeholder="End Date">
                                    </div>
                                    <div class="form-group">
                                        <label for="contract_no_months">No of Months</label> <input
                                            type="text" class="form-control" id="contract_no_months" name="contract_no_months"
                                            placeholder="End Date">
                                    </div>
                                    <div class="col-12 d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary me-1 mb-1">Submit</button>
                                    </div>
                                </div>


                            </form>
                        </div>

                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card text-white">
                        <div class="card-header bg-info"><i class="fa fa-table fa-fw"></i> Leave Years</div>
                        <div class="card-wrapper " aria-expanded="true">
                            <div class="card-body">
                                <div class="table-responsive ">
                                    <table width="100%" class="leave_years_table table  table-bordered table-hover " id="leave_years_table">
                                        <thead class='mt-3'>
                                            <tr>
                                           <th> Name</th>
                                           <th> Year</th>
                                                <th>Start Date</th>
                                                <th>End Date</th>
                                                <th>Action</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody id="leave_years_table_data">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
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

<<script>
    function addFY() {
    var name = document.getElementById("name").value;
    var year = document.getElementById("year").value;
    var start_date = document.getElementById("start_date").value;
    var end_date = document.getElementById("end_date").value;
    var contract_period = document.getElementById("contract_period").value;
    var contract_no_months = document.getElementById("contract_no_months").value;
    var status = document.getElementById("status").value;

    var data = {
        name: name,
        year: year,
        start_date: start_date,
        end_date: end_date,
        contract_period: contract_period,
        contract_no_months: contract_no_months,
        status: status
    };

    $.ajax({
        type: "POST",
        url: "FY",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(response) {
            alert("Data added successfully");
        },
        error: function(xhr, status, error) {
            console.log(error);
        }
    });
}
</script>
<%@include file="/_includes/include_footer.jsp"%>
</body>
</html>
