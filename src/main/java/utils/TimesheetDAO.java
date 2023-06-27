package utils;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Timesheet;
import models.TimesheetLog;
import models.TimesheetSummary;
import org.usaidtujengejamii.hrh.db.DatabaseConnection_;

/**
 *
 * @author CBwahyi
 */
public class TimesheetDAO {

    private final DatabaseConnection_ conn;
    private static final Logger LOGGER = Logger.getLogger(TimesheetDAO.class.getName());

    public TimesheetDAO() throws SQLException {
        conn = new DatabaseConnection_();
    }

    public List<Timesheet> getTimesheetInfo(String employeeId, String year, String month) throws SQLException {
        List<Timesheet> timesheetEntries = new ArrayList<>();

        try {
            // Get the start and end dates for the payroll month
            LocalDate startDate = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), 26).minusMonths(1);
            LocalDate endDate = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), 25);

            // Build the SQL query to join the timesheet, calendar, and leave tables
            String sql = "SELECT c.dt as date_field,\n"
                    + " c.dayName AS day_name,\n"
                    + " c.isWeekday as isWeekday,\n"
                    + " c.isHoliday isHoliday,\n"
                    + " IFNULL(t.log_no,'0') as log_no,\n"
                    + " IFNULL(t.activity_desc,'-') as activity,\n"
                    + "CASE \n"
                    + "    WHEN l.num_days IS NOT NULL AND l.num_days > 0 THEN  8*l.num_days/ l.num_days\n"
                    + "    ELSE 0\n"
                    + "END AS leave_hours,\n"
                    + "CASE \n"
                    + "    WHEN l.num_days IS NOT NULL AND l.num_days > 0 THEN 1\n"
                    + "    ELSE 0\n"
                    + "END AS onleave,\n"
                    + "CASE \n"
                    + "    WHEN c.isHoliday IS NOT NULL AND c.isHoliday > 0 THEN  8\n"
                    + "    ELSE 0\n"
                    + "END AS public_holiday,\n"
                    + "\n"
                    + "IFNULL(t.hours_worked,0) as hoursWorked,\n"
                    + "IFNULL(t.extra,0) as extra_hrs \n"
                    + "FROM hrh.calendar_table c \n"
                    + "LEFT JOIN (SELECT * FROM hrh.leave_requests WHERE employee_id = ? AND l_status = 1) l \n"
                    + "ON c.dt >= l.start_date AND c.dt <= l.end_date \n"
                    + "LEFT JOIN timesheet_log_activities t \n"
                    + "ON t.log_date = c.dt AND t.emp_no = ? \n"
                    + "WHERE c.dt BETWEEN ? AND ? \n"
                    + "ORDER BY c.dt ASC";

            // Prepare the statement and set the parameters
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, employeeId);
            conn.pst.setString(2, employeeId);
            conn.pst.setString(3, startDate.toString());
            conn.pst.setString(4, endDate.toString());

            // Execute the query and process the results
            conn.rs = conn.pst.executeQuery();
            while (conn.rs.next()) {
                Timesheet _timeTimesheet = new Timesheet();
                int isWeekday = conn.rs.getInt("isWeekday");
                int isHoliday = conn.rs.getInt("isHoliday");
                int hoursWorked = conn.rs.getInt("hoursWorked");
                int onLeave = conn.rs.getInt("onLeave");
                int extra_hrs = conn.rs.getInt("extra_hrs");
                _timeTimesheet.setDate_field(conn.rs.getString("date_field"));
                _timeTimesheet.setDate_name(conn.rs.getString("day_name"));
                _timeTimesheet.setHours_worked(hoursWorked);
                _timeTimesheet.setLeave_hours(conn.rs.getInt("leave_hours"));
                _timeTimesheet.setPublic_holiday(conn.rs.getInt("public_holiday"));
                _timeTimesheet.setExtra(extra_hrs);
                _timeTimesheet.setLog_no(conn.rs.getString("log_no"));
                _timeTimesheet.setActivity_desc(conn.rs.getString("activity"));
                _timeTimesheet.setIsHoliday(isHoliday);
                _timeTimesheet.setIsWeekday(isWeekday);
                _timeTimesheet.setOnLeave(onLeave);
                timesheetEntries.add(_timeTimesheet);
            }
        } catch (SQLException e) {
            throw new SQLException("Error getting timesheet entries for month", e);
        }

        return timesheetEntries;

    }
//    public List<Timesheet> getTimesheetInfo(String employeeId, String year, String month) throws SQLException {
//        List<Timesheet> timesheetEntries = new ArrayList<>();
//        try {
//            // Get the start and end dates for the payroll month
//            LocalDate startDate = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), 26).minusMonths(1);
//            LocalDate endDate = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), 25);
//            String sql = "SELECT c.dt as date_field,\n"
//                    + " c.dayName AS day_name,\n"
//                    + " c.isWeekday as isWeekday,\n"
//                    + " c.isHoliday isHoliday,\n"
//                    + " IFNULL(t.log_no,'0') as log_no,\n"
//                    + " IFNULL(t.activity_desc,'-') as activity,\n"
//                    + "CASE \n"
//                    + "    WHEN l.num_days IS NOT NULL AND l.num_days > 0 THEN  8*l.num_days/ l.num_days\n"
//                    + "    ELSE 0\n"
//                    + "END AS leave_hours,\n"
//                    + "CASE \n"
//                    + "    WHEN l.num_days IS NOT NULL AND l.num_days > 0 THEN 1\n"
//                    + "    ELSE 0\n"
//                    + "END AS onleave,\n"
//                    + "CASE \n"
//                    + "    WHEN c.isHoliday IS NOT NULL AND c.isHoliday > 0 THEN  8\n"
//                    + "    ELSE 0\n"
//                    + "END AS public_holiday,\n"
//                    + "\n"
//                    + "IFNULL(t.hours_worked,0) as hoursWorked,\n"
//                    + "IFNULL(t.extra,0) as extra_hrs \n"
//                    + "FROM hrh.calendar_table c \n"
//                    + "LEFT JOIN (SELECT * FROM hrh.leave_requests WHERE employee_id = ? AND l_status = 1) l \n"
//                    + "ON c.dt >= l.start_date AND c.dt <= l.end_date \n"
//                    + "LEFT JOIN timesheet_log_activities t \n"
//                    + "ON t.log_date = c.dt AND t.emp_no = ? \n"
//                    + "WHERE c.dt BETWEEN ? AND ? \n"
//                    + "ORDER BY c.dt ASC";
//            // Prepare the statement and set the parameters
//            conn.pst = conn.conn.prepareStatement(sql);
//            conn.pst.setString(1, employeeId);
//            conn.pst.setString(2, employeeId);
//            conn.pst.setString(3, startDate.toString());
//            conn.pst.setString(4, endDate.toString());
//
//            // Execute the query and process the results
//            conn.rs = conn.pst.executeQuery();
//            while (conn.rs.next()) {
//                Timesheet _timeTimesheet = new Timesheet();
//                int isWeekday = conn.rs.getInt("isWeekday");
//                int isHoliday = conn.rs.getInt("isHoliday");
//                int hoursWorked = conn.rs.getInt("hoursWorked");
//                int onLeave = conn.rs.getInt("onLeave");
//                int extra_hrs = conn.rs.getInt("extra_hrs");
//                _timeTimesheet.setDate_field(conn.rs.getString("date_field"));
//                _timeTimesheet.setDate_name(conn.rs.getString("day_name"));
//                _timeTimesheet.setHours_worked(hoursWorked);
//                _timeTimesheet.setLeave_hours(conn.rs.getInt("leave_hours"));
//                _timeTimesheet.setPublic_holiday(conn.rs.getInt("public_holiday"));
//                _timeTimesheet.setExtra(extra_hrs);
//                _timeTimesheet.setLog_no(conn.rs.getString("log_no"));
//                _timeTimesheet.setActivity_desc(conn.rs.getString("activity"));
//                _timeTimesheet.setIsHoliday(isHoliday);
//                _timeTimesheet.setIsWeekday(isWeekday);
//                _timeTimesheet.setOnLeave(onLeave);
//                timesheetEntries.add(_timeTimesheet);
//            }
//        } catch (SQLException e) {
//            if (e instanceof SQLNonTransientConnectionException) {
//                // Re-establish the database connection
////                conn.conn = DriverManager.getConnection(conn.conn.getMetaData().getURL(), conn.conn.getMetaData().getUserName(), password);
//                // Retry the query
//                return getTimesheetInfo(employeeId, year, month);
//            } else {
//                throw new SQLException("Error getting timesheet entries for month", e);
//            }
//
//        }
//
//        return timesheetEntries;
//    }

    public List<Timesheet> getTimesheetEntriesForMonth(String employeeId, String year, String month) throws SQLException {
        List<Timesheet> timesheetEntries = new ArrayList<>();

        try {
            // Get the start and end dates for the payroll month
            LocalDate startDate = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), 26).minusMonths(1);
            LocalDate endDate = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), 25);

            // Build the SQL query to join the timesheet, calendar, and leave tables
            String sql = "SELECT c.dt as date_field,\n"
                    + " c.dayName AS day_name,\n"
                    + " c.isWeekday as isWeekday,\n"
                    + " c.isHoliday isHoliday,\n"
                    + " IFNULL(t.log_no,'0') as log_no,\n"
                    + " IFNULL(t.activity_desc,'-') as activity,\n"
                    + "CASE \n"
                    + "    WHEN l.num_days IS NOT NULL AND l.num_days > 0 THEN  8*l.num_days/ l.num_days\n"
                    + "    ELSE 0\n"
                    + "END AS leave_hours,\n"
                    + "CASE \n"
                    + "    WHEN l.num_days IS NOT NULL AND l.num_days > 0 THEN 1\n"
                    + "    ELSE 0\n"
                    + "END AS onleave,\n"
                    + "CASE \n"
                    + "    WHEN c.isHoliday IS NOT NULL AND c.isHoliday > 0 THEN  8\n"
                    + "    ELSE 0\n"
                    + "END AS public_holiday,\n"
                    + "\n"
                    + "IFNULL(t.hours_worked,0) as hoursWorked,\n"
                    + "IFNULL(t.extra,0) as extra_hrs \n"
                    + "FROM hrh.calendar_table c \n"
                    + "LEFT JOIN (SELECT * FROM hrh.leave_requests WHERE employee_id = ? AND l_status = 1) l \n"
                    + "ON c.dt >= l.start_date AND c.dt <= l.end_date \n"
                    + "LEFT JOIN timesheet_log_activities t \n"
                    + "ON t.log_date = c.dt AND t.emp_no = ? \n"
                    + "WHERE c.dt BETWEEN ? AND ? \n"
                    + "ORDER BY c.dt ASC";

            // Prepare the statement and set the parameters
            conn.pst = conn.conn.prepareStatement(sql);

            conn.pst.setString(1, employeeId);
            conn.pst.setString(2, employeeId);
            conn.pst.setString(3, startDate.toString());
            conn.pst.setString(4, endDate.toString());

            // Execute the query and process the results
            conn.rs = conn.pst.executeQuery();
            while (conn.rs.next()) {
                Timesheet _timeTimesheet = new Timesheet();
                int isWeekday = conn.rs.getInt("isWeekday");
                int isHoliday = conn.rs.getInt("isHoliday");
                int hoursWorked = conn.rs.getInt("hoursWorked");
                int onLeave = conn.rs.getInt("onLeave");
                int extra_hrs = conn.rs.getInt("extra_hrs");
                _timeTimesheet.setDate_field(conn.rs.getString("date_field"));
                _timeTimesheet.setDate_name(conn.rs.getString("day_name"));
                _timeTimesheet.setHours_worked(hoursWorked);
                _timeTimesheet.setLeave_hours(conn.rs.getInt("leave_hours"));
                _timeTimesheet.setPublic_holiday(conn.rs.getInt("public_holiday"));
                _timeTimesheet.setExtra(extra_hrs);
                _timeTimesheet.setLog_no(conn.rs.getString("log_no"));
                _timeTimesheet.setActivity_desc(conn.rs.getString("activity"));
                _timeTimesheet.setIsHoliday(isHoliday);
                _timeTimesheet.setIsWeekday(isWeekday);
                _timeTimesheet.setOnLeave(onLeave);
                timesheetEntries.add(_timeTimesheet);
            }
        } catch (SQLException e) {
            throw new SQLException("Error getting timesheet entries for month", e);
        }

        return timesheetEntries;
    }

    public List<Timesheet> getTimesheetData(String year, String month) throws SQLException {
        List<Timesheet> data = new ArrayList<>();
        // Retrieve the data from the database and return it as a list of TimesheetData objects
        try {
            // Get the start and end dates for the payroll month
            LocalDate startDate = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), 26).minusMonths(1);
            LocalDate endDate = LocalDate.of(Integer.parseInt(year), Integer.parseInt(month), 25);

            // Build the SQL query to join the timesheet, calendar, and leave tables
            String sql = "SELECT\n"
                    + "  emp.emp_no,\n"
                    + "  emp.first_name,\n"
                    + "  emp.surname,\n"
                    + "  c.dt AS date_field,\n"
                    + "  c.dayName AS day_name,\n"
                    + "  c.isWeekday AS isWeekday,\n"
                    + "  c.isHoliday AS isHoliday,\n"
                    + "  IFNULL(t.log_no, '0') AS log_no,\n"
                    + "  IFNULL(t.activity_desc, '-') AS activity,\n"
                    + "  CASE \n"
                    + "    WHEN l.num_days IS NOT NULL AND l.num_days > 0 THEN 8 \n"
                    + "    ELSE 0\n"
                    + "  END AS leave_hours,\n"
                    + "  CASE \n"
                    + "    WHEN l.num_days IS NOT NULL AND l.num_days > 0 THEN 1\n"
                    + "    ELSE 0\n"
                    + "  END AS onleave,\n"
                    + "  CASE \n"
                    + "    WHEN c.isHoliday IS NOT NULL AND c.isHoliday > 0 THEN 8\n"
                    + "    ELSE 0\n"
                    + "  END AS public_holiday,\n"
                    + "  IFNULL(t.hours_worked, 0) AS hoursWorked,\n"
                    + "  IFNULL(t.extra, 0) AS extra_hrs \n"
                    + "FROM hrh.emp_bio emp\n"
                    + "CROSS JOIN hrh.calendar_table c\n"
                    + "LEFT JOIN hrh.leave_requests l \n"
                    + "  ON c.dt >= l.start_date AND c.dt <= l.end_date AND l.employee_id = emp.emp_no AND l.l_status = 1\n"
                    + "LEFT JOIN timesheet_log_activities t \n"
                    + "  ON t.log_date = c.dt AND t.emp_no = emp.emp_no\n"
                    + "WHERE c.dt BETWEEN ? AND ? \n"
                    + "ORDER BY emp.emp_no ASC, c.dt ASC";

            // Prepare the statement and set the parameters
            conn.pst = conn.conn.prepareStatement(sql);

            conn.pst.setString(1, startDate.toString());
            conn.pst.setString(2, endDate.toString());

            // Execute the query and process the results
            conn.rs = conn.pst.executeQuery();
            while (conn.rs.next()) {
                Timesheet _timeTimesheet = new Timesheet();
                int isWeekday = conn.rs.getInt("isWeekday");
                int isHoliday = conn.rs.getInt("isHoliday");
                int hoursWorked = conn.rs.getInt("hoursWorked");
                int onLeave = conn.rs.getInt("onLeave");
                int extra_hrs = conn.rs.getInt("extra_hrs");
                _timeTimesheet.setDate_field(conn.rs.getString("date_field"));
                _timeTimesheet.setFirstName(conn.rs.getString("first_name"));
                _timeTimesheet.setSurname(conn.rs.getString("surname"));
                _timeTimesheet.setEmp_no(conn.rs.getString("emp_no"));
                _timeTimesheet.setDate_name(conn.rs.getString("day_name"));
                _timeTimesheet.setHours_worked(hoursWorked);
                _timeTimesheet.setLeave_hours(conn.rs.getInt("leave_hours"));
                _timeTimesheet.setPublic_holiday(conn.rs.getInt("public_holiday"));
                _timeTimesheet.setExtra(extra_hrs);
                _timeTimesheet.setLog_no(conn.rs.getString("log_no"));
                _timeTimesheet.setActivity_desc(conn.rs.getString("activity"));
                _timeTimesheet.setIsHoliday(isHoliday);
                _timeTimesheet.setIsWeekday(isWeekday);
                _timeTimesheet.setOnLeave(onLeave);
                data.add(_timeTimesheet);
            }

        } catch (SQLException e) {
            throw new SQLException("Error getting timesheet entries for month", e);
        }
        return data;
    }

    public List<TimesheetLog> getActivityByStaffID(String emp_no) {
        List<TimesheetLog> activityLogs = new ArrayList<>();
        Connection connection = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            connection = conn.conn;
            String sql = "SELECT DISTINCT a.log_id,a.month,a.year,a.log_no,a.emp_no,a.log_date,a.hours_worked,a.leave_hours,"
                    + " a.holiday_hours,a.extra_hours,a.expected_hours,a.status, "
                    + " b.monthName ,a.total_hours AS total_hours  FROM timesheet_logs a"
                    + " JOIN calendar_table b ON a.month=b.m  where a.emp_no=?";
            pst = connection.prepareStatement(sql);
            pst.setString(1, emp_no);
            rs = pst.executeQuery();
            while (rs.next()) {
                TimesheetLog activityLog = new TimesheetLog();
//            activityLog.setLog_id(rs.getString("log_id"));
                activityLog.setMonth(rs.getString("month"));
                activityLog.setYear(rs.getString("year"));
                activityLog.setLog_no(rs.getString("log_no"));
                activityLog.setEmp_no(rs.getString("emp_no"));
                activityLog.setMonthName(rs.getString("monthName"));
                activityLog.setLog_date(rs.getString("log_date"));
                activityLog.setExpected_hrs(rs.getString("expected_hours"));
                activityLog.setHours_worked(rs.getString("hours_worked"));
                activityLog.setOnleave_hours(rs.getString("leave_hours"));
                activityLog.setExtra_hours_worked(rs.getString("extra_hours"));
                activityLog.setHoliday(rs.getString("holiday_hours"));
                activityLog.setThours_worked(rs.getString("total_hours"));
                activityLog.setShift(rs.getString("status"));
                activityLogs.add(activityLog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return activityLogs;
    }

    public boolean addLog(String log_id, String log_no, String emp_no, String timesheet_date, String month, String year, String hours_worked, String leave_hours, String holiday_hours, String extra_hours, String total_hours, String expected_hours, int shift) {
        boolean success = false;

        try {
            // Build the SQL query to insert the timesheet log data
            String sql = "REPLACE INTO `timesheet_logs` (log_id,log_no,emp_no,log_date,month,year,hours_worked,leave_hours,holiday_hours,extra_hours,total_hours,expected_hours,status) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, log_id);
            conn.pst.setString(2, log_no);
            conn.pst.setString(3, emp_no);
            conn.pst.setString(4, timesheet_date);
            conn.pst.setString(5, month);
            conn.pst.setString(6, year);
            conn.pst.setString(7, hours_worked);
            conn.pst.setString(8, leave_hours);
            conn.pst.setString(9, holiday_hours);
            conn.pst.setString(10, extra_hours);
            conn.pst.setString(11, total_hours);
            conn.pst.setString(12, expected_hours);
            conn.pst.setInt(13, shift);

            // Execute the query and check if any rows were affected
            int rowsAffected = conn.pst.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException e) {
            Logger.getLogger(TimesheetDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return success;
    }

    public boolean addActivityLog(String id, String hoursWorked, String leaveHours, String holidayHours, String extraHours, String logDate, String empNo, String logNo, String activityDesc, String pMonth, String pYear) {

        boolean success = false;

        try {
            // Build the SQL query to insert the timesheet log data
            String sql = "REPLACE INTO timesheet_log_activities"
                    + "(activity_log_id,hours_worked,leave_hours,public_holiday,extra,log_date,emp_no,log_no,activity_desc,month,year)"
                    + " VALUES (?,?,?,?,? ,?,?,?,?,?,?)";

            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, id);
            conn.pst.setString(2, hoursWorked);
            conn.pst.setString(3, leaveHours);
            conn.pst.setString(4, holidayHours);
            conn.pst.setString(5, extraHours);
            conn.pst.setString(6, logDate);
            conn.pst.setString(7, empNo);
            conn.pst.setString(8, logNo);
            conn.pst.setString(9, activityDesc);
            conn.pst.setString(10, pMonth);
            conn.pst.setString(11, pYear);

            // Execute the query and check if any rows were affected
            int rowsAffected = conn.pst.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException e) {
            Logger.getLogger(TimesheetDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return success;

    }

    public TimesheetSummary getSummaryForMonthAndYear(String empNo, String month, String year) throws SQLException {
        TimesheetSummary summary = null;

        String sql = "SELECT SUM(CONVERT(hours_worked, UNSIGNED)) AS hours_worked, SUM(CONVERT(leave_hours ,unsigned)) AS leave_hours, \n" +
"            SUM(CONVERT(holiday_hours , unsigned)) AS holiday_hours, SUM(CONVERT(extra_hours, unsigned)) AS extra_hours, SUM(CONVERT(total_hours ,unsigned)) AS total_hours, \n" +
"          SUM(CONVERT(expected_hours ,unsigned)) AS expected_hours FROM timesheet_logs WHERE emp_no  = ? AND month = ? AND year = ?";

        try {

            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, empNo);
            conn.pst.setString(2, month);
            conn.pst.setString(3, year);
//System.out.println(conn.pst);
            conn.rs = conn.pst.executeQuery();

            if (conn.rs.next()) {
                summary= new TimesheetSummary();
                int hoursWorked = conn.rs.getInt("hours_worked");
                int leaveHours = conn.rs.getInt("leave_hours");
                int holidayHours = conn.rs.getInt("holiday_hours");
                int extraHours = conn.rs.getInt("extra_hours");
                int totalHours = conn.rs.getInt("total_hours");
                int expectedHours = conn.rs.getInt("expected_hours");
               
                summary.setEmpNo(empNo);
                summary.setMonth(month);
                summary.setYear(year);
                summary.setHoursWorked(hoursWorked);
                summary.setLeaveHours(leaveHours);
                summary.setHolidayHours(holidayHours);
                summary.setExtraHours(extraHours);
                summary.setTotalHours(totalHours);
                summary.setExpectedHours(expectedHours);
//        System.out.println(JSONConverter.convert(summary));
            }
        } catch (SQLException e) {
            Logger.getLogger(TimesheetDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return summary;
    }

}
