package models;

public class LeaveApplication {
      private int application_id,  leave_type_id, leave_status, user_id;
    private String date_of_application, start_date, end_date, remarks, date_of_approval, leave_type_name, employee_name, duration,  to, supervisor, facility, designation, employee_id;

    public LeaveApplication() {

    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public void setLeave_type_name(String leave_type_name) {
        this.leave_type_name = leave_type_name;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    public String getLeave_type_name() {
        return leave_type_name;
    }
  
    private Double number_days;

    public String getStart_date() {
        return start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getDate_of_application() {
        return date_of_application;
    }

    public void setDate_of_application(String date_of_application) {
        this.date_of_application = date_of_application;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getDate_of_approval() {
        return date_of_approval;
    }

    public void setDate_of_approval(String date_of_approval) {
        this.date_of_approval = date_of_approval;
    }

    public int getApplication_id() {
        return application_id;
    }

    public void setApplication_id(int application_id) {
        this.application_id = application_id;
    }

    public String getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(String employee_id) {
        this.employee_id = employee_id;
    }

    public int getLeave_type_id() {
        return leave_type_id;
    }

    public void setLeave_type_id(int leave_type_id) {
        this.leave_type_id = leave_type_id;
    }

    public int getLeave_status() {
        return leave_status;
    }

    public void setLeave_status(int leave_status) {
        this.leave_status = leave_status;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Double getNumber_days() {
        return number_days;
    }

    public void setNumber_days(Double number_days) {
        this.number_days = number_days;
    }
  
    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(String supervisor) {
        this.supervisor = supervisor;
    }

    public String getFacility() {
        return facility;
    }

    public void setFacility(String facility) {
        this.facility = facility;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

  

}
