
$(document).ready(function (e) {

    "use strict";
    var app = "/hrh";
    $('#ddlCounty').change(function () {
        patasubcounty();

    });
    $('#ddlSubcounty').change(function () {
        patafacility();

    });
    $('#ddlFY').change(function () {
        patafydetails();

    });
    $('#ddlEmployeeType').change(function () {
        pataStandard();

    });
    $('#ddlCadreCategory').change(function () {
        pataPositions();

    });



    function loadcounty() {


        $.ajax({
            url: app + '/loadCounty',
            type: 'post',
            dataType: 'html',
            success: function (data) {
                $("#ddlCounty").html(data);


            }


        });

    }


    function patasubcounty() {
        var county = document.getElementById("ddlCounty").value;
        //var county = $('#county').val();

        $.ajax({
            url: app + '/GetsubcountyServlet?county=' + county,
            type: 'GET',
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            success: function (data) {
                $('#ddlSubcounty').empty();
                $('#ddlSubcounty').append('<option>---Select SubCounty---</option>');
                $.each(data, function (key, value)
                {
                    $('#ddlSubcounty').append('<option value="' + value.DistrictID + '">' + value.DistrictNom + '</option>');
                });

            }


        });

    }

    function patafacility() {

        var subcounty = document.getElementById("ddlSubcounty").value;
        $.ajax({
            url: app + '/GetFacility?subcounty=' + subcounty,
            type: 'GET',
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            success: function (data) {
                $('#ddlFacility').empty();
                $('#ddlFacility').append('<option>---Select Facility---</option>');
                $.each(data, function (key, value)
                {
                    $('#ddlFacility').append('<option value="' + value.CentreSanteId + '">' + value.SubPartnerNom + '</option>');
                });

            }

        });
    }



//load default facilities
    loadcounty();

    function patafydetails() {
        var year_id = document.getElementById("ddlFY").value;
        //var county = $('#county').val();?action=edit&carder_id=' + carder_id

        $.ajax({
            url: app + '/ProcessFinancialYear?action=get_year_details&year_id=' + year_id,
            type: 'GET',
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            success: function (data) {

                document.getElementById('contract_period').value = data.contract_period;
                document.getElementById('end_date').value = data.end_date;
                document.getElementById('contract_no_months').value = data.contract_no_months;
//            document.getElementById('start_date').value = data.start_date;
                document.getElementById('year').value = data.year;

            }


        });

    }
    
    function loademptype() {
    $.ajax({
        url: app+'/EmpTypeServlet',
        type: 'post',
        dataType: 'html',
        success: function (data) {

            $("#ddlEmployeeType").html(data);
            $("#wddlEmployeeType").html(data);
            //pataStandard();

        }

    });

}
function pataStandard() {
    let emp_type = document.getElementById("ddlEmployeeType").value;
    //var county = $('#county').val();
    console.log(emp_type);
    $.ajax({
        url: app+'/GetCadreServlet?emp_type=' + emp_type,
        type: 'post',
        contentType: "application/json; charset-utf-8",
        dataType: "json",
        success: function (data) {
            $('#ddlCadreCategory').empty();
            $('#wddlCadreCategory').empty();
            $('#wddlCadreCategory').append('<option>---Select Standard Cadre---</option>');
            $('#ddlCadreCategory').append('<option>---Select Standard Cadre---</option>');
            $.each(data, function (key, value)
            {
                $('#ddlCadreCategory').append('<option value="' + value.id + '">' + value.standardized_cadre_name + '</option>');
                $('#wddlCadreCategory').append('<option value="' + value.id + '">' + value.standardized_cadre_name + '</option>');
            });

        }

    });

}
function pataPositions() {
    let cadre = document.getElementById("ddlCadreCategory").value;
    //var county = $('#county').val();
    console.log(cadre);
    $.ajax({
        url: app+'/GetPostionServlet?cadre=' + cadre,
        type: 'GET',
        contentType: "application/json; charset-utf-8",
        dataType: "json",
        success: function (data) {
            $('#ddlPos').empty();
            $('#wddlPos').empty();
            $('#ddlPos').append('<option value="">--- Select One---</option>');
            $('#wddlPos').append('<option value="">--- Select One---</option>');
            $.each(data, function (key, value)
            {
                $('#ddlPos').append('<option value="' + value.id + '">' + value.position_title + '</option>');
                $('#wddlPos').append('<option value="' + value.id + '">' + value.position_title + '</option>');
            });

        },
        complete: function () {

        }


    });

}

loademptype();
// $('#ddlSupervisor').empty();
//        $('#ddlFacility').change(function () {
//            // Get the selected facility's mflcode
//            const mflcode = $(this).val();
//
//            // Make an AJAX request to retrieve the supervisors for the selected facility
//            $.ajax({
//                url: app + '/supervisors',
//                data: {mflcode: mflcode},
//                type: 'get',
//                contentType: "application/json; charset-utf-8",
//                dataType: "json",
//                success: function (data) {
//                    $('#ddlSupervisor').empty();
////                    const keys = Object.keys(data);
////                    console.log(keys);
////                    for (const key in data) {
////                        console.log(key); // prints the key
////                        console.log(data[key]); // prints the value associated with the key
////                    }
//                    $('#ddlSupervisor').append('<option value="">--- Select Supervisor---</option>');
//                    $.each(data, function (key, value)
//                    {
//                        $('#ddlSupervisor').append('<option id="' + key + '" value="' + value.supervisor_id + '">' + value.name + '</option>');
//                    });
//
//                },
//                complete: function () {
//
//                }
//
//
//            });
//
//        });
});