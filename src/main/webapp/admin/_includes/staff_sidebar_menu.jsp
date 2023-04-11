
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="assets/vendor/jquery/jquery.min.js"></script>  
        <title></title>
        <script>



            jQuery(document).ready(function () {
                // initiate layout and plugins

                $("ul li").on("click", function () {
                    $("ul li").removeClass("active");
                    $(this).addClass("active");
                });


            });
        </script>
    </head>
    <body>
        <div class="preloader" style="display: none;">
            <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"></circle>
            </svg>
        </div>
        <div class="sidebar-header" >
            <div class="top-left-part">
                <!-- Logo -->
                <a class="logo me-4" href="index.jsp">
                    <!-- Logo icon image, you can use font-icon also --><b>
                        <!--This is dark logo icon-->
                        <img  src="assets/img/logo_.png" alt="home" class="dark-logo img-fluid img-responsive">
                    </b>
                    <!-- Logo text image you can use text also -->
                    <span class="hidden-xs">

                    </span> </a>
            </div>

        </div>
        <div class="sidebar-menu">
            <ul class="menu">
                <li class="sidebar-item  ">
                    <a href="index.jsp" class='sidebar-link'> <i class="fa fa-home breadcrumbColor"></i>
                        <span>Dashboard</span>
                    </a></li>
                <li class="sidebar-item">
                    <a href="profile.jsp" class='sidebar-link'> <i class="mr-3 shrink-0 w-6 fa fa-user-tie breadcrumbColor"></i>
                        <span>Employee </span>
                    </a>
                </li>


                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'> <i class="fa fa-table breadcrumbColor"></i>
                        <span>Leave Management</span>
                    </a>
                    <ul class="submenu" style="display: block;">
                        <li><a href="apply_leave.jsp"><i class="fa fa-circle-notch"> </i>Apply Leave</a></li>
                        <li><a href="leave_allocation.jsp"><i class="fa fa-circle-notch"></i> Leave Allocation</a></li>
                    </ul>
                </li>
                <li class="sidebar-item  has-sub">
                    <a href="javascript:void(0)" class='sidebar-link'>
                        <i class="fa fa-user breadcrumbColor"></i> <span>Manage Timesheet</span></i>
                        </span>
                    </a>

                    <ul class="submenu" style="display: block;">
                        <li><a href="manage_shift.jsp"><i class="fa fa-circle-notch"> </i> Monthly Timesheet</a></li>
                      
                        <li class=""><a href="att_summary_report.jsp"> <i class="fa fa-circle-notch"> </i> View My Timesheets</a></li>
                        <li class=""><a href="manual_attendance.jsp"><i class="fa fa-circle-notch"> </i> Timesheet Reports</a></li>

                    </ul></li>
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'> <i class="mr-3 shrink-0 w-6 fa fa-file-invoice breadcrumbColor"></i>
                        <span>Payroll</span>
                    </a>
                    <ul class="submenu ">
                        <li><a href="#manage_tax_rule_setup.jsp"> <i class="fa fa-circle-notch"> </i> Tax Rule Setup</a></li>
                        <li><a href="#manage_allowance.jsp"> <i class="fa fa-circle-notch"> </i> Allowance</a></li>
                  
                    </ul>
                </li>
                <li class="sidebar-item "><a href="reports.jsp"
                                             class='sidebar-link'> <i class="fa fa-calendar breadcrumbColor"></i>
                        <span>Holidays</span>
                    </a></li>
               
          
            </ul>
        </div>

    </body>
</html>
