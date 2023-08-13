package utils;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.EmploymentHistory;

/**
 *
 * @author CBwahyi
 */
public class EmployeeHistoryDAO {

    private final DatabaseConnection conn;
 private static final Logger LOGGER = Logger.getLogger(EmployeeHistoryDAO.class.getName());
    public EmployeeHistoryDAO() {
        conn = new DatabaseConnection();

    }

    public boolean addEmployeeHistory(EmploymentHistory history) {
        try {
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
            int rowsInserted = conn.pst.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error while executing query", e);
        }

        return false;
    }

    public boolean recordExists(String emprecordid) {
        try {
            String query = "SELECT * FROM employee_hist WHERE emprecordid = ?";
            conn.pst = conn.conn.prepareStatement(query);
            conn.pst.setString(1, emprecordid);
            conn.pst.executeQuery();
            if (conn.rs.next()) {
                return conn.rs.getInt(1) > 0;
            }

            return conn.rs.next();
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error while executing query", ex);
        }
        return false;
    }

    public boolean updateEmployeeHistory(EmploymentHistory history) {
        try {
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

            int rowsUpdated = conn.pst.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
              LOGGER.log(Level.SEVERE, "Error while executing query", e);
        }
        return false;
    }

}
