package utils;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Employee;
import models.EmploymentHistory;
import models.Login;

/**
 *
 * @author UTJ
 */
public class EmployeeDAO {

    private static final Logger LOGGER = Logger.getLogger(EmployeeDAO.class.getName());
    private final DatabaseConnection conn;
    IdGen IG = new IdGen();

    public EmployeeDAO() {
        conn = new DatabaseConnection();
    }

    public boolean recordExists(String nationalID) {
        try {

            String query = "SELECT COUNT(*) FROM emp_bio WHERE national_id = ?";
            conn.pst = conn.conn.prepareStatement(query);
            conn.pst.setString(1, nationalID);
            conn.pst.executeQuery();

            if (conn.rs.next()) {
                return conn.rs.getInt(1) > 1;
            }

        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error while executing query", ex);
        }
        return false;
    }

    public List<Employee> findAll() {
        List<Employee> employees = new ArrayList<>();

        try {
            // Retrieve the basic information of the employee from the basic_info table
            String query = "SELECT eb.id as emp_id, IFNULL(eb.emp_no,'') as emp_no,\n"
                    + "                 IFNULL(eb.first_name,'') as firstname, IFNULL(eb.surname,'') as surname,\n"
                    + "                 IFNULL(eb.other_name,'') as other_name,  CONCAT(IFNULL(first_name,'') , ' ',IFNULL(other_name,''), ' ', IFNULL(surname,' ')) as full_name,IFNULL(eb.national_id,'') as national_id, IFNULL(eb.gender,'') as gender,\n"
                    + "                 IFNULL(eb.phone,'') as phone, IFNULL(eb.alternative_phone,'') as alternative_phone, \n"
                    + "                IFNULL(eb.email,'') as email, IFNULL(eb.alternative_email,'') as alternative_email,\n"
                    + "                IFNULL(eb.dob,'0000-00-00') as dob,IFNULL(eb.home_address,'') as home_address,\n"
                    + "                IFNULL(eb.present_address,'') as present_address,\n"
                    + "                 IFNULL(eb.postal_code,'') as postal_code,\n"
                    + "                 IFNULL(eb.nationality,'') as nationality,\n"
                    + "                IFNULL(eb.marital_status,'') as marital_status,\n"
                    + "                 IFNULL(eb.disability,'') as disability,IFNULL(eb.disability_explain,'') as disability_explain,\n"
                    + "                 IFNULL(eb.kra_pin,'') as kra_pin, IFNULL(eb.nssf_no,'') as nssf_no,\n"
                    + "                 IFNULL(eb.nhif_no,'') as nhif_no,\n"
                    + "                IFNULL(eb.cert_good_conduct_no,'') as cert_good_conduct_no,\n"
                    + "                 IFNULL(eb.helb_clearance_no,'') as helb_clearance_no,\n"
                    + "                 IFNULL(eb.helb_benefitiary,'') as helb_benefitiary,\n"
                    + "                IFNULL(eb.bank_name,'') as bank_name,\n"
                    + "                 IFNULL(eb.branch,'') as branch,\n"
                    + "                 IFNULL(eb.status,'') as status,\n"
                    + "                IFNULL( st.name,'') as emp_status,\n"
                    + "                 IFNULL(eb.account_name,'') as account_name,\n"
                    + "                 IFNULL(eb.acount_number,'') as acount_number ,\n"
                    + "                 IFNULL(eb.date_started,'') as hireDate,\n"
                    + "                 IFNULL(eb.date_ended,'') as endDate ,    \n"
                    + "                IFNULL(p1.position_title, '') as position_title,\n"
                    + "                IFNULL(rp.position_id, '') as position_id,\n"
                    + "                IFNULL(s1.id, '') as standard_id,\n"
                    + "                IFNULL(s1.standardized_cadre_name, '') as standardized_cadre_name,\n"
                    + "                IFNULL(t1.cadre_type_name, '') as cadre_type_name,\n"
                    + "                IFNULL(t1.id, '') as type_id,\n"
                    + "                IFNULL(fac.SubPartnerNom, '') as current_facility,\n"
                    + "                IFNULL(sup.name, '') as supervisor\n"
                    + "                FROM hrh.emp_bio eb \n"
                    + "                LEFT JOIN employee_status st ON eb.status = st.id\n"
                    + "                LEFT JOIN tbl_employee_position_relations rp ON rp.emp_no = eb.emp_no\n"
                    + "                LEFT JOIN hrh.cadre_positions p1 ON rp.position_id = p1.id \n"
                    + "                LEFT JOIN hrh.standardized_cadre s1 ON p1.standardized_cadre_id = s1.id \n"
                    + "                LEFT JOIN hrh.cadre_type t1 ON s1.carder_type_id = t1.id \n"
                    + "                LEFT JOIN hrh.tbl_user_facility uf ON uf.user_id = eb.emp_no \n"
                    + "                LEFT JOIN hrh.subpartnera fac ON fac.CentreSanteId = uf.facility_id \n"
                    + "                LEFT JOIN hrh.tbl_facility_supervisor fs ON fs.mflc = fac.CentreSanteId \n"
                    + "                LEFT JOIN hrh.supervisors sup ON sup.login_id = fs.login_id \n"
                    + "                 WHERE sup.status=1";

            conn.rs = conn.st.executeQuery(query);
            while (conn.rs.next()) {
                Employee employee = new Employee();
                employee.setId(conn.rs.getString("emp_id"));
                employee.setEmp_no(conn.rs.getString("emp_no"));
                employee.setFirst_name(conn.rs.getString("firstname"));
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
                employee.setIsActive(conn.rs.getString("emp_status"));
                employee.setPositionTitle(conn.rs.getString("position_title"));
                employee.setPositionId(conn.rs.getString("position_id"));
                employee.setStandardId(conn.rs.getString("standard_id"));
                employee.setStandard_carder(conn.rs.getString("standardized_cadre_name"));
                employee.setCadreTypeName(conn.rs.getString("cadre_type_name"));
                employee.setTypeId(conn.rs.getString("type_id"));
                employee.setCurrent_facility(conn.rs.getString("current_facility"));
                employee.setSupervisor(conn.rs.getString("supervisor"));
//                Employee employee = new Employee();
//                employee.setId(conn.rs.getString("emp_id"));
//                String c_position = conn.rs.getString("current_position");
//                String original = conn.rs.getString("emp_no");
//                String emp__no = IG.Encode(original);
//                employee.setEmp_no(emp__no);
                employee.setFull_name(conn.rs.getString("full_name"));
//                employee.setFirst_name(conn.rs.getString("firstname"));
//                employee.setSurname(conn.rs.getString("surname"));
//                employee.setOther_name(conn.rs.getString("other_name"));
//                employee.setPhone(conn.rs.getString("phone"));
//                employee.setEmail(conn.rs.getString("email"));
//                employee.setNationality(conn.rs.getString("nationality"));
//                employee.setCurrent_position(c_position);
//                employee.setIsActive(conn.rs.getString("emp_status"));
//
                employees.add(employee);
//
            }
        } catch (SQLException e) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, e);

        }

        return employees;

    }

    public boolean insertEmployee(Employee employee) {
        try {
            String inserter = "REPLACE INTO emp_bio(id,emp_no,first_name,surname,other_name,national_id,"
                    + "gender,phone,email,dob,home_address,postal_code,nationality,"
                    + "disability,disability_explain,kra_pin,nssf_no,nhif_no,cert_good_conduct_no,helb_clearance_no,helb_benefitiary,bank_name,branch,account_name,acount_number,date_started,date_ended,status)" + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            conn.pst = conn.conn.prepareStatement(inserter);
            conn.pst.setString(1, employee.getId());
            conn.pst.setString(2, employee.getEmp_no());
            conn.pst.setString(3, employee.getFirst_name());
            conn.pst.setString(4, employee.getSurname());
            conn.pst.setString(5, employee.getOther_name());
            conn.pst.setString(6, employee.getNational_id());
            conn.pst.setString(7, employee.getGender());
            conn.pst.setString(8, employee.getPhone());
            conn.pst.setString(9, employee.getEmail());
            conn.pst.setString(10, employee.getDob());
            conn.pst.setString(11, employee.getHome_address());
            conn.pst.setString(12, employee.getPostal_code());
            conn.pst.setString(13, employee.getNationality());
            conn.pst.setString(14, employee.getDisability());
            conn.pst.setString(15, employee.getDisability_explain());
            conn.pst.setString(16, employee.getKra_pin());
            conn.pst.setString(17, employee.getNssf_no());
            conn.pst.setString(18, employee.getNhif_no());
            conn.pst.setString(19, employee.getCert_good_conduct_no());
            conn.pst.setString(20, employee.getHelb_clearance_no());
            conn.pst.setInt(21, employee.getHelb_benefitiary());
            conn.pst.setString(22, employee.getBank_name());
            conn.pst.setString(23, employee.getBranch());
            conn.pst.setString(24, employee.getAccount_name());
            conn.pst.setString(25, employee.getAcount_number());
            conn.pst.setString(26, employee.getDate_started());
            conn.pst.setString(27, employee.getDate_ended());
            conn.pst.setInt(28, employee.getStatus());

            int rowsInserted = conn.pst.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error while executing query", e);
        }
        return false;
    }

    public Employee getEmployeeDetails(String emp_no) {
        Employee employee = null;
        try {
            // Retrieve the basic information of the employee from the basic_info table
            String getEmpDetails = "SELECT eb.id as emp_id, IFNULL(eb.emp_no,'') as emp_no,\n"
                    + "                 IFNULL(eb.first_name,'') as firstname, IFNULL(eb.surname,'') as surname,\n"
                    + "                 IFNULL(eb.other_name,'') as other_name,IFNULL(eb.national_id,'') as national_id, IFNULL(eb.gender,'') as gender,\n"
                    + "                 IFNULL(eb.phone,'') as phone, IFNULL(eb.alternative_phone,'') as alternative_phone, \n"
                    + "                IFNULL(eb.email,'') as email, IFNULL(eb.alternative_email,'') as alternative_email,\n"
                    + "                IFNULL(eb.dob,'0000-00-00') as dob,IFNULL(eb.home_address,'') as home_address,\n"
                    + "                IFNULL(eb.present_address,'') as present_address,\n"
                    + "                 IFNULL(eb.postal_code,'') as postal_code,\n"
                    + "                 IFNULL(eb.nationality,'') as nationality,\n"
                    + "                IFNULL(eb.marital_status,'') as marital_status,\n"
                    + "                 IFNULL(eb.disability,'') as disability,IFNULL(eb.disability_explain,'') as disability_explain,\n"
                    + "                 IFNULL(eb.kra_pin,'') as kra_pin, IFNULL(eb.nssf_no,'') as nssf_no,\n"
                    + "                 IFNULL(eb.nhif_no,'') as nhif_no,\n"
                    + "                IFNULL(eb.cert_good_conduct_no,'') as cert_good_conduct_no,\n"
                    + "                 IFNULL(eb.helb_clearance_no,'') as helb_clearance_no,\n"
                    + "                 IFNULL(eb.helb_benefitiary,'') as helb_benefitiary,\n"
                    + "                IFNULL(eb.bank_name,'') as bank_name,\n"
                    + "                 IFNULL(eb.branch,'') as branch,\n"
                    + "                 IFNULL(eb.status,'') as status,\n"
                    + "                IFNULL( st.name,'') as emp_status,\n"
                    + "                 IFNULL(eb.account_name,'') as account_name,\n"
                    + "                 IFNULL(eb.acount_number,'') as acount_number ,\n"
                    + "                 IFNULL(eb.date_started,'') as hireDate,\n"
                    + "                 IFNULL(eb.date_ended,'') as endDate ,    \n"
                    + "                IFNULL(p1.position_title, '') as position_title,\n"
                    + "                IFNULL(rp.position_id, '') as position_id,\n"
                    + "                IFNULL(s1.id, '') as standard_id,\n"
                    + "                IFNULL(s1.standardized_cadre_name, '') as standard_carder,\n"
                    + "                IFNULL(t1.cadre_type_name, '') as cadre_type_name,\n"
                    + "                IFNULL(t1.id, '') as type_id\n"
                    + "                FROM hrh.emp_bio eb \n"
                    + "                LEFT JOIN employee_status st ON eb.status = st.id\n"
                    + "                LEFT JOIN tbl_employee_position_relations rp ON rp.emp_no = eb.emp_no\n"
                    + "                LEFT JOIN hrh.cadre_positions p1 ON rp.position_id = p1.id \n"
                    + "                LEFT JOIN hrh.standardized_cadre s1 ON p1.standardized_cadre_id = s1.id \n"
                    + "                LEFT JOIN hrh.cadre_type t1 ON s1.carder_type_id = t1.id \n"
                    + "                 where eb.emp_no ='" + emp_no + "'";
//        conn.pst.setString(1, emp_no);
            conn.rs = conn.st.executeQuery(getEmpDetails);
//        conn.rs = conn.st.executeQuery();
            if (conn.rs.next()) {
                employee = new Employee();
                employee.setId(conn.rs.getString("emp_id"));
                employee.setEmp_no(conn.rs.getString("emp_no"));
                employee.setFirst_name(conn.rs.getString("firstname"));
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
                employee.setIsActive(conn.rs.getString("emp_status"));
                employee.setPositionTitle(conn.rs.getString("position_title"));
                employee.setPositionId(conn.rs.getString("position_id"));
                employee.setStandardId(conn.rs.getString("standard_id"));
                employee.setCadreTypeName(conn.rs.getString("cadre_type_name"));
                employee.setTypeId(conn.rs.getString("type_id"));

            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error while executing query", e);
        }

        return employee;
    }

    public List<EmploymentHistory> getEmployeeHistory(String employeeId) {
        List<EmploymentHistory> employmentHistoryList = new ArrayList<>();

        try {
            // Retrieve the employment history of the employee from the employment_history table
            String getEmpHist = "SELECT e.*, f.SubPartnerNom, p.position_title, t.cadre_type_name\n"
                    + "                FROM hrh.employee_hist e \n"
                    + "                JOIN hrh.subpartnera f ON e.mfl = f.CentreSanteId \n"
                    + "                JOIN hrh.cadre_positions p ON e.position_id = p.id\n"
                    + "                JOIN hrh.standardized_cadre s ON p.standardized_cadre_id = s.id\n"
                    + "                JOIN hrh.cadre_type t ON s.carder_type_id = t.id\n"
                    + "                WHERE emp_no ='" + employeeId + "'";
            //        conn.pst1.setString(1, emp_no);
            conn.rs = conn.st.executeQuery(getEmpHist);
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
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return employmentHistoryList;
    }

    public Login getLoginInfo(String employeeId, Login defaultLogin) {
        Login loginInfo = defaultLogin;
        try {
            String getActive = "SELECT l.*,r.*"
                    + "FROM hrh.tbl_user l \n"
                    + "JOIN hrh.tbl_roles r ON l.level_ = r.role_id \n"
                    + "WHERE userid ='" + employeeId + "'";
            conn.rs = conn.st.executeQuery(getActive);
            if (conn.rs.next()) {
                loginInfo = new Login();
                loginInfo.setUsername(conn.rs.getString("l.username"));
                loginInfo.setEmail(conn.rs.getString("l.email"));
                loginInfo.setUser_level(conn.rs.getString("r.role_name"));
            }
        } catch (SQLException e) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return loginInfo;
    }

    public EmploymentHistory getCurrentPosition(String employeeId, EmploymentHistory defaultValues) {
        EmploymentHistory employeeHistory = defaultValues;
        try {
            String getActive = "SELECT e.*,\n"
                    + "COALESCE(f1.SubPartnerNom, f2.SubPartnerNom) as SubPartnerNom,\n"
                    + "COALESCE(p1.position_title, p2.position_title) as position_title,\n"
                    + "COALESCE(t1.cadre_type_name, t2.cadre_type_name) as cadre_type_name,\n"
                    + "COALESCE(t1.id, t2.id) as type_id,\n"
                    + "COALESCE(d1.districtID, d.districtID) as districtID,\n"
                    + "COALESCE(cn.countyID, c.countyID) as countyID\n"
                    + "FROM hrh.employee_hist e\n"
                    + "LEFT JOIN hrh.subpartnera f1 ON e.mfl = f1.CentreSanteId \n"
                    + "LEFT JOIN hrh.subpartnera f2 ON e.mfl = f2.CentreSanteId \n"
                    + "LEFT JOIN hrh.cadre_positions p1 ON e.position_id = p1.id \n"
                    + "LEFT JOIN hrh.cadre_positions p2 ON e.position_id = p2.id \n"
                    + "LEFT JOIN hrh.standardized_cadre s1 ON p1.standardized_cadre_id = s1.id \n"
                    + "LEFT JOIN hrh.standardized_cadre s2 ON p2.standardized_cadre_id = s2.id\n"
                    + "LEFT JOIN hrh.cadre_type t1 ON s1.carder_type_id = t1.id \n"
                    + "LEFT JOIN hrh.cadre_type t2 ON s2.carder_type_id = t2.id \n"
                    + "LEFT JOIN hrh.district d ON f1.DistrictID = d.districtID \n"
                    + "LEFT JOIN hrh.district d1 ON f2.DistrictID = d1.districtID \n"
                    + "LEFT JOIN hrh.county cn ON d.countyID = cn.countyID \n"
                    + "LEFT JOIN hrh.county c ON d1.countyID = c.countyID \n"
                    + "WHERE e.emp_no ='" + employeeId + "' and e.isActive=1\n"
                    + "ORDER BY e.isActive DESC";

            conn.rs = conn.st.executeQuery(getActive);
            if (conn.rs.next()) {
                employeeHistory = new EmploymentHistory();
                employeeHistory.setEmp_no(conn.rs.getString("e.emp_no"));
                employeeHistory.setFacility(conn.rs.getString("SubPartnerNom"));
                employeeHistory.setPosition(conn.rs.getString("position_title"));
                employeeHistory.setDate_started(conn.rs.getString("e.date_started"));
                employeeHistory.setDate_ended(conn.rs.getString("e.date_ended"));
                employeeHistory.setEmp_type(conn.rs.getString("cadre_type_name"));
            }
        } catch (SQLException e) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return employeeHistory;
    }

    public List<Employee> findActive() {
        List<Employee> employees = new ArrayList<>();

        try {
            String sql = "SELECT IFNULL(emp_no,'-') as emp_no,"
                    + "  IFNULL(first_name,'') as firstname,"
                    + "  IFNULL(surname,'') as surname,"
                    + "  IFNULL(other_name,'') as other_name,"
                    + "  CONCAT(IFNULL(first_name,'') , ' ',IFNULL(other_name,''), ' ', IFNULL(surname,' ')) as full_name"
                    + "  FROM hrh.emp_bio  where status = 1";
            conn.rs = conn.st.executeQuery(sql);
            while (conn.rs.next()) {
                Employee employee = new Employee();

                String emp_no = conn.rs.getString("emp_no");
                employee.setEmp_no(emp_no);
                employee.setFull_name(conn.rs.getString("full_name"));
                employees.add(employee);
            }
        } catch (SQLException e) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return employees;
    }
}
