package models;

import java.util.List;

/**
 *
 * @author CBwahyi
 */
public class EmployeeProfileData {

    private final Employee employee;
    private final Login loginDetails;
    private final List<EmploymentHistory> history;

    public EmployeeProfileData(Employee employee, Login loginDetails, List<EmploymentHistory> history) {
        this.employee = employee;
        this.loginDetails = loginDetails;
        this.history = history;
    }

    public Employee getEmployee() {
        return employee;
    }

    public Login getLoginDetails() {
        return loginDetails;
    }

    public List<EmploymentHistory> getHistory() {
        return history;
    }
    
    
    
    
    
}
