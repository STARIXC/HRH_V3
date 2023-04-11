package utils;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.sql.*;
import models.Day;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.TimesheetSum;

/**
 *
 * @author CBWAHYI
 */
public class GetDates {

    private final DatabaseConnection conn;
    private JSONConverter json;
    public GetDates() {
        conn = new DatabaseConnection();
    }

    public List<Day> getMonthDates(String month, String year, String emp_no) {
        List<Day> month_days = new ArrayList<>();
        int next_m = Integer.parseInt(month) - 1;
        String start_date = year + "-" + next_m + "-" + "26";
        String end_date = year + "-" + month + "-" + "25";

        //String SELECT_ALL_DATES = "SELECT date_field, DAYNAME(date_field) AS day_name FROM (SELECT MAKEDATE(YEAR('"+Start_date+"'),1) + INTERVAL (MONTH('"+Start_date+"')-1) MONTH + INTERVAL daynum DAY date_field FROM ( SELECT t*10+u daynum FROM (SELECT 0 t UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) A,(SELECT 0 u UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) B ORDER BY daynum) AA) AAA WHERE MONTH(date_field) = MONTH('"+Start_date+"');";
        String SELECT_ALL_DATES = " SELECT a.dt as date_field, a.dayName AS day_name, IFNULL(b.hours_worked,'0') as hours_worked ,a.isWeekday as isWeekday,a.isHoliday as isHoliday"
                + ",IFNULL(b.log_no,'0') as log_no, "
                + "IFNULL(b.activity_desc,'-') as activity,IFNULL(b.leave_hours,0) as leave_hours,IFNULL(b.public_holiday,0) as public_holiday,IFNULL(b.extra,0) as extra_hrs FROM calendar_table a"
                + " LEFT JOIN timesheet_log_activities b ON a.dt=b.log_date WHERE b.emp_no='" + emp_no + "'AND cast(a.dt as date) BETWEEN '" + start_date + "' AND '" + end_date + "'  ";
        //String SELECT_ALL_DATES = "SELECT  `activity_log_id`,  `activity_code`,  `hours_worked`,  `log_date`,  `emp_no`,  `log_no`, LEFT(`activity_desc`, 256) FROM `hrh`.`timesheet_log_activities` ORDER BY `activity_desc` ASC LIMIT 1000";
        try {
            //  System.out.println(SELECT_ALL_DATES);
            conn.rs = conn.st.executeQuery(SELECT_ALL_DATES);
            while (conn.rs.next()) {
                Day day = new Day();
                day.setDate_field(conn.rs.getString("date_field"));
                day.setDate_name(conn.rs.getString("day_name"));
                day.setHours_worked(conn.rs.getInt("hours_worked"));
                day.setLeave_hours(conn.rs.getInt("leave_hours"));
                day.setPublic_holiday(conn.rs.getInt("public_holiday"));
                day.setExtra(conn.rs.getInt("extra_hrs"));
                day.setLog_no(conn.rs.getString("log_no"));
                //day.setEmp_no(conn.rs.getString(emp_no));
                day.setActivity_desc(conn.rs.getString("activity"));
                day.setIsHoliday(conn.rs.getString("isHoliday"));
                day.setIsWeekday(conn.rs.getString("isWeekday"));
                month_days.add(day);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
           Logger.getLogger(GetDates.class.getName()).log(Level.SEVERE, null, e);
        }
        return month_days;

    }

    public List<Day> getMonthBlankDates(String month, String year, String emp_no) {
        List<Day> month_days = new ArrayList<>();
        int next_m = Integer.parseInt(month) - 1;
        String start_date = year + "-" + next_m + "-" + "26";
        String end_date = year + "-" + month + "-" + "25";
        //String SELECT_ALL_DATES = "SELECT date_field, DAYNAME(date_field) AS day_name FROM (SELECT MAKEDATE(YEAR('"+Start_date+"'),1) + INTERVAL (MONTH('"+Start_date+"')-1) MONTH + INTERVAL daynum DAY date_field FROM ( SELECT t*10+u daynum FROM (SELECT 0 t UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) A,(SELECT 0 u UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) B ORDER BY daynum) AA) AAA WHERE MONTH(date_field) = MONTH('"+Start_date+"');";
        String SELECT_ALL_DATES = " SELECT a.dt as date_field, a.dayName AS day_name, IFNULL(b.hours_worked,0) as hours_worked,a.isWeekday as isWeekday,a.isHoliday as isHoliday ,IFNULL(b.log_no,'0') as log_no, IFNULL(b.activity_desc,'-') as activity ,IFNULL(b.leave_hours,'0') as leave_hours,IFNULL(b.public_holiday,'0') as public_holiday,IFNULL(b.extra,'0') as extra_hrs FROM calendar_table a LEFT JOIN timesheet_log_activities b ON a.dt=b.log_date WHERE cast(a.dt as date) BETWEEN '" + start_date + "' AND '" + end_date + "' ";
        //String SELECT_ALL_DATES = "SELECT  `activity_log_id`,  `activity_code`,  `hours_worked`,  `log_date`,  `emp_no`,  `log_no`, LEFT(`activity_desc`, 256) FROM `hrh`.`timesheet_log_activities` ORDER BY `activity_desc` ASC LIMIT 1000";
        try {
            //  System.out.println(SELECT_ALL_DATES);
            conn.rs = conn.st.executeQuery(SELECT_ALL_DATES);
            while (conn.rs.next()) {
                Day day = new Day();
                day.setDate_field(conn.rs.getString("date_field"));
                day.setDate_name(conn.rs.getString("day_name"));
                day.setHours_worked(conn.rs.getInt("hours_worked"));
                day.setLeave_hours(conn.rs.getInt("leave_hours"));
                day.setPublic_holiday(conn.rs.getInt("public_holiday"));
                day.setExtra(conn.rs.getInt("extra_hrs"));
                day.setLog_no(conn.rs.getString("log_no"));
                // day.setEmp_no(conn.rs.getString(emp_no));
                day.setActivity_desc(conn.rs.getString("activity"));
                day.setIsHoliday(conn.rs.getString("isHoliday"));
                day.setIsWeekday(conn.rs.getString("isWeekday"));
                month_days.add(day);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(GetDates.class.getName()).log(Level.SEVERE, null, e);
        }
        return month_days;

    }

    public List<String> getMonthDays(String month, String year) {
        ArrayList<String> month_days = new ArrayList<>();//Creating arraylist 
        int next_m = Integer.parseInt(month) - 1;
        String start_date = year + "-" + next_m + "-" + "26";
        String end_date = year + "-" + month + "-" + "25";
        String SELECT_ALL_DATES = " SELECT   a.dayName AS day_name  FROM calendar_table a LEFT JOIN timesheet_log_activities b ON a.dt=b.log_date WHERE cast(a.dt as date) BETWEEN '" + start_date + "' AND '" + end_date + "' ";
        try {
            //System.out.println(SELECT_ALL_DATES);
            conn.rs = conn.st.executeQuery(SELECT_ALL_DATES);
            while (conn.rs.next()) {

                month_days.add(conn.rs.getString("day_name"));//Adding object in arraylist    

                //Printing the arraylist object   
                //  System.out.println(list);  
                //  Day day = new Day();
                //   day.setDate_field(conn.rs.getString("date_field"));
                //   day.setDate_name(conn.rs.getString("day_name"));
                //  month_days.add(day);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(GetDates.class.getName()).log(Level.SEVERE, null, e);
        }
        return month_days;

    }

    public String MonthName(String month) {
        String MonthName = "";
        String SELECT_ALL_DATES = " select distinct(a.monthName)  as MonthName FROM calendar_table a where a.m='" + month + "'";
        try {

            conn.rs = conn.st.executeQuery(SELECT_ALL_DATES);
            while (conn.rs.next()) {
                //  Month month_ = new Month();
                MonthName = conn.rs.getString("MonthName");
                System.out.println(MonthName);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(GetDates.class.getName()).log(Level.SEVERE, null, e);
        }
        return MonthName;

    }

    public List<TimesheetSum> getData(String month, String year) {
        //  JSONObject obj = new JSONObject();
       ArrayList<TimesheetSum> data = new ArrayList<>();//Creating arraylist 
//        int i=0;
        String SELECT_ALL_DATA = "SELECT a.log_no,a.emp_no,CONCAT(e.first_name , ' ', e.other_name, ' ', e.surname  )as EName,\n" +
"cp.position_title as position, a.hours_worked as hours_worked,a.leave_hours as leave_hours_worked,a.holiday_hours as holiday_hrs,\n" +
"((sum(cast(a.hours_worked as decimal)+cast(a.leave_hours as decimal)+cast(a.holiday_hours as decimal))*1.75)/cast(a.expected_hours as decimal)) as earned_leave\n" +
"FROM timesheet_logs a Left JOIN emp_bio e ON a.emp_no=e.emp_no left join employee_hist hr on e.emp_no = hr.emp_no  left join cadre_positions cp on cp.id=hr.position where month ='2' and year ='2022' GROUP BY log_no ORDER BY log_no ASC\n" +
";";
        try {
            conn.rs = conn.st.executeQuery(SELECT_ALL_DATA);
            while (conn.rs.next()) {
                TimesheetSum timesheet = new TimesheetSum();
        String log_no=conn.rs.getString("log_no");
              String name=conn.rs.getString("EName");
              String position=conn.rs.getString("position");
              String hours_worked=conn.rs.getString("hours_worked");
              String leave_hours_worked=conn.rs.getString("leave_hours_worked");
              String holiday_hrs=conn.rs.getString("holiday_hrs");
              String earned_leave=conn.rs.getString("earned_leave");
              timesheet.setLog_no(log_no);
              timesheet.setName(name);
              timesheet.setPosition(position);
              timesheet.setHours_worked(hours_worked);
              timesheet.setLeave_hours_worked(leave_hours_worked);
              timesheet.setHoliday_hrs(holiday_hrs);
              timesheet.setEarned_leave(earned_leave);
            
              data.add(timesheet);
            //  obj.toString();
         
            //  System.out.println(obj);
               
               
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
           Logger.getLogger(GetDates.class.getName()).log(Level.SEVERE, null, e);
        }
  return data;
    }
}
