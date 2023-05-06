/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Employee;
import models.EmploymentHistory;
import models.Login;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author CBwahyi
 */
public class EmployeeProfileDAO {

    private final DatabaseConnection conn;

    public EmployeeProfileDAO() {
        conn = new DatabaseConnection();
    }

    public Employee getEmployeeDetails(String empNo) throws SQLException {
        Employee employee = null;

        // Use prepared statement to avoid SQL injection
        String getEmpDetails = "SELECT DISTINCT eb.id as emp_id, IFNULL(eb.emp_no,'') as emp_no,"
                + "IFNULL(eb.first_name,'') as first_name,"
                + "IFNULL(eb.surname,'') as surname,"
                + "IFNULL(eb.other_name,'') as other_name,"
                + "IFNULL(eb.national_id,'') as national_id, IFNULL(eb.gender,'') as gender,"
                + "IFNULL(eb.phone,'') as phone, "
                + "IFNULL(eb.alternative_phone,'') as alternative_phone, "
                + "IFNULL(eb.email,'') as email, "
                + "IFNULL(eb.alternative_email,'') as alternative_email,"
                + "IFNULL(eb.dob,'0000-00-00') as dob,"
                + "IFNULL(eb.date_started,'0000-00-00') as hireDate,"
                + "IFNULL(eb.date_ended,'0000-00-00') as endDate,"
                + "IFNULL(eb.home_address,'') as home_address,"
                + "IFNULL(eb.present_address,'') as present_address,"
                + "IFNULL(eb.postal_code,'') as postal_code,"
                + "IFNULL(eb.nationality,'') as nationality,"
                + "IFNULL(eb.marital_status,'') as marital_status,"
                + "IFNULL(eb.disability,'') as disability,"
                + "IFNULL(eb.disability_explain,'') as disability_explain,"
                + "IFNULL(eb.kra_pin,'') as kra_pin,"
                + "IFNULL(eb.nssf_no,'') as nssf_no,"
                + "IFNULL(eb.nhif_no,'') as nhif_no,"
                + "IFNULL(eb.cert_good_conduct_no,'') as cert_good_conduct_no,"
                + "IFNULL(eb.helb_clearance_no,'') as helb_clearance_no,"
                + "IFNULL(eb.helb_benefitiary,'') as helb_benefitiary,"
                + "IFNULL(eb.bank_name,'') as bank_name,"
                + "IFNULL(eb.branch,'') as branch,"
                + "IFNULL(eb.account_name,'') as account_name,"
                + "IFNULL(eb.acount_number,'') as acount_number,"
                + "IFNULL(eb.status,'') as status,"
                + "IFNULL(sup.name,'') as facility_sup,"
                + "IFNULL(f.SubPartnerNom,'not linked to any facility') as facility,"
                + "p.position_title,ct.cadre_type_name\n"
                + "FROM hrh.emp_bio eb \n"
                + "JOIN hrh.tbl_employee_position_relations e ON eb.emp_no=e.emp_no  \n"
                + "JOIN hrh.tbl_user_facility fac ON fac.user_id=e.emp_no  \n"
                + "JOIN hrh.subpartnera f ON f.CentreSanteId=fac.facility_id  \n"
                + "JOIN hrh.tbl_facility_supervisor fs ON fs.mflc=f.CentreSanteId  \n"
                + "JOIN hrh.supervisors sup ON sup.id=fs.supervisor_id  \n"
                + "JOIN  hrh.cadre_positions p on p.id = e.position_id \n"
                + "JOIN hrh.standardized_cadre sc on sc.id= p.standardized_cadre_id\n"
                + "JOIN hrh.cadre_type ct on ct.id =sc.carder_type_id  WHERE eb.emp_no = ?";

        try {
            conn.pst = conn.conn.prepareStatement(getEmpDetails);
            conn.pst.setString(1, empNo);
            try {
                conn.rs = conn.pst.executeQuery();
                if (conn.rs.next()) {
                    employee = new Employee();
                    employee.setId(conn.rs.getString("emp_id"));
                    employee.setEmp_no(conn.rs.getString("emp_no"));
                    employee.setFirst_name(conn.rs.getString("first_name"));
                    employee.setSurname(conn.rs.getString("surname"));
                    employee.setOther_name(conn.rs.getString("other_name"));
                    employee.setNational_id(conn.rs.getString("national_id"));
                    employee.setGender(conn.rs.getString("gender"));
                    employee.setPhone(conn.rs.getString("phone"));
                    employee.setEmail(conn.rs.getString("email"));
                    employee.setAlt_phone(conn.rs.getString("alternative_phone"));
                    employee.setAlt_email(conn.rs.getString("alternative_email"));
                    employee.setDob(conn.rs.getString("dob"));
                    employee.setHome_address(conn.rs.getString("home_address"));
                    employee.setPresent_address(conn.rs.getString("present_address"));
                    employee.setPostal_code(conn.rs.getString("postal_code"));
                    employee.setNationality(conn.rs.getString("nationality"));
                    employee.setMarital_status(conn.rs.getString("marital_status"));
                    employee.setDisability(conn.rs.getString("disability"));
                    employee.setDisability_explain(conn.rs.getString("disability_explain"));
                    employee.setBank_name(conn.rs.getString("bank_name"));
                    employee.setBranch(conn.rs.getString("branch"));
                    employee.setAccount_name(conn.rs.getString("account_name"));
                    employee.setAcount_number(conn.rs.getString("acount_number"));
                    employee.setKra_pin(conn.rs.getString("kra_pin"));
                    employee.setNssf_no(conn.rs.getString("nssf_no"));
                    employee.setNhif_no(conn.rs.getString("nhif_no"));
                    employee.setCert_good_conduct_no(conn.rs.getString("cert_good_conduct_no"));
                    employee.setHelb_clearance_no(conn.rs.getString("helb_clearance_no"));
                    employee.setDate_started(conn.rs.getString("hireDate"));
                    employee.setDate_ended(conn.rs.getString("endDate"));
                    employee.setStatus(Integer.parseInt(conn.rs.getString("status")));
                    employee.setCurrent_facility(conn.rs.getString("facility"));
                    employee.setSupervisor(conn.rs.getString("facility_sup"));
//                    employee.setIsActive(conn.rs.getString("emp_status"));
                    employee.setPositionTitle(conn.rs.getString("position_title"));
//                    employee.setPositionId(conn.rs.getString("position_id"));
//                    employee.setStandardId(conn.rs.getString("standard_id"));
                    employee.setCadreTypeName(conn.rs.getString("cadre_type_name"));
//                    employee.setTypeId(conn.rs.getString("type_id"));
                }
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeProfileDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return employee;
    }

//    public EmploymentHistory getCurrentPosition(String emp_no) {
//        throw new UnsupportedOperationException("Not supported yet.");
//    }

    public Login getLoginInfo(String emp_no) {
        Login loginInfo = null;
        try {
            String getActive = "SELECT l.*,r.*"
                    + "FROM hrh.tbl_user l \n"
                    + "JOIN hrh.tbl_roles r ON l.level_ = r.role_id \n"
                    + "WHERE userid =?";
            conn.pst = conn.conn.prepareStatement(getActive);
            conn.pst.setString(1, emp_no);
            conn.rs = conn.pst.executeQuery();
            if (conn.rs.next()) {
                loginInfo = new Login();
                loginInfo.setUsername(conn.rs.getString("l.username"));
                loginInfo.setEmail(conn.rs.getString("l.email"));
                loginInfo.setUser_level(conn.rs.getString("r.role_name"));
            }
        } catch (SQLException e) {
            Logger.getLogger(EmployeeProfileDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return loginInfo;
    }

    public List<EmploymentHistory> getEmployeeHistory(String emp_no) {
        List<EmploymentHistory> employmentHistoryList = new ArrayList<>();

        try {
            // Retrieve the employment history of the employee from the employment_history table
            String getEmpHist = "SELECT e.*, f.SubPartnerNom, p.position_title, t.cadre_type_name\n"
                    + "                FROM hrh.employee_hist e \n"
                    + "                JOIN hrh.subpartnera f ON e.mfl = f.CentreSanteId \n"
                    + "                JOIN hrh.cadre_positions p ON e.position_id = p.id\n"
                    + "                JOIN hrh.standardized_cadre s ON p.standardized_cadre_id = s.id\n"
                    + "                JOIN hrh.cadre_type t ON s.carder_type_id = t.id\n"
                    + "                WHERE emp_no =?";
            //        conn.pst1.setString(1, emp_no);
            conn.pst = conn.conn.prepareStatement(getEmpHist);
            conn.pst.setString(1, emp_no);
            conn.rs = conn.pst.executeQuery();
            while (conn.rs.next()) {
                EmploymentHistory employmentHistory = new EmploymentHistory();
                employmentHistory.setEmp_no(conn.rs.getString("e.emp_no"));
                employmentHistory.setFacility(conn.rs.getString("f.SubPartnerNom"));
                employmentHistory.setPosition(conn.rs.getString("p.position_title"));
                employmentHistory.setDate_started(conn.rs.getString("e.date_started"));
                employmentHistory.setDate_ended(conn.rs.getString("e.date_ended"));
                employmentHistory.setEmp_type(conn.rs.getString("t.cadre_type_name"));
                employmentHistoryList.add(employmentHistory);
            }
        } catch (SQLException e) {
            Logger.getLogger(EmployeeProfileDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return employmentHistoryList;
    }

}
