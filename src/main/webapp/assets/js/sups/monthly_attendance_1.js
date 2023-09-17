
$(document).ready(function () {
      var app="/hrh";
 // var emp_no = document.getElementById("__STAFFID").value;
 $.ajax({
  url: 'loadYear',
  type: 'post',
  dataType: 'html',
  success: function (data) {
    document.getElementById("Tyear").innerHTML = data;
    //loadmonths();
    //gethours();
    //changeHour();
  }


});
//loadmonths();
//                                      load Months
function loadmonths() {
  var yr = document.getElementById("Tyear").value;
  console.log(yr);
  $.ajax({
    url: app+'loadMonth?year=' + yr,
    type: 'post',
    dataType: 'html',
    success: function (data) {
      // $("#Tmonth").html(data);
      document.getElementById("TMonth").innerHTML = data;
      // App.init();  
      //gethours();
//changeHour();
    }


  });
}
function retrivetimesheetlogs(){}

  $('#timesheetLogs').DataTable({
    "ajax": {
      "url": app+'/MonthlyTimesheet',
      "type": "GET",
      dataType: "json",
      dataSrc: "",
       responsive: true,
      "data": function (d) {
        $("#timesheetLogs_").html(d);
      }
    },
    "columns": [
      {
        "data": "emp_name"
      },
      {
        "data": "year"
      },
      {
        "data": "monthName"
      },
      {
        "data": "hours_worked"
      },

      {
        "data": "onleave_hours"
      },
      {
        "data": "holiday"
      },
      {
        "data": "extra_hours_worked"
      },
      {
        "data": "Thours_worked"
      },
      {
        "data": "expected_hrs"
      },
      {
        "targets": 0,
        "data": "shift",
        "render": function (data, type, row, meta) {
          if (data === 2) {
            return '<span class="badge bg-success fs-7">Submited</span>';
          } else if (data === 1) {
            return '<span class="badge bg-primary fs-7">Draft</span><br>';
          } else {
            return '<span class="badge bg-secondary fs-7">N/A</span><br>';
          }
        }
      },
      {
        "render": function (data, type, row, meta) {
          var url="./GetMonthDates?year=" + row['year']  + "&&month=" + row['month'] + "&&emp_no=" + row['emp_no']  ;
          var a = '<a class="badge bg-primary" href="'+url+'">Approve</a><a class="badge bg-danger" href="./AllStaffServlet?id=' + data + '&action=delete">Reject</a>';
         //console.log(row['year']);
          return 	a;
        }
      }
    ]

  });
});