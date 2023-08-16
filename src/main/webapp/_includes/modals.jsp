<div id="simpleModal" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog  modal-xl" role="document">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Employee Form</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">

                </button>
            </div>
            <form method="POST"  enctype="multipart/form-data" id="AddEmpForm_" class="form-horizontal" autocomplete="off">
                <div class="modal-body">

                    <div class="form-body">

                        <div class="row">
                            <div class="col-sm-12 col-md-3 employee-form">
                                <div class="picture-container">
                                    <div class="picture">
                                        <img src="assets/img/mystery-person.png" class="picture-src" id="wizardPicturePreview" title="">
                                        <input type="file" id="wizard-picture" class="employeePassport">
                                    </div>
                                    <h6 class="btn btn-md btn-info mt-3">Choose Picture</h6>

                                </div>
                            </div>

                            <div class="col-sm-12 col-md-8 employee-form">
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
                                                                       class="form-control input-width-xlarge" autocomplete="off"/> <span
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
                                                                       class="form-control input-width-xlarge" autocomplete="off"/>
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
                                                                       class="form-control input-width-xlarge" autocomplete="off" />
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
                                                                       class="form-control input-width-xlarge" autocomplete="off" />  
                                                                <span id="email_v_message"></span>
                                                            </div>
                                                        </div>
                                                    </div>      
                                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="col-md-12 control-label">
                                                                National ID/Passport No# <span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-12">
                                                                <input name="txtNationalID" type="text" value=""
                                                                       maxlength="50" id="txtNationalID"
                                                                       class="form-control input-width-xlarge" /> <span
                                                                       id="rfNationalID" class="required"
                                                                       style="display: none">Please enter
                                                                    National ID or Passport No#.</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="col-md-12 control-label">
                                                                Employee No <span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-12">
                                                                <input name="txtEmployeeNumber" type="text" value=""
                                                                       maxlength="50" id="txtEmployeeNumber"
                                                                       class="form-control input-width-xlarge" autocomplete="off" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                                        <div class="form-group efirst">
                                                            <label class="col-md-12 control-label"> Employee Type
                                                                <span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-12">
                                                                <select class="form-control"  name='ddlEmployeeType' id='ddlEmployeeType' autocomplete="off">
                                                                </select>

                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="row">

                                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="col-md-12 control-label">Employee Status<span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-12">
                                                                <select name="eStatus" id="eStatus" class="form-control" required="required" tabindex="-1" aria-hidden="true"
                                                                        autocomplete="off">
                                                                    <option value="">- Select -</option>
                                                                    <option value="1">Active</option>
                                                                    <option value="2">Inactive</option>
                                                                    <option value="3">Terminated</option>
                                                                    <option value="4">Deceased</option>
                                                                    <option value="5">Resigned</option>
                                                                </select>
                                                                <span id="workStatus"></span>

                                                            </div>
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
                                                    <div class="col-sm-4">
                                                        <div class="form-group ">
                                                            <label for="endDate">Employee End Date <sup class="color-red ">*</sup></label>
                                                            <div class="col-md-12">
                                                                <input type="text" class="form-control datepicker input-width-xlarge" name="endDate" id="endDate" placeholder="Hire date" autocomplete="off">
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
                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input" id="show-more">
                            <label class="form-check-label" for="show-more">Show more options</label>
                        </div>
                        <div class="row extra-options">
                            <div class="col-sm-12 col-md-12 employee-form ">
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
                                                        <div class="form-group">
                                                            <label class="col-md-12 control-label"> Cadre
                                                                Category <span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-12">
                                                                <select class="form-control"  name='ddlCadreCategory' id='ddlCadreCategory'>
                                                                    <option selected>Choose...</option>
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
                                                                    <option selected>Choose...</option>
                                                                </select>
                                                                <span id="Pos"></span>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                                        <div class="form-group efirst">
                                                            <label class="col-md-12 control-label"> County
                                                                <span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-12">
                                                                <select class="form-control" name='ddlCounty'
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
                                                                <select class="form-control"  name='ddlSubcounty' id='ddlSubcounty'>
                                                                    <option selected>--Select County First--</option>
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
                                                                <select class="form-control"  name='ddlFacility'
                                                                        id='ddlFacility'>
                                                                    <option selected>--Select County First--</option>
                                                                </select>
                                                                <span id="facil"></span>

                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label for="ddlFY">Contract Financial Year</label>
                                                            <select name="ddlFY" id="ddlFY" class="form-control"  >
                                                                <option selected>Choose...</option>
                                                            </select>
                                                            <!--<input type="hidden" class="form-control  input-width-xlarge" name="start_date" id="start_date" >-->
                                                            <input type="hidden" class="form-control  input-width-xlarge" name="contract_period" id="contract_period" >
                                                            <input type="hidden" class="form-control  input-width-xlarge" name="end_date" id="end_date" >
                                                            <input type="hidden" class="form-control  input-width-xlarge" name="contract_no_months" id="contract_no_months" >
                                                            <input type="hidden" class="form-control  input-width-xlarge" name="year" id="year" >

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                </div> </div>
                            <hr/>
                            <div class="col-sm-12 col-md-12 employee-form ">
                                <div class="card_">

                                    <div class="card-body">
                                        <div class=" box">
                                            <div class="header">
                                                <div class="headingOftabel">
                                                    <h4>
                                                        Personal <span>Details</span>
                                                    </h4>
                                                </div>
                                            </div>
                                            <div class="card-content">
                                                <div class="row">
                                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="col-md-12 control-label">
                                                                Home Address <span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-12">
                                                                <input name="txtHomeAddress" type="text" value=""
                                                                       maxlength="50" id="txtHomeAddress"
                                                                       class="form-control input-width-xlarge" autocomplete="off" /> <span
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
                                                                       class="form-control input-width-xlarge" autocomplete="off" /> <span
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
                                                                       class="form-control input-width-xlarge" autocomplete="off" /> <span
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
                                                                       value=""  autocomplete="off"/>
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
                                                                Marital Status <span class="required">*</span>
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
                                                                    Marital Status.</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="col-md-12 control-label">
                                                                Alternative Email Address <span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-12">
                                                                <input name="txtAltEmail" type="email" value=""
                                                                       id="txtAltEmail"
                                                                       class="form-control input-width-xlarge" />  
                                                                <span id="email_alt_v_message"></span>
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
                                                                Alternative Phone Number 
                                                            </label>
                                                            <div class="col-md-12">
                                                                <input name="txtAltPhone" type="text" value=""
                                                                       maxlength="50" id="txtAltPhone"
                                                                       class="form-control input-width-xlarge" /> <span
                                                                       id="rfavPhone" class="required"
                                                                       style="display: none">Please enter Phone
                                                                    Number.</span>
                                                            </div>
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
                                                                    value="1" /><label
                                                                    for="rbtnDisability">Yes</label>
                                                            </label> <label class="radio-inline"> <input
                                                                    id="rbtnDisability_no" type="radio" name="rbtnDisability"
                                                                    value="0" checked="checked"  /> <label for="rbtnDisability_no">No</label>
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

                                    </div>

                                </div>
                            </div>
                            <hr/>
                            <div class="col-sm-12 col-md-12 employee-form ">
                                <div class="col-sm-12 col-md-12 employee-form ">
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

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <div class="col-sm-12 col-md-12 employee-form ">
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

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="user_notification " class=" col-md-2 mr-5 mb-5">Notification</label>
                                <span class="checkbox col-md-8 m-3"><label for="user_notification">
                                        <input type="checkbox" value="on" name="user_notification" id="user_notification"> Send the employee an welcome email.</label>
                                </span>                            
                            </div>

                        </div>

                        <div class="form-actions modal-footer">

                            <button type="submit" class="btn btn-info btn_style btn_save"><i class="fa fa-check"></i> Save</button>

                        </div>



                    </div>



                </div>
            </form>
            <!--            <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            a supervisor in linked to a facility using mflcode the action to get supervisor is started when a facility is selected. redo the code while creating servlet class, dao class to get supervisor and ajax to append the supervisor list to the input select
                        </div>-->
        </div>


    </div>
</div>
<div id="simpleModalWork" class="modal" tabindex="-1" role="dialog" data-bs-backdrop="static">
    <div class="modal-dialog  modal-xl" role="document">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Work Record</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">

                </button>
            </div>
            <form method="POST"  enctype="multipart/form-data" id="AddWorkForm_" class="form-horizontal" autocomplete="off">
                <div class="modal-body">

                    <div class="form-body">


                        <div class="row extra-options">
                            <div class="col-sm-12 col-md-12 employee-form ">
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
                                                            <label class="col-md-12 control-label"> Employee Type
                                                                <span class="required">*</span>
                                                            </label>
                                                            <input type="hidden" class="form-control  input-width-xlarge" name="emp_no" id="wemp_record" >
                                                            <div class="col-md-12">
                                                                <select class="form-control"
                                                                         name='ddlEmployeeType'
                                                                        id='wddlEmployeeType' autocomplete="off">


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
                                                                <select class="form-control"  name='ddlCadreCategory' id='wddlCadreCategory'>

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
                                                                        id='wddlPos'>

                                                                </select>
                                                                <span id="wPos"></span>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                                        <div class="form-group efirst">
                                                            <label class="col-md-12 control-label"> County
                                                                <span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-12">
                                                                <select class="form-control"
                                                                         name='ddlCounty'
                                                                        id='wddlCounty'>


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
                                                                <select class="form-control" name='ddlSubcounty' id='wddlSubcounty'>

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
                                                                <select class="form-control"  name='ddlFacility'
                                                                        id='wddlFacility'>

                                                                </select>
                                                                <span id="facil"></span>

                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                                        <div class="form-group">
                                                            <label class="col-md-12 control-label"> Reporting To <span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-12">
                                                                <select class="form-control" name='ddlSupervisor'
                                                                        id='wddlSupervisor'>

                                                                </select>
                                                                <span id="superviros"></span>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <div class="form-group">
                                                            <label for="ddlFY">Contract Financial Year</label>
                                                            <select name="ddlFY" id="wddlFY" class="form-control"  >
                                                                <option selected>Choose...</option>
                                                            </select>
                                                            <!--<input type="hidden" class="form-control  input-width-xlarge" name="start_date" id="start_date" >-->
                                                            <input type="hidden" class="form-control  input-width-xlarge" name="contract_period" id="wcontract_period" >
                                                            <input type="hidden" class="form-control  input-width-xlarge" name="end_date" id="wend_date" >
                                                            <input type="hidden" class="form-control  input-width-xlarge" name="contract_no_months" id="wcontract_no_months" >
                                                            <input type="hidden" class="form-control  input-width-xlarge" name="year" id="wyear" >

                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group ">
                                                            <label for="contractStartDate">Contract Start Date </label>
                                                            <div class="col-md-12">
                                                                <input type="text" class="form-control datepicker input-width-xlarge" name="contractStartDate" id="wcontractStartDate" placeholder="Hire date" autocomplete="off">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="form-group ">
                                                            <label for="endDate">Contract End Date </label>
                                                            <div class="col-md-12">
                                                                <input type="text" class="form-control datepicker input-width-xlarge" name="contractEndDate" id="wcontractEndDate" placeholder="Hire date" autocomplete="off">
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <!--                                                    //    var start_date = $('#ddlFY').data("start_date");
                                                                                                        //    var contract_period = $('#ddlFY').data("period");
                                                                                                        //    var end_date = $('#ddlFY').data("end_date");
                                                                                                        //    var contract_no_months = $('#ddlFY').data("expected_months");
                                                                                                        //    var year = $('#ddlFY').data("year");-->


                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                </div> </div>

                        </div>

                        <div class="form-actions modal-footer">

                            <button type="submit" class="btn btn-info btn_style btn_save"><i class="fa fa-check"></i> Save</button>

                        </div>



                    </div>



                </div>
            </form>
            <!--            <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            a supervisor in linked to a facility using mflcode the action to get supervisor is started when a facility is selected. redo the code while creating servlet class, dao class to get supervisor and ajax to append the supervisor list to the input select
                        </div>-->
        </div>


    </div>
</div>
<div id="simpleModalDoc" class="modal" tabindex="-1" role="dialog" data-bs-backdrop="static">
    <div class="modal-dialog" role="document">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Document Record</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">

                </button>
            </div>
            <form method="POST"  enctype="multipart/form-data" id="uploadForm" class="form-horizontal" autocomplete="off">
                <div class="modal-body">

                    <div class="form-body">


                        <div class="row extra-options">
                            <div class="col-sm-12 col-md-12 employee-form ">
                                <div class="card_">

                                    <div class="card-body">

                                        <div class="card-content">
                                            <div class="row">
                                                <input type="hidden" class="form-control  input-width-xlarge" name="created_by" id="created_by"  />
                                                <div class="col-12">
                                                    <div class="form-group efirst">
                                                        <label class="col-md-12 control-label"> Document Type
                                                            <span class="required">*</span>
                                                        </label>
                                                        <input type="hidden" class="form-control  input-width-xlarge" name="emp_no" id="doc_emp_record" >
                                                        <div class="col-md-12">
                                                            <select class="form-control"  name='ddlDocType'id='ddlDocType' autocomplete="off">


                                                            </select>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group doc">
                                                        <label class="col-md-12 control-label">  Document
                                                            <span class="required">*</span>
                                                        </label>

                                                        <div class="col-md-12">

                                                            <input type="file" class="form-control  input-width-xlarge" id="documentFile" name="documentFile"  />
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>


                                        </div>

                                    </div>

                                </div>

                            </div> </div>

                    </div>

                    <div class="form-actions modal-footer">

                        <button type="submit" class="btn btn-info btn_style btn_save"><i class="fa fa-check"></i> Save</button>

                    </div>



                </div>

            </form>

        </div>


    </div>


</div>
<div id="simpleModalLeaveType" class="modal" tabindex="-1" role="dialog" data-bs-backdrop="static">
    <div class="modal-dialog" role="leave_type">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Leave Type</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">

                </button>
            </div>
            <form method="POST"  enctype="multipart/form-data" id="leaveTypeForm" class="form-horizontal" autocomplete="off">
                <div class="modal-body">

                    <div class="form-body">


                        <div class="row extra-options">
                            <div class="col-sm-12 col-md-12 leave-type-form "><input type="hidden" class="form-control  input-width-xlarge" name="type_id" id="type_id"  />
                                <!-- Basic Vertical form layout section start -->
                                <div class="row">

                                    <form class="form form-vertical" id="leaveTypeForm">
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="form-group has-icon-left">
                                                        <label for="leave_name">Leave Name</label>
                                                        <div class="position-relative">
                                                            <input type="text" class="form-control" placeholder="Input leave type" id="leave_name" name="leave_name">
                                                            <div class="form-control-icon">
                                                                <i class="fa fa-table"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group has-icon-left">
                                                        <label for="leave_descriptionn">Description</label>
                                                        <div class="position-relative">
                                                            <input type="text" class="form-control" placeholder="Input Description" name="leave_description" id="leave_description">
                                                            <div class="form-control-icon">
                                                                <i class="fa fa-table"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label class="col-md-12 control-label">
                                                            Is Accrued<span class="required">*</span>
                                                        </label>
                                                        <div class="col-md-12">
                                                            <select name="is_accrued"
                                                                    id="is_accrued"
                                                                    class="form-control input-width-xlarge" required>
                                                                <option value="">-- Select --</option>
                                                                <option value="1">Yes</option>
                                                                <option value="0">No</option>

                                                            </select> <span id="rfvis_accrued" class="required"
                                                                            style="display: none">Please select
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12" id="leave-accrual" style="display:none;">
                                                    <div class="form-group has-icon-left">
                                                        <label for="email-id-icon">Accrual Rate</label>
                                                        <div class="position-relative">
                                                            <input type="text" class="form-control" placeholder="Input Accrual Rate" name="rate_" id="rate_">
                                                            <div class="form-control-icon">
                                                                <i class="fa fa-table"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <div class="form-group has-icon-left">
                                                        <label for="email-id-icon">Max Number of days Allowed</label>
                                                        <div class="position-relative">
                                                            <input type="text" class="form-control" placeholder="Input days allowed" id="max_days" name="max_days">
                                                            <div class="form-control-icon">
                                                                <i class="fa fa-table"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </form>


                                </div>
                                <!-- // Basic Vertical form layout section end -->

                            </div> </div>

                    </div>

                    <div class="form-actions modal-footer">

                        <button type="submit" class="btn btn-info btn_style btn_save"><i class="fa fa-check"></i> Save</button>

                    </div>



                </div>

            </form>

        </div>


    </div>


</div>

<div id="simpleModalLHoliday" class="modal" tabindex="-1" role="dialog" data-bs-backdrop="static">
    <div class="modal-dialog" role="holiday">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Holiday</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">

                </button>
            </div>
            <div class="row">
                <div class="card__">
                    <form   id="publicHolidayForm" class="form-horizontal" autocomplete="off">
                        <div class="modal-body">


                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-offset-2 col-md-12">
                                        <input class="form-control required " id="holiday_id"   name="holiday_id" type="hidden">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label">Holy Day Name<span class="validateRq">*</span></label>
                                            <div class="col">
                                                <input class="form-control required " id="no_of_days"   name="no_of_days" type="hidden">
                                                <input class="form-control required " id="holiday_name"  placeholder="Holiday Name" name="holiday_name" type="text">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label">From Date<span class="validateRq">*</span></label>
                                            <div class="col">
                                                <input class="form-control required datepicker" id="from_date" readonly="readonly" placeholder="From Date" name="from_date" type="text">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label ">To Date<span class="validateRq">*</span></label>
                                            <div class="col">
                                                <input class="form-control required datepicker dateField" id="to_date" readonly="readonly" placeholder="To Date" name="to_date" type="text">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label ">Comment</label>
                                            <div class="col">
                                                <textarea class="form-control comment" id="comment" placeholder="Comment" cols="30" rows="2" name="comment"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col">
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
<div id="simpleModalLB" class="modal" tabindex="-1" role="dialog" data-bs-backdrop="static">
    <div class="modal-dialog" role="leave_balance">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Update /Recreate Leave Balances</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">

                </button>
            </div>
            <div class="row">
                <div class="card__">
                    <form   id="lbForm" class="form-horizontal" autocomplete="off">
                        <div class="modal-body">


                            <div class="form-body">
                                <div class="row">
                                    <div class="col-md-offset-2 col-md-12">
                                        <div class="form-group">
                                            <label for="yearSelect">Select year:</label>
                                            <div class="col">
                                                <select id="yearSelect" name="year" class="form-control">

                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">

                                            <div class="col">

                                                <input  type="radio" id="allEmployeesRadio" name="employee" value="all" checked>
                                                <label for="allEmployeesRadio">Update leave balance for all employees</label>
                                            </div>

                                            <div class="col">
                                                <input  type="radio" id="selectEmployeeRadio" name="employee" value="select">
                                                <label for="selectEmployeeRadio">Update leave balance for a specific employee:</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">

                                            <select class="from-control employeeSelect" id="employeeSelect" name="employeeId" disabled>
                                                <option value="-1" selected>Select employee</option>


                                            </select>
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col">
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
