<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Earn Leave Config</title>
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
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
        <link rel="stylesheet" href="../assets/css/jquery.toast.css">
        <style type="text/css">
            .notif:hover{
                background-color: rgba(0,0,0,0.1);
            }
        </style>
        <style type="text/css">.jqstooltip {
                position: absolute;
                left: 0px;
                top: 0px;
                visibility: hidden;
                background: rgb(0, 0, 0) transparent;
                background-color: rgba(0,0,0,0.6);
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);
                -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
                color: white;
                font: 10px arial, san serif;
                text-align: left;
                white-space: nowrap;
                padding: 5px;
                border: 1px solid white;
                z-index: 10000;
            }
            .jqsfield {
                color: white;
                font: 10px arial, san serif;
                text-align: left;
            }</style>
    </head>
    <body>

        <%@include file="/_includes/header.jsp"%>

        <div class="main-content container-fluid">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                        <nav aria-label="breadcrumb" class='breadcrumb-header'>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp" class="text-info"><i class="fa fa-home"></i> Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Earn Leave Configuration</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card text-white">
                            <div class="card-header bg-info"><i class="fa fa-th-list fa-fw"></i>	Rules of Earn Leave
                            </div>
                            <div class="card-wrapper" >
                                <div class="card-body card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr class="tr_header">
                                                    <th>S/L</th>
                                                    <th>For Month</th>
                                                    <th>Day of Earn Leave</th>
                                                    <th>Update</th>
                                                </tr>
                                            </thead>
                                            <tbody id="earnleave">
                                                <tr>
                                                    <td>1</td>
                                                    <td>

                                                        <input type="hidden" class="form-control earn_leave_rule_id" value="1">
                                                        <input type="number" class="form-control for_month" value="1" readonly="" placeholder="For Days EX:(3)">
                                                    </td>
                                                    <td>
                                                        <input type="number" class="form-control day_of_earn_leave" value="" placeholder="Salary Deduction For Day EX:(1)">
                                                    </td>

                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-success updateRule">
                                                            Update												</button>
                                                    </td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- // Basic multiple Column Form section start -->

        </div>

    </div>
</div>
<script src="../assets/js/feather-icons/feather.min.js"></script>
<script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="../assets/vendor/jquery.toast.js"></script>
<script src="../assets/js/app.js"></script>

<script src="../assets/js/main.js"></script>
<script type="text/javascript">
    jQuery(function () {
        var app="/hrh";
        get_earn_leave();
        function get_earn_leave() {
            var action = "All";
            $.ajax({
                url: app+'/updateEarnLeaveConfigure?action=' + action,
                type: 'GET',
                contentType: "application/json; charset-utf-8",
                dataType: "json",
                success: function (data) {
                    $('#earnleave').empty();

                    var form_fields = '<tr>'
                            + '<td>1</td>'
                            + '   <td>'
                            + '   <input type="hidden" class="form-control earn_leave_rule_id" value="' + data.earn_leave_rule_id + '">'
                            + '   <input type="number" class="form-control for_month" value="' + data.for_month + '" readonly="" placeholder="For Days EX:(3)">'
                            + '    </td>'
                            + '    <td>'
                            + '     <input type="number" class="form-control day_of_earn_leave" value="' + data.day_of_earn_leave + '" placeholder="Salary Deduction For Day EX:(1)">'
                            + '   </td>'
                            + '   <td>'
                            + '   <button type="button" class="btn btn-sm btn-success updateRule">Update</button>'
                            + '   </td>'
                            + '</tr>';
                    $('#earnleave').append(form_fields);


                }


            });


        }
        ;

        $("body").on("click", ".updateRule", function () {
            var earn_leave_rule_id = $('.earn_leave_rule_id').val();
            var for_month = $('.for_month').val();
            var day_of_earn_leave = $('.day_of_earn_leave').val();

            var action = app+"/updateEarnLeaveConfigure?action=updateEarnLeaveConfigure";
            $.ajax({
                type: "post",
                url: action,
                data: {'earn_leave_rule_id': earn_leave_rule_id, 'for_month': for_month, 'day_of_earn_leave': day_of_earn_leave},
                success: function (data) {
                    var json = $.parseJSON(data);
                    console.log(json.status);
                    if (json.status === 'success') {
                        $.toast({
                            heading: 'success',
                            text: 'Earn leave rule update successfully!',
                            position: 'top-right',
                            loaderBg: '#ff6849',
                            icon: 'success',
                            hideAfter: 3000,
                            stack: 6
                        });
                    } else {
                        $.toast({
                            heading: 'Problem',
                            text: 'Something error found !',
                            position: 'top-right',
                            loaderBg: '#ff6849',
                            icon: 'error',
                            hideAfter: 3000,
                            stack: 6
                        });
                    }

                }
            });
        });
    });
</script>
<%@include file="/_includes/include_footer.jsp"%>
</body>
</html>
