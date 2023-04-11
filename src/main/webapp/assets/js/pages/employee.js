"use strict";
var loadFile = function (event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
};

//$('.btnNext').click(function() {
//  const nextTabLinkEl = $('.nav-tabs .active').closest('li').next('li').find('a')[0];
//  const nextTab = new bootstrap.Tab(nextTabLinkEl);
//  nextTab.show();
//});

$('.btnPrevious').click(function () {
    const prevTabLinkEl = $('.nav-tabs .active').closest('li').prev('li').find('a')[0];
    const prevTab = new bootstrap.Tab(prevTabLinkEl);
    prevTab.show();
});



$("#txtFirstName").on('keyup', function () {
    var inpfirstname = document.getElementById('txtFirstName');
    if (inpfirstname.value.length === 0)
        return;
    document.getElementById("txtFirstName").style.borderColor = "green";
});

$("#txtSurname").on('keyup', function () {
    var inplastname = document.getElementById('txtSurname');
    if (inplastname.value.length === 0)
        return;
    document.getElementById("txtSurname").style.borderColor = "green";
});


$("#txtPhone").on('keyup', function () {
    var inputphone = document.getElementById('txtPhone');
    if (inputphone.value.length === 0)
        return;
    document.getElementById("txtPhone").style.borderColor = "green";
});

$("#txtEmail").on('keyup', function () {
    var inpemail = document.getElementById('txtEmail');
    if (inpemail.value.length === 0)
        return;
    document.getElementById("txtEmail").style.borderColor = "green";
    var reEmail = /^(?:[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+\.)*[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+@(?:(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!\.)){0,61}[a-zA-Z0-9]?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!$)){0,61}[a-zA-Z0-9]?)|(?:\[(?:(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\.){3}(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\]))$/;

    if (!(inpemail.value).match(reEmail)) {

        document.getElementById("email_v_message").innerHTML = "Invalid email address";
        document.getElementById("txtEmail").style.borderColor = "red";
        return false;
    }
    document.getElementById("email_v_message").innerHTML = "";
    return true;
});

//hire date
$("#txtHiredate").on('keyup', function () {
    var inputhiredate = document.getElementById('txtHiredate');
    if (inputhiredate.value.length === 0)
        return;
    document.getElementById("txtHiredate").style.borderColor = "green";
});
$("#ddlFacility").on('change', function () {
    var inputhiredate = document.getElementById('ddlFacility');
    if (inputhiredate.value.length === 0)
        return;
    document.getElementById("ddlFacility").style.borderColor = "green";
});
//$("#ddlDesignation").on('change', function () {
//    var inputdesignaiton = document.getElementById('ddlDesignation');
//    if (inputdesignaiton.value.length === 0)
//        return;
//    document.getElementById("ddlDesignation").innerHTML = "";
//});
$("#txtEmployeeNumber").on('change', function () {
    var inputdivision = document.getElementById('txtEmployeeNumber');
    if (inputdivision.value.length === 0)
        return;
    document.getElementById("txtEmployeeNumber").innerHTML = "";
});

"use strict";

function valid_inf() {
    var usernameInput = document.getElementById('txtFirstName');
    var userlastnameInput = document.getElementById('txtSurname');
    var phoneInput = document.getElementById('txtPhone');
    var emailInput = document.getElementById('txtEmail');
    var firstname = $('#txtFirstName').val();
    var lastname = $('#txtSurname').val();
    var phone = $('#txtPhone').val();
    var email = $('#txtEmail').val();
    if (firstname === "") {
        document.getElementById("txtFirstName").style.borderColor = "red";

    } else {
        $("#txtFirstName").on('keyup', function () {
            document.getElementById("txtFirstName").style.borderColor = "green";
        });

    }
    if (lastname === "") {
        document.getElementById("txtSurname").style.borderColor = "red";

    } else {
        $("#txtSurname").on('keyup', function () {
            document.getElementById("txtSurname").style.borderColor = "green";
        });

    }
    if (phone === "") {
        document.getElementById("txtPhone").style.borderColor = "red";

    } else {
        $("#txtPhone").on('keyup', function () {
            document.getElementById("txtPhone").style.borderColor = "green";
        });

    }
    if (email === "") {
        document.getElementById("txtEmail").style.borderColor = "red";
        return false;
    } else {
        $("#txtEmail").on('keyup', function () {
            document.getElementById("txtEmail").style.borderColor = "green";
        });
    }
    var reEmail = /^(?:[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+\.)*[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+@(?:(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!\.)){0,61}[a-zA-Z0-9]?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!$)){0,61}[a-zA-Z0-9]?)|(?:\[(?:(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\.){3}(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\]))$/;

    if (email !== "" && email.match(reEmail) && phone !== "" && firstname !== "" && lastname !== "") {
        //  alert("active");
        const nextTabLinkEl = $('.nav-tabs .active').closest('li').next('li').find('a')[0];
        const nextTab = new bootstrap.Tab(nextTabLinkEl);
        nextTab.show();
    }
}

// second tab validation
"use strict";
function valid_inf2() {
    var hiredateInput = document.getElementById('hiredate');
    var divisionInput = document.getElementById('ddlFacility');
    var designationInput = document.getElementById('ddlDesignation');
    var employeenumberInput = document.getElementById('txtEmployeeNumber');

    var hiredate = $('#hiredate').val();
    var designation = $('#ddlDesignation').val();
    var division = $('#ddlFacility').val();
    var employeeno = $('#txtEmployeeNumber').val();

    if (division === "") {
        document.getElementById("ddlFacility").style.color = "red";
        document.getElementById("facil").innerHTML = 'Facility Field is Required';
    } else {
        $("#ddlFacility").on('keyup', function () {
            document.getElementById("ddlFacility").style.color = "green";
            document.getElementById("facil").innerHTML = '';
        });

    }
//    if (designation === "") {
//        document.getElementById("ddlDesignation").style.color = "red";
//        document.getElementById("desig").innerHTML = 'Position /Designation Field is Required';
//
//    } else {
//        $("#ddlDesignation").on('keyup', function () {
//            document.getElementById("ddlDesignation").style.color = "green";
//
//        });
//
//    }

    if (hiredate === "") {
        document.getElementById("hiredate").style.borderColor = "red";
    } else {
        $("#hiredate").on('keyup', function () {
            document.getElementById("hiredate").style.borderColor = "green";
        });


    }
    if (employeeno === "") {
        document.getElementById("txtEmployeeNumber").style.borderColor = "red";

    } else {
        $("#txtEmployeeNumber").on('keyup', function () {
            document.getElementById("txtEmployeeNumber").style.borderColor = "green";
        });


    }



    if (division !== "" &&  hiredate !== "" && employeeno !== "") {
        //  alert("active");
        const nextTabLinkEl = $('.nav-tabs .active').closest('li').next('li').find('a')[0];
        const nextTab = new bootstrap.Tab(nextTabLinkEl);
        nextTab.show();
    }
}

// third tab validation
"use strict";
function valid_inf3() {

    //  alert("active");
    const nextTabLinkEl = $('.nav-tabs .active').closest('li').next('li').find('a')[0];
    const nextTab = new bootstrap.Tab(nextTabLinkEl);
    nextTab.show();

}

// third tab validation
"use strict";
function valid_inf4() {

    var kraInput = document.getElementById('txtPinCode');
    var nssfInput = document.getElementById('txtNSSF');
    var nhifInput = document.getElementById('txtNHIF');
    var helbcheckInput = document.getElementById('rbtnHelb');
    var helbcertInput = document.getElementById('txtHelbClearance');
    var gconductInput = document.getElementById('txtGoodConduct');


    var kra = $('#txtPinCode').val();
    var nssf = $('#txtNSSF').val();
    var nhif = $('#txtNHIF').val();
    var helbcheck = $('#rbtnHelb').val();
    var helbCert = $('#txtHelbClearance').val();
    var gconduct = $('#txtGoodConduct').val();
    if (kra === "") {
        document.getElementById("txtPinCode").style.borderColor = "red";
    } else {
        $("#txtPinCode").on('keyup', function () {
            document.getElementById("txtPinCode").style.borderColor = "green";
        });


    }
    if (nssf === "") {
        document.getElementById("txtNSSF").style.color = "red";
//        document.getElementById("gend").innerHTML = 'Gender Field is Required';

    } else {
        $("#txtNSSF").on('keyup', function () {
            document.getElementById("txtNSSF").style.borderColor = "green";
//            document.getElementById("txtNSSF").innerHTML = '';
        });


    }
    if (nhif === "") {
        document.getElementById("txtNHIF").style.borderColor = "red";

    } else {
        $("#txtNHIF").on('keyup', function () {
            document.getElementById("txtNHIF").style.borderColor = "green";
        });
        if (helbCert === "") {

            if (helbcheck === 1) {
                document.getElementById("txtHelbClearance").style.borderColor = "red";

            } else {
                $("#txtHelbClearance").on('keyup', function () {
                    document.getElementById("txtHelbClearance").style.borderColor = "green";
                    document.getElementById("txtNSSF").innerHTML = '';
                });

            }
        }
        if (kra !== "" && nssf !== "" && nhif !== "") {
            const nextTabLinkEl = $('.nav-tabs .active').closest('li').next('li').find('a')[0];
            const nextTab = new bootstrap.Tab(nextTabLinkEl);
            nextTab.show();
        }

    }
}
"use strict";
function setuseemail() {
    var email = document.getElementById("email").value;
    document.getElementById("user_email").value = email;
}

"use strict";
function Payment(salpayid, employee_id, TotalSalary, WorkHour, Period) {
    var base_url = $("#base_url").val();
    var sal_id = salpayid;
    var employee_id = employee_id;
    var app="/hrh";
    $.ajax({
        url: app + "/Employees/EmployeePayment/'",
        method: 'post',
        dataType: 'json',
        data: {
            'sal_id': sal_id,
            'employee_id': employee_id,
            'totalamount': TotalSalary

        },
        success: function (data) {
            document.getElementById('employee_name').value = data.Ename;
            document.getElementById('employee_id').value = data.employee_id;
            document.getElementById('salType').value = salpayid;
            document.getElementById('total_salary').value = TotalSalary;
            document.getElementById('total_working_minutes').value = WorkHour;
            document.getElementById('working_period').value = Period;
            $("#PaymentMOdal").modal('show');
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Error get data from ajax');
        }

    });
}
;

"use strict";
function change_employee_status(employee_id) {
var app="/hrh";
    var base_url = $("#base_url").val();
    var req_url = app + "/EmployeesController/change_employee_status?employee_id=" + employee_id;

    $.ajax({
        type: "GET",
        url: req_url,
        cache: false,
        success: function (data)
        {
            var obj = jQuery.parseJSON(data);
        }
    });

}
;
