
$(document).ready(function () {
var app="/hrh";

var i = 1;
get_users();
function get_users() {
    $.ajax({
        type: "GET",
        url: app+'/ManageUsers?action=all',
        contentType: "application/json; charset-utf-8",
        dataType: "json",
        success: function (data) {
            $('#users_data').empty();


            $.each(data, function (key, value)
            {
                  var respond = value;
            if (respond.level === "1") {
                var role = '<span class="d-inline-flex text-white items-center font-medium px-2 py-1 text-xs leading-4 rounded-md bg-primary" style="">Super Admin </span>';
            } else if (respond.level === "2") {
                
                 var role = '<span class="d-inline-flex text-white items-center font-medium px-2 py-1 text-xs leading-4 rounded-md bg-primary" style="">Facility Staff </span>';
            } else if (respond.level === "3") {
                
                 var role = '<span class="d-inline-flex text-white items-center font-medium px-2 py-1 text-xs leading-4 rounded-md bg-primary" style="">HR Admin </span>';
            } else if (respond.level === "4") {
            
                 var role = '<span class="d-inline-flex text-white items-center font-medium px-2 py-1 text-xs leading-4 rounded-md bg-primary" style="">Payroll Manager</span>';
            } else if (respond.level === "5") {
               
                 var role = '<span class="d-inline-flex text-white items-center font-medium px-2 py-1 text-xs leading-4 rounded-md bg-primary" style="">Facility Supervisor</span>';
            } else if (respond.level === "6") {
               
                 var role = '<span class="d-inline-flex text-white items-center font-medium px-2 py-1 text-xs leading-4 rounded-md bg-primary" style="">Technical Monitor </span>';
            } else {
                var role = "";
            }
           
            if (respond.status === "1") {
                var active_status = '<span class="d-inline-flex text-white items-center font-medium px-2 py-1 text-xs leading-4 rounded-md bg-success" style="">Activated</span>';
            }else{
                var active_status = '<span class="d-inline-flex text-white items-center font-medium px-2 py-1 text-xs leading-4 rounded-md bg-danger" style="">Not Active </span>';
            }
                var serial_=key+1;
                
                var action='<div class="d-flex" style="width: 150px;"> <a href="javascript:void(0);"  data-id="' + value.userid + '" class="btn btn-success btn-xs btnColor edit-hols"> <i class="fa fa-edit" ></i></a> <a href="javascript:void(0);"  data-id="' + value.userid + '" class="delete btn btn-danger btn-xs deleteBtn btnColor"><i class="fa fa-trash" aria-hidden="true" title="Delete" ></i></a></div>'
                $('#users_data').append('<tr><td>' + serial_ + '</td><td>' + respond.full_name + '</td><td>' + respond.email + '</td>  <td>' + respond.username + '</td> <td>' + role + '</td> <td>' + active_status + '</td>  <td>' + respond.created_at + '</td> <td>'+action+' </td></tr>');
            });

        },
        complete: function () {
             $('#user_table').DataTable();
        }
    });

}

}