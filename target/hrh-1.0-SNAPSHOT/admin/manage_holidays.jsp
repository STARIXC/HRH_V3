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
        <title>Holidays</title>
        <link rel="stylesheet" href="../assets/css/custom.css">
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <link rel="stylesheet" href="../assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="../assets/css/toggle.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.2.4/css/fixedHeader.bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">
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

            .fade:not(.show) {
                opacity: 1 !important;
            }
        </style>

    </head>
    <body>

        <%@include file="/_includes/header.jsp"%>

        <div class="main-content">
            <div class="container-fluid">
                <div class="page-header">
                    <div class="page-block">
                        <div class="row align-items-center">
                            <div class="col-auto">
                                <div class="page-header-title">
                                    <h4 class="m-b-10">
                                        Manage Employee
                                    </h4>
                                </div>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="./">Home</a></li>
                                    <li class="breadcrumb-item">Holidays</li>
                                </ul>
                            </div>
                            <div class="col">
                                <div class="float-end ">


                                    <a href="javascript:void(0);" data-title="Create New Employee" data-bs-toggle="tooltip" title="" class="btn btn-sm btn-info create_new" data-bs-original-title="Create">
                                        <i class="fa fa-plus"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="success-popup" class="alert alert-success d-none" role="alert">
                    Your operation was successful!
                </div>




                <div class="row">
                    <div class="col-sm-12 pt-5">
                        <div class="card text-white">
                            <!--<div class="card-header "><i class="fa fa-table fa-fw"></i> Staff List</div>-->
                            <div class="card-wrapper " aria-expanded="true">
                                <div class="card-header card-body table-border-style">
                                    <div class="table-responsive ">
                                        <div id="myTable_wrapper" class="dataTables_wrapper no-footer">
                                            <table id="myTable" class="table table-bordered  no-footer mt-3" >
                                                <thead class="tr_header">
                                                    <tr role="row">
                                                        <th >S/L</th>
                                                        <th >Holy Day Name</th>
                                                        <th >Start Date</th>
                                                        <th >End Date</th>
                                                        <th >Comment</th>
                                                        <th style="text-align: center;" >Action</th></tr>
                                                </thead>
                                                <tbody id="tbl_holidays">

                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <%@include file="/_includes/modals.jsp"%>
        <%@include file="/_includes/footer.jsp"%>

        <script src="../assets/vendor/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../assets/vendor/calender/lib/jquery-ui.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://cdn.datatables.net/fixedheader/3.2.4/js/dataTables.fixedHeader.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.3.0/js/responsive.bootstrap.min.js"></script>
        <script defer src="../assets/fontawesome/js/all.min.js" type="text/javascript"></script>
        <script src="../assets/js/feather-icons/feather.min.js"></script>
        <script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script src="../assets/js/main.js"></script>
        <!--        <script src="../assets/js/pages/front.js"></script>-->
        <script src="../assets/js/pages/holiday.js"></script>
        <%@include file="/_includes/include_footer.jsp"%>
        <script type="text/javascript">
            $(document).ready(function () {

                $(document).on('click', '.create_new', function (e) {
                    $('#simpleModalLHoliday form')[0].reset();
                    $("#simpleModalLHoliday").modal('show');
                });


                $(document).on('click', '.edit-hols', function (e) {
                    e.preventDefault();
                    var typeId = $(this).data('id');
                    console.log("Type id: " + typeId);
                    OpenBootstrapPopup(typeId);

                });
                $(document).on('click', '.deleteBtn', function (e) {
                    e.preventDefault();
                    var typeId = $(this).data('id');
                    console.log("Type id: " + typeId);
                    SwalDelete(typeId);

                });

            });
            function OpenBootstrapPopup(id) {
                var holiday_id = id;
                $.ajax({
                    type: "GET",
                    url: './ManageHolidays?action=edit&id=' + holiday_id,
                    contentType: "application/json; charset-utf-8",
                    dataType: "json",
//                            data: {
//                                'id': holiday_id
//                            },
                    success: function (data) {
                        console.log(eval(data));
                        document.getElementById('holiday_id').value = data.id;
                        document.getElementById('holiday_name').value = data.holiday_name;
                        var date = new Date(data.start_date); // parse the date string from the server response
                        var formatedStartDate = date.getFullYear() + "-" + (date.getMonth() + 1).toString().padStart(2, '0') + "-" + date.getDate().toString().padStart(2, '0'); // format the date as yyyy-mm-dd
//                        $("#myField").val(formattedDate); // set the value of the target field
                        var date_ = new Date(data.end_date); // parse the date string from the server response
                        var formatedEndDate = date_.getFullYear() + "-" + (date_.getMonth() + 1).toString().padStart(2, '0') + "-" + date_.getDate().toString().padStart(2, '0'); // format the date as yyyy-mm-dd
//                        $("#myField").val(formattedDate); // set the value of the target field
    
                        document.getElementById('from_date').value = formatedStartDate;
                        document.getElementById('to_date').value = formatedEndDate;
                        document.getElementById('no_of_days').value = data.no_of_days;
                        document.getElementById('comment').value = data.comment;
                    },
                    complete: function () {
                        $("#simpleModalLHoliday").modal('show');
                    }
                });

            }
            function SwalDelete(typeId) {

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
                            var data = "deleteId=" + typeId + "&action=" + action;
                            var url = url;
                            $.ajax({
                                url: './ManageHolidays', //ajax codes start for delete data
                                type: 'POST',
                                data: data,
                                dataType: 'JSON'
                            })
                                    .done(function (response) {
                                        swal('Deleted!', response.message, response.status);    //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                                        var url_ = "manage_holidays.jsp";
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

    </body>
</html>

