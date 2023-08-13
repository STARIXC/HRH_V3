
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<script src="assets/vendor/jquery/jquery.min.js"></script>-->  
        <title></title>

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


                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'> <i class=" mr-3 shrink-0 w-6 fa fa-building breadcrumbColor"></i>
                        <span>Company</span>
                    </a>
                    <ul class="submenu ">
                        <li><a href="manage_carder_type.jsp"><i class="fa fa-circle-notch"> </i> Carder Type</a></li>
                        <li><a href="manage_carder_category.jsp"><i class="fa fa-circle-notch"> </i> Carder Category</a></li>
                        <li><a href="manage_standardised_carder.jsp"><i class="fa fa-circle-notch"> </i> Standardized Carder</a></li>
                        <li><a href="manage_designation.jsp"><i class="fa fa-circle-notch"> </i>  Positions</a></li>
                        <li><a href="document.jsp"><i class="fa fa-circle-notch"> </i>  Document</a></li>

                    </ul></li>

                <li class="sidebar-item">
                    <a href="manage_employee.jsp" class='sidebar-link'> <i class="mr-3 shrink-0 w-6 fa fa-user-tie breadcrumbColor"></i>
                        <span>Employee </span>
                    </a>
                    <!--                    <ul class="submenu ">
                                            <li><a href="manage_employee.jsp"><i class="fa fa-circle-notch"> </i> Manage Employee</a></li>
                                            <li><a href="manage_termination.jsp"><i class="fa fa-circle-notch"> </i> Termination</a></li>
                                            <li><a href="manage_warning.jsp"><i class="fa fa-circle-notch"> </i> Warning</a></li>
                                        </ul>-->
                </li>


                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'> <i class="fa fa-table breadcrumbColor"></i>
                        <span>Leave Management</span>
                    </a>
                    <ul class="submenu" style="display: block;">
                        <li><a href="manage_holidays.jsp"><i class="fa fa-circle-notch"> </i> Public Holidays</a></li>
                        <li><a href="manage_leave_type.jsp"><i class="fa fa-circle-notch"></i> Manage Leave Type</a></li>
                        <!--<li><a href="earn_leave_config.jsp"><i class="fa fa-circle-notch"></i> Earn Leave Configure</a></li>-->
                        <li><a href="manage_leave_applications.jsp"><i class="fa fa-circle-notch"></i> Manage Application</a></li>
                        <li><a href="leave_applications.jsp"><i class="fa fa-circle-notch"></i> Leave Application List</a>
                        <li><a href="leave_report.jsp"><i class="fa fa-circle-notch"></i> Leave Report</a>
                            <!--<li><a href="leave_summary_report.jsp"><i class="fa fa-circle-notch"></i> Summary Report</a></li>-->
                    </ul>
                </li>
                <li class="sidebar-item  has-sub"><a href="javascript:void(0)" class='sidebar-link'>
                        <i class="fa fa-user breadcrumbColor"></i> <span>Attendance</span></i>
                        </span>
                    </a>

                    <ul class="submenu" style="display: block;">
                        <li><a href="manage_shift.jsp"><i class="fa fa-circle-notch"> </i> Manage Shifts</a></li>
                        <li class=""><a href="daily_attendance.jsp"><i class="fa fa-circle-notch"> </i> Daily Attendance</a></li>
                        <li class=""><a href="monthly_manual_attendance.jsp"><i class="fa fa-circle-notch"> </i> Monthly Attendance</a></li>
                        <li class=""><a href="missing_attendance"><i class="fa fa-circle-notch"> </i> Missing Attendance</a></li>
                        <li class=""><a href="att_summary_report.jsp"> <i class="fa fa-circle-notch"> </i> Summary Report</a></li>
                        <li class=""><a href="manual_attendance.jsp"><i class="fa fa-circle-notch"> </i> Manual Attendance</a></li>

                    </ul></li>
                <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'> <i class="mr-3 shrink-0 w-6 fa fa-file-invoice breadcrumbColor"></i>
                        <span>Payroll</span>
                    </a>
                    <ul class="submenu ">
                        <li><a href="manage_tax_rule_setup.jsp"> <i class="fa fa-circle-notch"> </i> Tax Rule Setup</a></li>
                        <li><a href="manage_allowance.jsp"> <i class="fa fa-circle-notch"> </i> Allowance</a></li>
                        <li><a href="manage_payment_history.jsp"> <i class="fa fa-circle-notch"> </i> Payment History</a></li>
                        <li><a href="manage_monthly_pay_grade.jsp"> <i class="fa fa-circle-notch"> </i> Monthly Pay Grade</a></li>
                        <li><a href="manage_deduction.jsp"> <i class="fa fa-circle-notch"> </i> Deduction</a></li>
                        <li><a href="manage_approve_work_hour.jsp"> <i class="fa fa-circle-notch"> </i> Approve Work Hour</a></li>
                        <li><a href="manage_hourly_pay_grade.jsp"> <i class="fa fa-circle-notch"> </i> Hourly Pay Grade</a></li>
                        <li><a href="manage_generate_salary_sheet.jsp"> <i class="fa fa-circle-notch"> </i> Generate Salary Sheet</a></li>


                    </ul>
                </li>
                <li class="sidebar-item "><a href="reports.jsp"
                                             class='sidebar-link'> <i class="fa fa-chart-bar breadcrumbColor"></i>
                        <span>Reports</span>
                    </a></li>
                <!--                <li class="sidebar-item ">
                                    <a href="reports.jsp" class='sidebar-link'> <i class="fa fa-user breadcrumbColor"></i>
                                        <span>User</span>
                                    </a></li>-->
                <li class="sidebar-item  has-sub">
                    <a href="javascript:void(0)" class='sidebar-link'> <i class="mr-3 shrink-0 w-6 fas fa-cog breadcrumbColor"></i>
                        <span>Settings</span>
                    </a>
                    <ul class="submenu ">
                        <li class="sidebar-item  has-sub">
                            <a href="javascript:void(0)" class='sidebar-link-'> <i class="mr-3 shrink-0 w-6 fas fa-circle-notch breadcrumbColor"></i>
                                <span>Roles</span>
                            </a>
                            <ul class="submenu ">
                                <li><a href="manage_role.jsp"> <i class="fa fa-circle-notch"> </i> Manage Roles</a></li>
                                <li><a href="manage_role_permision.jsp"><i class="fa fa-circle-notch"> </i> Role Permission</a></li>
                              

                            </ul>
                        </li>
                        
                        <li><a href="manage_user.jsp"><i class="fa fa-circle-notch"> </i> Users</a></li>
                        <li><a href="update_password.jsp"><i class="fa fa-circle-notch"> </i> Change Password</a></li>

                    </ul>
                </li>
            </ul>
        </div>

    </body>
</html>
