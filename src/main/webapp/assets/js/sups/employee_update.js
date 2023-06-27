getEmpDet();
"use strict";
function getEmpDet() {
    var app = "/hrh";
    var emp_no = $("#employee_id").val();
    ;

    $.ajax({
        url: app + "/ProcessStaff?action=edit",
        method: 'GET',
        dataType: 'json',
        data: {
            'emp_no': emp_no
        },
        success: function (data) {
            console.log(data);
            var mstatus, gender_, disabled, helb_check, county_id, county, district, district_id, facility, mflcode, scarder, scarder_id, ctype, ctype_id, position, position_id, financialyear, financialyearid;
            mstatus = data.marital_status;
            gender_ = data.gender;
            disabled = data.disability;
            helb_check = data.helb_clearance_no;
            county_id = data.CountyID;
            county = data.county;
            district = data.DistrictNom;
            district_id = data.DistrictID;
            facility = data.SubPartnerNom;
            mflcode = data.mfl;
            scarder = data.standardized_cadre_name;
            scarder_id = data.standard_id;
            ctype_id = data.cat_id;
            ctype = data.cadre_type_name;
            position = data.position_name;
            position_id = data.position_id;
            financialyear = data.fy_name;
            financialyearid = data.fy_id;

            if (county === "") {
                console.log("We are missing this record");
            } else {
                $('#ddlCounty').append('<option selected="selected" value="' + county_id + '">' + county + '</option>');
            }
            if (district === "") {
                console.log("We are missing this record");
            } else {
                $('#ddlSubcounty').append('<option selected="selected" value="' + district_id + '">' + district + '</option>');
            }
            if (mflcode === "") {
                console.log("We are missing this record");
            } else {
                $('#ddlFacility').append('<option selected="selected" value="' + mflcode + '">' + facility + '</option>');
            }
            if (scarder === "") {
                console.log("We are missing this record");
            } else {
                $('#ddlCadreCategory').append('<option selected="selected" value="' + scarder_id + '">' + scarder + '</option>');
            }
            if (ctype === "") {
                console.log("We are missing this record");
            } else {
                $('#ddlEmployeeType').append('<option selected="selected" value="' + ctype_id + '">' + ctype + '</option>');
            }
            if (position === "") {
                console.log("We are missing this record");
            } else {
                $('#ddlPos').append('<option selected="selected" value="' + position_id + '">' + position + '</option>');
            }
            if (financialyear === "") {
                console.log("We are missing financial year this record");
            } else {
                $('#ddlFY').append('<option selected="selected" value="' + financialyearid + '">' + financialyear + '</option>');
            }




            document.getElementById('txtSurname').value = data.surname;

            document.getElementById('txtFirstName').value = data.first_name;

            document.getElementById('txtMiddleName').value = data.other_name;

            document.getElementById('txtHomeAddress').value = data.home_address;

            document.getElementById('txtPostalCode').value = data.postal_code;

            document.getElementById('txtNationality').value = data.nationality;

            document.getElementById('txtBirthDate').value = data.dob;
            document.getElementById('txtEmail').value = data.email;
            document.getElementById('txtPhone').value = data.phone;
            document.getElementById('txtNationalID').value = data.national_id;
            document.getElementById('txtEmployeeNumber').value = data.emp_no;
            document.getElementById('hiredate').value = data.date_started;


            //  console.log(data.DistrictNom + data.DistrictID);












            document.getElementById('contract_period').value = data.contract_period;
            document.getElementById('end_date').value = data.contract_end_date;
            document.getElementById('contract_no_months').value = data.expected_months;
            document.getElementById('year').value = data.financial_year;


            if (mstatus === "") {
                console.log("We are missing this record");
            } else {
                $('#ddlMaratialStatus').append('<option selected="selected" value="' + mstatus + '">' + mstatus + '</option>');
            }

            if (gender_.toUpperCase() === 'FEMALE')
                $('#gender').find(':radio[name=rbtnGender][value="' + gender_.toUpperCase() + '"]').prop('checked', true);
            else
                $('#gender').find(':radio[name=rbtnGender][value="' + gender_.toUpperCase() + '"]').prop('checked', true);


            if (disabled === "0") {
                $('#disabilityRadio').find(':radio[name=rbtnDisability][value="0"]').prop('checked', true);
            } else {
                $('#disabilityRadio').find(':radio[name=rbtnDisability][value="1"]').prop('checked', true);
                document.getElementById('txtDisabilityExplain').value = data.disability_explain;
            }

            document.getElementById('txtEmployeeNumber').value = data.emp_no;
            document.getElementById('txtPinCode').value = data.kra_pin;
            document.getElementById('txtNSSF').value = data.nssf_no;
            document.getElementById('txtNHIF').value = data.nhif_no;
            document.getElementById('txtBankName').value = data.bank_name;
            document.getElementById('txtBranchName').value = data.branch;
            document.getElementById('txtAccountName').value = data.account_name;
            document.getElementById('txtAccountNumber').value = data.acount_number;



            if (helb_check === "") {
                $('#heldCheck').find(':radio[name=rbtnHelb][value="0"]').prop('checked', true);
            } else {
                $('#heldCheck').find(':radio[name=rbtnHelb][value="1"]').prop('checked', true);
                document.getElementById('txtHelbClearance').value = data.helb_clearance_no;
            }

            document.getElementById('txtGoodConduct').value = data.cert_good_conduct_no;

        },
        complete: function () {
            $('#cadre_type_table').DataTable();
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }

    });
}
;


