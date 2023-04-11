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

}).on("change", function () {
  holidaycalculation();
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
  var start_date = document.getElementById("start_date").value;
  var end_date = document.getElementById("end_date").value;
  $.ajax({
    url: "./LeaveDays?start_date=" + start_date + "&&end_date=" + end_date,
    type: "get",
    dataType: "json",
    success: function (data) {
      var arr = eval(data);
      console.log(arr);
      console.log(arr.no_weekdays);
      //$('#days_applied').append(html_code);
      var no_day = (arr.no_weekdays - arr.no_holidays);
      $("#days_applied").val(no_day);
    }

  }
  );
}



$("#enjoy").hide();
$("#checkleave").hide();
getLeaves();
//leavetypechange();
function leavetypechange_() {
  var leave_type = $('#leave_type_id').val();
  ;
  var employee_id = $('#employee_id').val();
  var base_url = $("#base_url").val();
  $.ajax({
    url: base_url + "AvailableDays",
    method: 'get',
    dataType: 'json',
    data: {
      'employee_id': employee_id,
      'leave_type': leave_type
    },
    success: function (data) {
      document.getElementById('enjoy').innerHTML = 'You Enjoyed : ' + data.enjoy + ' Ds';
      document.getElementById('checkleave').innerHTML = 'Total Leave : ' + data.due + ' Ds';
    },
    error: function (jqXHR, textStatus, errorThrown)
    {
      alert('Error get data from ajax');
    }
  });
}
function leavetypechange() {
//get the form data using another method 
  var fy = 2022;
  var leave_type = document.getElementById("leave_type_id").value;
  var employee_id = document.getElementById("employee_id").value;
  dataString = "leave_type=" + leave_type + "&&employee_id=" + employee_id + "&&fy=" + fy;
  //make the AJAX request, dataType is set to json
  //meaning we are expecting JSON data in response from the server
  $.ajax({
    type: "GET",
    url: "./AvailableDays",
    data: dataString,
    dataType: "json",
    //if received a response from the server
    success: function (data, textStatus, jqXHR) {
      //our country code was correct so we have some information to display
      if (data.success) {
        document.getElementById('enjoy').innerHTML = 'You Enjoyed : ' + data.result.enjoyed + ' Ds';
        document.getElementById('checkleave').innerHTML = 'Total Leave : ' + data.result.daysavailable + ' Ds';
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

  var leave_type_id = $("#leave_type_id").val();
  var employee_id = $("#employee_id").val();
  var start_date = $("#start_date").val();
  var end_date = $("#end_date").val();
  var no_days = $("#days_applied").val();
  var action = "save_log";
  var leave_status = 1;
  var data = {
    action: action,
    leave_type_id: leave_type_id,
    employee_id: employee_id,
    start_date: start_date,
    end_date: end_date,
    no_days: no_days,
    leave_status: leave_status
  };
  var url = "./Leave"; //get submit url [replace url here if desired]
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
//  $.ajax({
//    type: "POST",
//    url: url,
//    data: data, // serializes form input
//    beforeSend: function beforeSend() {
//      //startLoader();
//      console.log(data);
//    },
//    success: function (data) {
//      //var resp = JSON.stringify(data);
//      // console.log(resp.message);
//      setTimeout(() => {
//        if (data === 1) {
//          var message = "Leave Saved Successfully.";
//          toastr.success(message);
//        } else if (data === 2) {
//          message = "No change detected.";
//          toastr.error(message);
//        } else {
//          var message = "Application could not be submited. There already exist another application for the same dates.";
//          toastr.error(message);
//        }
//
//      }, 5000);
//    },
//    error: function error(result) {
//    },
//    complete: function complete() {
//      //stopLoader();
//    }
//  });
  $("#leave_application")[0].reset();
});
function getLeaves() {
  $.ajax({
    url: "./LeaveType",
    type: "get",
    dataType: "html",
    success: function (data) {
      let collection = document.getElementsByName("basicSelectLeaveType");
      $(collection).html(data.replace("<option value=''>Select Leave Type</option>", ""));
    }
  });
}



