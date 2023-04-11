package org.usaidtujengejamii.hrh.controller;

import utils.EmployeesRepo;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CBWAHYI
 */
public class ProcessEmployee_ extends HttpServlet {

    PrintWriter out;
    int insert_bio, insert_hist, insert_stat, insert_banking, insert_login = 0;
    public EmployeesRepo dao;
    Gson gson = new Gson();
    String result, nextPage;
    String username, password, emp_no, first_name, surname, other_name, gender, phone, email,
            dob, home_address, postal_code, nationality, disability, disability_explain,
            national_id, mfl, position, emprecordid, date_started, date_ended, months_worked, financial_year, current_contract,
            contract_period, contract_end_date, expected_months,
            status, kra_pin, nssf_no, nhif_no,
            cert_good_conduct_no, helb_clearance_no,
            position_name, bank_name, branch, account_name, acount_number;
    int helb_benefitiary, active;

    public ProcessEmployee_() {
        super();
        dao = new EmployeesRepo();

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();

        username = password = emp_no = first_name = surname = other_name = gender = phone = email
                = dob = home_address = postal_code = nationality = disability = disability_explain
                = national_id = emprecordid = mfl = position = date_started = date_ended = months_worked = financial_year = current_contract
                = contract_period = contract_end_date = expected_months = status = kra_pin = nssf_no = nhif_no = cert_good_conduct_no
                = position_name = bank_name = branch = account_name = acount_number = helb_clearance_no = "";
        helb_benefitiary = active = 0;
//txtSurname: Mwai
//txtFirstName: Geoffrey
//txtMiddleName: 
//txtHomeAddress: Oginga odinga
//txtPostalCode: 20100
//txtNationality: Kenyan
//txtBirthDate: 03/13/2000
//rbtnGender: Male
//ddlMaratialStatus: Married
//txtEmail: geoffreymwai@gmail.com
//txtPhone: +254720641491
//txtNationalID: 23232323
//rbtnDisability: 0
//txtDisabilityExplain: N/A
//ddlCounty: 1
//ddlSubcounty: 9
//ddlFacility: 14224
//ddlEmployeeType: 1
//ddlCadreCategory: 9
//txtEmployeeNumber: 3000
//ddlFY: 4
//start_date: 01-10-2022
//contract_period: 365
//end_date: 30-09-2023
//contract_no_months: 12
//year: 2023
//hiredate: 10/01/2022
//txtPinCode: A88888888X
//txtNSSF: 111111111111111
//txtNHIF: 222222222222222
//txtGoodConduct: 555555555555555
//rbtnHelb: 1
//txtHelbClearance: 25656565_B
//txtBankName: Equity Bank
//txtBranchName: Nakuru
//txtAccountName: Test Test Test
//txtAccountNumber: 569556652333333333355

//action: save_employee
        emp_no = request.getParameter("txtEmployeeNumber");
        first_name = request.getParameter("txtFirstName");
        surname = request.getParameter("txtSurname");
        other_name = request.getParameter("txtMiddleName");
        gender = request.getParameter("rbtnGender");
        phone = request.getParameter("txtPhone");
        email = request.getParameter("txtEmail");
        dob = request.getParameter("txtBirthDate");
        home_address = request.getParameter("txtHomeAddress");
        postal_code = request.getParameter("txtPostalCode");
        nationality = request.getParameter("txtNationality");
        disability = request.getParameter("rbtnDisability");
        disability_explain = request.getParameter("txtDisabilityExplain");
        national_id = request.getParameter("txtNationalID");
        mfl = request.getParameter("ddlFacility");
        position = request.getParameter("ddlDesignation");
        date_started = request.getParameter("hiredate");
        financial_year = request.getParameter("year");
        current_contract = request.getParameter("start_date");
        contract_period = request.getParameter("contract_period");
        contract_end_date = request.getParameter("end_date");
        expected_months = request.getParameter("date_");
        kra_pin = request.getParameter("txtPinCode");
        nssf_no = request.getParameter("txtNSSF");
        nhif_no = request.getParameter("txtNHIF");
        cert_good_conduct_no = request.getParameter("txtGoodConduct");
        helb_clearance_no = request.getParameter("txtHelbClearance");
        helb_benefitiary = Integer.parseInt(request.getParameter("rbtnHelb"));
        bank_name = request.getParameter("txtBankName");
        branch = request.getParameter("txtBranchName");
        account_name = request.getParameter("txtAccountName");
        acount_number = request.getParameter("txtAccountNumber");
        emprecordid = emp_no + "_" + mfl + "_" + position+ "_" + financial_year;
        username = "";
        
        String sql_login = "REPLACE INTO login( emp_no, username, password, is_admin)"
                + "VALUES ('" + emp_no + "',CONCAT( LEFT('" + first_name + "', 1),'" + surname + "'),MD5( '" + password + "'),'" + 0 + "')";
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
        processRequest(request, response);
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
        processRequest(request, response);
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
