jQuery(document).ready(function() {


	//load all the facilities first to enable one to filter by county
	$.ajax({
		url: './Activities',
		type: 'get',
		dataType: 'html',
		success: function(data) {
		
			console.log(data);

// Populate dropdown with list of facilities

 $(".activity_hhr").html(data.replace("<option value=''>Select facility</option>", ""));
			
		}


	});
});