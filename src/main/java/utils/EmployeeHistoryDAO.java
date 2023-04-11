package utils;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.sql.SQLException;
import models.EmploymentHistory;

/**
 *
 * @author CBwahyi
 */
public class EmployeeHistoryDAO {

    private final DatabaseConnection conn;


    public EmployeeHistoryDAO() {
        conn = new DatabaseConnection();
       
    }

    public boolean  addEmployeeHistory(EmploymentHistory history) throws SQLException {
        String query = "Replace INTO employee_hist(emprecordid, emp_no, mfl, position_id, date_started, date_ended, financial_year, months_worked, current_contract, contract_period, contract_end_date, expected_months, isActive) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        conn.pst = conn.conn.prepareStatement(query);
        conn.pst.setString(1, history.getEmprecordid());
        conn.pst.setString(2, history.getEmp_no());
        conn.pst.setString(3, history.getMfl());
        conn.pst.setInt(4, history.getPosition_id());
        conn.pst.setString(5, history.getDate_started());
        conn.pst.setString(6, history.getDate_ended());
        conn.pst.setString(7, history.getFinancial_year());
        conn.pst.setInt(8, history.getMonths_worked());
        conn.pst.setString(9, history.getCurrent_contract());
        conn.pst.setString(10, history.getContract_period());
        conn.pst.setString(11, history.getContract_end_date());
        conn.pst.setInt(12, history.getExpected_months());
        conn.pst.setInt(13, history.getActive());

        conn.pst.executeUpdate();
        return true;
    }

    public boolean recordExists(String emprecordid) {
        try {
            String query = "SELECT * FROM employee_hist WHERE emprecordid = ?";
            conn.pst = conn.conn.prepareStatement(query);
            conn.pst.setString(1, emprecordid);
            conn.pst.executeQuery();
            return conn.rs.next();
        } catch (SQLException ex) {
            System.out.println("Error checking record existence: " + ex.getMessage());
        }
        return false;
    }

    public boolean updateEmployeeHistory(EmploymentHistory history) throws SQLException {
        String query = "UPDATE employee_hist SET mfl = ?, position_id = ?, date_started = ?, date_ended = ?, financial_year = ?, months_worked = ?, current_contract = ?, contract_period = ?, contract_end_date = ?, expected_months = ?, isActive = ? WHERE emprecordid = ?";
        conn.pst = conn.conn.prepareStatement(query);
        conn.pst.setString(1, history.getMfl());
        conn.pst.setInt(2, history.getPosition_id());
        conn.pst.setString(3, history.getDate_started());
        conn.pst.setString(4, history.getDate_ended());
        conn.pst.setString(5, history.getFinancial_year());
        conn.pst.setInt(6, history.getMonths_worked());
        conn.pst.setString(7, history.getCurrent_contract());
        conn.pst.setString(8, history.getContract_period());
        conn.pst.setString(9, history.getContract_end_date());
        conn.pst.setInt(10, history.getExpected_months());
        conn.pst.setInt(11, history.getActive());
        conn.pst.setString(12, history.getEmprecordid());

        conn.pst.executeUpdate();
        return true;
        
    }


}
