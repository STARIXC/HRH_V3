
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
});