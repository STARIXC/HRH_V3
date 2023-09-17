$(function () {
  $("#save_data").click(function () {
    $("#loading").html('<img src="../img/ajax-loader.gif"> loading...');
    $("#form_data").validate({
      rules: {
        txtSurname: {
          required: true,
        },
        txtFirstName: {
          required: true,
        },
        txtMiddleName: {
          required: true,
        },
        txtHomeAddress: {
          required: true,
        },
        txtPostalCode: {
          required: true,
        },
        txtNationality: {
          required: true,
        },
        txtBirthDate: {
          required: true,
        },
        rbtnGender: {
          required: true,
        },
        ddlMaratialStatus: {
          required: true,
        },
        txtEmail: {
          required: true,
        },
        txtPhone: {
          required: true,
        },
        txtNationalID: {
          required: true,
        },
        ddlCounty: {
          required: true,
        },
        ddlSubcounty: {
          required: true,
        },
        ddlFacility: {
          required: true,
        },
        ddlEmployeeType: {
          required: true,
        },
        ddlCadreCategory: {
          required: true,
        },
        ddlDesignation: {
          required: true,
        },
        txtEmployeeNumber: {
          required: true,
        },
        txtJoinDate: {
          required: true,
        },
        txtTerminateDate: {
          required: true,
        },
        termreason: {
          required: true,
        },
        volunt_termination: {
          required: true,
        },
        txtRehiredate: {
          required: true,
        },
        txtPinCode: {
          required: true,
        },
        txtNSSF: {
          required: true,
        },
        txtNHIF: {
          required: true,
        },
        txtGoodConduct: {
          required: true,
        },
        rbtnHelb: {
          required: true,
        },
        txtHelbClearance: {
          required: function (element) {
            return $("#rbtnHelb").val() === "1";
          },
        },
        txtBankName: {
          required: true,
        },
        txtBranchName: {
          required: true,
        },
        txtAccountName: {
          required: true,
        },
        txtAccountNumber: {
          required: true,
        },
      },
      messages: {
        txtSurname: "please enter Surname",
        txtFirstName: "please enter the First Name",
        txtMiddleName: "please enter the Other Name",
        txtHomeAddress: "please enter the Home Address",
        txtPostalCode: "please enter the Postal Code",
        txtNationality: "please enter Nationality",
        txtBirthDate: "Please Choose the date of Birth",
        rbtnGender: "please Choose the Gender",
        ddlMaratialStatus:
          "Please Select the Marital Status from the drop down options",
        txtEmail: "please enter the Email Address",
        txtPhone: "please enter the Phone Number",
        txtNationalID: "please enter the National ID/Passport  Number",
        ddlCounty: "Please Select the County from the drop down options",
        ddlSubcounty: "Please Select the SubCounty from the drop down options",
        ddlFacility: "Please Select the Facility from the drop down options",
        ddlEmployeeType:
          "Please Select the HRH Type from the drop down options",
        ddlCadreCategory: "Please Select the Cadre from the drop down options",
        ddlDesignation:
          "Please Select the Designation/Position from the drop down options",
        txtEmployeeNumber: "please enter the Employee Number",
        txtJoinDate: "Please Choose the employment date",
        txtTerminateDate: "Please Choose the date of termination",
        termreason: "please enter reason for termination",
        volunt_termination: "please choose if voluntary termination ",
        txtRehiredate: "Please Choose the date rehired",
        txtPinCode: "please enter the KRA PIN Number",
        txtNSSF: "please enter the NSSF Number",
        txtNHIF: "please enter the NHIF Number",
        txtGoodConduct: "please enter the Certificate of Good Conduct Number",
        rbtnHelb: "please choose if helb benefitiary",
        txtHelbClearance: "please enter the HELB Clearence Number",
        txtBankName: "please enter Bank Name",
        txtBranchName: "please enter Bank Branch",
        txtAccountName: "please enter Account Name",
        txtAccountNumber: "please enter Account Number",
      },
      submitHandler: function (form) {
        // just for demo
        //create variables from the form

        var surname = $("#txtSurname").val();
        var first_name = $("#txtFirstName").val();
        var other_name = $("#txtMiddleName").val();
        var home_address = $("#txtHomeAddress").val();
        var postal_code = $("#txtPostalCode").val();
        var nationality = $("#txtNationality").val();
        var dob = $("#txtBirthDate").val();
        var gender = $("#rbtnGender").val();
        var marital_status = $("#ddlMaratialStatus").val();
        var email = $("#txtEmail").val();
        var phone = $("#txtPhone").val();
        var national_id = $("#txtNationalID").val();
        var county = $("#ddlCounty").val();
        var subcounty = $("#ddlSubcounty").val();
        var mfl = $("#ddlFacility").val();
        var emp_type = $("#ddlEmployeeType").val();
        var cadre = $("#ddlCadreCategory").val();
        var position = $("#ddlDesignation").val();
        var emp_no = $("#txtEmployeeNumber").val();
        var date_started = $("#txtJoinDate").val();
        var date_ended = $("#txtTerminateDate").val();
        var termination_reason = $("#termreason").val();
        var voluntary_termination = $("#volunt_termination").val();
        var date_rehired = $("#txtRehiredate").val();
        var kra_pin = $("#txtPinCode").val();
        var nssf_no = $("#txtNSSF").val();
        var nhif_no = $("#txtNHIF").val();
        var cert_good_conduct_no = $("#txtGoodConduct").val();
        var helb_benefitiary = $("#rbtnHelb").val();
        var helb_clearance_no = $("#txtHelbClearance").val();
        var bank_name = $("#txtBankName").val();
        var branch = $("#txtBranchName").val();
        var account_name = $("#txtAccountName").val();
        var acount_number = $("#txtAccountNumber").val();

        var dataString = {
          emp_no: emp_no,
          first_name: first_name,
          surname: surname,
          other_name: other_name,
          national_id: national_id,
          county: county,
          subcounty: subcounty,
          gender: gender,
          marital_status: marital_status,
          phone: phone,
          email: email,
          dob: dob,
          home_address: home_address,
          postal_code: postal_code,
          nationality: nationality,
          disability: disability,
          disability_explain: disability_explain,
          mfl: mfl,
          cadre: cadre,
          position: position,
          emp_type: emp_type,
          termination_reason: termination_reason,
          voluntary_termination: voluntary_termination,
          date_rehired: date_rehired,
          date_started: date_started,
          date_ended: date_ended,
          current_contract: current_contract,
          contract_period: contract_period,
          contract_end_date: contract_end_date,
          bank_name: bank_name,
          branch: branch,
          account_name: account_name,
          acount_number: acount_number,
          kra_pin: kra_pin,
          nssf_no: nssf_no,
          nhif_no: nhif_no,
          cert_good_conduct_no: cert_good_conduct_no,
          helb_clearance_no: helb_clearance_no,
          helb_benefitiary: helb_benefitiary,
        };

        $.ajax({
          type: "POST",
          url: "./AllStaffServlet",
          data: dataString,
          success: function (result) {
            setTimeout(function () {
              $("#loading").html(result);
              $("#form_data")[0].reset();
            }, 2000);
        },
          error: function () {
            alert("Sorry !This didn't work . Please Contact the Admin");
          },
        });
        return false;
      },
      //
    });
  });
});


