/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.Date;

/**
 *
 * @author UTJ
 */
public class EmpHistory {

    private String emprecordid;
    private String emp_no;
    private String nationalid;
    private Facility facility;
    private String financial_year;
    private Position position;
//    private String emp_type;
    private int months_worked, contract_period, expected_months, active;
    private Date date_started, date_ended, current_contract, contract_end_date;

    public EmpHistory() {
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

    public String getNationalid() {
        return nationalid;
    }

    public void setNationalid(String nationalid) {
        this.nationalid = nationalid;
    }

    public Facility getFacility() {
        return facility;
    }

    public void setFacility(Facility facility) {
        this.facility = facility;
    }

    public String getFinancial_year() {
        return financial_year;
    }

    public void setFinancial_year(String financial_year) {
        this.financial_year = financial_year;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public int getMonths_worked() {
        return months_worked;
    }

    public void setMonths_worked(int months_worked) {
        this.months_worked = months_worked;
    }

    public int getContract_period() {
        return contract_period;
    }

    public void setContract_period(int contract_period) {
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

    public Date getDate_started() {
        return date_started;
    }

    public void setDate_started(Date date_started) {
        this.date_started = date_started;
    }

    public Date getDate_ended() {
        return date_ended;
    }

    public void setDate_ended(Date date_ended) {
        this.date_ended = date_ended;
    }

    public Date getCurrent_contract() {
        return current_contract;
    }

    public void setCurrent_contract(Date current_contract) {
        this.current_contract = current_contract;
    }

    public Date getContract_end_date() {
        return contract_end_date;
    }

    public void setContract_end_date(Date contract_end_date) {
        this.contract_end_date = contract_end_date;
    }
    
    
    
}
