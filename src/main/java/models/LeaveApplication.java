package models;


public class LeaveApplication {
 private String   date_of_application,start_date,end_date,  remarks, date_of_approval,leave_type_name, employee_name,duration;

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
 private int  application_id,employee_id, leave_type_id,leave_status,user_id;
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
public int getEmployee_id() {
	return employee_id;
}
public void setEmployee_id(int employee_id) {
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
public LeaveApplication(String date_of_application, String remarks, String date_of_approval, int employee_id,
		int leave_type_id, int leave_status, int user_id, Double number_days) {
	super();
	this.date_of_application = date_of_application;
	this.remarks = remarks;
	this.date_of_approval = date_of_approval;
	this.employee_id = employee_id;
	this.leave_type_id = leave_type_id;
	this.leave_status = leave_status;
	this.user_id = user_id;
	this.number_days = number_days;
}
public LeaveApplication(String date_of_application, String remarks, String date_of_approval, int application_id,
		int employee_id, int leave_type_id, int leave_status, int user_id, Double number_days) {
	super();
	this.date_of_application = date_of_application;
	this.remarks = remarks;
	this.date_of_approval = date_of_approval;
	this.application_id = application_id;
	this.employee_id = employee_id;
	this.leave_type_id = leave_type_id;
	this.leave_status = leave_status;
	this.user_id = user_id;
	this.number_days = number_days;
}
public LeaveApplication() {
	super();

}
public LeaveApplication(int employee_id, int leave_type_id, int leave_status, Double number_days,
		String date_of_application) {
	this.employee_id = employee_id;
	this.leave_type_id = leave_type_id;
	this.leave_status = leave_status;
	this.number_days = number_days;
}

    public LeaveApplication( int employee_id, int leave_type_id,String date_of_application, Double number_days, int leave_status, String start_date, String end_date) {
        this.date_of_application = date_of_application;
        this.start_date = start_date;
        this.end_date = end_date;
        this.employee_id = employee_id;
        this.leave_type_id = leave_type_id;
        this.leave_status = leave_status;
        this.number_days = number_days;
    }
 
 
}
