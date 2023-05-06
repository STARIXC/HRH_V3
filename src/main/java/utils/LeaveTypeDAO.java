package utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.util.logging.Level;
import java.util.logging.Logger;

import models.Leave;

public class LeaveTypeDAO {

    private final DatabaseConnection conn;
    private static final String INSERT_LEAVE_TYPE = "INSERT INTO leaves(leave_type, is_accrued, accrual_rate, max_days, description)VALUES ( ?, ?,?,?,?)";
    private static final String DELETE_LEAVE_TYPE = "DELETE from leaves where leave_id=?";
    private static final String UPDATE_LEAVE_TYPE = "update leaves set  leave_type=?, is_accrued=?, accrual_rate=?, max_days=?, description=? where leave_id=?";
    private static final String SELECT_ALL_LEAVE_TYPE = "SELECT * FROM leaves";
    private static final String SELECT_LEAVE_TYPE_BY_ID = "SELECT * FROM leaves where leave_id=?";

    public LeaveTypeDAO() {
        conn = new DatabaseConnection();
    }
    public int addLeave(Leave leave) {
        int success=0;
        try {

            conn.pst = conn.conn.prepareStatement(INSERT_LEAVE_TYPE);
//			declare parameters starting with 1
            conn.pst.setString(1, leave.getLeave_type());
            conn.pst.setBoolean(2, leave.isIs_accrued());
            conn.pst.setInt(3, leave.getAccrual_rate());
            conn.pst.setInt(4, leave.getMax_days());
            conn.pst.setString(5, leave.getDescription());

           success= conn.pst.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(LeaveTypeDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return success;
    }

    public int deleteLeave(int typeID) {
        int i = 0;
        try {

            conn.pst = conn.conn.prepareStatement(DELETE_LEAVE_TYPE);
            conn.pst.setInt(1, typeID);
//            conn.pst.executeUpdate();
             int submit = conn.pst.executeUpdate();
            if (submit > 0) {
                i = +1;
            } else {
                System.out.println(submit);
                i = +submit;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(LeaveTypeDAO.class.getName()).log(Level.SEVERE, null, e);
        }
     
        return i;
    }

    public int updateLeave(Leave leave) {
        int success=0;
        try {

            conn.pst = conn.conn.prepareStatement(UPDATE_LEAVE_TYPE);
            conn.pst.setString(1, leave.getLeave_type());
            conn.pst.setBoolean(2, leave.isIs_accrued());
            conn.pst.setInt(3, leave.getAccrual_rate());
            conn.pst.setInt(4, leave.getMax_days());
            conn.pst.setString(5, leave.getDescription());
            conn.pst.setInt(6, leave.getLeave_id());
           success= conn.pst.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(LeaveTypeDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return success;
    }

    public List<Leave> getAllLeaves() {
        List<Leave> leaves = new ArrayList<>();

        try {

            conn.rs = conn.st.executeQuery(SELECT_ALL_LEAVE_TYPE);

            while (conn.rs.next()) {
//leave_id, leave_type, is_accrued, accrual_rate, max_days, description
                Leave leave = new Leave();
                leave.setLeave_id(conn.rs.getInt("leave_id"));
                leave.setLeave_type(conn.rs.getString("leave_type"));
                leave.setIs_accrued(conn.rs.getBoolean("is_accrued"));
                leave.setAccrual_rate(conn.rs.getInt("accrual_rate"));
                leave.setMax_days(conn.rs.getInt("max_days"));
                leave.setDescription(conn.rs.getString("description"));

                leaves.add(leave);

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(LeaveTypeDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return leaves;
    }
    public Leave getLeaveById(int id) {
        Leave leave = new Leave();

        try {

            conn.pst = conn.conn.prepareStatement(SELECT_LEAVE_TYPE_BY_ID);
            conn.pst.setInt(1, id);
            conn.rs = conn.pst.executeQuery();
            if (conn.rs.next()) {
                leave.setLeave_id(conn.rs.getInt("leave_id"));
                leave.setLeave_type(conn.rs.getString("leave_type"));
                leave.setIs_accrued(conn.rs.getBoolean("is_accrued"));
                leave.setAccrual_rate(conn.rs.getInt("accrual_rate"));
                leave.setMax_days(conn.rs.getInt("max_days"));
                leave.setDescription(conn.rs.getString("description"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(LeaveTypeDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return leave;

    }
}
