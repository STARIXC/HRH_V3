
package org.usaidtujengejamii.hrh.controller;

import utils.EmployeesRepo;
import utils.IdGen;
import utils.JSONConverter;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author UTJ
 */
public class StaffUpdate extends HttpServlet {

    String found;
    MessageDigest m;
    HttpSession session = null;
    Gson gson = new Gson();
    public JSONConverter json;
    PrintWriter out;
    private final DatabaseConnection conn;

    public EmployeesRepo dao;
    String result, nextPage;
    String id, userid, username, password, pass, emp_no, full_name, first_name, surname, other_name, gender, phone, email,
            dob, home_address, postal_code, nationality, marital_status, disability, disability_explain,
            national_id, mfl, position, emprecordid, date_started, date_ended, months_worked, financial_year, current_contract,
            contract_period, contract_end_date, expected_months,
            status, kra_pin, nssf_no, nhif_no,
            cert_good_conduct_no, helb_clearance_no,
            position_name, bank_name, branch, account_name, acount_number;
    int helb_benefitiary, active, isAdmin;

    public StaffUpdate() {
        super();
        conn = new DatabaseConnection();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NoSuchAlgorithmException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        session = request.getSession();
      //  String action = request.getParameter("action");
        JSONObject obj = new JSONObject();   //create globally JSONObject and name is "obj"
        id = username = password = pass = emp_no = full_name = first_name = surname = other_name = gender = phone = email
                = dob = home_address = postal_code = nationality = marital_status = disability = disability_explain
                = national_id = emprecordid = mfl = position = date_started = date_ended = months_worked = financial_year = current_contract
                = contract_period = contract_end_date = expected_months = status = kra_pin = nssf_no = nhif_no = cert_good_conduct_no
                = position_name = bank_name = branch = account_name = acount_number = helb_clearance_no = "";
        helb_benefitiary = active = isAdmin = 0;
        // form variables
        emp_no = request.getParameter("txtEmployeeNumber");
        first_name = request.getParameter("txtFirstName");
        surname = request.getParameter("txtSurname");
        other_name = request.getParameter("txtMiddleName");
        full_name = surname + " " + first_name + " " + other_name;
        gender = request.getParameter("rbtnGender");
        phone = request.getParameter("txtPhone");
        email = request.getParameter("txtEmail");
        dob = request.getParameter("txtBirthDate");
        home_address = request.getParameter("txtHomeAddress");
        postal_code = request.getParameter("txtPostalCode");
        nationality = request.getParameter("txtNationality");
        marital_status = request.getParameter("ddlMaratialStatus");
        disability = request.getParameter("rbtnDisability");
        disability_explain = request.getParameter("txtDisabilityExplain");
        national_id = request.getParameter("txtNationalID");
        mfl = request.getParameter("ddlFacility");
        position = request.getParameter("ddlPos");
        date_started = request.getParameter("hiredate");
        financial_year = request.getParameter("year");
        current_contract = request.getParameter("start_date");
        contract_period = request.getParameter("contract_period");
        contract_end_date = request.getParameter("end_date");
        expected_months = request.getParameter("contract_no_months");
        kra_pin = request.getParameter("txtPinCode");
        nssf_no = request.getParameter("txtNSSF");
        nhif_no = request.getParameter("txtNHIF");
        cert_good_conduct_no = request.getParameter("txtGoodConduct");
        helb_clearance_no = request.getParameter("txtHelbClearance");
        helb_benefitiary = Integer.parseInt(request.getParameter("rbtnHelb"));
        // position_name = request.getParameter("ddlPos");
        bank_name = request.getParameter("txtBankName");
        branch = request.getParameter("txtBranchName");
        account_name = request.getParameter("txtAccountName");
        acount_number = request.getParameter("txtAccountNumber");
        active = 1;
        emprecordid = emp_no + "_" + mfl + "_" + position + "_" + financial_year;
        username = "";
        if (national_id == null) {
            pass = "123456";
        } else {
            pass = national_id;
        }
//        check if user id is available if not generate one
        if (id == null) {
            IdGen IG = new IdGen();
            userid = IG.current_id();
        } else {
            userid = id;
        }

        m = MessageDigest.getInstance("MD5");
        m.update(pass.getBytes(), 0, pass.length());
        password = new BigInteger(1, m.digest()).toString(16);
        String checker = "SELECT id FROM emp_bio WHERE (first_name=? && surname=? && other_name=?) || emp_no=? || national_id=?";
        conn.pst = conn.conn.prepareStatement(checker);
        conn.pst.setString(1, first_name);
        conn.pst.setString(2, surname);
        conn.pst.setString(3, other_name);
        conn.pst.setString(4, emp_no);
        conn.pst.setString(5, national_id);
        conn.rs = conn.pst.executeQuery();
        if (conn.rs.next() == true) {
            String inserter = "REPLACE INTO emp_bio(id,emp_no,first_name,surname,other_name,national_id,gender,phone,email,dob,home_address,postal_code,nationality,marital_status,disability,disability_explain,kra_pin,nssf_no,nhif_no,cert_good_conduct_no,helb_clearance_no,helb_benefitiary,bank_name,branch,account_name,acount_number)" + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            conn.pst = conn.conn.prepareStatement(inserter);
            conn.pst.setString(1, userid);
            conn.pst.setString(2, emp_no);
            conn.pst.setString(3, first_name);
            conn.pst.setString(4, surname);
            conn.pst.setString(5, other_name);
            conn.pst.setString(6, national_id);
            conn.pst.setString(7, gender);
            conn.pst.setString(8, phone);
            conn.pst.setString(9, email);
            conn.pst.setString(10, dob);
            conn.pst.setString(11, home_address);
            conn.pst.setString(12, postal_code);
            conn.pst.setString(13, nationality);
            conn.pst.setString(14, marital_status);
            conn.pst.setString(15, disability);
            conn.pst.setString(16, disability_explain);
            conn.pst.setString(17, kra_pin);
            conn.pst.setString(18, nssf_no);
            conn.pst.setString(19, nhif_no);
            conn.pst.setString(20, cert_good_conduct_no);
            conn.pst.setString(21, helb_clearance_no);
            conn.pst.setInt(22, helb_benefitiary);
            conn.pst.setString(23, bank_name);
            conn.pst.setString(24, branch);
            conn.pst.setString(25, account_name);
            conn.pst.setString(26, acount_number);

            if (conn.pst.executeUpdate() > 0) {

                //     ADD STAFF EMPLOYEEMENT DETAILS
                insert_hist(emprecordid, emp_no, national_id, mfl, position, date_started, financial_year, current_contract, contract_period, contract_end_date, expected_months, active);

                obj.put("status", "success");
                obj.put("message", "Record for" + full_name + "Added Successfully");    //create json object "status","message" and apply custome messages for "delete data"

            } else {
                obj.put("status", "error");
                obj.put("message", "Unable to add " + full_name + " To the Record....");   //create json object "status","message" and apply custome messages for "unable to delete data"

            }

        } else {
            obj.put("status", "error");
            obj.put("message", "Unable to add " + full_name + " To the Record....");   //create json object "status","message" and apply custome messages for "unable to delete data"
        }
        out.print(obj); //finally print the "obj" object

    }

//    private void addlogin(String emp_no, String first_name, String surname, int admin, String password) throws SQLException {
//        String sql_login = "REPLACE INTO login( emp_no, username, password, is_admin)"
//                + "VALUES ('" + emp_no + "',CONCAT( LEFT('" + first_name + "', 1),'" + surname + "'),MD5( '" + password + "'),'" + admin + "')";
//        conn.pst = conn.conn.prepareStatement(sql_login);
//        conn.pst.executeUpdate();
//
//    }

    private int insert_hist(String emprecordid, String emp_no, String national_id, String mfl, String position, String date_started, String financial_year, String current_contract, String contract_period, String contract_end_date, String expected_months, int active) throws SQLException {
        int success = 0;
        String date_fmt = "%m/%d/%Y";
        String dt_fmt = "%d-%m-%Y";
        String inserter_hist = "REPLACE INTO employee_hist(emprecordid, emp_no,nationalid, mfl, position,date_started,financial_year,current_contract,contract_period, contract_end_date,expected_months, active)"
                + "VALUES ('" + emprecordid + "','" + emp_no + "','" + national_id + "','" + mfl + "','" + position + "',STR_TO_DATE('" + date_started + "', '" + date_fmt + "'),'" + financial_year + "',STR_TO_DATE('" + current_contract + "', '" + dt_fmt + "'),'" + contract_period + "',STR_TO_DATE('" + contract_end_date + "', '" + dt_fmt + "'),'" + expected_months + "','" + active + "')";
        conn.pst = conn.conn.prepareStatement(inserter_hist);

        if (conn.pst.executeUpdate() > 0) {
            success += 1;
        } else {
            success = 0;
        }

        return success;
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
        } catch (NoSuchAlgorithmException | SQLException ex) {
            Logger.getLogger(StaffUpdate.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (NoSuchAlgorithmException | SQLException ex) {
            Logger.getLogger(StaffUpdate.class.getName()).log(Level.SEVERE, null, ex);
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
