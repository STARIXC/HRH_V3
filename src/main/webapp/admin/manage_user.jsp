<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage User</title>
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <link rel="stylesheet" href="../assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="../assets/css/toggle.css">
        <link rel="stylesheet" href="../assets/vendor/DataTables/datatables.css">
        <link href="../assets/vendor/swal2/sweetalert2.min.css" rel="stylesheet" type="text/css">
        <script defer src="../assets/fontawesome/js/all.min.js"></script>
        <link rel="stylesheet"
              href="../assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <script src="../assets/vendor/jquery/jquery.min.js"></script>
        <script src="../assets/vendor/calender/lib/jquery-ui.min.js"></script>
        <script src="../assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
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
            <div class="container-fluid">
                <div class="row bg-title_ ">
                    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 p-0 mb-5">
                        <nav aria-label="breadcrumb" class='breadcrumb-header'>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.jsp" class="text-info"><i class="fa fa-home"></i> Dashboard</a></li>
                                <li class="breadcrumb-item active text-bold" aria-current="page">Manage Users</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row mb-1">
                    <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">

                        <h2 class="text-xl font-bold col-7 text-sm-2xl text-truncate-sm">User</h2>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                        <a href="add_user.jsp" type="button"  class="btn card  d-inline-flex items-center ">Add
                            New User</a>
                        <!----><button type="button" class="btn card d-inline-flex items-center "><i
                                class="fa fa-filter"></i></button>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card text-white">

                            <div class="card-wrapper" >
                                <div class="card-body ">
                                    <table class="rounded-table table-responsive-md table w-100 divide-y divide-gray-200 " id="user_table">
                                        <thead class="bg-gray-50 dark:bg-neutral-700">
                                            <tr>
                                                <th scope="col"
                                                    class="px-sm-2 px-xl-4 py-3 text-left text-xs font-medium text-gray-500  text-uppercase tracking-wider cursor-pointer">
                                                    <!----> SNo 
                                                </th>
                                                <th scope="col"
                                                    class="px-sm-2 px-xl-4 py-3 text-left text-xs font-medium text-gray-500  text-uppercase tracking-wider cursor-pointer">
                                                    <!----> Name 
                                                </th>
                                                <th scope="col"
                                                    class="px-sm-2 px-xl-4 py-3 text-left text-xs font-medium text-gray-500  text-uppercase tracking-wider cursor-pointer">
                                                    <!----> Email 
                                                </th>
                                                <th scope="col"
                                                    class="px-sm-2 px-xl-4 py-3 text-left text-xs font-medium text-gray-500  text-uppercase tracking-wider cursor-pointer">
                                                    <!----> Username 
                                                </th>
                                                <th scope="col"
                                                    class="px-sm-2 px-xl-4 py-3 text-left text-xs font-medium text-gray-500  text-uppercase tracking-wider">
                                                    <!----> Role
                                                    <!---->
                                                </th>
                                                <th scope="col"
                                                    class="px-sm-2 px-xl-4 py-3 text-left text-xs font-medium text-gray-500  text-uppercase tracking-wider">
                                                    <!----> Status
                                                    <!---->
                                                </th>
                                                <th scope="col"
                                                    class="px-sm-2 px-xl-4 py-3 text-left text-xs font-medium text-gray-500  text-uppercase tracking-wider cursor-pointer">
                                                    <!----> Created At 
                                                </th>
                                                <th scope="col"
                                                    class="px-sm-2 px-xl-4 py-3 text-left text-xs font-medium text-gray-500  text-uppercase tracking-wider">
                                                    <!---->
                                                    <!---->
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody class="bg-white divide-y divide-gray-200" id="users_data"></tbody></table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- // Basic multiple Column Form section start -->

        </div>


        <div id="userModal" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">

                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">User Update Form</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">

                        </button>
                    </div>
                    <form class="form"  id="addUserForm" autocomplete="off">
                        <div class="modal-body">
 <input type="hidden" class="form-control" placeholder="contact" id="txt_userid" name="txt_userid">

                            <div class="form-body">

                                <div class="row">
                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="col-md-12 control-label">
                                                Surname <span class="required">*</span>
                                            </label>
                                            <div class="col-md-12">
                                                <input name="txtSurname" type="text" value=""
                                                       maxlength="50" id="txtSurname"
                                                       class="form-control input-width-xlarge"  /> <span
                                                       id="rfvSurname" class="required"
                                                       style="display: none">Please enter Last
                                                    Name.</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                        <div class="form-group efirst">
                                            <label class="col-md-12 control-label">
                                                First Name <span class="required">*</span>
                                            </label>
                                            <div class="col-md-12">
                                                <input name="txtFirstName" type="text" value=""
                                                       maxlength="50" id="txtFirstName"
                                                       class="form-control input-width-xlarge" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="col-md-12 control-label">
                                                Middle Name </label>
                                            <div class="col-md-12">
                                                <input name="txtMiddleName" type="text" value=""
                                                       maxlength="50" id="txtMiddleName"
                                                       class="form-control input-width-xlarge" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group has-icon-left">
                                            <label for="first-name-icon">Contact</label>
                                            <div class="position-relative">
                                                <input type="text" class="form-control" placeholder="contact" id="txtPhone" name="txtPhone">
                                                <div class="form-control-icon">
                                                    <i class="fa fa-phone"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div><div class="col-md-6 col-12">
                                        <div class="form-group has-icon-left">
                                            <label for="first-name-icon">Email</label>
                                            <div class="position-relative">
                                                <input type="text" class="form-control" placeholder="contact" id="txtEmail" name="txtEmail">
                                                <div class="form-control-icon">
                                                    <i class="fa fa-envelope"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 col-12">
                                        <div class="form-group has-icon-left">
                                            <label for="first-name-icon">User Category</label>
                                            <div class="position-relative">
                                                <fieldset class="form-group">
                                                    <select class="form-select" id="ddlLevel" name="ddlLevel">
                                                        <option>Admin</option>
                                                        <option>Staff</option>
                                                    </select>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
<!--                                    <div class="col-md-3 col-12">
                                        <div class="form-group has-icon-left">
                                            <label for="first-name-icon">County</label>
                                            <div class="position-relative">
                                                <fieldset class="form-group">
                                                    <select class="form-control" onchange="patasubcounty();" name='ddlCounty' id='ddlCounty'>
                                                    </select>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-12">
                                        <div class="form-group has-icon-left">
                                            <label for="first-name-icon">User Subcounty</label>
                                            <div class="position-relative">
                                                <fieldset class="form-group">
                                                    <select class="form-control" onchange='patafacility();' name='ddlSubcounty' id='ddlSubcounty'>
                                                    </select>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>-->
                                    <div class="col-md-6 col-12">
                                        <div class="form-group has-icon-left">
                                            <label for="first-name-icon">User Facility</label>
                                            <div class="position-relative">
                                                <fieldset class="form-group">

                                                    <select class="form-control form-select" name='ddlFacility' id='ddlFacility'>

                                                    </select>
                                                </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary me-1 mb-1">Submit</button>
                                    </div>
                                </div>


                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12">
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
                    <div class="modal-footer">
                        <!--                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>-->
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>


            </div>
        </div>

        <%@include file="/_includes/footer.jsp"%>

        <script src="../assets/vendor/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../assets/vendor/calender/lib/jquery-ui.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script defer src="../assets/fontawesome/js/all.min.js" type="text/javascript"></script>
        <script src="../assets/js/feather-icons/feather.min.js"></script>
        <script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script><!-- comment -->
        <script src="../assets/js/app.js"></script>
        <script src="../assets/js/pages/users.js"></script>
        <script src="../assets/js/main.js"></script>
        <script type="text/javascript">
                                                        $(document).ready(function () {
                                                            var app = "/hrh";
                                                            $(document).on('click', '.edit-user', function (e) {
                                                                e.preventDefault();
                                                                var typeId = $(this).data('id');
                                                                console.log("Type id: " + typeId);
                                                                OpenBootstrapPopup(typeId);

                                                            });
                                                            $(document).on('click', '#delete_user', function (e) {
                                                                e.preventDefault();
                                                                var typeId = $(this).data('id');
                                                                console.log("Type id: " + typeId);
                                                                SwalDelete(typeId);

                                                            });

                                                            function OpenBootstrapPopup(id) {
                                                                var userid = id;
                                                                $.ajax({
                                                                    type: "GET",
                                                                    url: app + '/ManageUsers?action=edit&userid=' + userid,
                                                                    contentType: "application/json; charset-utf-8",
                                                                    dataType: "json",
                                                                    //                            data: {
                                                                    //                                'id': holiday_id
                                                                    //                            },
                                                                    success: function (data) {
                                                                        console.log(eval(data));
                                                                        document.getElementById('txt_userid').value = data.userid;
                                                                        document.getElementById('txtSurname').value = data.lname;
                                                                        document.getElementById('txtFirstName').value = data.fname;
//                                                                        document.getElementById('txtMiddleName').value = data.hrs_per_week;
                                                                        document.getElementById('txtPhone').value = data.phone;
                                                                        document.getElementById('txtEmail').value = data.email;
//                                                                        document.getElementById('ddlLevel').value = data.hrs_per_week;

                                                                    },
                                                                    complete: function () {
                                                                        $("#userModal").modal('show');
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
                                                                                url: './CarderTypeUpdates', //ajax codes start for delete data
                                                                                type: 'POST',
                                                                                data: data,
                                                                                dataType: 'JSON'
                                                                            })
                                                                                    .done(function (response) {
                                                                                        swal('Deleted!', response.message, response.status);    //after process done on delete.jsp file get JSON response display message "Fruit Delete Successfully"
                                                                                        var url_ = "manage_carder_type.jsp";
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


                                                        });
        </script>

        <%@include file="/_includes/include_footer.jsp"%>

    </body>

</html>