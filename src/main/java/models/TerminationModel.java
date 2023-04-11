/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author CBWAHYI
 */
public class TerminationModel {
    String t_id,emp_no,termination_date,notice_date,termination_reason,voluntary_termination,emp_name;

    public TerminationModel() {
    }

    public String getEmp_name() {
        return emp_name;
    }

    public void setEmp_name(String emp_name) {
        this.emp_name = emp_name;
    }

    public String getT_id() {
        return t_id;
    }

    public void setT_id(String t_id) {
        this.t_id = t_id;
    }

    public String getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(String emp_no) {
        this.emp_no = emp_no;
    }

    public String getTermination_date() {
        return termination_date;
    }

    public void setTermination_date(String termination_date) {
        this.termination_date = termination_date;
    }

    public String getNotice_date() {
        return notice_date;
    }

    public void setNotice_date(String notice_date) {
        this.notice_date = notice_date;
    }

    public String getTermination_reason() {
        return termination_reason;
    }

    public void setTermination_reason(String termination_reason) {
        this.termination_reason = termination_reason;
    }

    public String getVoluntary_termination() {
        return voluntary_termination;
    }

    public void setVoluntary_termination(String voluntary_termination) {
        this.voluntary_termination = voluntary_termination;
    }
    
}
