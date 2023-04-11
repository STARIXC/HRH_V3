<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Employee</title>

        <link rel="stylesheet" href="../assets/css/custom.css">
        <link rel="shortcut icon" href="../assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <link rel="stylesheet" href="../assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="../assets/css/toggle.css">
        <link rel="stylesheet" href="../assets/vendor/DataTables/datatables.css">
        <link href="../assets/vendor/swal2/sweetalert2.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="../assets/vendor/calender/lib/jquery-ui.min.css" />
        <link rel="stylesheet" href="../assets/vendor/calender/lib/bootstrap-datepicker.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="../assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="../assets/css/style.css">

        <style type="text/css">
            .notif:hover{
                background-color: rgba(0,0,0,0.1);
            }
            .fade:not(.show) {
                opacity: 1 !important;
            }
        </style>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <!-- Font Awesome CSS-->
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
                                <li class="breadcrumb-item active" aria-current="page">Add Staff</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                        <a href="manage_employee.jsp" class="btn btn-success float-end m-l-20 hidden-xs hidden-sm waves-effect waves-light"><i class="fa fa-list-ul" aria-hidden="true"></i> View Staff</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card text-white">
                            <div class="card-header bg-info"><i class="fa fa-plus-square fa-fw"></i>  Add Staff
                            </div>
                            <div class="card-wrapper" >
                                <div class="card-body">
                                    <section id="multiple-column-form_">
                                        <form  id="createEmployee" enctype="multipart/form-data" method="post" accept-charset="utf-8">
                                            <div class="row">
                                                <div class="empform">

                                                    <!-- Nav tabs -->
                                                    <ul class="nav nav-tabs">
                                                        <li class="nav-item">
                                                            <a class="nav-link active" data-bs-toggle="tab" href="#home">Basic Information</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" data-bs-toggle="tab" href="#menu1">Official Information</a>
                                                        </li>
                                                        <!--                                                                <li class="nav-item">
                                                                                                                            <a class="nav-link" data-bs-toggle="tab" href="#menu2">Supervisor</a>
                                                                                                                        </li>-->
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
                                                                    <div class="card_">

                                                                        <div class="card-body">
                                                                            <div class=" box">

                                                                                <div class="header">
                                                                                    <div class="headingOftabel">
                                                                                        <h4>
                                                                                            Basic <span>Information</span>
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
                                                                                        <div class="col-md-4 col-sm-6 col-xs-12">
                                                                                            <div class="form-group">
                                                                                                <label class="col-md-12 control-label"> Disability <span class="required">*</span>
                                                                                                </label>
                                                                                                <div class="col-md-12">
                                                                                                    <label class="radio-inline"> <input
                                                                                                            id="rbtnDisability_yes" type="radio" name="rbtnDisability"
                                                                                                            value="1" checked="checked" /><label
                                                                                                            for="rbtnDisability">Yes</label>
                                                                                                    </label> <label class="radio-inline"> <input
                                                                                                            id="rbtnDisability_no" type="radio" name="rbtnDisability"
                                                                                                            value="0" /> <label for="rbtnDisability_no">No</label>
                                                                                                    </label>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-md-8 col-sm-12 col-xs-12">
                                                                                            <div class="form-group">
                                                                                                <label class="col-md-12 control-label"> Disability Explain <span class="required">*</span>
                                                                                                </label>
                                                                                                <div class="col-md-12">
                                                                                                    <textarea value="" maxlength="200" id="txtDisabilityExplain" class="form-control input-width-xlarge" name="txtDisabilityExplain" rows="5" cols="10"></textarea>
                                                                                                    <span
                                                                                                        id="rfvDisabilityExplain" class="required"
                                                                                                        style="display: none">Please Explain type of Disability.</span> <br />
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
                                                                    <div class="card_">

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
                                                                                                    <select class="form-control" onchange='patafacility();' name='ddlSubcounty' id='ddlSubcounty'>

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
                                                                                                <label class="col-md-12 control-label"> Employee Type
                                                                                                    <span class="required">*</span>
                                                                                                </label>
                                                                                                <div class="col-md-12">
                                                                                                    <select class="form-control"
                                                                                                            onchange="pataStandard();" name='ddlEmployeeType'
                                                                                                            id='ddlEmployeeType'>


                                                                                                    </select>

                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-md-4 col-sm-6 col-xs-12">
                                                                                            <div class="form-group">
                                                                                                <label class="col-md-12 control-label"> Cadre
                                                                                                    Category <span class="required">*</span>
                                                                                                </label>
                                                                                                <div class="col-md-12">
                                                                                                    <select class="form-control" onchange='pataPositions();' name='ddlCadreCategory' id='ddlCadreCategory'>

                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-md-4 col-sm-6 col-xs-12">
                                                                                            <div class="form-group">
                                                                                                <label class="col-md-12 control-label">Position /Designation <span class="required">*</span>
                                                                                                </label>
                                                                                                <div class="col-md-12">
                                                                                                    <select class="form-control" name='ddlPos'
                                                                                                            id='ddlPos'>

                                                                                                    </select>
                                                                                                    <span id="Pos"></span>

                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="row">

                                                                                        <div class="col-md-4 col-sm-6 col-xs-12">
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


                                                                                        <div class="col-sm-4">
                                                                                            <div class="form-group">
                                                                                                <label for="ddlFY">Contract Financial Year</label>
                                                                                                <select name="ddlFY" id="ddlFY" class="form-control" onchange="patafydetails();" >
                                                                                                    <option selected>Choose...</option>
                                                                                                </select>
                                                                                                <input type="hidden" class="form-control  input-width-xlarge" name="start_date" id="start_date" >
                                                                                                <input type="hidden" class="form-control  input-width-xlarge" name="contract_period" id="contract_period" >
                                                                                                <input type="hidden" class="form-control  input-width-xlarge" name="end_date" id="end_date" >
                                                                                                <input type="hidden" class="form-control  input-width-xlarge" name="contract_no_months" id="contract_no_months" >
                                                                                                <input type="hidden" class="form-control  input-width-xlarge" name="year" id="year" >

                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-sm-4">
                                                                                            <div class="form-group ">
                                                                                                <label for="work_hour">Hire Date <sup class="color-red ">*</sup></label>
                                                                                                <div class="col-md-12">
                                                                                                    <input type="text" class="form-control datepicker input-width-xlarge" name="hiredate" id="hiredate" placeholder="Hire date" autocomplete="off">
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>

                                                                                        <!--            //    var start_date = $('#ddlFY').data("start_date");
                                                                                        //    var contract_period = $('#ddlFY').data("period");
                                                                                        //    var end_date = $('#ddlFY').data("end_date");
                                                                                        //    var contract_no_months = $('#ddlFY').data("expected_months");
                                                                                        //    var year = $('#ddlFY').data("year");-->


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

                                                        <div class="tab-pane fade" id="menu3">
                                                            <div class="row">
                                                                <div class="col-sm-12 col-md-12 employee-form">
                                                                    <div class="card_">

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
                                                                    <div class="card_">

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

<%@include file="/_includes/footer.jsp"%>

<script src="../assets/vendor/jquery/jquery.min.js" type="text/javascript"></script>
<script src="../assets/vendor/calender/lib/jquery-ui.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="../assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
<script src="../assets/vendor/DataTables/datatables.js"></script>
<script defer src="../assets/fontawesome/js/all.min.js" type="text/javascript"></script>
<script src="../assets/js/feather-icons/feather.min.js"></script>
<script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="../assets/js/pages/form_.js"></script>
<script src="../assets/js/pages/front.js"></script>
<script src="../assets/js/app.js"></script>
<script src="../assets/js/main.js"></script>
<script src="../assets/js/pages/position_cadre_loader.js"></script>
<script src="../assets/js/pages/employee.js"></script>

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
<%@include file="/_includes/include_footer.jsp"%>
</body>
</html>
