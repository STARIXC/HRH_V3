package models;

/**
 *
 * @author CBwahyi
 */
public class TimesheetSummary {
     private String empNo;
    private int hoursWorked;
    private int leaveHours;
    private int holidayHours;
    private int expectedHours;
    private int extraHours;
    private int totalHours;
    private String month;
    private String year;

    public TimesheetSummary() {
    }

    public String getEmpNo() {
        return empNo;
    }

    public void setEmpNo(String empNo) {
        this.empNo = empNo;
    }

    public int getHoursWorked() {
        return hoursWorked;
    }

    public void setHoursWorked(int hoursWorked) {
        this.hoursWorked = hoursWorked;
    }

    public int getLeaveHours() {
        return leaveHours;
    }

    public void setLeaveHours(int leaveHours) {
        this.leaveHours = leaveHours;
    }

    public int getHolidayHours() {
        return holidayHours;
    }

    public void setHolidayHours(int holidayHours) {
        this.holidayHours = holidayHours;
    }

    public int getExpectedHours() {
        return expectedHours;
    }

    public void setExpectedHours(int expectedHours) {
        this.expectedHours = expectedHours;
    }

    public int getTotalHours() {
        return totalHours;
    }

    public void setTotalHours(int totalHours) {
        this.totalHours = totalHours;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public int getExtraHours() {
        return extraHours;
    }

    public void setExtraHours(int extraHours) {
        this.extraHours = extraHours;
    }
    
    
    
    
    
}
