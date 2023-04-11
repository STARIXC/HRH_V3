
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.*"%>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Time Sheet</title>
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <script defer src="assets/fontawesome/js/all.min.js"></script>
    <link rel="stylesheet" href="assets/vendors/chartjs/Chart.min.css">
    <link rel="stylesheet"
          href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="shortcut icon" href="assets/images/favicon.svg"
          type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />
  </head>
  <body>
    <%
      Random rand = new Random();
      int log_no = rand.nextInt(90000) + 10000;
      String id = (String) session.getAttribute("userid");
      if (id != null) {
    %>
    <div id="app">
      <div id="sidebar" class='active'>
        <div class="sidebar-wrapper active">
          <div class="sidebar-header" style="height: 50px; margin-top: -30px">
            <i class="fa fa-users text-success me-4"></i> <span>HRM</span>
          </div>
          <div class="sidebar-menu">
            <ul class="menu">
              <li class="sidebar-item active "><a href="index.jsp"
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
                  <span>Timesheets</span>
                </a>
                <ul class="submenu ">
                  <li><a href="timesheet_log.jsp">Timesheet Form</a></li>
                  <li><a href="manage_timesheet.jsp">Timesheet Logs</a></li>
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
                    <img src="assets/images/admin.png" alt="" srcset="">
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
                <h3>Time sheet</h3>
              </div>
              <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.jsp" class="text-success">Dashboard</a></li>
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

                      <%
                        if (session.getAttribute("level") != null) {
                      %>
                      <%
                        if (session.getAttribute("level").toString().equals("3")) {
                      %>
                      <div class="row">
                        <div class="hrh-loader" id="overlay-screen-lock">
                          <%@ include file="_includes/loader.jsp"%>
                        </div>
                        <div class="col-sm-12 col-md-12">
                          <div class="card">
                            <div class="card-header has-shadow">
                              <div class="card-title">
                                <h4>Volunteer Timesheet</h4>
                              </div>
                            </div>
                            <div class="card-body">
                              <form action="/create_atten_vol" method="post"
                                    accept-charset="utf-8">
                                <div class="row">
                                  <div class="col-md-4 col-sm-12">
                                    <div class="form-group">
                                      <label for="date_" class="col-form-label">Date*</label> <input
                                        type="hidden" name="empno_" id="" name="
                                        empno" 
                                        value="<%out.println(session.getAttribute("userid").toString());%>" />
                                      <input type="text" name="date_" id="date_" placeholder="Date"
                                             class="form-control datetimepicker" value=""
                                             autocomplete="off" />
                                    </div>
                                  </div>

                                  <!--The d-none class is used to hide the out-time, as now only intime field is using for attendance time-->
                                  <div class="col-md-4 col-sm-12">
                                    <div class="form-group ">
                                      <label for="activity" class="col-form-label">Activity*</label>

                                      <input type="text" name="activity" id="activity"
                                             placeholder="Activity conducted" class="form-control"
                                             value="" autocomplete="off" />
                                    </div>
                                  </div>
                                  <div class="col-md-4 col-sm-12">
                                    <div class="form-group ">
                                      <label for="hrsworked" class="col-form-label">Hours
                                        Worked*</label> <input type="number" name="hrsworked" id="activity"
                                                             placeholder="" class="form-control " value=""
                                                             autocomplete="off" />
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                      <label for="tst" class="col-form-label">Tested*</label> <input
                                        type="number" name="tested" id="tested" placeholder="Date"
                                        class="form-control" value="" autocomplete="off" />
                                    </div>
                                  </div>

                                  <!--The d-none class is used to hide the out-time, as now only intime field is using for attendance time-->
                                  <div class="col-md-6 col-sm-6">
                                    <div class="form-group ">
                                      <label for="positive" class="col-form-label">Positive
                                        Indentified*</label> <input type="number" name="positive"
                                                                  id="positive" placeholder="" class="form-control" value=""
                                                                  autocomplete="off" />
                                    </div>
                                  </div>
                                </div>

                                <button type="button" class="btn btn-success w-md m-b-5"
                                        autocomplete="off">Save and Submit</button>
                              </form>
                            </div>
                          </div>
                        </div>

                      </div>
                      <%
                        }
                        if (session.getAttribute("level").toString().equals("1")) {
                      %>
                      <div class="row">
                        <div class="col-sm-12 col-md-12">
                          <div class="card_">
                            <div class="card-header_">
                              <div class="card-title_">
                                <div class="page-title">
                                  <div class="row">
                                    <div class="col-12 col-md-9 order-md-1 order-last">
                                      <h4>&nbsp;&nbsp;&nbsp;Monthly Timesheet for&nbsp;<font color="#0066cc"><% out.println(session.getAttribute("fullname").toString());%></font></h4>
                                    </div>

                                  </div>

                                </div>

                              </div>
                            </div>
                            <form method="post" autocomplete="off" accept-charset="utf-8" id="timesheetForm_" name="timesheetForm_" >
                              <div class="row">
                                <div class="col-md-4 col-sm-12">
                                  <div class="form-group">
                                    <label for="shift" class="col-form-label">Year*</label>
                                    <select required data-placeholder="Reporting Year" class="Tyear form-control" tabindex="-1" onchange="loadmonths();retrivetimesheet();"  id="Tyear" name="Tyear">
                                      <option value=""></option>                                 

                                    </select>
                                    <i>(01-Apr-2022 - 30-Apr-2022)</i>
                                  </div>
                                </div>

                                <div class="col-md-4 col-sm-12">
                                  <input type="hidden" name="empno_" id="empno_" value="<%=id%>" />
                                  <input type="hidden" class="form-control" name="log_id"  id="log_id" value="" autocomplete="off" />
                                  <div class="form-group">
                                    <label for="date_" class="col-form-label">Month*</label> 
                                    <select required data-placeholder="Reporting Month" class="form-control" tabindex="-1"  id="TMonth" name="TMonth" onchange="retrivetimesheet();gethours();">
                                      <option value="">Choose reporting year first</option>                                 

                                    </select>
                                  </div>
                                </div>

                                <div class="col-md-4 col-sm-12">
                                  <div class="form-group">
                                    <span class="col-form-label mt-5">TS Ref.:&nbsp;&nbsp;<font color="green" id="logno"></font></span>
                                    <br/>
                                    <span class="col-form-label">
                                      Minimum Hours:&nbsp;&nbsp;<font color="green" id="exp_hour">0.00</font>
                                    </span>
                                  </div>
                                </div>
                                <div class="col-md-4 col-sm-12">

                                  <div class="form-group">
                                    <label for="date_" class="col-form-label">Facility Supervisor*</label> 
                                    <select name="PMID" id="PMID" class="form-control">

                                    </select>
                                  </div>
                                </div>
                                <div class="col-md-4 col-sm-12">

                                  <div class="form-group">
                                    <label for="date_" class="col-form-label">Technical Monitor*</label> 
                                    <select name="TMID" id="TMID" class="form-control">

                                    </select>
                                  </div>
                                </div>
                              </div>

                              <div class="row">

                                <div class="time_sheet_form_" >
                                  <div class="table-responsive" >
                                    <table class="table">

                                      <thead style="text-align:center; font-weight:normal;">
                                      <input type="hidden" name="MnthBeginning" value="4/1/2022">
                                      <input type="hidden" name="MthEnd" value="4/30/2022">
                                      <input type="hidden" name="TSID" id="TSID" value="">
                                      <input type="hidden" name="stHours" id="stHours" value="166">
                                      <input type="hidden" name="StaffID" id="StaffID" value="<%=id%>">
                                      <input type="hidden" name="exp_hour_"  id="exp_hour_" value="">
                                      <input type="hidden" name="pmapproved" value="0">
                                      <th>Day/Date</th>
                                      <th>Hours Worked</th>
                                      <th>Leave</th>
                                      <th>Public Holiday</th>
                                      <th>Extra</th>
                                      <th>Note</th>
                                      </thead>
                                      <tbody id="table_timesheet" class="tbody">

                                      </tbody>
                                      <tfoot>
                                        <tr bgcolor="#f8f8f8" style="text-align:center; font-weight:normal;">
                                          <td colspan="1" >&nbsp;<b>Total Hours&nbsp;&nbsp;</b></td>

                                          <td align="center">
                                            <b id="THours">0.00&nbsp;</b>
                                            <input type="hidden" name="tstotal" id="tstotal" value="0" />
                                          </td>

                                          <td align="center" >
                                            <b><font color="#ff3300" class="leave_tot" id="leave_tot">0.00&nbsp;</font></b>
                                            <input type="hidden" name="ltotal" id="ltotal" value="0" />
                                          </td>
                                          <td align="center" >
                                            <b><font color="#ff3300" class="pholiday_tot" id="pholiday_tot">0.00&nbsp;</font></b>
                                            <input type="hidden" name="phtotal" id="phtotal" value="0" />
                                          </td>
                                          <td align="center" >
                                            <b><font color="#ff3300" class="extra_tot" id="ETotal">0.00&nbsp;</font></b>
                                            <input type="hidden" name="extotal" id="extotal" value="0" />
                                          </td>

                                          <td>
                                            <b><font color="#ff3300" class="tot_tot" id="labelTotalH">0.00&nbsp;</font></b>
                                            <input type="hidden" name="ttotal" id="ttotal" value="0" />
                                          </td>
                                        </tr>
                                        <tr bgcolor="#ffffff" style="text-align:center; font-weight:normal;">
                                          <td nowrap="" colspan="1" >&nbsp;<b>Total Hours %&nbsp;&nbsp;</b></td>

                                          <td ><font color="blue">0.0&nbsp;%</font></td>
                                          <td ><font color="blue">0.0&nbsp;%</font></td>
                                          <td ><font color="blue">0.0&nbsp;%</font></td>
                                          <td ><font color="#ff3300">0.0&nbsp;%              

                                            </font></td>
                                          <td>
                                            <b>&nbsp;</b>
                                            
                                          </td>
                                        </tr>
                                        <tr bgcolor="">
                                          <td align="right" colspan="-1" style="border-top:1px solid #f8f8f8;">&nbsp;</td>    
                                          <td colspan="2" bgcolor="" style="border-top:1px solid #f8f8f8;">

                                            <input class=" btn btn-success" type="submit" value="Save Timesheet" name="submitts" /> 
                                          </td>
                                          <td align="right" colspan="-1" style="border-top:1px solid #f8f8f8;">&nbsp;</td>        
                                        </tr>


                                      </tfoot>
                                    </table>
                                  </div>
                                </div>
                              </div>


                            </form>

                          </div>
                        </div>
                      </div>



                      <%
                        }
                        if (session.getAttribute("level").toString().equals("2")) {
                      %>
                      <div class="row">
                        <div class="col-sm-12 col-md-12">
                          <div class="card-">
                            <div class="card-header-has-shadow">
                              <div class="card-title-">
                                <h4>STAFF Timesheet</h4>
                              </div>
                            </div>
                            <div class="card-body-">
                              <form method="post" autocomplete="off" accept-charset="utf-8"
                                    id="timesheetForm">
                                <div class="row mb-5">
                                  <div class="col-md-4 col-sm-12">
                                    <input type="hidden" name="empno_" id="empno_" value="<%=id%>" />
                                    <input type="hidden" class="form-control" name="log_id"
                                           id="log_id" value="<%=log_no%>" autocomplete="off">
                                    <div class="form-group">
                                      <label for="date_" class="col-form-label">Date*</label> <input
                                        type="date" name="date_" id="date_" placeholder="Date"
                                        class="form-control datetimepicker" value="" />
                                    </div>
                                  </div>


                                  <!--The d-none class is used to hide the out-time, as now only intime field is using for attendance time-->
                                  <div class="col-md-4 col-sm-12">
                                    <div class="form-group">
                                      <label for="shift" class="col-form-label">Shitf*</label> <select
                                        name="shift" id="shift" class="form-control">
                                        <option>---Select One---</option>
                                        <option value="1">Day Shift</option>
                                        <option value="2">Night Shift</option>
                                      </select>
                                    </div>
                                  </div>
                                  <div class="col-md-4 col-sm-12">
                                    <div class="form-group">
                                      <label for="total_hrs" class="col-form-label">Total
                                        Hours Worked</label> <input type="text" name="total_hrs"
                                                                  id="total_hrs" class="form-control total_hrs" value=""
                                                                  readonly />
                                    </div>
                                  </div>

                                </div>

                                <div class="">
                                  <div class="table-responsive">
                                    <table class="table">
                                      <thead>

                                      <th>Activity Conducted</th>
                                      <th>Hours Spend on the Activity</th>
                                      <th><button class="btn btn-md btn-primary"
                                                  id="addBtn" type="button">Add Activity</button></th>
                                      </thead>
                                      <tbody id="tbody" class="tbody">
                                        <tr id="">

                                          <td class="text-center"><select name="activity_hrh"
                                                                          class="form-control activity_hhr">

                                            </select></td>
                                          <td class="text-center"><input type="number"
                                                                         name="a_hours_worked" placeholder="Hours Worked*"
                                                                         class="form-control a_hours_worked" value=""
                                                                         autocomplete="off" step="0.01" /></td>
                                          <td class="text-center"></td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  </div>

                                </div>

                                <button type="submit" class="btn btn-success w-md m-b-5"
                                        name="save" id="save">Save and Submit</button>
                              </form>
                            </div>
                          </div>
                        </div>

                      </div>
                      <%
                          }
                        }
                      %>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js" ></script>
    <script src="assets/vendor/DataTables/datatables.js"></script>
    <script src="assets/vendor/popper.js/umd/popper.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="assets/vendor/jquery.cookie/jquery.cookie.js"></script>
    <script src="assets/vendor/chart.js/Chart.min.js"></script>
    <script src="assets/vendor/jquery-validation/jquery.validate.min.js"></script>

    <script src="assets/vendor/additional/additional.js"></script>
    <script src="assets/js/feather-icons/feather.min.js"></script>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/app.js"></script>

    <script src="assets/js/main.js"></script>

    <script src="assets/js/pages/custom_.js" type="text/javascript"></script>

    <script>
                                      $(document).ready(function () {

                                      

                                      });
    </script>
    <script src="assets/js/pages/timesheet.js" type="text/javascript"></script>
    <%
      } else {
        response.sendRedirect("login.jsp");
      }
    %>
  </body>
</html>
