<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply Leave</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.css">

    <link rel="stylesheet" href="../assets/css/app.css">
    <link rel="stylesheet" href="../assets/vendor/calender/lib/jquery-ui.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
   
  </head>
  <body>
      <%@include file="/_includes/header.jsp"%>
 <div class="main-content container-fluid">
          <div class="page-title">
            <div class="row">
              <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>Apply for Leave</h3>
              </div>
              <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html"
                                                   class="text-success">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Leave
                      Application</li>
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
                      <form class="form" id="leave_application" autocomplete="off">
                        <div class="row">
                          <div id="ajaxResponse"></div>
                          <div class="col-md-6 col-12">
                            <div class="form-group has-icon-left">
                              <label for="first-name-icon">Days Applied</label>
                              <div class="position-relative">
                                <input type="hidden" class="form-control"
                                       id="fy_id" value="<%=fy_id%>">
                                <input type="hidden" class="form-control"
                                       id="employee_id" value="<%=id%>">
                                <input type="text" class="form-control" id="days_applied"  value="0" readonly>
                                <div class="form-control-icon">
                                  <i class="fa fa-table"></i>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="col-md-6 col-12">
                            <div class="form-group has-icon-left">
                              <label for="first-name-icon">Select Leave Type</label>
                              <div class="position-relative">
                                <fieldset class="form-group">

                                  <select class="form-select" id="leave_type_id"
                                          name="basicSelectLeaveType" onchange="leavetypechange();">

                                  </select>
                                  <span id="enjoy">You Enjoyed : 0 Ds</span>
                                    <span id="checkleave">Total Leave : 12 Ds</span>
                                </fieldset>
                              </div>
                            </div>
                          </div>
                          <div class="col-md-6 col-12">
                            <div class="form-group has-icon-left">
                              <label for="calender-icon">From Date</label>
                              <div class="position-relative">
                                <input type="text" class="form-control" placeholder="Start Date" id="start_date" name="start_date" value="" data-date-format="yyyy-mm-dd"  />
                                <div class="form-control-icon">
                                  <i class="fa fa-calendar"></i>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="col-md-6 col-12">
                            <div class="form-group has-icon-left">
                              <label for="calender-icon">To Date</label>
                              <div class="position-relative">
                                <input type="text" class="form-control" placeholder="End Date" id="end_date"  name="end_date" value="" data-date-format="yyyy-mm-dd"  />
                                <div class="form-control-icon">
                                  <i class="fa fa-calendar"></i>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="col-12 d-flex justify-content-end">
                            <button type="submit" class="btn btn-primary me-1 mb-1">Submit</button>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
          <!-- // Basic multiple Column Form section end -->
          <input type="hidden" name="" id="base_url" value="./">
        </div>

      </div>
    </div>
    <!-- JavaScript files-->
    <script src="../assets/vendor/jquery/jquery.min.js"></script>
    <script src="../assets/vendor/calender/lib/jquery-ui.min.js"></script>
    <script src="../assets/js/pages/leave.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <script src="../assets/vendor/popper.js/umd/popper.min.js"></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/vendor/jquery.cookie/jquery.cookie.js"></script>
    <script src="../assets/vendor/chart.js/Chart.min.js"></script>
    <script src="../assets/vendor/jquery-validation/jquery.validate.min.js"></script>
  
    <script defer src="../assets/fontawesome/js/all.min.js"></script>
    <script src="../assets/vendor/additional/additional.js"></script>
    <script src="../assets/js/feather-icons/feather.min.js"></script>
    <script src="../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../assets/js/app.js"></script>

    <script src="../assets/js/main.js"></script>


    <script>

      $(document).ready(function () {
        //

      });
    </script>
    <%@include file="/_includes/include_footer.jsp"%>
  </body>
</html>
