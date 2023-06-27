package org.usaidtujengejamii.hrh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Timesheet;
import models.TimesheetLog;
import models.TimesheetSummary;
import org.json.simple.JSONObject;
import utils.JSONConverter;
import utils.TimesheetDAO;

/**
 *
 * @author CBwahyi
 */
@WebServlet(name = "TimesheetController", urlPatterns = {"/timesheetController"})
public class TimesheetController extends HttpServlet {

    PrintWriter out;
    private final TimesheetDAO dao;
    private final JSONObject obj;
    private final JSONConverter json;
    /* Getting The Value From TextBox */
    String log_no,
            id,
            emp_no,
            hours_worked,
            timesheet_date,
            leave_hours,
            holiday_hours,
            extra_hours,
            total_hours,
            expected_hours,start_date,end_date;
    int shift = 1;
    String month,
            year;

    public TimesheetController() throws SQLException {
        dao = new TimesheetDAO();
        obj = new JSONObject();
        json = new JSONConverter();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        out = response.getWriter();
        // setting the response type
        response.setContentType("application/json");
        String action = request.getParameter("action");
        JSONObject obj_ = new JSONObject();
        switch (action) {
            case "save":
                String[] activity_desc;
                String[] a_hours_worked;
                String[] log_date;
                String[] leave;
                String[] holiday;
                String[] extra;
                timesheet_date = LocalDate.now().toString();
                log_no = request.getParameter("log_id");
                emp_no = request.getParameter("empno_");
                hours_worked = request.getParameter("tstotal");
                leave_hours = request.getParameter("ltotal");
                holiday_hours = request.getParameter("phtotal");
                extra_hours = request.getParameter("extotal");
                expected_hours = request.getParameter("exp_hour_");
                total_hours = request.getParameter("ttotal");
                month = request.getParameter("month");
                year = request.getParameter("year");
                activity_desc = request.getParameterValues("activity_desc");
                a_hours_worked = request.getParameterValues("hours_worked");
                log_date = request.getParameterValues("date_");
                leave = request.getParameterValues("leave");
                holiday = request.getParameterValues("pHoliday");
                extra = request.getParameterValues("extra_hours_worked");
//                end_date=log_date[p];
                String logID = month + year + emp_no + log_no;
                System.out.println(Arrays.toString(leave));

                boolean success = dao.addLog(logID, log_no, emp_no, timesheet_date, month, year, hours_worked, leave_hours, holiday_hours, extra_hours, total_hours, expected_hours, shift);
                if (success) {
                    for (int p = 0; p < log_date.length; p++) {
                        id = log_date[p] + "_" + emp_no;
                        String hoursWorked = a_hours_worked[p];
                        String leaveHours = leave[p];
                        String holidayHours = holiday[p];
                        String extraHours = extra[p];
                        String logDate = log_date[p];
                        String empNo = emp_no;
                        String logNo = log_no;
                        String activityDesc = activity_desc[p];
                        String pMonth = month;
                        String pYear = year;

                        boolean saved = dao.addActivityLog(id, hoursWorked, leaveHours, holidayHours, extraHours, logDate, empNo, logNo, activityDesc, pMonth, pYear);

                    }
                    obj_.put("status", "success");
                    obj_.put("message", "Saved Successfully....");
                    out.println(obj_);
                } else {
                    obj_.put("status", "failed");
                    obj_.put("message", "Something Went Wrong");
                    out.println(obj_);
                }
                break;

            case "getEmployeeEntries":
                emp_no = request.getParameter("emp_no");
                year = request.getParameter("year");
                month = request.getParameter("month");
                System.out.println(year + "_" + emp_no + "_" + month);
                // Retrieve the timesheet data for the selected month
                List<Timesheet> timesheetData = dao.getTimesheetEntriesForMonth(emp_no, year, month);
                boolean ans = timesheetData.isEmpty();
                if (ans == true) {
                    System.out.println("The data cannot be found for" + year + "_" + emp_no + "_" + month);
                } else {
                    out.println(JSONConverter.convert(timesheetData));

                }
//               
                break;
            case "view_time_sheet":
                emp_no = request.getParameter("emp_no");
                year = request.getParameter("year");
                month = request.getParameter("month");
//                System.out.println(year + "_" + emp_no + "_" + month);
                // Retrieve the timesheet data for the selected month
                List<Timesheet> timesheetDetails = dao.getTimesheetInfo(emp_no, year, month);
                boolean ans_ = timesheetDetails.isEmpty();
                if (ans_ == true) {
                    System.out.println("The data cannot be found for" + year + "_" + emp_no + "_" + month);
                } else {
                    out.println(JSONConverter.convert(timesheetDetails));

                }
//               
                break;
            case "time_sheet_summary":
                emp_no = request.getParameter("emp_no");
                 System.out.println(emp_no);
                year = request.getParameter("year");
                month = request.getParameter("month");
                try {

                    TimesheetSummary summary = dao.getSummaryForMonthAndYear(emp_no, month, year);
//                     System.out.println(JSONConverter.convert(summary));
                    obj.put("hoursWorked", summary.getHoursWorked());
                    obj.put("leaveHours", summary.getLeaveHours());
                    obj.put("holidayHours", summary.getHolidayHours());
                    obj.put("extraHours", summary.getExtraHours());
                    obj.put("totalHours", summary.getTotalHours());
                    obj.put("expectedHours", summary.getExpectedHours());
                } catch (SQLException e) {
                    obj.put("error", "Error getting chart data");
                    e.printStackTrace();
                }
                out.print(obj.toString());
                out.flush();
                break;

            case "getAllEntries":
                String year_ = request.getParameter("year");
                String month_ = request.getParameter("month");
                List<Timesheet> timesheetData_ = dao.getTimesheetData(year_, month_);
                // Create a JSON object for the response
                JSONObject jsonResponse = new JSONObject();

//                jsonResponse.put("data", timesheetData_);
                out.println(JSONConverter.convert(timesheetData_));
                break;
            case "approve":
//                approveTimesheetEntries(request, response);
                break;
            case "timesheetLogEmp":
                out = response.getWriter();
                // setting the response type
                response.setContentType("application/json");
                request.getParameter("action");
                emp_no = request.getParameter("emp_no");
                List<TimesheetLog> logs = dao.getActivityByStaffID(emp_no);
                System.out.print(logs);
                out.println(JSONConverter.convert(logs));
                break;
            default:
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("Invalid action specified");
                break;
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(TimesheetController.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(TimesheetController.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
