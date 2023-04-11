package org.usaidtujengejamii.hrh.controller;

import utils.DocumentDAO;
import utils.EmployeeDAO;
import utils.EmployeeHistoryDAO;
import utils.IdGen;
import utils.JSONConverter;
import utils.UserDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Document;
import models.Employee;
import models.EmployeeData;
import models.EmploymentHistory;
import models.Login;
import org.json.simple.JSONObject;

/**
 *
 * @author UTJ
 */
public class EmployeeController__ extends HttpServlet {

    HttpSession session;
    String found;
    MessageDigest m;
    PrintWriter out;

    private EmployeeDAO employeeDAO;
    private Employee employee;
    private EmploymentHistory currentPosition;
    private EmployeeHistoryDAO employeeHistoryDAO;
    private EmploymentHistory defaultValues;
    private EmploymentHistory history_;
    private EmployeeData employeeData;
    private Login loginDetails;
    private UserDAO userDAO;
    private Login defaultLogin;
private Document defaultDoc;
    private DocumentDAO documentDAO;

    Gson gson = new Gson();
    String result, nextPage;
    String userid, username, password, pass, emp_no, empno, emp__no, full_name, first_name, surname, other_name, gender, altPhone, phone, email, altEmail,
            dob, home_address, postal_code, nationality, disability, disability_explain,
            national_id, marital_status, mfl, emprecordid, hireDate, endDate, date_started, date_ended, financial_year, current_contract,
            contract_period, contract_end_date,
            kra_pin, nssf_no, nhif_no,
            cert_good_conduct_no, helb_clearance_no,
            bank_name, branch, account_name, acount_number, subcounty;
    int helb_benefitiary, active, months_worked, empStatus, level, expected_months, status, position;
//    String t_id, t_emp_no, termination_date, notice_date, voluntary_termination, termination_reason, termination_by;

    public EmployeeController__() {
        employee = null;
        currentPosition = null;
        employeeHistoryDAO = null;
        defaultValues = null;
        history_ = null;
        loginDetails = null;
        defaultLogin = null;
        userDAO = null;
        employeeDAO = null;
        documentDAO = null;
        defaultDoc=null;

    }

    @Override
    public void init() throws ServletException {
        super.init();
        employee = new Employee();
        currentPosition = new EmploymentHistory();
        employeeHistoryDAO = new EmployeeHistoryDAO();
        defaultValues = new EmploymentHistory();
        history_ = new EmploymentHistory();
        loginDetails = new Login();
        defaultLogin = new Login();
        defaultDoc= new Document();
        userDAO = new UserDAO();
        employeeDAO = new EmployeeDAO();
        documentDAO = new DocumentDAO();
//        document= new Document();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NoSuchAlgorithmException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        session = request.getSession();
        IdGen IG = new IdGen();
        //create globally JSONObject and name is "obj"
        username = password = pass = emp_no = empno = emp__no = full_name = first_name = surname = other_name = gender = phone = email
                = dob = home_address = postal_code = nationality = disability = disability_explain
                = national_id = marital_status = emprecordid = mfl = hireDate = endDate = date_started = date_ended = financial_year = current_contract
                = contract_period = contract_end_date = kra_pin = nssf_no = nhif_no = cert_good_conduct_no
                = bank_name = branch = account_name = acount_number = helb_clearance_no = subcounty = "";
        helb_benefitiary = active = level = expected_months = months_worked = empStatus = position = status = 0;
        JSONObject obj = new JSONObject();
        String action = request.getParameter("action");
        if (action != null && action.equals("getEmployee")) {

            empno = request.getParameter("emp_no");
            emp__no = IG.Decode(empno);
            emp_no = emp__no;
            defaultValues.setEmp_no(emp_no);
            defaultValues.setFacility("N/A");
            defaultValues.setPosition("N/A");
            defaultValues.setDate_started("N/A");
            defaultValues.setDate_ended("N/A");
            defaultValues.setEmp_type("N/A");

            defaultLogin.setUsername("N/A");
            defaultLogin.setEmail("N/A");
            defaultLogin.setUser_level("N/A");
            defaultDoc.setId(0);
            defaultDoc.setDocTypeName("");
            defaultDoc.setDocumentValue("");
            
            
            try {
                employee = employeeDAO.getEmployeeDetails(emp_no);
//                List<Document> documents = documentDAO.getAllDocumentsForEmployee(emp_no,defaultDoc);
//                out.print(JSONConverter.convert(documents));
//                List<Document> document = new ArrayList<>();
                currentPosition = employeeDAO.getCurrentPosition(emp_no, defaultValues);
                loginDetails = employeeDAO.getLoginInfo(emp_no, defaultLogin);
                List<EmploymentHistory> history = employeeDAO.getEmployeeHistory(emp_no);
                employeeData = new EmployeeData(employee, currentPosition, history, loginDetails);
                String details = JSONConverter.convert(employeeData);
//                System.out.print(details);
                out.println(details);

            } catch (SQLException e) {
                out.println("Failled:" + e);
            }

        } else if (action != null && action.equals("allStaff")) {
            String employees = JSONConverter.convert(employeeDAO.findAll());
//              System.out.print(employees);
            out.println(employees);
        } else if (action != null && action.equals("save_employee")) {
            // form variables
            emp_no = request.getParameter("txtEmployeeNumber");
            first_name = request.getParameter("txtFirstName");
            surname = request.getParameter("txtSurname");
            other_name = request.getParameter("txtMiddleName");
            full_name = surname + " " + first_name + " " + other_name;
            gender = request.getParameter("rbtnGender");
            phone = request.getParameter("txtPhone");
            email = request.getParameter("txtEmail");
            empStatus = Integer.parseInt(request.getParameter("eStatus"));
            dob = request.getParameter("txtBirthDate");
            home_address = request.getParameter("txtHomeAddress");
            postal_code = request.getParameter("txtPostalCode");
            nationality = request.getParameter("txtNationality");
            marital_status = request.getParameter("ddlMaratialStatus");
            disability = request.getParameter("rbtnDisability");
            disability_explain = request.getParameter("txtDisabilityExplain");
            national_id = request.getParameter("txtNationalID");
            mfl = request.getParameter("ddlFacility");
            position = Integer.parseInt(request.getParameter("ddlPos"));
            hireDate = request.getParameter("hiredate");
            endDate = request.getParameter("endDate");
            date_started = request.getParameter("contractStartDate");
            date_ended = request.getParameter("contractEndDate");
//            endDate= request.getParameter("endDate");
            financial_year = request.getParameter("year");
            current_contract = request.getParameter("start_date");
            contract_period = request.getParameter("contract_period");
            contract_end_date = request.getParameter("end_date");
            expected_months = Integer.parseInt(request.getParameter("contract_no_months"));
            kra_pin = request.getParameter("txtPinCode");
            nssf_no = request.getParameter("txtNSSF");
            nhif_no = request.getParameter("txtNHIF");
            cert_good_conduct_no = request.getParameter("txtGoodConduct");
            helb_clearance_no = request.getParameter("txtHelbClearance");
            if (request.getParameter("rbtnHelb") == null) {
                helb_benefitiary = 0;
            } else {
                helb_benefitiary = Integer.parseInt(request.getParameter("rbtnHelb"));
            }

            subcounty = request.getParameter("ddlSubcounty");
            bank_name = request.getParameter("txtBankName");
            branch = request.getParameter("txtBranchName");
            account_name = request.getParameter("txtAccountName");
            acount_number = request.getParameter("txtAccountNumber");
            if (request.getParameter("eStatus") == null) {
                empStatus = 0;
            } else {
                empStatus = Integer.parseInt(request.getParameter("eStatus"));
            }

            emprecordid = emp_no + "_" + mfl + "_" + position + "_" + financial_year;
            username = "";
            if (national_id == null) {
                pass = "123456";
            } else {
                pass = national_id;
            }
            if (empStatus == 1 || empStatus == 2) {
                active = 0;
            } else {
                active = 1;
            }
            if (endDate != null && hireDate != null) {
                months_worked = getMonthDifference(hireDate, endDate);
            } else {
                months_worked = 0;
            }
            userid = IG.current_id();
            m = MessageDigest.getInstance("MD5");
            m.update(pass.getBytes(), 0, pass.length());
            password = new BigInteger(1, m.digest()).toString(16);
            // Check if the basic information record already exists
            boolean basicInfo = employeeDAO.recordExists(national_id);
            if (basicInfo == true) {
                boolean user = userDAO.recordExists(userid);
                boolean empRecord = employeeHistoryDAO.recordExists(emprecordid);
                if (user == true && empRecord == false) {
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
                    history_.setActive(active);
                    employeeHistoryDAO.addEmployeeHistory(history_);
                }
                if (user == false && empRecord == true) {

                    loginDetails.setFname(first_name);
                    loginDetails.setMname(other_name);
                    loginDetails.setLname(surname);
                    loginDetails.setUsername(username);
                    loginDetails.setEmail(email);
                    loginDetails.setPhone(phone);
                    loginDetails.setUsername(username);
                    loginDetails.setPassword(password);
                    loginDetails.setLevel(2);
                    loginDetails.setFacility(mfl);
                    loginDetails.setScounty(subcounty);
                    loginDetails.setStatus(status);
                    userDAO.addUser(loginDetails);

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
                    history_.setActive(active);
                    employeeHistoryDAO.addEmployeeHistory(history_);

                    loginDetails.setFname(first_name);
                    loginDetails.setMname(other_name);
                    loginDetails.setLname(surname);
                    loginDetails.setUsername(username);
                    loginDetails.setEmail(email);
                    loginDetails.setPhone(phone);
                    loginDetails.setUsername(username);
                    loginDetails.setPassword(password);
                    loginDetails.setLevel(2);
                    loginDetails.setFacility(mfl);
                    loginDetails.setScounty(subcounty);
                    loginDetails.setStatus(status);
                    userDAO.addUser(loginDetails);
                }
            } else {

                employee.setId(userid);
                employee.setEmp_no(emp_no);
                employee.setFirst_name(first_name);
                employee.setSurname(surname);
                employee.setOther_name(other_name);
                employee.setNational_id(national_id);
                employee.setGender(gender);
                employee.setPhone(phone);
                employee.setAlt_phone(altPhone);
                employee.setEmail(email);
                employee.setAlt_email(altEmail);
                employee.setDob(dob);
                employee.setHome_address(home_address);
                employee.setPostal_code(postal_code);
                employee.setNationality(nationality);
                employee.setMarital_status(marital_status);
                employee.setDisability(disability);
                employee.setDisability_explain(disability_explain);
                employee.setKra_pin(kra_pin);
                employee.setNssf_no(nssf_no);
                employee.setNhif_no(nhif_no);
                employee.setCert_good_conduct_no(cert_good_conduct_no);
                employee.setHelb_clearance_no(helb_clearance_no);
                employee.setHelb_benefitiary(helb_benefitiary);
                employee.setBank_name(bank_name);
                employee.setBranch(branch);
                employee.setAccount_name(account_name);
                employee.setAcount_number(acount_number);
                employee.setDate_started(hireDate);
                employee.setDate_ended(endDate);
                employee.setStatus(empStatus);

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
                history_.setActive(active);
                // Update the login Table
                loginDetails.setFname(first_name);
                loginDetails.setMname(other_name);
                loginDetails.setLname(surname);
                loginDetails.setUsername(username);
                loginDetails.setEmail(email);
                loginDetails.setPhone(phone);
                loginDetails.setUsername(username);
                loginDetails.setPassword(password);
                loginDetails.setLevel(2);
                loginDetails.setFacility(mfl);
                loginDetails.setScounty(subcounty);
                loginDetails.setStatus(status);
                userDAO.addUser(loginDetails);

                boolean saveBio = employeeDAO.insertEmployee(employee);
                boolean saveLogin = userDAO.addRelationship(emp_no, position);
                boolean saveHist = employeeHistoryDAO.addEmployeeHistory(history_);
                if (saveBio != true && saveLogin != true && saveHist != true) {
                    obj.put("status", "error");
                    obj.put("message", "Unable to add the Record....");   //create json object "status","message" and apply custome messages for "unable to delete data"

                } else {

                    obj.put("status", "success");
                    obj.put("message", "Saved Successfully....");

                }

                out.print(obj);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);

        } catch (NoSuchAlgorithmException | SQLException ex) {
            Logger.getLogger(EmployeeController__.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            processRequest(request, response);

        } catch (NoSuchAlgorithmException | SQLException ex) {
            Logger.getLogger(EmployeeController__.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "This servlet handles the processing of an employee";
    }// </editor-fold>

    public static int getMonthDifference(String startDate, String endDate) {
        LocalDate start = LocalDate.parse(startDate);
        LocalDate end = LocalDate.parse(endDate);
        Period period = Period.between(start, end);
        return (int) period.toTotalMonths();
    }

}
