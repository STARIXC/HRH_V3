package org.usaidtujengejamii.hrh.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import java.time.LocalDate;

/**
 * Servlet implementation class LogTimesheet
 */
public class LogTimesheet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    PrintWriter out;
    int status, execute_activity = 0;
//    private TimesheetLogDAO dao;
    Gson gson = new Gson();
    String result, nextPage;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogTimesheet() {
        super();
//        dao = new TimesheetLogDAO();
    }

    /**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @SuppressWarnings("unused")
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // defining the PrintWriter object
        out = response.getWriter();

        // setting the response type
        response.setContentType("application/json");
        request.getParameter("action");
        String emp_no = request.getParameter("emp_no");

//        List<TimeSheetLog> logs = dao.getActivityByStaffID(emp_no);
//        out.println(JSONConverter.convert(logs));

    }

    /**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @SuppressWarnings("static-access")
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            out = response.getWriter();
            /* Getting The Value From TextBox */
            String log_no, id, emp_no, hours_worked, timesheet_date, leave_hours, holiday_hours, extra_hours, total_hours, expected_hours;
            int shift = 1;
            int month, year;
            timesheet_date = LocalDate.now().toString();

            log_no = request.getParameter("log_id");
            emp_no = request.getParameter("empno_");
            hours_worked = request.getParameter("tstotal");
            leave_hours = request.getParameter("ltotal");
            holiday_hours = request.getParameter("phtotal");
            extra_hours = request.getParameter("extotal");
            // extra_hours = request.getParameter("tstotal");
            expected_hours = request.getParameter("exp_hour_");
            total_hours = request.getParameter("ttotal");

            month = Integer.parseInt(request.getParameter("TMonth"));
            year = Integer.parseInt(request.getParameter("Tyear"));
            // request.getParameter("tested");
            System.out.println("Log entry Date:" + timesheet_date);
            //shift = Integer.parseInt(request.getParameter("shift"));
            //	String[] activity_code = request.getParameterValues("activity_hrh");
            String[] activity_desc = request.getParameterValues("activity_desc");
            String[] a_hours_worked = request.getParameterValues("hours_worked");
            String[] log_date = request.getParameterValues("date_");
            String[] leave = request.getParameterValues("leave");
            String[] holiday = request.getParameterValues("pHoliday");
            String[] extra = request.getParameterValues("extra_hours_worked");

            String sql_log = "REPLACE INTO `timesheet_logs` (log_no,emp_no,log_date,month,year,hours_worked,leave_hours,holiday_hours,extra_hours,total_hours,expected_hours,status) VALUES ('" + log_no
                    + "', '" + emp_no + "','" + timesheet_date + "','" + month + "','" + year + "','" + hours_worked + "','" + leave_hours + "','" + holiday_hours + "','" + extra_hours + "','" + total_hours + "','" + expected_hours + "','" + shift + "')";
            System.out.println("Log Query Date:" + sql_log);
            for (int p = 0; p < log_date.length; p++) {
                id = log_date[p] + "_" + emp_no;
                String sql = "REPLACE INTO timesheet_log_activities"
                        + "(activity_log_id,hours_worked,leave_hours,public_holiday,extra,log_date,emp_no,log_no,activity_desc,month,year)"
                        + " VALUES ('" + id + "','" + a_hours_worked[p] + "','" + leave[p] + "',"
                        + "'" + holiday[p] + "','" + extra[p] + "','" + log_date[p] + "','" + emp_no + "','" + log_no
                        + "','" + activity_desc[p] + "','" + month + "','" + year + "')";
                //System.out.println(a_hours_worked[p]);
                //  System.out.println("Log Query Date:" + sql);
//                dao.addActivityLog(sql);
            }

            // fill it to the time sheet log
            //TimeSheetLog log = new TimeSheetLog(shift, log_no, emp_no, log_date, hours_worked);
            // Call the database access object and save the Log object
//            status = dao.addLog(sql_log);

            if (status == 0) {
                System.out.println("Log entry failled");

            } else {
                result = "Record Submited Successfully";
                nextPage = "index.jsp";
            }

        } catch (IOException | NumberFormatException e) {
            out.println(e);
        } finally {
            out.close();
        }

    }

}
