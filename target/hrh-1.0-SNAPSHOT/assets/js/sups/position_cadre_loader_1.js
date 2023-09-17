$(document).ready(function () {
    var app ="/hrh";
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
pataStandard();
//pataPositions();
});