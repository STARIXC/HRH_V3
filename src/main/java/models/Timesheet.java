package models;

import java.util.List;

/**
 *
 * @author CBwahyi
 */
public class Timesheet {

    private String date_field;
    private String date_name;
    private String activity_log_id;
    private String firstName;
    private String surname;
    private int activity_code;
    private int hours_worked;
    private int leave_hours;
    private int public_holiday;
    private int extra;
    private String log_date;
    private String emp_no;
    private String log_no;
    private String activity_desc;
    private int month;
    private int year;
    private int isWeekday;
    private int isHoliday;
    private int onLeave;
    private List<Date> dates;
    private List<String> dateList;

    public Timesheet() {
    }

    public String getDate_field() {
        return date_field;
    }

    public void setDate_field(String date_field) {
        this.date_field = date_field;
    }

    public String getDate_name() {
        return date_name;
    }

    public void setDate_name(String date_name) {
        this.date_name = date_name;
    }

    public String getActivity_log_id() {
        return activity_log_id;
    }

    public void setActivity_log_id(String activity_log_id) {
        this.activity_log_id = activity_log_id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }
    
    

    public int getActivity_code() {
        return activity_code;
    }

    public void setActivity_code(int activity_code) {
        this.activity_code = activity_code;
    }

    public int getHours_worked() {
        return hours_worked;
    }

    public void setHours_worked(int hours_worked) {
        this.hours_worked = hours_worked;
    }

    public int getLeave_hours() {
        return leave_hours;
    }

    public void setLeave_hours(int leave_hours) {
        this.leave_hours = leave_hours;
    }

    public int getPublic_holiday() {
        return public_holiday;
    }

    public void setPublic_holiday(int public_holiday) {
        this.public_holiday = public_holiday;
    }

    public int getExtra() {
        return extra;
    }

    public void setExtra(int extra) {
        this.extra = extra;
    }

    public String getLog_date() {
        return log_date;
    }

    public void setLog_date(String log_date) {
        this.log_date = log_date;
    }

    public String getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(String emp_no) {
        this.emp_no = emp_no;
    }

    public String getLog_no() {
        return log_no;
    }

    public void setLog_no(String log_no) {
        this.log_no = log_no;
    }

    public String getActivity_desc() {
        return activity_desc;
    }

    public void setActivity_desc(String activity_desc) {
        this.activity_desc = activity_desc;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getIsWeekday() {
        return isWeekday;
    }

    public void setIsWeekday(int isWeekday) {
        this.isWeekday = isWeekday;
    }

    public int getIsHoliday() {
        return isHoliday;
    }

    public void setIsHoliday(int isHoliday) {
        this.isHoliday = isHoliday;
    }

    public int getOnLeave() {
        return onLeave;
    }

    public void setOnLeave(int onLeave) {
        this.onLeave = onLeave;
    }

    public List<Date> getDates() {
        return dates;
    }

    public void setDates(List<Date> dates) {
        this.dates = dates;
    }

    public List<String> getDateList() {
        return dateList;
    }

    public void setDateList(List<String> dateList) {
        this.dateList = dateList;
    }

}
