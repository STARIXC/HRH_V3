package org.usaidtujengejamii.hrh.controller;

import utils.EmployeeHistoryDAO;
import utils.JSONConverter;
import utils.UserDAO;
import com.google.gson.Gson;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.EmploymentHistory;
import org.json.simple.JSONObject;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author UTJ
 */
public class EmployeeHistoryServlet extends HttpServlet {

    HttpSession session;
    String found;
    MessageDigest m;
    PrintWriter out;
    private final EmploymentHistory history_;
    private final EmployeeHistoryDAO employeeHistoryDAO;
    private final UserDAO userDAO;
    private final DatabaseConnection conn;
    public JSONConverter json;
    Gson gson = new Gson();
    String result, nextPage;
    String userid, username, password, pass, emp_no, empno, emp__no, full_name, first_name, surname, other_name, gender, altPhone, phone, email, altEmail,
            dob, home_address, postal_code, nationality, disability, disability_explain,
            national_id, marital_status, mfl, emprecordid, hireDate, endDate, date_started, date_ended, financial_year, current_contract,
            contract_period, contract_end_date,
            kra_pin, nssf_no, nhif_no, Record,
            cert_good_conduct_no, helb_clearance_no,
            bank_name, branch, account_name, acount_number, subcounty;
    int helb_benefitiary, active, months_worked, empStatus, level, expected_months, status, position;
//    String t_id, t_emp_no, termination_date, notice_date, voluntary_termination, termination_reason, termination_by;

    public EmployeeHistoryServlet() {

        history_ = new EmploymentHistory();
        employeeHistoryDAO = new EmployeeHistoryDAO();
        conn = new DatabaseConnection();
        userDAO= new UserDAO();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        session = request.getSession();
//        IdGen IG = new IdGen();
        JSONObject obj = new JSONObject();
        //create globally JSONObject and name is "obj"
        username = password = pass = emp_no = empno = emp__no = full_name = first_name = surname = other_name = gender = phone = email
                = dob = home_address = Record = postal_code = nationality = disability = disability_explain
                = national_id = marital_status = emprecordid = mfl = hireDate = endDate = date_started = date_ended = financial_year = current_contract
                = contract_period = contract_end_date = kra_pin = nssf_no = nhif_no = cert_good_conduct_no
                = bank_name = branch = account_name = acount_number = helb_clearance_no = subcounty = "";
        helb_benefitiary = active = level = expected_months = months_worked = empStatus = position = status = 0;
        String action = request.getParameter("action");
        if (action != null && action.equals("add_work")) {
            emp_no = request.getParameter("emp_no");
            mfl = request.getParameter("ddlFacility");
            position = Integer.parseInt(request.getParameter("ddlPos"));
            financial_year = request.getParameter("year");
            date_started = request.getParameter("contractStartDate");
            date_ended = request.getParameter("contractEndDate");
            financial_year = request.getParameter("year");
            current_contract = request.getParameter("start_date");
            contract_period = request.getParameter("contract_period");
            contract_end_date = request.getParameter("end_date");
            expected_months = Integer.parseInt(request.getParameter("contract_no_months"));
            emprecordid = emp_no + "_" + mfl + "_" + position + "_" + financial_year;
            Record = date_started + "_" + emp_no + "_" + emp_no + "_" + mfl + "_" + position + "_" + financial_year;
            System.out.print("process the imfo: " + Record);
            String checker_hist = "SELECT * FROM employee_hist WHERE  emprecordid=? ";
            conn.pst = conn.conn.prepareStatement(checker_hist);
            conn.pst.setString(1, emprecordid);
            conn.rs = conn.pst.executeQuery();
            if (conn.rs.next() == true) {
                obj.put("status", "error");
                obj.put("message", "The above person is available....");
            } else {
                // Update the employee history
                history_.setEmprecordid(emprecordid);
                history_.setEmp_no(emp_no);
                history_.setMfl(mfl);
                history_.setPosition_id(position);
                history_.setDate_started(date_started);
                history_.setDate_ended(date_ended);
                history_.setFinancial_year(financial_year);
                history_.setMonths_worked(months_worked);
                history_.setCurrent_contract(current_contract);
                history_.setContract_period(contract_period);
                history_.setContract_end_date(contract_end_date);
                history_.setExpected_months(expected_months);
                history_.setActive(1);
                employeeHistoryDAO.addEmployeeHistory(history_);
                userDAO.addRelationship(emp_no, position);
                
            }

        }
    }


// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
/**
 * Handles the HTTP <code>GET</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

} catch (SQLException ex) {
            Logger.getLogger(EmployeeHistoryServlet.class  

.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

} catch (SQLException ex) {
            Logger.getLogger(EmployeeHistoryServlet.class  

.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
