
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <script src="assets/vendor/jquery/jquery.min.js"></script>  -->
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
              <li class="sidebar-item active ">
                  <a href="index.jsp" class='sidebar-link'> <i class="fa fa-home text-primary"></i>
                  <span>Dashboard</span>
                </a>
              </li>
              <li class="sidebar-item ">
                  <a href="profile.jsp" class='sidebar-link'> <i class="fa fa-user-alt text-primary"></i>
                  <span>Profile</span>
                </a>
              </li>
              <li class="sidebar-item ">
                  <a href="leave.jsp" class='sidebar-link'> <i class="fa fa-clock text-primary"></i>
                  <span>Time-off Request</span>
                </a>
              </li>
            
              <li class="sidebar-item  has-sub  ">
                  <a href="#" class='sidebar-link'> <i class="fa fa-table text-primary"></i>
                  <span>Time sheets</span>
                </a>
                <ul class="submenu ">
                  <li><a href="timesheet_log.jsp">Time sheet Form</a></li>
                  <li><a href="manage_timesheet.jsp">Time sheet Logs</a></li>
                </ul>
              </li>
                <li class="sidebar-item ">
                  <a href="payroll.jsp" class='sidebar-link'> <i class="fa fa-money-bill-alt text-primary"></i>
                  <span>Payroll</span>
                </a>
              </li>
                <li class="sidebar-item ">
                  <a href="documents.jsp" class='sidebar-link'> <i class="fa fa-folder-open text-primary"></i>
                  <span>Documents</span>
                </a>
              </li>
                <li class="sidebar-item ">
                  <a href="trainings.jsp" class='sidebar-link'> <i class="fa fa-book-reader text-primary"></i>
                  <span>Trainings</span>
                </a>
              </li>
                <li class="sidebar-item ">
                  <a href="notification.jsp" class='sidebar-link'> <i class="fa fa-bell text-primary"></i>
                  <span>Notifications</span>
                </a>
              </li>
              <li class="sidebar-item">
                  <a href="./logout.jsp" class='sidebar-link'> <i class="fa fa-lock"></i>
                  <span class="title">Log Out</span>
                </a></li>

            </ul>
          </div>
        
    </body>
</html>
