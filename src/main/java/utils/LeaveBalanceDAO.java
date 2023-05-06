package utils;

import java.sql.SQLException;
import models.LeaveBalance;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author CBwahyi
 */
public class LeaveBalanceDAO {

    private final DatabaseConnection conn;

    public LeaveBalanceDAO() {
        conn = new DatabaseConnection();
    }

    public boolean exists(String employeeId, int leaveTypeId, String year) throws SQLException {
        boolean exists = false;
        try {
            String sql = "SELECT * FROM leave_balances WHERE employee_id = ? AND leave_type_id = ? AND year = ?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, employeeId);
            conn.pst.setInt(2, leaveTypeId);
            conn.pst.setString(3, year);
            conn.rs = conn.pst.executeQuery();
            if (conn.rs.next()) {
                exists = true;
            }
        } catch (SQLException e) {
            throw new SQLException("Error checking record of Leave Type ID " + leaveTypeId, e);
        }
        return exists;
    }

    public boolean create(LeaveBalance leaveBalance) {
        boolean success = false;
        try {
            String sql = "INSERT INTO leave_balances (employee_id, leave_type_id, year, days_accrued, days_used) VALUES (?, ?, ?, ?, ?)";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, leaveBalance.getEmployee_id());
            conn.pst.setInt(2, leaveBalance.getLeave_id());
            conn.pst.setString(3, leaveBalance.getYear());
            conn.pst.setInt(4, leaveBalance.getDays_accrued());
            conn.pst.setInt(5, leaveBalance.getDays_used());
            int rows = conn.pst.executeUpdate();
            if (rows > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    public LeaveBalance findByEmployeeAndLeaveTypeAndYear(String employeeId, int leaveTypeId, String year) {
        LeaveBalance leaveBalance = null;

        try {
            String sql = "SELECT * FROM leave_balances WHERE employee_id = ? AND leave_type_id = ? AND year = ?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, employeeId);
            conn.pst.setInt(2, leaveTypeId);
            conn.pst.setString(3, year);
            conn.rs = conn.pst.executeQuery();

            if (conn.rs.next()) {
                leaveBalance = new LeaveBalance();
                leaveBalance.setBalance_id(conn.rs.getInt("id"));
                leaveBalance.setEmployee_id(conn.rs.getString("employee_id"));
                leaveBalance.setLeave_id(conn.rs.getInt("leave_type_id"));
                leaveBalance.setYear(conn.rs.getString("year"));
                leaveBalance.setDays_accrued(conn.rs.getInt("days_accrued"));
                leaveBalance.setDays_used(conn.rs.getInt("days_used"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return leaveBalance;
    }

    public void update(LeaveBalance leaveBalance) {
        try {
            String sql = "UPDATE leave_balances SET days_accrued = ?, days_used = ? WHERE id = ?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setInt(1, leaveBalance.getDays_accrued());
            conn.pst.setInt(2, leaveBalance.getDays_used());
            conn.pst.setInt(3, leaveBalance.getBalance_id());
            conn.pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
