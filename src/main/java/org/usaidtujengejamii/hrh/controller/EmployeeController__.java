
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
            bank_name, branch, account_name, account_number, subcounty;
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
        defaultDoc = null;

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
        defaultDoc = new Document();
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
                = bank_name = branch = account_name = account_number = helb_clearance_no = subcounty = "";
        helb_benefitiary = active = level = expected_months = months_worked = empStatus = position = status = 0;
        JSONObject obj = new JSONObject();
        String action = request.getParameter("action");
        if (action != null && action.equals("getEmployee")) {

            empno = request.getParameter("emp_no");
            emp__no = IG.Decode(empno);
            emp_no = emp__no;
            defaultValues.setEmp_no(empno);
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

            employee = employeeDAO.getEmployeeDetails(empno);
            //                List<Document> documents = documentDAO.getAllDocumentsForEmployee(emp_no,defaultDoc);
//                out.print(JSONConverter.convert(documents));
//                List<Document> document = new ArrayList<>();
            currentPosition = employeeDAO.getCurrentPosition(empno, defaultValues);
            loginDetails = employeeDAO.getLoginInfo(empno, defaultLogin);
            List<EmploymentHistory> history = employeeDAO.getEmployeeHistory(empno);
            employeeData = new EmployeeData(employee, currentPosition, history, loginDetails);
            String details = JSONConverter.convert(employeeData);
//                System.out.print(details);
            out.println(details);

        } else if (action != null && action.equals("allStaff")) {
            String employees = JSONConverter.convert(employeeDAO.findAll());
//              System.out.print(employees);
            out.println(employees);
        } else if (action != null && action.equals("employee_update")) {
            empno = request.getParameter("emp_no");
            employee = employeeDAO.getEmployeeDetails(empno);
             String employee_ = JSONConverter.convert(employee);
//              System.out.print(employees);
            out.println(employee_);
        } else if (action != null && action.equals("allActiveStaff")) {
            String employees = JSONConverter.convert(employeeDAO.findActive());
//              System.out.print(employees);
            out.println(employees);
        } else if (action != null && action.equals("get_profile")) {
            empno = request.getParameter("emp_no");
//            emp__no = IG.Decode(empno);
            emp_no = empno;
            defaultValues.setEmp_no(empno);
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

            employee = employeeDAO.getEmployeeDetails(emp_no);
            //                List<Document> documents = documentDAO.getAllDocumentsForEmployee(emp_no,defaultDoc);
//                out.print(JSONConverter.convert(documents));
//                List<Document> document = new ArrayList<>();
            currentPosition = employeeDAO.getCurrentPosition(emp_no, defaultValues);
            loginDetails = employeeDAO.getLoginInfo(emp_no, defaultLogin);
            List<EmploymentHistory> history = employeeDAO.getEmployeeHistory(emp_no);
            employeeData = new EmployeeData(employee, currentPosition, history, loginDetails);
            String details = JSONConverter.convert(employeeData);
            System.out.print(details);
            out.println(details);
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
            String firstCharacter = first_name.substring(0, 1); // Get the first character of the first name
//            username = "";
            username = firstCharacter + surname; // Concatenate the first character with the surname

            subcounty = request.getParameter("ddlSubcounty");
            bank_name = request.getParameter("txtBankName");
            branch = request.getParameter("txtBranchName");
            account_name = request.getParameter("txtAccountName");
            account_number = request.getParameter("txtAccountNumber");

            if (request.getParameter("eStatus") == null) {
                empStatus = 0;
            } else {
                empStatus = Integer.parseInt(request.getParameter("eStatus"));
            }

            emprecordid = emp_no + mfl + position + financial_year;

            if (national_id == null) {
                pass = "123456";
            } else {
                pass = national_id;
            }
            password = hashPassword(pass);
            if (empStatus == 1 || empStatus == 2) {
                active = 1;
            } else {
                active = 0;
            }
            if (endDate != null && hireDate != null) {
                months_worked = getMonthDifference(hireDate, endDate);
            } else {
                months_worked = 0;
            }
            userid = emp_no;

            String user_details = emp_no + "_" + mfl + "_" + position + "_" + financial_year + "_" + full_name + "_" + emp_no;
            System.out.println(user_details);
            // Check basic info record existence
            boolean basicInfoExists = employeeDAO.recordExists(national_id);
            System.out.println(basicInfoExists);
//
            if (basicInfoExists) {
                boolean userExists = userDAO.recordExists(userid);
                boolean empRecordExists = employeeHistoryDAO.recordExists(emprecordid);
                System.out.println("userexist: " + userExists + " and emp_recordExist: " + empRecordExists);
                if (userExists && !empRecordExists) {
                    boolean saveHist = addEmployeeHistory(history_, emprecordid, emp_no, mfl, position, date_started, date_ended, financial_year, months_worked, current_contract, contract_period, contract_end_date, expected_months, active);
                    boolean saveRelation = addRelationship(emp_no, mfl);
                    if (!saveRelation || !saveHist) {
                        obj.put("status", "error");
                        obj.put("message", "Unable to add the Record...");
                    } else {
                        obj.put("status", "success");
                        obj.put("message", "Saved Successfully...");
                    }
                    out.println(obj);
                } else if (!userExists && empRecordExists) {
                    boolean update = updateEmployeeHistoryAndAddUser(history_, userid, emprecordid, emp_no, position, date_started, date_ended, financial_year, months_worked, current_contract, contract_period, contract_end_date, expected_months, active, loginDetails, first_name, other_name, surname, username, email, phone, password, mfl, subcounty, status);
                    boolean addUserFacility = addRelationship(emp_no, mfl);
                    if (!update || !addUserFacility) {
                        obj.put("status", "error");
                        obj.put("message", "Unable to add the Record...");
                    } else {
                        obj.put("status", "success");
                        obj.put("message", "Saved Successfully...");
                    }
                    out.println(obj);
                } else if (userExists && empRecordExists) {
                    obj.put("status", "info");
                    obj.put("message", "The user with this records exists");
                    out.println(obj);
                } else {
                    boolean addU_H = addUserAndHistory(loginDetails, history_, emprecordid, userid, emp_no, position, date_started, date_ended, financial_year, months_worked, current_contract, contract_period, contract_end_date, expected_months, active, first_name, other_name, surname, username, email, phone, password, mfl, level, status);
                    boolean relationship = addRelationship(emp_no, mfl);
                    if (!addU_H || !relationship) {
                        obj.put("status", "error");
                        obj.put("message", "Unable to add the Record...");
                    } else {
                        obj.put("status", "success");
                        obj.put("message", "Saved Successfully...");
                    }
                }
            } else {
                boolean addedEmpHistoryUser = createEmployeeAndHistoryAndAddUser(employee, history_, emprecordid, userid, emp_no, first_name, surname, other_name, gender, phone, altPhone, email, altEmail, dob, home_address, postal_code, nationality, marital_status, disability, disability_explain, kra_pin, nssf_no, nhif_no, cert_good_conduct_no, helb_clearance_no, helb_benefitiary, bank_name, branch, account_name, account_number, hireDate, endDate, empStatus, active, loginDetails, first_name, other_name, surname, username, email, phone, password, mfl, subcounty, status);
                boolean facilityRel = addRelationship(emp_no, mfl);
//                boolean saveBio = employeeDAO.insertEmployee(employee);
//                boolean saveLogin = userDAO.addRelationship(emp_no, position);
//                boolean saveHist = employeeHistoryDAO.addEmployeeHistory(history_);

                if (!addedEmpHistoryUser || !facilityRel) {
                    obj.put("status", "error");
                    obj.put("message", "Unable to add the Record...");
                } else {
                    obj.put("status", "success");
                    obj.put("message", "Saved Successfully...");
                }
                out.println(obj);

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
        if (startDate.isEmpty() || endDate == null || endDate.isEmpty()) {
            return 0; // Handle empty or null dates
        }

        LocalDate start = LocalDate.parse(startDate);
        LocalDate end = LocalDate.parse(endDate);

        Period period = Period.between(start, end);

        int years = period.getYears();
        int months = period.getMonths();
        int days = period.getDays();

        int totalMonths = years * 12 + months;

        // Adjust for remaining days
        if (days > 0) {
            if (start.getDayOfMonth() > end.getDayOfMonth()) {
                totalMonths--;
            }
        }

        return totalMonths;
    }

    private boolean updateEmployeeHistoryAndAddUser(EmploymentHistory history, String userid, String empRecordId, String empNo, int position, String dateStarted, String dateEnded, String financialYear, int monthsWorked, String currentContract, String contractPeriod, String contractEndDate, int expectedMonths, int active, Login loginDetails, String firstName, String otherName, String surname, String username, String email, String phone, String password, String mfl, String subcounty, int status) throws SQLException {
        boolean updateHistory = updateEmployeeHistory(history, empRecordId, empNo, mfl, position, dateStarted, dateEnded, financialYear, monthsWorked, currentContract, contractPeriod, contractEndDate, expectedMonths, active);
        boolean addUser = addUser(loginDetails, userid, firstName, otherName, surname, username, email, phone, password, 2, status);
        // Return true if both updateHistory and addUser are true, otherwise return false
        return updateHistory && addUser;
    }

    private boolean updateEmployeeHistory(EmploymentHistory history, String empRecordId, String empNo, String mfl, int position, String dateStarted, String dateEnded, String financialYear, int monthsWorked, String currentContract, String contractPeriod, String contractEndDate, int expectedMonths, int active) throws SQLException {
        history.setEmprecordid(empRecordId);
        history.setEmp_no(empNo);
        history.setMfl(mfl);
        history.setPosition_id(position);
        history.setDate_started(dateStarted);
        history.setDate_ended(dateEnded);
        history.setFinancial_year(financialYear);
        history.setMonths_worked(monthsWorked);
        history.setCurrent_contract(currentContract);
        history.setContract_period(contractPeriod);
        history.setContract_end_date(contractEndDate);
        history.setExpected_months(expectedMonths);
        history.setActive(active);
        return employeeHistoryDAO.updateEmployeeHistory(history);
    }

    private boolean addEmployeeHistory(EmploymentHistory history, String empRecordId, String empNo, String mfl, int position, String dateStarted, String dateEnded, String financialYear, int monthsWorked, String currentContract, String contractPeriod, String contractEndDate, int expectedMonths, int active) throws SQLException {
        history.setEmprecordid(empRecordId);
        history.setEmp_no(empNo);
        history.setMfl(mfl);
        history.setPosition_id(position);
        history.setDate_started(dateStarted);
        history.setDate_ended(dateEnded);
        history.setFinancial_year(financialYear);
        history.setMonths_worked(monthsWorked);
        history.setCurrent_contract(currentContract);
        history.setContract_period(contractPeriod);
        history.setContract_end_date(contractEndDate);
        history.setExpected_months(expectedMonths);
        history.setActive(active);
        return employeeHistoryDAO.addEmployeeHistory(history);
    }

    private boolean addUserAndHistory(Login loginDetails, EmploymentHistory history, String userid, String empRecordId, String empNo, int position, String dateStarted, String dateEnded, String financialYear, int monthsWorked, String currentContract, String contractPeriod, String contractEndDate, int expectedMonths, int active, String firstName, String otherName, String surname, String username, String email, String phone, String password, String mfl, int ulevel, int status) throws SQLException {
        ulevel = 2;
        boolean addUser = addUser(loginDetails, userid, firstName, otherName, surname, username, email, phone, password, ulevel, status);
        boolean addERecord = addEmployeeHistory(history, empRecordId, empNo, mfl, position, dateStarted, dateEnded, financialYear, monthsWorked, currentContract, contractPeriod, contractEndDate, expectedMonths, active);
        return addERecord && addUser;
    }

    private boolean addUser(Login loginDetails, String userid, String firstName, String otherName, String surname, String username, String email, String phone, String password, int level, int status) throws SQLException {
        loginDetails.setUserid(userid);
        loginDetails.setFname(firstName);
        loginDetails.setMname(otherName);
        loginDetails.setLname(surname);
        loginDetails.setUsername(username);
        loginDetails.setEmail(email);
        loginDetails.setPhone(phone);
        loginDetails.setUsername(username);
        loginDetails.setPassword(password);
        loginDetails.setLevel(level);
        loginDetails.setStatus(status);
        return userDAO.addUser(loginDetails);
    }

    private boolean createEmployeeAndHistoryAndAddUser(Employee employee, EmploymentHistory history, String empRecordId, String userId, String empNo, String firstName, String surname, String otherName, String gender, String phone, String altPhone, String email, String altEmail, String dob, String homeAddress, String postalCode, String nationality, String maritalStatus, String disability, String disabilityExplain, String kraPin, String nssfNo, String nhifNo, String certGoodConductNo, String helbClearanceNo, int helbBeneficiary, String bankName, String branch, String accountName, String accountNumber, String hireDate, String endDate, int empStatus, int active, Login loginDetails, String fName, String oName, String lName, String uName, String mail, String pNumber, String pass, String facility, String sCounty, int sStatus) throws SQLException {
        boolean createEmp = createEmployee(employee, userId, empNo, firstName, surname, otherName, gender, phone, altPhone, email, altEmail, dob, homeAddress, postalCode, nationality, maritalStatus, disability, disabilityExplain, kraPin, nssfNo, nhifNo, certGoodConductNo, helbClearanceNo, helbBeneficiary, bankName, branch, accountName, accountNumber, hireDate, endDate, empStatus, active);
        boolean addUser = addUser(loginDetails, userId, fName, oName, lName, uName, mail, pNumber, pass, 2, sStatus);
        boolean addHistory = addEmployeeHistory(history, empRecordId, empNo, facility, history.getPosition_id(), history.getDate_started(), history.getDate_ended(), history.getFinancial_year(), history.getMonths_worked(), history.getCurrent_contract(), history.getContract_period(), history.getContract_end_date(), history.getExpected_months(), history.getActive());
        return createEmp && addUser && addHistory;
    }

    private boolean createEmployee(Employee employee, String userid, String emp_no, String first_name, String surname, String other_name, String gender, String phone, String altPhone, String email, String altEmail, String dob, String home_address, String postal_code, String nationality, String marital_status, String disability, String disability_explain, String kra_pin, String nssf_no, String nhif_no, String cert_good_conduct_no, String helb_clearance_no, int helb_beneficiary, String bankName, String branch, String accountName, String accountNumber, String hireDate, String endDate, int empStatus, int active) {
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
        employee.setAcount_number(account_number);
        employee.setDate_started(hireDate);
        employee.setDate_ended(endDate);
        employee.setStatus(empStatus);
        return employeeDAO.insertEmployee(employee);

    }

    private String hashPassword(String pass) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(pass.getBytes());
        byte[] bytes = md.digest();
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    private boolean addRelationship(String emp_no, String mfl) {
        return userDAO.addFacilityRelation(emp_no, mfl);
    }

}
