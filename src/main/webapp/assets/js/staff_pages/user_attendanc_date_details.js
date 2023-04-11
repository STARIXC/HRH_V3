
$(document).ready(function() {
	var emp_no = document.getElementById("__STAFFID").value;
	var emp_no = document.getElementById("__LOGNO").value;
	var tableName = '#timesheetLogs';



	// handleSearchDatatable(tbl);
//load all the facilities first to enable one to filter by county
	$.ajax({
		url: './TimesheetLogs?emp_no=' + emp_no+'&log_no='+log_no,
		type: 'get',
		dataType: 'html',
		cache: true,
		success: function(data) {
			var timelogs = JSON.parse(data);
			//console.log(data);
			console.log(timelogs);
			$.each(timelogs, function(key, value) {


				var sn = key + 1;
				$('#timesheetLogs_').append(
					'<tr><td>' + sn + '</td><td>' + value.log_date + '</td><td class="shift"></td><td>' + value.hours_worked + '</td><td class="status"></td><td><a class="btn btn-info"href="./TimesheetLogs?emp_no=' + value.emp_no+'&log_no='+value.log_no+'"><i class="fa fa-eye"></i>Details</a></td></tr>');
			});
			if (timelogs.shift == 1) {
				$('.shift').append('<span class="badge badge-light-success fs-7">Day Shift</span><br>');
			} else {
				$('.shift').append('<span class="badge badge-light-success fs-7">Night Shift</span>');
			}


		}
});
});