package models;

import java.util.Date;

public class Holiday {
	private int id ; 
	private String holiday_name ;
	private Date start_date;
	private Date end_date ;
	private String no_of_days;
        private String comment;

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getHoliday_name() {
		return holiday_name;
	}


	public void setHoliday_name(String holiday_name) {
		this.holiday_name = holiday_name;
	}


	public Date getStart_date() {
		return start_date;
	}


	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}


	public Date getEnd_date() {
		return end_date;
	}


	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}


	public String getNo_of_days() {
		return no_of_days;
	}


	public void setNo_of_days(String no_of_days) {
		this.no_of_days = no_of_days;
	}

    @Override
    public String toString() {
        return "Holiday{" + "id=" + id + ", holiday_name=" + holiday_name + ", start_date=" + start_date + ", end_date=" + end_date + ", no_of_days=" + no_of_days + ", comment=" + comment + '}';
    }



	
	
}
