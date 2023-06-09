
$(document).ready(function () {
  var emp_no = document.getElementById("__STAFFID").value;
  var tableName = '#timesheetLogs';
let app="/hrh";

  // handleSearchDatatable(tbl);
//load all the facilities first to enable one to filter by county
  $.ajax({
    url: app+'/timesheetController?emp_no=' + emp_no+'&action=timesheetLogEmp',
    type: 'get',
    dataType: 'html',
    cache: true,
    success: function (data) {
      //var timelogs = JSON.parse(data);
      //console.log(data);
      console.log(data);
      /*	$.each(timelogs, function(key, value) {
       
       var sn = key + 1;
       $('#timesheetLogs_').append(
       '<tr><td>' + sn + '</td><td>' + value.log_date + '</td><td class="shift"></td><td>' + value.hours_worked + '</td><td class="status"></td><td><a class="btn btn-info" href="./TimesheetLogs?service_no=' + value.emp_no+'&activity_no='+value.log_no+'"><i class="fa fa-eye"> Details</i></a></td></tr>');
       });
       if (timelogs.shift == 1) {
       $('.shift').append('');
       } else {
       $('.shift').append('');
       }*/


    }
  });
//"log_id":1,"shift":1,"":"97227","emp_no":"0014","log_date":"2022-02-15","hours_worked":"null"
//[{"log_id":1,"shift":1,"year":2022,"month":4,"log_no":"6949","emp_no":"0014","log_date":"2022-05-03","hours_worked":"0"
//,"onleave_hours":"","holiday":"","extra_hours_worked":"","Thours_worked":"0.0","expected_hrs":"","monthName":"April"}]
  $('#timesheetLogs').DataTable({
    "ajax": {
      "url": app+'/timesheetController?emp_no=' + emp_no+'&action=timesheetLogEmp',
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
          if (data === '2') {
            return '<span class="badge bg-success fs-7">Submited</span>';
          } else if (data === '1') {
            return '<span class="badge bg-primary fs-7">Draft</span><br>';
          } else {
            return '<span class="badge bg-secondary fs-7">N/A</span><br>';
          }
        }
      },
      {
        "render": function (data, type, row, meta) {
          var url="./GetMonthDates?year=" + row['year']  + "&&month=" + row['month'] + "&&emp_no=" + row['emp_no']  ;
          var view="timesheet.jsp?year=" + row['year']  + "&month=" + row['month'] + "&emp_no=" + row['emp_no'] + "&action=view_time_sheet";
          var a = '<a class="badge bg-success" href="'+view+'">View</a><a class="badge bg-primary" href="'+url+'">Submit</a>';
         //console.log(row['year']);
          return 	a;
        }
      }
    ]

  });
});