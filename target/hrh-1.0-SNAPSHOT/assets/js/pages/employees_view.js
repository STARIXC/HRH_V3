$(document).ready(function () {

var app="/hrh";
//;
    "use strict";
    var i = 1;
    var emp_no = $("#employee_id").val();
    function dateDiff(date1, date2) {
        var diff = Math.abs(date1 - date2);
        var days = Math.floor(diff / (1000 * 60 * 60 * 24));
        var years = Math.floor(days / 365);
        days -= years * 365;
        var months = Math.floor(days / 31);
        days -= months * 31;
        return {years: years, months: months, days: days};
    }

    getDocs();
    getEmpDet();
    function getEmpDet() {

//    var emp_no = $("#employee_id").val();
        console.log("emp_no:" + emp_no);
        $.ajax({
            type: "GET",
            url: app+"/employee",
            data: {emp_no: emp_no, action: "getEmployee"},
            dataType: "json",
            success: function (data) {
//                console.log(eval(data));
                var data = data;
//            console.log("getdetails:" +eval(data));
//                console.log("|Processing 1:");
//            emp_image
                if (data.employee.gender === "Female") {
                    document.getElementById("emp_image").src = "assets/images/female.png";
                } else {
                    document.getElementById("emp_image").src = "assets/images/male.png";
                }
//                console.log("|Processing 2 Done:");
                let status_active = '<span class="label label-success">Active</span>';
                let status_not_active = '<span class="label label-danger">In Active</span>';
                let status_terminated = '<span class="label label-danger">Terminated</span>';
                let status_deceased = '<span class="label label-warning">Deceased</span>';
                let status_resigned = '<span class="label label-warning">Resigned</span>';
                let status_not_defined = '<span class="label label-info">Not Defined</span>';
                let status = data.employee.isActive;
                let staff_status = "";
//                console.log(status);
                if (status === "Active") {
                    staff_status = status_active;
                } else if (status === "Inactive") {
                    staff_status = status_not_active;
                } else if (status === "Terminated") {
                    staff_status = status_terminated;
                } else if (status === "Deceased") {
                    staff_status = status_deceased;
                } else if (status === "Resigned") {
                    staff_status = status_resigned;
                } else {
                    staff_status = status_not_defined;
                }
//                console.log("|Processing 3 Starts:");
                var full_name = data.employee.surname + " " + data.employee.first_name;
//            console.log("Title:" + jobTitle);
                $("#emp_name").text(data.employee.surname + " " + data.employee.first_name);
                $(".text_info").text(data.employee.surname + " " + data.employee.first_name);
                $("#sum_name").text(data.employee.surname + " " + data.employee.first_name);
                $("#full_name").text(full_name);
                var position = data.employee.positionTitle;
                if (position === null || position === "") {
                    $("#designation").text("N/A");
                    $("#_designation").text("N/A");
                    $("#designation_").text("N/A");
                } else {
                    $("#designation").text(position);
                    $("#_designation").text(position);
                    $("#designation_").text(position);
                }
//                $("#designation").text();
//                $("#_designation").text(data.currentPosition.position);
                $("#fname").text(data.employee.first_name);
                $("#lname").text(data.employee.surname);
                $("#employeeNo").text(data.employee.emp_no);
                $("#wemp_record").val(data.employee.emp_no);
                $("#doc_emp_record").val(data.employee.emp_no);
                $("#email").text(data.employee.email);
                $("#sumEmail").text(data.employee.email);
                $("#phone").text(data.employee.phone);
                $("#_phone").text(data.employee.phone);
                $("#postal_code").text(data.employee.postal_code);
                $("#home_address").text(data.employee.home_address);
                $("#facility").text(data.currentPosition.facility);
                $("#_facility").text(data.currentPosition.facility);
                $("#title").text(data.currentPosition.position);
                $("#ecode").text(data.employee.emp_no);
                $("#hireDate").text(data.employee.date_started);
                $("#etype").text(data.currentPosition.emp_type);
                $("#estatus").append(staff_status);
                $("#dob").text(data.employee.dob);
                $("#gender").text(data.employee.gender);
                $("#kra").text(data.employee.kra_pin);
                $("#nhif").text(data.employee.nhif_no);
                $("#nssf").text(data.employee.nssf_no);
                $("#nationality").text(data.employee.nationality);
                $("#phone").text(data.employee.phone);
                $("#alt_phone").text(data.employee.alt_phone);
                $("#alt_email").text(data.employee.alt_email);
                $("#present_add").text(data.employee.present_address);
                $("#permanent_add").text(data.employee.home_address);
                $("#marital_status").text(data.employee.marital_status);
                $("#etype").text(data.employee.cadreTypeName);
                $("#title").text(data.employee.positionTitle);
                $("#lemail").text(data.loginDetails.email);
                $("#username").text(data.loginDetails.username);
                $("#role").text(data.loginDetails.level);
                $('#emp_hist').empty();
//                console.log("|Processing 3 Ends:");
//                console.log(data.history);
//            
                for (let i = 0; i < data.history.length; i++) {
                    let history = data.history[i];
                    let to = "";
                    if (history.date_ended === null || history.date_ended === '2023-09-30' || typeof history.date_ended === "undefined") {
                        to = "Present";
                    } else {
                        to = history.date_ended;
                    }
                    let period = history.date_started + "-" + to;
                    let hireDateString = history.date_started;
                    let terminationDateString = history.date_ended;
                    let hireDate = new Date(hireDateString);
//                    console.log(hireDate);
                    let terminationDate = new Date(terminationDateString === null || typeof terminationDateString === "undefined" ? new Date() : terminationDateString);
//                    console.log("Termination Date :" + terminationDate);
                    let timeWorked = dateDiff(hireDate, terminationDate);
                    let periodDetails = timeWorked.years + ' year(s), ' + timeWorked.months + ' month(s), ' + timeWorked.days + ' Day(s)';
                    var display = '        <!---->'
                            + '<tr class="hover:bg-gray-100 dark:hover:bg-dark-body hidden md:table-row">'
                            + '<td valign="top" colspan="1" class=" py-2 dark:bg-dark-header hidden md:table-cell">'
                            + ' <div class="text-sm text-gray-900 ">' + period + '<div class="text-xs">' + periodDetails + '</div>'
                            + '   </div>'
                            + ' </td>'

                            + ' <td valign="top" colspan="1" class=" py-2 dark:bg-dark-header hidden md:table-cell">'
                            + '     <div class="text-sm text-gray-900 ">' + history.emp_type + '</div>'
                            + '  </td>'

                            + ' <td valign="top" colspan="1" class=" py-2 dark:bg-dark-header hidden md:table-cell">'
                            + '    <div class="text-sm text-gray-900 ">' + history.position + '</div>'
                            + ' </td>'
                            + ' <td valign="top" colspan="1" class=" py-2 dark:bg-dark-header hidden md:table-cell">'
                            + '    <div class="text-sm text-gray-900 ">' + history.facility + '</div>'
                            + ' </td>'
                            + ' <td valign="top" colspan="1" class=" py-2 dark:bg-dark-header hidden md:table-cell">'
                            + '   <div class="text-sm text-gray-900 ">Permanent</div>'
                            + ' </td>'
                            + '  <td valign="top" colspan="1" class=" py-2 dark:bg-dark-header hidden md:table-cell">'
                            + '    <div class="text-sm text-gray-900 ">'
                            + '      <div class="relative flex justify-end items-center">'
                            + '        <div class="dropdown">'
                            + '<a class="btn dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'
                            + ' <i class="fas fa-ellipsis-v"></i>'
                            + '</a>'

                            + ' <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">'
                            + '   <a class="dropdown-item" href="#">Action</a>'
                            + '  <a class="dropdown-item" href="#">Another action</a>'
                            + '   <a class="dropdown-item" href="#">Something else here</a>'
                            + '  </div>'
                            + '</div>'
                            + '        </div>'
                            + '     </div>'
                            + '  </div>'
                            + '  </div>'
                            + ' </td>'

                            + '</tr>  <!---->';
                    $('#emp_hist').append(display);
//                    $("#employeeHistory").append("<li>" + history.company + " (" + history.startDate + " - " + history.endDate + ")</li>");
                }
            },
            error: function (error) {
                console.log("Error: " + error);
            }
        });
    }

    $('#wddlCounty').change(function () {
        patasubcounty();
    });
    $('#wddlSubcounty').change(function () {
        patafacility();
    });
    $('#wddlFY').change(function () {
        patafydetails();
    });
    function loadcounty() {


        $.ajax({
            url: app+'/loadCounty',
            type: 'post',
            dataType: 'html',
            success: function (data) {
                $("#wddlCounty").html(data);
            }


        });
    }


    function patasubcounty() {
        var county = document.getElementById("wddlCounty").value;
        //var county = $('#county').val();

        $.ajax({
            url: app+'/GetsubcountyServlet?county=' + county,
            type: 'GET',
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            success: function (data) {
                $('#wddlSubcounty').empty();
                $('#wddlSubcounty').append('<option>---Select SubCounty---</option>');
                $.each(data, function (key, value)
                {
                    $('#wddlSubcounty').append('<option value="' + value.DistrictID + '">' + value.DistrictNom + '</option>');
                });
            }


        });
    }

    function patafacility() {

        var subcounty = document.getElementById("wddlSubcounty").value;
        $.ajax({
            url: app+'/GetFacility?subcounty=' + subcounty,
            type: 'GET',
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            success: function (data) {
                $('#wddlFacility').empty();
                $('#wddlFacility').append('<option>---Select Facility---</option>');
                $.each(data, function (key, value)
                {
                    $('#wddlFacility').append('<option value="' + value.CentreSanteId + '">' + value.SubPartnerNom + '</option>');
                });
            }

        });
    }



//load default facilities
    loadcounty();
    function getDocs() {
        let action = "get_all_docs";
        $.ajax({
            url: app+"/documentUploads",
            method: "GET",
            dataType: "json",
            data: {
                emp_no: emp_no,
                action: action
            },
            success: function (response) {
                if (response && response.length > 0) {

                    // Build the table rows with document information
                    let tableRows = '';
                    for (let i = 0; i < response.length; i++) {
                        let document = response[i];
//                     getDocumentById(emp_no,document.DocTypeName);
                        tableRows += '<tr>';
                        tableRows += '<td>' + document.DocTypeName + '</td>';
                        tableRows += '<td><a href="documentUploads?action=download&filename=' + document.DocTypeName + '&emp_no=' + emp_no + '" class="btn btn-md btn-info"><i class="fa fa-download"></i> </a>\n\
<a data-name="' + document.documentValue + '" data-empno="' + emp_no + '" data-id="' + document.id + '" href="javascript:void(0)" class="edit_doc btn btn-md btn-success ms-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Edit"><i class="fa fa-pen text-white"></i></a>\n\
 <a id="delete_leave_type" data-id="' + document.id + '" href="javascript:void(0)" class="btn btn-md btn-danger ms-1" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Delete"><i class="fa fa-trash text-white"></i></a></td>';

                        tableRows += '</tr>';
                    }
                    // Update the table body with the rows
                    $('#docTable').html(tableRows);
                } else {
                    // Display a message if there are no documents
                    $('#docTable').html('<tr><td colspan="2">No documents found.</td></tr>');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.error("Error retrieving documents: " + errorThrown);
            }
        });
    }



});


