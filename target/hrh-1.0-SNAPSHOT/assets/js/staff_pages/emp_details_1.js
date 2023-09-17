jQuery(document).ready(function() {

	var emp_no = document.getElementById("__STAFFID").value;
	//load all the facilities first to enable one to filter by county
	$.ajax({
		url: './StaffServlet?action=view' + '&emp_no=' + emp_no,
		type: 'get',
		dataType: 'html',
		success: function(data) {
			var user = JSON.parse(data);
			//console.log(data);
			console.log(user);

			document.getElementById("cphBody_lblFirstName").innerHTML = user.first_name;
			document.getElementById("cphBody_lblMiddleName").innerHTML = user.other_name;
			document.getElementById("cphBody_lblLastName").innerHTML = user.surname;
			document.getElementById("cphBody_lblDateOfBirth").innerHTML = user.dob;
			document.getElementById("cphBody_lblGender").innerHTML = user.gender;
			document.getElementById("cphBody_lblMaritalStatus").innerHTML = "Single";
			document.getElementById("cphBody_lblEmployeeType").innerHTML = user.dob;
			document.getElementById("cphBody_lblDepartment").innerHTML = user.mfl;
			document.getElementById("cphBody_lblDesignation").innerHTML = user.position;
			document.getElementById("cphBody_lblPFNumber").innerHTML = user.emp_no;
			document.getElementById("cphBody_lblCountry").innerHTML = user.nationality;
			
		}


	});
});