package models;

/**
 *
 * @author CBwahyi
 */
public class EmploymentHistory {

    private String emprecordid, emp_no,mfl, facility, financial_year, position, emp_type,date_started, date_ended;
    private int position_id,months_worked,  expected_months, active;
    private String current_contract,contract_period, contract_end_date;

    public EmploymentHistory() {
    }

    public String getFacility() {
        return facility;
    }

    public void setFacility(String facility) {
        this.facility = facility;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getEmp_type() {
        return emp_type;
    }

    public String getMfl() {
        return mfl;
    }

    public void setMfl(String mfl) {
        this.mfl = mfl;
    }

    public int getPosition_id() {
        return position_id;
    }

    public void setPosition_id(int position_id) {
        this.position_id = position_id;
    }

    public void setEmp_type(String emp_type) {
        this.emp_type = emp_type;
    }

    public String getEmprecordid() {
        return emprecordid;
    }

    public void setEmprecordid(String emprecordid) {
        this.emprecordid = emprecordid;
    }

    public String getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(String emp_no) {
        this.emp_no = emp_no;
    }

    public String getFinancial_year() {
        return financial_year;
    }

    public void setFinancial_year(String financial_year) {
        this.financial_year = financial_year;
    }

    public int getMonths_worked() {
        return months_worked;
    }

    public void setMonths_worked(int months_worked) {
        this.months_worked = months_worked;
    }

    public String getContract_period() {
        return contract_period;
    }

    public void setContract_period(String contract_period) {
        this.contract_period = contract_period;
    }

    public int getExpected_months() {
        return expected_months;
    }

    public void setExpected_months(int expected_months) {
        this.expected_months = expected_months;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public String getDate_started() {
        return date_started;
    }

    public void setDate_started(String date_started) {
        this.date_started = date_started;
    }

    public String getDate_ended() {
        return date_ended;
    }

    public void setDate_ended(String date_ended) {
        this.date_ended = date_ended;
    }

    public String getCurrent_contract() {
        return current_contract;
    }

    public void setCurrent_contract(String current_contract) {
        this.current_contract = current_contract;
    }

    public String getContract_end_date() {
        return contract_end_date;
    }

    public void setContract_end_date(String contract_end_date) {
        this.contract_end_date = contract_end_date;
    }

  
}
