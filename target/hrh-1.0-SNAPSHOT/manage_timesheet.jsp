<!DOCTYPE html>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Time sheet</title>

    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendor/DataTables/datatables.css">
    <script defer src="assets/fontawesome/js/all.min.js"></script>
    <!--<script defer src="assets/fontawesome/js/all.min.js"></script>-->
    <link rel="stylesheet" href="assets/css/app.css">
  </head>
  <body>
    <%
      String id = (String) session.getAttribute("userid");
      if (id != null) {
    %>
    <div id="app">
      <div id="sidebar" class='active'>
        <div class="aspNetHidden">
          <input type="hidden" name="__STAFFID" id="__STAFFID"	value="<% out.println(id);%>" />
        </div>
        <div class="sidebar-wrapper active">
          <div class="sidebar-header" style="height: 50px; margin-top: -30px">
            <i class="fa fa-users text-success me-4"></i> <span>HRM</span>
          </div>
          <div class="sidebar-menu">
            <ul class="menu">
              <li class="sidebar-item  "><a href="index.jsp"
                                            class='sidebar-link'> <i class="fa fa-home text-primary"></i>
                  <span>Dashboard</span>
                </a></li>
              <li class="sidebar-item "><a href="apply_leave.jsp"
                                           class='sidebar-link'> <i class="fa fa-plane text-primary"></i>
                  <span>Apply Leave</span>
                </a></li>
              <li class="sidebar-item "><a href="leave_status.jsp"
                                           class='sidebar-link'> <i class="fa fa-plane text-primary"></i>
                  <span>Leave Status</span>
                </a></li>
              <li class="sidebar-item  has-sub active "><a href="#"
                                                           class='sidebar-link'> <i class="fa fa-table text-primary"></i>
                  <span>Time sheets</span>
                </a>
                <ul class="submenu ">
                  <li><a href="timesheet_log.jsp">Time sheet Form</a></li>
                  <li><a href="manage_timesheet.jsp">Time sheet Logs</a></li>
                </ul></li>
              <li class="sidebar-item"><a href="./Logout" class='sidebar-link'> <i class="fa fa-lock"></i>
                  <span class="title">Log Out</span>
                </a></li>

            </ul>
          </div>
          <button class="sidebar-toggler btn x">
            <i data-feather="x"></i>
          </button>
        </div>
      </div>
      <div id="main">
        <nav class="navbar navbar-header navbar-expand navbar-light">
          <a class="sidebar-toggler" href="#"><span
              class="navbar-toggler-icon"></span></a>
          <button class="btn navbar-toggler" type="button"
                  data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                  aria-controls="navbarSupportedContent" aria-expanded="false"
                  aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul
              class="navbar-nav d-flex align-items-center navbar-light ms-auto">

              <li class="dropdown"><a href="#" data-bs-toggle="dropdown"
                                      class="nav-link dropdown-toggle nav-link-lg nav-link-user">
                  <div class="avatar me-1">
                    <img src="assets/images/admin.png" alt="" srcset="" />
                  </div>
                  <div class="d-none d-md-block d-lg-inline-block">
                    Hi,
                    <%
                      if (session.getAttribute("userid") != null) {
                        out.println(session.getAttribute("fullname").toString());
                      }
                    %>
                  </div>
                </a>
                <div class="dropdown-menu dropdown-menu-end">
                  <a class="dropdown-item" href="update.html"><i
                      data-feather="user"></i> Account</a> <a class="dropdown-item"
                                                          href="update_password.jsp"><i data-feather="settings"></i>
                    Settings</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="./Logout"><i
                      data-feather="log-out"></i> Logout</a>
                </div></li>
            </ul>
          </div>
        </nav>
        <div class="main-content container-fluid">
          <div class="page-title">
            <div class="row">
              <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>Time sheet Logs</h3>
              </div>
              <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html" class="text-success">Dash board</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Timesheet</li>
                  </ol>
                </nav>
              </div>
            </div>

          </div>


          <!-- // Basic multiple Column Form section start -->
          <section id="multiple-column-form">
            <div class="row match-height">
              <div class="col-12">
                <div class="card">
                  <div class="card-content">
                    <div class="card-body">
                      <div class="table-responsive">

                        <table class="table table-striped table-bordered table-hover" id="timesheetLogs" >
                          <thead>
                            <tr>
                              <!-- <th>S#</th> -->
                              <th>Year</th>
                              <th>Month Name</th>
                              <th>Hours Worked</th>
                              <th>Leave </th> 
                              <th>Public Holiday</th> 
                              <th>Extra</th>
                              <th>Total Hours</th>
                              <th>Expected Hours</th>
                              <th>Status</th>
                              <th>Action</th>
                            </tr>
                          </thead>
                          <tbody id="timesheetLogs_">





                          </tbody>
                        </table>


                      </div>

                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
          <!-- // Basic multiple Column Form section end -->
        </div>

      </div>
    </div>
    <!-- JavaScript files-->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/DataTables/datatables.js"></script>
    <script src="assets/vendor/popper.js/umd/popper.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/vendor/jquery.cookie/jquery.cookie.js"></script>
    <script src="assets/vendor/chart.js/Chart.min.js"></script>
    <script src="assets/vendor/jquery-validation/jquery.validate.min.js"></script>

    <script src="assets/vendor/additional/additional.js"></script>
    <script src="assets/js/feather-icons/feather.min.js"></script>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/app.js"></script>

    <script src="assets/js/pages/timesheet_logs.js"></script>
    <script src="assets/js/main.js"></script>


    <%
      } else {
        response.sendRedirect("login.jsp");
      }
    %>
  </body>
</html>
