/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author CBwahyi
 */
public class TimesheetDateData {
    private String dateField;
    private int isWeekday;
    private int isHoliday;
    private int leaveHours;
    private int onLeave;
    private int publicHoliday;

    public TimesheetDateData(String dateField, int isWeekday, int isHoliday, int leaveHours, int onLeave, int publicHoliday) {
        this.dateField = dateField;
        this.isWeekday = isWeekday;
        this.isHoliday = isHoliday;
        this.leaveHours = leaveHours;
        this.onLeave = onLeave;
        this.publicHoliday = publicHoliday;
    }

    public String getDateField() {
        return dateField;
    }

    public void setDateField(String dateField) {
        this.dateField = dateField;
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

    public int getLeaveHours() {
        return leaveHours;
    }

    public void setLeaveHours(int leaveHours) {
        this.leaveHours = leaveHours;
    }

    public int getOnLeave() {
        return onLeave;
    }

    public void setOnLeave(int onLeave) {
        this.onLeave = onLeave;
    }

    public int getPublicHoliday() {
        return publicHoliday;
    }

    public void setPublicHoliday(int publicHoliday) {
        this.publicHoliday = publicHoliday;
    }
}
