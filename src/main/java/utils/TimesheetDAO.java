package utils;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import models.Date;
import models.Timesheet;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author CBwahyi
 */
public class TimesheetDAO {

    private final DatabaseConnection conn;
    private static final Logger LOGGER = Logger.getLogger(TimesheetLogDAO.class.getName());

    public TimesheetDAO() {
        conn = new DatabaseConnection();
    }

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

   

}