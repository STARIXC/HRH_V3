<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Leave Details</title>
        <link rel="stylesheet" href="./assets/css/custom.css">
        <link rel="shortcut icon" href="./assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="./assets/css/bootstrap.css">
        <link rel="stylesheet" href="./assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="./assets/css/toggle.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.2.4/css/fixedHeader.bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">
        <link href="./assets/vendor/swal2/sweetalert2.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="./assets/vendor/calender/lib/jquery-ui.min.css" />
        <link rel="stylesheet" href="./assets/vendor/calender/lib/bootstrap-datepicker.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="./assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <style type="text/css">
            .notif:hover {
                background-color: rgba(0, 0, 0, 0.1);
            }
            /*            #spinner-div {
                            position: fixed;
                            display: none;
                            width: 100%;
                            height: 100%;
                            top: 0;
                            left: 0;
                            text-align: center;
                            background-color: rgba(255, 255, 255, 0.8);
                            z-index: 2;
                        }*/
            .fade:not(.show) {
                opacity: 1 !important;
            }
            hr{
                color: #0000004f;
                margin-top: 5px;
                margin-bottom: 5px
            }
            .add td{
                color: #c5c4c4;
                text-transform: uppercase;
                font-size: 12px
            }
            .content{
                font-size: 14px
            }
        </style>
    </head>

    <body>
        <%@include file="/_includes/header_.jsp"%>
        <%     String id = request.getParameter("id");
        %>
        <div class="main-content container-fluid">
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-auto">
                            <div class="page-header-title">
                                <h4 class="m-b-10">
                                    Leave Detail
                                </h4>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="./">Home</a></li>
                                <li class="breadcrumb-item">Leave Details</li>
                            </ul>
                        </div>
                        <div class="col">
                            <div class="float-end ">

                                <a href="/export/employee" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Print" class="btn btn-sm btn-info">
                                    <i class="fa fa-print"></i>
                                </a>


                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="success-popup" class="alert alert-success d-none" role="alert">
                Your operation was successful!
            </div>


            <section id="basic-vertical-layouts ">
                <div class="row match-height">
                    <div class="col-md-12 col-12 pt-5">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body">
                                    <form class="form form-vertical">
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="col-12">

                                                    <div class="row d-flex ">
                                                        <div class="col">
                                                            <div class="card_">
                                                                <div class="d-flex flex-row p-2 justify-content-center"> <img src="./assets/images/aphia_logo.png" class="img-responsive">
                                                                </div>
                                                                <div class="d-flex flex-row justify-content-center"> 
                                                                    <h1>Leave Application Form</h1>
                                                                </div>
                                                                <input type="hidden" class="form-control"  id="leave_id" value="<%=id%>">

                                                                <div class="table-responsive p-2">
                                                                    <table class="table table-borderless">
                                                                        <tbody>
                                                                            <tr class="add_">
                                                                                <td><strong>Employee Name :</strong><br>Jon Doe</td>
                                                                                <td><strong>Employee Number :</strong><br>00014</td>
                                                                            </tr>
                                                                            <tr class="add_">
                                                                                <td><strong>Designation :</strong><br>Nurse</td>
                                                                                <td><strong>Duty Station :</strong><br> Mother Kevin Nursing Home</td>
                                                                            </tr>

                                                                            <tr class="content_">
                                                                                <td class="font-weight-bold">Type of Leave Requested </td>
                                                                                <td class="font-weight-bold">
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                                                        <label class="form-check-label" for="flexCheckDefault">
                                                                                            Annual Leave
                                                                                        </label>
                                                                                    </div>
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
                                                                                        <label class="form-check-label" for="flexCheckChecked">
                                                                                            Sick Leave
                                                                                        </label>
                                                                                    </div>
                                                                                    <div class="form-check">
                                                                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
                                                                                        <label class="form-check-label" for="flexCheckChecked">
                                                                                            Maternity /Paternity
                                                                                        </label>
                                                                                    </div>

                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>

                                                                <div class="table-responsive p-2">
                                                                    <table class="table ">
                                                                        <tbody>
                                                                            <tr class="add_">
                                                                                <td><strong>Leave Days :</strong></td>
                                                                                <td><strong>Current Balance :</strong></td>
                                                                                <td><strong>Number of Days Requested :</strong></td>
                                                                            </tr>
                                                                            <tr class="add_">
                                                                                <td><strong>Date Requested :</strong></td>
                                                                                <td><strong>From :</strong></td>
                                                                                <td><strong>To :</strong></td>
                                                                            </tr>

                                                                        </tbody>
                                                                    </table>
                                                                </div>

                                                                <div class="products p-2">
                                                                    <div class="d-flex flex-row justify-content-center"> 
                                                                        <h5>For Official Use Only</h5>
                                                                    </div>
                                                                    <table class="table table-borderless">
                                                                        <tbody>
                                                                            <tr class="add">
                                                                                <td>Reviewed by <em>(Facility In charge /Supervisor)</em></td>
                                                                                <td></td>
                                                                                <td>Reviewed by <em>(Technical Officer -USAID Tujenge Jamii)</em></td>
                                                                                <td class="text-center"></td>
                                                                            </tr>
                                                                            <tr class="content">
                                                                                <td>Designation</td>
                                                                                <td class="sup_">Mercy</td>
                                                                                <td>Designation</td>
                                                                                <td class="to_">$22,500</td>
                                                                            </tr>
                                                                            <tr class="content">
                                                                                <td>Date</td>
                                                                                <td class="sup_date">10</td>
                                                                                <td>Date</td>
                                                                                <td class=" to_date">$15,000</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>

                                                                <div class="address p-2">
                                                                    <table class="table table-borderless">
                                                                        <tbody>
                                                                            <tr class="add_">
                                                                                <td>Approval Details</td>
                                                                            </tr>
                                                                            <tr class="content">
                                                                                <td> Approved By : <span>Celestine </span> <br> Designation : <span class="hrh_desig">HRH </span> <br> Date : <span class="app_date">2023-05-24 </span> <br> Number Days Remaining : <span class="balance"> 5 </span> Days <br> </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>

                                                <!--                                                <div class="col-12 d-flex justify-content-end">
                                                                                                    <button type="submit" class="btn btn-primary me-1 mb-1">Approve</button>
                                                                                                    <button type="submit" class="btn btn-primary me-1 mb-1">Not Approve</button>
                                                                                                </div>-->
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- // Basic Vertical form layout section end -->
        </div>
    </div>
</div>
<%@include file="/_includes/footer.jsp"%>

<script src="./assets/vendor/jquery/jquery.min.js" type="text/javascript"></script>
<script src="./assets/vendor/calender/lib/jquery-ui.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="./assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/fixedheader/3.2.4/js/dataTables.fixedHeader.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.3.0/js/responsive.bootstrap.min.js"></script>
<script defer src="./assets/fontawesome/js/all.min.js" type="text/javascript"></script>
<script src="./assets/js/feather-icons/feather.min.js"></script>
<script src="./assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="./assets/js/pages/leave.js"></script>
<script src="./assets/js/main.js"></script>

<%@include file="/_includes/include_footer.jsp"%>
</body>
</html>