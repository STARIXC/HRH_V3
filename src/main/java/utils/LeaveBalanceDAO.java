package utils;

import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Leave;
import models.LeaveApplication;
import models.LeaveBalance;

/**
 *
 * @author CBwahyi
 */
public class LeaveBalanceDAO {

    private final DatabaseConnection conn;

   

    public LeaveBalanceDAO() { 
        conn= new DatabaseConnection();
   }

     @SuppressWarnings("static-access")
    public void addLeave(Leave leave) {

        try {
            String sql = "INSERT INTO leaves( leave_name,number_days_allowed, leave_description)VALUES (?, ?, ?)";
            conn.pst = conn.conn.prepareStatement(sql);
//				declare parameters starting with 1
//            conn.pst.setString(1, leave.getLeave_type_name());
//            conn.pst.setString(2, leave.getTotal_days());
//            conn.pst.setString(3, leave.getLeave_description());
            conn.pst.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
             Logger.getLogger(LeaveDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @SuppressWarnings("static-access")
    public int deleteLeave(int typeID) {
        int i = 0;
        try {
            String sql = "DELETE from leaves where leave_type_id=?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setInt(1, typeID);
            //  conn.pst.executeUpdate();
            int submit = conn.pst.executeUpdate();

            if (submit > 0) {
                i = +1;
            } else {
                System.out.println(submit);
                i = +submit;
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
             Logger.getLogger(LeaveDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return i;
    }

    @SuppressWarnings("static-access")
    public void updateLeave(Leave leave) {

        try {
            String sql = "update leaves set leave_name=?,number_days_allowed=?, leave_description=? where leave_type_id=?";
            conn.pst = conn.conn.prepareStatement(sql);
//            conn.pst.setString(1, leave.getLeave_type_name());
//            conn.pst.setString(2, leave.getTotal_days());
//            conn.pst.setString(3, leave.getLeave_description());
//            conn.pst.setInt(4, leave.getTypeID());
            conn.pst.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(LeaveDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @SuppressWarnings("static-access")
    public List<Leave> getAllLeaves() {
        List<Leave> leaves = new ArrayList<>();

        try {
            String sql = "SELECT * FROM leaves";
            conn.rs = conn.st.executeQuery(sql);

            while (conn.rs.next()) {

                Leave leave = new Leave();
//                leave.setTypeID(conn.rs.getInt("leave_type_id"));
//                leave.setLeave_type_name(conn.rs.getString("leave_name"));
//                leave.setTotal_days(conn.rs.getString("number_days_allowed"));
//                leave.setEmp_type(conn.rs.getString("designation"));

                leaves.add(leave);

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(LeaveDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return leaves;
    }

    @SuppressWarnings("static-access")
    public Leave getLeaveById(int id) {
        Leave leave = new Leave();

        try {
            String sql = "SELECT * FROM leaves where leave_type_id=?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setInt(1, id);
            conn.rs = conn.pst.executeQuery();
            if (conn.rs.next()) {

//                leave.setTypeID(id);
//                leave.setLeave_type_name(conn.rs.getString("leave_name"));
//                leave.setTotal_days(conn.rs.getString("number_days_allowed"));
//                leave.setEmp_type(conn.rs.getString("designation"));
//                leave.setLeave_description(conn.rs.getString("leave_description"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
             Logger.getLogger(LeaveDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return leave;

    }
//                get all applied leaves
//public List<Staff> findAll() {
//		List<Staff> allStaff = new ArrayList<>();

    public List<LeaveApplication> getAllApplied() {
        List<LeaveApplication> leaves = new ArrayList<>();
//        try {

//            String sql = "SELECT a.application_id as id,a.start_date as startdate,a.end_date as enddate, a.date_of_application AS applicationdate, a.leave_status AS status,a.number_days AS no_days,t.leave_name AS leave_name, e.emp_no AS employee_no, \n"
//                    + "CONCAT(e.first_name,' ',e.surname) AS EmployeeName FROM leave_requests a join leaves t on t.leave_id=a.leave_type_id JOIN emp_bio e ON e.emp_no=a.employee_id";
//            conn.rs = conn.st.executeQuery(sql);
//
//            while (conn.rs.next()) {
//                String start_date = conn.rs.getString("startdate");
//                String end_date = conn.rs.getString("enddate");
//                String duration = start_date + " to " + end_date;
//                LeaveApplication leave = new LeaveApplication();
//                leave.setEmployee_name(conn.rs.getString("EmployeeName"));
//                leave.setApplication_id(conn.rs.getInt("id"));
//                leave.setStart_date(start_date);
//                leave.setEnd_date(end_date);
//                leave.setDuration(duration);
//                leave.setNumber_days(conn.rs.getDouble("no_days"));
//                leave.setLeave_status(conn.rs.getInt("status"));
//                leave.setLeave_type_name(conn.rs.getString("leave_name"));
//                leave.setDate_of_application(conn.rs.getString("applicationdate"));
//                leave.setEmployee_id(conn.rs.getInt("employee_no"));
//                leaves.add(leave);
//
//            }

//        } catch (SQLException e) {
//            // TODO Auto-generated catch block
//             Logger.getLogger(LeaveDAO.class.getName()).log(Level.SEVERE, null, e);
//        }
        return leaves;
    }

    public List<LeaveApplication> getAllApproved() {
        List<LeaveApplication> leaves = new ArrayList<>();
        try {

            String sql = "SELECT a.application_id as id,a.start_date as startdate,a.end_date as enddate, a.date_of_application AS applicationdate, a.leave_status AS status,t.leave_name AS leave_name, e.emp_no AS employee_no, \n"
                    + "CONCAT(e.first_name,' ',e.surname) AS EmployeeName FROM leave_requests a join leaves t on t.leave_type_id=a.leave_type_id JOIN emp_bio e ON e.emp_no=a.employee_id WHERE a.leave_status=2";
            conn.rs = conn.st.executeQuery(sql);

            while (conn.rs.next()) {
                LeaveApplication leave = new LeaveApplication();
                leave.setEmployee_name(conn.rs.getString("EmployeeName"));
                leave.setApplication_id(conn.rs.getInt("id"));
                leave.setStart_date(conn.rs.getString("startdate"));
                leave.setEnd_date(conn.rs.getString("enddate"));
                leave.setLeave_status(conn.rs.getInt("status"));
                leave.setLeave_type_name(conn.rs.getString("leave_name"));
                leave.setDate_of_application(conn.rs.getString("applicationdate"));
                leave.setEmployee_id(conn.rs.getInt("employee_no"));
                leaves.add(leave);

            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(LeaveDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return leaves;
    }

    public List<LeaveApplication> getAllrejected() {
        List<LeaveApplication> leaves = new ArrayList<>();
        try {

            String sql = "SELECT a.application_id as id,a.start_date as startdate,a.end_date as enddate, a.date_of_application AS applicationdate, a.leave_status AS status,t.leave_name AS leave_name, e.emp_no AS employee_no, \n"
                    + "CONCAT(e.first_name,' ',e.surname) AS EmployeeName FROM leave_requests a join leaves t on t.leave_type_id=a.leave_type_id JOIN emp_bio e ON e.emp_no=a.employee_id WHERE a.leave_status=3;";
            conn.rs = conn.st.executeQuery(sql);

            while (conn.rs.next()) {
                LeaveApplication leave = new LeaveApplication();
                leave.setEmployee_name(conn.rs.getString("EmployeeName"));
                leave.setApplication_id(conn.rs.getInt("id"));
                leave.setStart_date(conn.rs.getString("startdate"));
                leave.setEnd_date(conn.rs.getString("enddate"));
                leave.setLeave_status(conn.rs.getInt("status"));
                leave.setLeave_type_name(conn.rs.getString("leave_name"));
                leave.setDate_of_application(conn.rs.getString("applicationdate"));
                leave.setEmployee_id(conn.rs.getInt("employee_no"));
                leaves.add(leave);

            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
             Logger.getLogger(LeaveDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return leaves;
    }

    public List<LeaveApplication> getAllpending() {
        List<LeaveApplication> leaves = new ArrayList<>();
        try {

            String sql = "SELECT a.application_id as id,a.start_date as startdate,a.end_date as enddate, a.date_of_application AS applicationdate, a.leave_status AS status,t.leave_name AS leave_name, e.emp_no AS employee_no, \n"
                    + "CONCAT(e.first_name,' ',e.surname) AS EmployeeName FROM leave_requests a join leaves t on t.leave_type_id=a.leave_type_id JOIN emp_bio e ON e.emp_no=a.employee_id WHERE a.leave_status=1 ;";
            conn.rs = conn.st.executeQuery(sql);

            while (conn.rs.next()) {
                LeaveApplication leave = new LeaveApplication();
                leave.setEmployee_name(conn.rs.getString("EmployeeName"));
                leave.setApplication_id(conn.rs.getInt("id"));
                leave.setStart_date(conn.rs.getString("startdate"));
                leave.setEnd_date(conn.rs.getString("enddate"));
                leave.setLeave_status(conn.rs.getInt("status"));
                leave.setLeave_type_name(conn.rs.getString("leave_name"));
                leave.setDate_of_application(conn.rs.getString("applicationdate"));
                leave.setEmployee_id(conn.rs.getInt("employee_no"));
                leaves.add(leave);

            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
             Logger.getLogger(LeaveDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return leaves;
    }

    public LeaveApplication getAppliedLeaveById(int id) {

        LeaveApplication leave = new LeaveApplication();

        try {
            String sql = "SELECT * FROM `hrh`.`leave_requests` WHERE application_id=?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setInt(1, id);
            conn.rs = conn.pst.executeQuery();
            if (conn.rs.next()) {

                leave.setDate_of_application(sql);
                leave.setLeave_type_id(conn.rs.getInt("leave_type_id"));
                leave.setNumber_days(conn.rs.getDouble("number_days"));
                leave.setEmployee_id(conn.rs.getInt("employee_id"));
                leave.setStart_date(conn.rs.getString("start_date"));
                leave.setApplication_id(id);
                leave.setEnd_date(conn.rs.getString("end_date"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(LeaveDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return leave;

    }

    public int approveLeave(String sql) {
        int i = 0;
        try {
            conn.pst = conn.conn.prepareStatement(sql);
            int submit = conn.pst.executeUpdate();

            if (submit > 0) {
                i = +1;
            } else {
                System.out.println(submit);
                i = +submit;
            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
             Logger.getLogger(LeaveDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return i;
    }

    public List<LeaveApplication> getAllAppliedByEmpNo(int employee_id, String start, String end) {
        List<LeaveApplication> leaves = new ArrayList<>();
        try {

            String sql = "SELECT a.application_id as id,a.start_date as startdate,a.end_date as enddate, a.date_of_application AS applicationdate,a.supervisor_id AS approved_by, a.leave_status AS status,a.number_days AS no_days,t.leave_name AS leave_name, e.emp_no AS employee_no, \n"
                    + "CONCAT(e.first_name,' ',e.surname) AS EmployeeName FROM leave_requests a join leaves t on t.leave_type_id=a.leave_type_id JOIN emp_bio e ON e.emp_no=a.employee_id where a.employee_id='" + employee_id + "'";
            conn.rs = conn.st.executeQuery(sql);

            while (conn.rs.next()) {
                String start_date = conn.rs.getString("startdate");
                String end_date = conn.rs.getString("enddate");
                String duration = start_date + " to " + end_date;
                LeaveApplication leave = new LeaveApplication();
                leave.setEmployee_name(conn.rs.getString("EmployeeName"));
                leave.setApplication_id(conn.rs.getInt("id"));
                leave.setStart_date(start_date);
                leave.setEnd_date(end_date);
                leave.setDuration(duration);
                leave.setNumber_days(conn.rs.getDouble("no_days"));
                leave.setUser_id(conn.rs.getInt("approved_by"));
                leave.setLeave_status(conn.rs.getInt("status"));
                leave.setLeave_type_name(conn.rs.getString("leave_name"));
                leave.setDate_of_application(conn.rs.getString("applicationdate"));
                leave.setEmployee_id(conn.rs.getInt("employee_no"));
                leaves.add(leave);

            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
             Logger.getLogger(LeaveDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return leaves;
    }

    public List<LeaveBalance> getBalanceByEmpNo(String emp_id, String start, String end) {
        List<LeaveBalance> leaves = new ArrayList<>();

        String sql = "SELECT ltp.leave_name as leave_type, ifnull(la.no_days,0) as accrud_days,ifnull(lt.no_days,0) as days_taken,  ((ifnull(la.no_days,0)-ifnull(lt.no_days,0)) ) as balance FROM hrh.tbl_leave_days_available la \n"
                + "left join hrh.tbl_leave_taken lt on la.employee_id =lt.employee_id  left join hrh.leaves ltp on ltp.leave_type_id =la.leave_type_id   where  la.fy_id='2022' and la.employee_id='" + emp_id + "' ";
        try {
            conn.rs = conn.st.executeQuery(sql);
            while (conn.rs.next()) {
                LeaveBalance lb =new LeaveBalance();
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(LeaveDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return leaves;

    }

    public int getLeaveBalance(String employeeId, int leaveType) {

        int leaveBalance = 0;

        try {

            // Prepare the SQL statement
            String sql = "SELECT balance FROM leave_balance WHERE employee_id = ? AND leave_type = ?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, employeeId);
            conn.pst.setInt(2, leaveType);
            // Execute the SQL statement
            int submit = conn.pst.executeUpdate();
            // Retrieve the leave balance from the result set
            if (conn.rs.next()) {
                leaveBalance = conn.rs.getInt("balance");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(LeaveDAO.class.getName()).log(Level.SEVERE, null, e);

        }
        return leaveBalance;
    }
}
