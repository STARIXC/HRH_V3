<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Timesheet</title>
        <link rel="stylesheet" href="./assets/css/custom.css">
        <link rel="shortcut icon" href="./assets/img/logo.png" type="image/x-icon">
        <link rel="stylesheet" href="./assets/css/bootstrap.css">
        <link rel="stylesheet" href="./assets/css/bootstrap-toggle.min.css">
        <link rel="stylesheet" href="./assets/css/toggle.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.2.4/css/fixedHeader.bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">
        <link href="./assets/vendor/swal2/sweetalert2.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="./assets/vendor/calender/lib/jquery-ui.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.5.95/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="./assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <style type="text/css">
            .notif:hover{
                background-color: rgba(0,0,0,0.1);
            }
            .fade:not(.show) {
                opacity: 1 !important;
            }

            .sidemenu .card-body {
                padding: 10px;
            }
        </style>
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    </head>

    <body>
        <%@include file="/_includes/header_.jsp"%>


          <% String id = (String) session.getAttribute("emp_no");%>
        <div class="main-content container-fluid">
             <input type="hidden" name="__STAFFID" id="__STAFFID"	value="<% out.println(id);%>" />
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-auto">
                            <div class="page-header-title">
                                <h4 class="m-b-10">
                                    Timesheet
                                </h4>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="./">Home</a></li>
                                <li class="breadcrumb-item">Timesheet</li>
                            </ul>
                        </div>
                       
                    </div>
                </div>
            </div>
            <div class="row pt-5">
                <form method="post" autocomplete="off" accept-charset="utf-8" id="timesheetForm_" name="timesheetForm_" >
                

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body table-border-style">
                                        <div class="row">
                        <div class="col-4">
                            <div class="form-group">
                                <label class="control-label" for="email">Month<span class="validateRq">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                    <input type="text" class="form-control monthField required" readonly placeholder="Month"  name="month" id="monthyear" />
                                </div>
                            </div>
                        </div>
                        <div class="col-4">

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
                                    <div class="time_sheet_form_" >
                                        <div class="table-responsive" >
                                            <table class="table">

                                                <thead style="text-align:center; font-weight:normal;">
                                                <input type="hidden" name="empno_" id="empno_" value="<%=id%>" />
                                                <input type="hidden" class="form-control" name="log_id"  id="log_id" value="" autocomplete="off" />
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




                            </div>
                        </div>   
                    </div>     
                </form>  
            </div>
        </div>
        <!-- // Basic Vertical form layout section end -->
    </div>
</div>
</div>
</div>
<%@include file="/_includes/modals.jsp"%>
<script src="./assets/vendor/jquery/jquery.min.js" type="text/javascript"></script>
<script src="./assets/vendor/calender/lib/jquery-ui.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="./assets/vendor/swal2/sweetalert2.min.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/fixedheader/3.2.4/js/dataTables.fixedHeader.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.3.0/js/responsive.bootstrap.min.js"></script>
<script defer src="./assets/fontawesome/js/all.min.js" type="text/javascript"></script>
<script src="./assets/js/feather-icons/feather.min.js"></script>
<script src="./assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="./assets/js/app.js"></script>
<script src="./assets/js/main.js"></script>

 <script src="./assets/js/staff_pages/timesheet.js" type="text/javascript"></script>
<%@include file="/_includes/include_footer.jsp"%>
</body>

</html> 