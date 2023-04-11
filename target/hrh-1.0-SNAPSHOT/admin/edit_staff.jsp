<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Employee</title>
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">

        <script defer src="../assets/fontawesome/js/all.min.js"></script>
        <link rel="stylesheet"
              href="../assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="../assets/css/style.css">
        <link rel="stylesheet" href="../assets/css/custom.css">
        <style type="text/css">
            .notif:hover {
                background-color: rgba(0, 0, 0, 0.1);
            }
        </style>
        <link href="../assets/vendor/select2/dist/css/select2.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../assets/vendor/calender/lib/jquery-ui.min.css" />
        <link rel="stylesheet"
              href="../assets/vendor/calender/lib/bootstrap-datepicker.css" />
        <link rel="stylesheet" href="../assets/css/select2.min.css" />
        <!-- Font Awesome CSS-->
    </head>
    <body>

        <%@include file="/_includes/header.jsp"%>

        <button class="sidebar-toggler btn x">
            <i data-feather="x"></i>
        </button>
    </div>
</div>
<div id="main">
    <nav class="navbar navbar-header navbar-expand navbar-light">
        <a class="sidebar-toggler" href="#"><span
                class="navbar-toggler-icon"></span></a>
        <button class="btn navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul
                class="navbar-nav d-flex align-items-center navbar-light ms-auto">
                <li class="dropdown nav-icon"><a href="#"
                                                 data-bs-toggle="dropdown"
                                                 class="nav-link  dropdown-toggle nav-link-lg nav-link-user">
                        <div class="d-lg-inline-block">
                            <i data-feather="bell"></i><span class="badge bg-info">2</span>
                        </div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end dropdown-menu-large">
                        <h6 class='py-2 px-4'>Notifications</h6>
                        <ul class="list-group rounded-none">
                            <li class="list-group-item border-0 align-items-start">
                                <div class="row mb-2">
                                    <div class="col-md-12 notif">
                                        <a href="leave_details.jsp"><h6 class='text-bold'>John
                                                Doe</h6>
                                            <p class='text-xs'>applied for leave at 05-21-2021</p></a>
                                    </div>
                                    <div class="col-md-12 notif">
                                        <a href="leave_details.jsp"><h6 class='text-bold'>Jane
                                                Doe</h6>
                                            <p class='text-xs'>applied for leave at 05-21-2021</p></a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div></li>
                <li class="dropdown"><a href="#" data-bs-toggle="dropdown"
                                        class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                        <div class="avatar me-1">
                            <img src="../assets/images/admin.png" alt="" srcset="">
                        </div>
                        <div class="d-none d-md-block d-lg-inline-block">Hi, Admin</div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end">
                        <a class="dropdown-item" href="#"><i data-feather="user"></i>
                            Account</a> <a class="dropdown-item" href="#"><i
                                data-feather="settings"></i> Settings</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="login.jsp"><i
                                data-feather="log-out"></i> Logout</a>
                    </div></li>
            </ul>
        </div>
    </nav>

    <div class="main-content container-fluid">
        <div class="page-title">
            <div class="row">
                <div class="col-12 col-md-6 order-md-1 order-last">
                    <h3>Add Employee</h3>
                </div>
                <div class="col-12 col-md-6 order-md-2 order-first">
                    <nav aria-label="breadcrumb" class='breadcrumb-header'>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp"
                                                           class="text-success">Dashboard</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Add
                                Employee</li>
                        </ol>
                    </nav>
                </div>
            </div>

        </div>
        <section id="multiple-column-form">

            <form  id="createEmployee" enctype="multipart/form-data" method="post" accept-charset="utf-8">
                <div class="row">
                    <div class="empform">

                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="tab" href="#home">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#menu1">Official Information</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#menu2">Supervisor</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#menu3">Statutory Info</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#menu4">Banking Info</a>
                            </li>

                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">

                            <div class="tab-pane  active" id="home">
                                <div class="row">
                                    <div class="col-sm-12 col-md-12 employee-form">
                                        <div class="card">

                                            <div class="card-body">
                                                <div class=" box">

                                                    <div class="header">
                                                        <div class="headingOftabel">
                                                            <h4>
                                                                Official <span>Information</span>
                                                            </h4>
                                                        </div>
                                                    </div>
                                                    <div class="card-content">
                                                        <div class="row">
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="form-group">
                                                                    <label class="col-md-12 control-label">
                                                                        Surname Name <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12">
                                                                        <input name="txtSurname" type="text" value=""
                                                                               maxlength="50" id="txtSurname"
                                                                               class="form-control input-width-xlarge" /> <span
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
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="form-group">
                                                                    <label class="col-md-12 control-label">
                                                                        Home Address <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12">
                                                                        <input name="txtHomeAddress" type="text" value=""
                                                                               maxlength="50" id="txtSurname"
                                                                               class="form-control input-width-xlarge" /> <span
                                                                               id="rfvHomeAddress" class="required"
                                                                               style="display: none">Please enter Home
                                                                            Address.</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="form-group">
                                                                    <label class="col-md-12 control-label">
                                                                        Postal Code <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12">
                                                                        <input name="txtPostalCode" type="text" value=""
                                                                               maxlength="50" id="txtPostalCode"
                                                                               class="form-control input-width-xlarge" /> <span
                                                                               id="rfvPostalCode" class="required"
                                                                               style="display: none">Please enter Home
                                                                            Address.</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="form-group">
                                                                    <label class="col-md-12 control-label">
                                                                        Nationality <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12">
                                                                        <input name="txtNationality" type="text" value=""
                                                                               maxlength="50" id="txtNationality"
                                                                               class="form-control input-width-xlarge" /> <span
                                                                               id="rfvPostalCode" class="required"
                                                                               style="display: none">Please enter Home
                                                                            Address.</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="form-group">
                                                                    <label class="col-md-12 control-label">
                                                                        Date of Birth <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12 date-select">
                                                                        <input name="txtBirthDate" type="text"
                                                                               id="txtBirthDate"
                                                                               class=" form-control input-width-xlarge txtBirthDate"
                                                                               value="" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="form-group">
                                                                    <label class="col-md-12 control-label">
                                                                        Gender <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12">
                                                                        <label class="radio-inline"> <input
                                                                                id="rbtnMale" type="radio" name="rbtnGender"
                                                                                value="Male" /><label for="rbtnMale">Male</label>
                                                                        </label> <label class="radio-inline"> <input
                                                                                id="rbtnFeMale" type="radio" name="rbtnGender"
                                                                                value="Female" /><label for="rbtnFeMale">FeMale</label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="form-group">
                                                                    <label class="col-md-12 control-label">
                                                                        Maratial Status <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12">
                                                                        <select name="ddlMaratialStatus"
                                                                                id="ddlMaratialStatus"
                                                                                class="form-control input-width-xlarge">
                                                                            <option value="">-- Select --</option>
                                                                            <option value="Single">SINGLE</option>
                                                                            <option value="Married">MARRIED</option>
                                                                            <option value="Widowed">WIDOWED</option>
                                                                            <option value="Divorced">DIVORCED</option>
                                                                        </select> <span id="rfvMaratialStatus" class="required"
                                                                                        style="display: none">Please select
                                                                            Maratial Status.</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="form-group">
                                                                    <label class="col-md-12 control-label">
                                                                        Email Address <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12">
                                                                        <input name="txtEmail" type="email" value=""
                                                                               id="txtEmail"
                                                                               class="form-control input-width-xlarge" />  
                                                                        <span id="email_v_message"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="form-group">
                                                                    <label class="col-md-12 control-label">
                                                                        Phone Number <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12">
                                                                        <input name="txtPhone" type="text" value=""
                                                                               maxlength="50" id="txtPhone"
                                                                               class="form-control input-width-xlarge" /> <span
                                                                               id="rfvPhone" class="required"
                                                                               style="display: none">Please enter Phone
                                                                            Number.</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="form-group">
                                                                    <label class="col-md-12 control-label">
                                                                        National ID/Passport Number <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12">
                                                                        <input name="txtNationalID" type="text" value=""
                                                                               maxlength="50" id="txtNationalID"
                                                                               class="form-control input-width-xlarge" /> <span
                                                                               id="rfNationalID" class="required"
                                                                               style="display: none">Please enter
                                                                            National ID or Passport Number.</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-margin text-right">

                                                        <input type="button" class="btn btn-primary btnNext" onclick="valid_inf()" value="NEXT">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                            </div>
                            <div class="tab-pane  fade" id="menu1">
                                <div class="row">
                                    <div class="col-sm-12 col-md-12 employee-form">
                                        <div class="card">

                                            <div class="card-body">
                                                <div class=" box">
                                                    <div class="header">
                                                        <div class="headingOftabel">
                                                            <h4>
                                                                Official <span>Information</span>
                                                            </h4>
                                                        </div>
                                                    </div>
                                                    <div class="card-content">
                                                        <div class="row">
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="form-group efirst">
                                                                    <label class="col-md-12 control-label"> County
                                                                        <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12">
                                                                        <select class="form-control"
                                                                                onchange="patasubcounty();" name='ddlCounty'
                                                                                id='ddlCounty'>


                                                                        </select>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="form-group">
                                                                    <label class="col-md-12 control-label"> Sub
                                                                        County<span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12">
                                                                        <select class="form-control"
                                                                                onchange='patafacility();' name='ddlSubcounty'
                                                                                id='ddlSubcounty'>

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="form-group">
                                                                    <label class="col-md-12 control-label"> Duty
                                                                        Station / Facility <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12">
                                                                        <select class="form-control" name='ddlFacility'
                                                                                id='ddlFacility'>

                                                                        </select>
                                                                        <span id="facil"></span>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="form-group efirst">
                                                                    <label class="col-md-12 control-label">
                                                                        Employee Type <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12">
                                                                        <select name="ddlEmployeeType" id="ddlEmployeeType"
                                                                                class="form-control" onchange='pataStandard();'
                                                                                >

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="form-group">
                                                                    <label class="col-md-12 control-label"> Cadre
                                                                        Category<span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12">
                                                                        <select class="form-control" name='ddlCadreCategory'
                                                                                id='ddlCadreCategory' onchange="pataPositions();">

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 col-sm-6 col-xs-12">
                                                                <div class="form-group">
                                                                    <label class="col-md-12 control-label">
                                                                        Designation / Position <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12">
                                                                        <select name="ddlDesignation" id="ddlDesignation"
                                                                                class="form-control input-width-xlarge">

                                                                        </select>
                                                                        <span id="desig"></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row">

                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <div class="form-group">
                                                                    <label class="col-md-12 control-label">
                                                                        Employee No <span class="required">*</span>
                                                                    </label>
                                                                    <div class="col-md-12">
                                                                        <input name="txtEmployeeNumber" type="text" value=""
                                                                               maxlength="50" id="txtEmployeeNumber"
                                                                               class="form-control input-width-xlarge" />
                                                                    </div>
                                                                </div>
                                                            </div>


                                                            <div class="col-sm-6">
                                                                <div class="form-group ">
                                                                    <label for="work_hour">Hire Date <sup class="color-red ">*</sup></label>
                                                                    <div class="col-md-12">
                                                                        <input type="text" class="form-control datepicker input-width-xlarge" name="hiredate" id="hiredate" placeholder="Hire date" autocomplete="off">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-sm-6">
                                                                <div class="form-group ">
                                                                    <label for="work_hour">Termination Date </label>
                                                                    <input type="text" class="form-control datepicker input-width-xlarge" name="terminatedate" id="tdate" placeholder="Termination date" autocomplete="off">
                                                                </div>
                                                            </div>

                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label for="work_hour">Termination Reason</label>
                                                                    <textarea class="form-control input-width-xlarge" name="termreason" id="treason" placeholder="Termination Reason"></textarea> 
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="form-group ">
                                                                    <label for="period">Voluntary Termination</label>
                                                                    <select name="volunt_termination" class="form-control input-width-xlarge " >
                                                                        <option value=""> Select One</option>
                                                                        <option value="1"> Yes</option>
                                                                        <option value="2">No</option>
                                                                    </select>

                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="form-group ">
                                                                    <label for="work_hour">Re Hire Date</label>
                                                                    <input type="text" class="form-control datepicker input-width-xlarge" name="rehiredate" id="rhdate" placeholder="Rehire date">
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="form-group form-group-margin text-right">
                                                    <input type="button" class="btn btn-primary btnPrevious" value="Previous">
                                                    <input type="button" class="btn btn-primary btnNext" onclick="valid_inf2()" value="NEXT">
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="menu2">
                                <div class="row">
                                    <div class="col-sm-12 col-md-12 employee-form">
                                        <div class="card">

                                            <div class="card-body">
                                                <div class=" box">

                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label for="s_name">Supervisor Name</label>
                                                                <select name="supervisorname" class="form-control">
                                                                    <option value="">Select One</option>
                                                                    <option value="self"> Self </option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group form-group-margin">
                                                                <label for="l_name">Is Supervisor</label>
                                                                <select name="is_supervisor" class="form-control" >
                                                                    <option value="0">No</option>
                                                                    <option value="1">Yes</option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="form-group form-group-margin text-right">
                                                            <input type="button" class="btn btn-primary btnPrevious" value="Previous">
                                                            <input type="button" class="btn btn-primary btnNext" onclick="valid_inf3()" value="NEXT">
                                                        </div>
                                                    </div>

                                                </div>   

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="menu3">
                                <div class="row">
                                    <div class="col-sm-12 col-md-12 employee-form">
                                        <div class="card">

                                            <div class="card-body">

                                                <div class="box">
                                                    <div class="heading">
                                                        <div class="headingOftabel">
                                                            <h4>
                                                                Statutory <span>Information</span>
                                                            </h4>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                                            <div class="row">
                                                                <div class="col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="form-group">
                                                                        <label class="col-md-12 control-label"> KRA
                                                                            Pin Code <span class="required">*</span>
                                                                        </label>
                                                                        <div class="col-md-12">
                                                                            <input name="txtPinCode" type="text" value=""
                                                                                   maxlength="10" id="txtPinCode"
                                                                                   class=" form-control input-width-xlarge txtNumber" />
                                                                            <span id="rfvPinCode" class="required"
                                                                                  style="display: none">Please enter Pin
                                                                                Code.</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="form-group">
                                                                        <label class="col-md-12 control-label"> NSSF
                                                                            Number <span class="required">*</span>
                                                                        </label>
                                                                        <div class="col-md-12">
                                                                            <input name="txtNSSF" type="text" value=""
                                                                                   maxlength="15" id="txtNSSF"
                                                                                   class=" form-control input-width-xlarge txtNumber" />
                                                                            <span id="rfvNSSF" class="required"
                                                                                  style="display: none">Please enter Mobile.</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="form-group">
                                                                        <label class="col-md-12 control-label"> NHIF
                                                                            Number <span class="required">*</span>
                                                                        </label>
                                                                        <div class="col-md-12">
                                                                            <input name="txtNHIF" type="text" value=""
                                                                                   maxlength="15" id="txtNHIF"
                                                                                   class=" form-control input-width-xlarge txtNumber" />
                                                                            <span id="rfvNSSF" class="required"
                                                                                  style="display: none">Please enter Mobile.</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="form-group">
                                                                        <label class="col-md-12 control-label">
                                                                            Certificate of Good Conduct No </label>
                                                                        <div class="col-md-12">
                                                                            <input name="txtGoodConduct" type="text"
                                                                                   maxlength="15" id="txtGoodConduct"
                                                                                   class=" form-control input-width-xlarge txtGoodConduct" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="form-group">
                                                                        <label class="col-md-12 control-label"> HELB
                                                                            Benefitiary <span class="required">*</span>
                                                                        </label>
                                                                        <div class="col-md-12">
                                                                            <label class="radio-inline"> <input
                                                                                    id="rbtnHelb" type="radio" name="rbtnHelb"
                                                                                    value="1" checked="checked" /><label
                                                                                    for="rbtnHelb">Yes</label>
                                                                            </label> <label class="radio-inline"> <input
                                                                                    id="rbtnHelb_no" type="radio" name="rbtnHelb"
                                                                                    value="0" /> <label for="rbtnHelb_no">No</label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="form-group">
                                                                        <label class="col-md-12 control-label"> HELB
                                                                            Clearance Certificate Number <span class="required">*</span>
                                                                        </label>
                                                                        <div class="col-md-12">
                                                                            <input name="txtHelbClearance" type="text" value=""
                                                                                   maxlength="200" id="txtHelbClearance"
                                                                                   class="form-control input-width-xlarge" /> <span
                                                                                   id="rfvHelbClearance" class="required"
                                                                                   style="display: none">Please enter Helb
                                                                                Clearance Certificate Number.</span> <br />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-margin text-right">
                                                        <input type="button" class="btn btn-primary btnPrevious" value="Previous">
                                                        <input type="button" class="btn btn-primary btnNext" onclick="valid_inf4()" value="NEXT">
                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="tab-pane fade" id="menu4">
                                <div class="row">
                                    <div class="col-sm-12 col-md-12 employee-form">
                                        <div class="card">

                                            <div class="card-body">
                                                <div class=" box">
                                                    <div class="">
                                                        <div class="headingOftabel">
                                                            <h4>
                                                                Banking <span>Information</span>
                                                            </h4>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6 col-sm-6 co-xs-12">
                                                            <div class="form-group efirst">
                                                                <label class="col-md-12 control-label"> Bank
                                                                    Name </label>
                                                                <div class="col-md-12">
                                                                    <input name="txtBankName" type="text" value=""
                                                                           maxlength="50" id="txtBankName"
                                                                           class="form-control input-width-xlarge" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-sm-6 co-xs-12">
                                                            <div class="form-group">
                                                                <label class="col-md-12 control-label">
                                                                    Branch Name </label>
                                                                <div class="col-md-12">
                                                                    <input name="txtBranchName" type="text"
                                                                           maxlength="50" id="txtBranchName"
                                                                           class="form-control input-width-xlarge" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6 col-sm-6 co-xs-12">
                                                            <div class="form-group">
                                                                <label class="col-md-12 control-label">
                                                                    Account Holder Name </label>
                                                                <div class="col-md-12">
                                                                    <input name="txtAccountName" type="text"
                                                                           maxlength="150" id="txtAccountName"
                                                                           class="form-control input-width-xlarge" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-sm-6 co-xs-12">
                                                            <div class="form-group">
                                                                <label class="col-md-12 control-label">
                                                                    Account Number </label>
                                                                <div class="col-md-12">
                                                                    <input name="txtAccountNumber" type="text" value=""
                                                                           maxlength="50" id="txtAccountNumber"
                                                                           class=" form-control input-width-xlarge txtNumber" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-margin text-right">
                                                        <input type="button" class="btn btn-primary btnPrevious" value="Previous">
                                                        <input type="submit"  class="btn btn-success" value="Save">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </form>
        </section>

        <!-- // Basic multiple Column Form section end -->
    </div>

</div>
</div>

<script src="../assets/vendor/jquery/jquery.min.js"></script>
<script src="../assets/vendor/calender/lib/jquery-ui.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/pages/form_.js"></script>
<script src="../assets/js/pages/front.js"></script>
<script src="../assets/js/pages/position_cadre_loader.js"></script>
<script src="../assets/js/pages/employee.js"></script>
<script src="../assets/vendor/select2/dist/js/select2.min.js"></script>
<!-- JavaScript files-->
<script>
                                                                $(document).ready(function () {
                                                                    $(".datepicker").datepicker();
                                                                    $("#txtJoinDate").datepicker();
                                                                    $("#txtTerminateDate").datepicker();
                                                                    $("#txtRehiredate").datepicker();
                                                                    $("#txtBirthDate").datepicker();

                                                                });
</script>
<script src="../assets/js/feather-icons/feather.min.js"></script>
<script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="../assets/js/app.js"></script>
<script src="../assets/js/main.js"></script>
<%@include file="/_includes/include_footer.jsp"%>
</body>
</html>
