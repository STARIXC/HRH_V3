$(document).ready(function () {
    var app = "/hrh";
    function loademptype() {
        $.ajax({
            url: app + '/EmpTypeServlet',
            type: 'post',
            dataType: 'html',
            success: function (data) {

                $("#inputcadrecat").html(data);
                //pataStandard();

            }
        });

    }

    function pataStandard() {
        let emp_type = document.getElementById("inputcadrecat").value;
        //var county = $('#county').val();
        console.log(emp_type);
        $.ajax({
            url: app + '/GetCadreServlet?emp_type=' + emp_type,
            type: 'post',
            dataType: 'html',
            success: function (data) {
                $("#inputStandCadre").html(data);
            }


        });

    }


    loademptype();
});