/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.List;

/**
 *
 * @author UTJ
 */
public class EmployeeData {

    private final Employee employee;
    private final EmploymentHistory currentPosition;
    private Login loginDetails;
    private final List<EmploymentHistory> history;

    public EmployeeData(Employee employee, EmploymentHistory currentPosition, List<EmploymentHistory> history,Login loginDetails) {
        this.employee = employee;
        this.currentPosition = currentPosition;
        this.history = history;
        this.loginDetails=loginDetails;
    }

    public EmployeeData(Employee employee, List<EmploymentHistory> history, Login loginDetails) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Employee getEmployee() {
        return employee;
    }

    public EmploymentHistory getCurrentPosition() {
        return currentPosition;
    }

    public List<EmploymentHistory> getHistory() {
        return history;
    }

    public Login getLoginDetails() {
        return loginDetails;
    }

    public void setLoginDetails(Login loginDetails) {
        this.loginDetails = loginDetails;
    }
    
}