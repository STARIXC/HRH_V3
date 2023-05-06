 var app="/hrh";
$("#start_date").datepicker({
  dateFormat: "yy-mm-dd",
  numberOfMonths: 1,
  minDate: 0,
  changeMonth: true,
  changeYear: true,
  onSelect: function (selected) {
    var dt = new Date(selected);
    dt.setDate(dt.getDate() - 1);
    $("#end_date").datepicker("option", "minDate", dt);
    $(this).change();
  }

});
$("#end_date").datepicker({
  dateFormat: "yy-mm-dd",
  changeMonth: true,
  changeYear: true,
  numberOfMonths: 1,
  onSelect: function (selected) {
    var dt = new Date(selected);
    dt.setDate(dt.getDate() - 1);
    $(this).change();
  }
}).on("change", function () {
  holidaycalculation();
});
//
//$('#start_date').change();
//$('#end_date').change(holidaycalculation());

function holidaycalculation() {
  $('#days_applied').empty();
   var app="/hrh";
  var start_date = document.getElementById("start_date").value;
  var end_date = document.getElementById("end_date").value;
  $.ajax({
    url: app+"/LeaveDays?start_date=" + start_date + "&&end_date=" + end_date,
    type: "get",
    dataType: "json",
    success: function (data) {
      var arr = eval(data);
      console.log(arr);
     
      //$('#days_applied').append(html_code);
      var no_day = (arr);
      $("#days_applied").val(no_day);
    }

  }
  );
}



$("#enjoy").hide();
$("#checkleave").hide();

function leavetypechange() {
//get the form data using another method 
  var fy = 2023;
  var app="/hrh";
  var leave_type = document.getElementById("leave_type_id").value;
  var employee_id = document.getElementById("employee_id").value;
  dataString = "leave_type=" + leave_type + "&&employee_id=" + employee_id + "&&fy=" + fy;
  //make the AJAX request, dataType is set to json
  //meaning we are expecting JSON data in response from the server
  $.ajax({
    type: "GET",
    url: app+"/availableDays",
    data: dataString,
    dataType: "json",
    //if received a response from the server
    success: function (data, textStatus, jqXHR) {
      //our country code was correct so we have some information to display
      if (data.success) {
        document.getElementById('enjoy').innerHTML = 'You Enjoyed : ' + data.result.days_used + ' Ds';
        document.getElementById('checkleave').innerHTML = 'Total Leave : ' + data.result.days_accrued + ' Ds';
        $("#enjoy").show();
        $("#checkleave").show();
      }
      //display error message
      else {
        $("#ajaxResponse").html("<div><b>Country code in Invalid!</b></div>");
      }
    },
    //If there was no resonse from the server
    error: function (jqXHR, textStatus, errorThrown) {
      console.log("Something really bad happened " + textStatus);
      // $("#ajaxResponse").html(jqXHR.responseText);
    },
    //capture the request before it was sent to server
    beforeSend: function (jqXHR, settings) {
      //adding some Dummy data to the request
      settings.data += "&dummyData=whatever";
      //disable the button until we get the response
//                                $('#myButton').attr("disabled", true);
    },
    //this is called after the response or error functions are finsihed
    //so that we can take some action
    complete: function (jqXHR, textStatus) {
      //enable the button 
//                        $('#myButton').attr("disabled", false);
    }

  });
}
;
// jQuery ajax form submit example, runs when form is submitted
$("#leave_application").submit(function (e) {
  e.preventDefault(); // prevent actual form submit
var app="/hrh";
var today = new Date();
var day = today.getDate();
var month = today.getMonth() + 1; // January is 0
var year = today.getFullYear();

var application_date = year + '-' + month + '-' + day;
  var leave_type_id = $("#leave_type_id").val();
  var supervisor_id = $("#supervisor_id").val();
  var technical_monitor_id = $("#technical_monitor_id").val();
  var employee_id = $("#employee_id").val();
  var start_date = $("#start_date").val();
  var end_date = $("#end_date").val();
  var no_days = $("#days_applied").val();
  var action = "save_leave";
  var leave_status = 0;
  var data = {
    action: action,
    leave_type_id: leave_type_id,
    supervisor_id: supervisor_id,
    technical_monitor_id: technical_monitor_id,
    employee_id: employee_id,
    start_date: start_date,
    end_date: end_date,
    no_days: no_days,
    application_date:application_date,
    leave_status: leave_status
  };
  var url = app+"/LeaveApplication"; //get submit url [replace url here if desired]
  //screenLock();
   $.ajax({
    type: "POST",
    url: url,
    data: data,
    dataType: "json",
    //if received a response from the server
    success: function (data, textStatus, jqXHR) {
      //our country code was correct so we have some information to display
      if (data.success) {
      
      }
      //display error message
      else {
        $("#ajaxResponse").html("<div><b>Country code in Invalid!</b></div>");
      }
    },
    //If there was no resonse from the server
    error: function (jqXHR, textStatus, errorThrown) {
      console.log("Something really bad happened " + textStatus);
      // $("#ajaxResponse").html(jqXHR.responseText);
    },
    //capture the request before it was sent to server
    beforeSend: function (jqXHR, settings) {
      //adding some Dummy data to the request
      settings.data += "&dummyData=whatever";
      //disable the button until we get the response
//                                $('#myButton').attr("disabled", true);
    },
    //this is called after the response or error functions are finsihed
    //so that we can take some action
    complete: function (jqXHR, textStatus) {
      //enable the button 
//                        $('#myButton').attr("disabled", false);
    }

  });

 
});



