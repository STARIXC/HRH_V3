package models;

public class Leave {
	private int leave_id, accrual_rate, max_days;
	private String  leave_type,  description;
        private boolean is_accrued;
        

	public Leave() {
		
	}

    public int getLeave_id() {
        return leave_id;
    }

    public void setLeave_id(int leave_id) {
        this.leave_id = leave_id;
    }

    public int getAccrual_rate() {
        return accrual_rate;
    }

    public void setAccrual_rate(int accrual_rate) {
        this.accrual_rate = accrual_rate;
    }

    public int getMax_days() {
        return max_days;
    }

    public void setMax_days(int max_days) {
        this.max_days = max_days;
    }

    public String getLeave_type() {
        return leave_type;
    }

    public void setLeave_type(String leave_type) {
        this.leave_type = leave_type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isIs_accrued() {
        return is_accrued;
    }

    public void setIs_accrued(boolean is_accrued) {
        this.is_accrued = is_accrued;
    }
        
        

}
