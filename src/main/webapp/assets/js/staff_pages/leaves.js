jQuery(document).ready(function () {

  //load all the facilities first to enable one to filter by county
  $.ajax({
    url: "./Leave?action=listLeaves",
    type: "get",
    dataType: "json",
    success: function (data) {
      var len = data.length;

      $("#leave_type").empty();

      for (var i = 0; i < len; i++) {
        var total_days = data[i]["total_days"];
        var name = data[i]["leave_type_name"];
        var emp_type = data[i]["emp_type"];

        $("#leave_type").append(
          "<option data_emptype='" +
            emp_type +
            "' value='" +
            total_days +
            "'>" +
            name +
            "</option>"
        );
      }
      //console.log(data);
    }
  });
	

});
