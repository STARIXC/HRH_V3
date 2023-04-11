/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author UTJ
 */
public class TimesheetSum {

    String log_no;
    String name;
    String position;
    String hours_worked;
    String leave_hours_worked;
    String holiday_hrs;
    String earned_leave;

    public String getLog_no() {
        return log_no;
    }

    public void setLog_no(String log_no) {
        this.log_no = log_no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getHours_worked() {
        return hours_worked;
    }

    public void setHours_worked(String hours_worked) {
        this.hours_worked = hours_worked;
    }

    public String getLeave_hours_worked() {
        return leave_hours_worked;
    }

    public void setLeave_hours_worked(String leave_hours_worked) {
        this.leave_hours_worked = leave_hours_worked;
    }

    public String getHoliday_hrs() {
        return holiday_hrs;
    }

    public void setHoliday_hrs(String holiday_hrs) {
        this.holiday_hrs = holiday_hrs;
    }

    public String getEarned_leave() {
        return earned_leave;
    }

    public void setEarned_leave(String earned_leave) {
        this.earned_leave = earned_leave;
    }

    public TimesheetSum() {
    }
    
}
