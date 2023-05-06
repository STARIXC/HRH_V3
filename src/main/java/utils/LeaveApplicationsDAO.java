package utils;

import java.sql.Date;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.LeaveApplication;
import models.LeaveBalance;

/**
 *
 * @author CBwahyi
 */
public class LeaveApplicationsDAO {

    private final DatabaseConnection conn;
 
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy"); // format of the date string
    LocalDate currentDate = LocalDate.now();
   Date approved_at = Date.valueOf(currentDate);
    public LeaveApplicationsDAO() {
        conn = new DatabaseConnection();
    }

    public List<LeaveApplication> getAllApplied() {
        List<LeaveApplication> leaves = new ArrayList<>();
        try {
            String sql = "SELECT a.application_id as id,"
                    + "a.start_date as startdate,"
                    + "a.end_date as enddate,"
                    + " a.application_date AS applicationdate,"
                    + "a.supervisor_id AS approved_by,"
                    + " a.l_status AS status,"
                    + "a.num_days AS no_days,"
                    + "t.leave_type AS leave_name,"
                    + " e.emp_no AS employee_no,"
                    + "CONCAT(e.first_name,' ',e.surname) AS EmployeeName"
                    + " FROM hrh.leave_requests a "
                    + "LEFT JOIN leaves t on t.leave_id=a.leave_id "
                    + "LEFT JOIN emp_bio e ON e.emp_no=a.employee_id";
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
                leave.setEmployee_id(conn.rs.getString("employee_no"));
                leaves.add(leave);

            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(LeaveApplicationsDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return leaves;
    }

    public List<LeaveApplication> getAllAppliedByEmpNo(String employee_id) {
        List<LeaveApplication> eleaves = new ArrayList<>();
        try {
            String sql = "SELECT a.application_id as id,"
                    + "a.start_date as startdate,"
                    + "a.end_date as enddate,"
                    + " a.application_date AS applicationdate,"
                    + "a.supervisor_id AS approved_by,"
                    + " a.l_status AS status,"
                    + "a.num_days AS no_days,"
                    + "t.leave_type AS leave_name,"
                    + " e.emp_no AS employee_no,"
                    + "CONCAT(e.first_name,' ',e.surname) AS EmployeeName"
                    + " FROM hrh.leave_requests a "
                    + "LEFT JOIN leaves t on t.leave_id=a.leave_id "
                    + "LEFT JOIN emp_bio e ON e.emp_no=a.employee_id where a.employee_id=?";

            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, employee_id);
            conn.rs = conn.pst.executeQuery();
            
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
                leave.setEmployee_id(conn.rs.getString("employee_no"));
                eleaves.add(leave);
            }

        } catch (SQLException e) {
            Logger.getLogger(LeaveApplicationsDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return eleaves;
    }

    public List<LeaveBalance> getBalanceByEmpNo(String emp_id, String start, String end) {
        List<LeaveBalance> leaves = new ArrayList<>();
//
//        String sql = "SELECT ltp.leave_name as leave_type, ifnull(la.no_days,0) as accrud_days,ifnull(lt.no_days,0) as days_taken,  ((ifnull(la.no_days,0)-ifnull(lt.no_days,0)) ) as balance FROM hrh.tbl_leave_days_available la \n"
//                + "left join hrh.tbl_leave_taken lt on la.employee_id =lt.employee_id  left join hrh.leaves ltp on ltp.leave_type_id =la.leave_id   where  la.fy_id='2022' and la.employee_id='" + emp_id + "' ";
//        try {
//            conn.rs = conn.st.executeQuery(sql);
//            while (conn.rs.next()) {
//                LeaveBalance lb =new LeaveBalance();
//                
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(LeaveDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }

        return leaves;

    }

    public int getLeaveBalance(String employeeId, int leaveType) {

        int leaveBalance = 0;
//
//        try {
//
//            // Prepare the SQL statement
//            String sql = "SELECT balance FROM leave_balance WHERE employee_id = ? AND leave_type = ?";
//            conn.pst = conn.conn.prepareStatement(sql);
//            conn.pst.setString(1, employeeId);
//            conn.pst.setInt(2, leaveType);
//            // Execute the SQL statement
//            int submit = conn.pst.executeUpdate();
//            // Retrieve the leave balance from the result set
//            if (conn.rs.next()) {
//                leaveBalance = conn.rs.getInt("balance");
//            }
//        } catch (SQLException e) {
//            // TODO Auto-generated catch block
//            Logger.getLogger(LeaveDAO.class.getName()).log(Level.SEVERE, null, e);
//
//        }
        return leaveBalance;
    }

    public List<LeaveApplication> getAllpending() {
        List<LeaveApplication> leaves = new ArrayList<>();
        try {
            String sql = "SELECT a.application_id as id,"
                    + "a.start_date as startdate,"
                    + "a.end_date as enddate,"
                    + " a.application_date AS applicationdate,"
                    + "a.supervisor_id AS approved_by,"
                    + " a.l_status AS status,"
                    + "a.num_days AS no_days,"
                    + "t.leave_type AS leave_name,"
                    + " e.emp_no AS employee_no,"
                    + "CONCAT(e.first_name,' ',e.surname) AS EmployeeName"
                    + " FROM hrh.leave_requests a "
                    + "LEFT JOIN leaves t on t.leave_id=a.leave_id "
                    + "LEFT JOIN emp_bio e ON e.emp_no=a.employee_id where a.l_status='0'";
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
                leave.setEmployee_id(conn.rs.getString("employee_no"));
                leaves.add(leave);

            }

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            Logger.getLogger(LeaveApplicationsDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return leaves;
    }

    public LeaveApplication getLeaveDetails(int leaveID) {
        LeaveApplication leaveApplication = null;
        String sql = "SELECT a.application_id AS id, "
                + "a.start_date AS startdate, "
                + "a.end_date AS enddate, "
                + "a.application_date AS applicationdate, "
                + "a.supervisor_id AS approved_by, "
                + "a.l_status AS status, "
                + "a.num_days AS no_days, "
                + "t.leave_type AS leave_name, "
                + "e.emp_no AS employee_no, "
                + "CONCAT(e.first_name, ' ', e.surname) AS employee_name, "
                + "e.emp_no AS supervisor "
                + "FROM hrh.leave_requests a "
                + "LEFT JOIN leaves t ON t.leave_id = a.leave_id "
                + "LEFT JOIN emp_bio e ON e.emp_no = a.employee_id "
                + "JOIN hrh.tbl_employee_position_relations ep ON ep.emp_no = e.emp_no "
                + "JOIN hrh.tbl_user_facility fac ON fac.user_id = e.emp_no "
                + "JOIN hrh.subpartnera f ON f.CentreSanteId = fac.facility_id "
                + "JOIN hrh.tbl_facility_supervisor fs ON fs.mflc = f.CentreSanteId "
                + "JOIN hrh.supervisors sup ON sup.id = fs.supervisor_id "
                + "JOIN hrh.cadre_positions p ON p.id = ep.position_id "
                + "JOIN hrh.standardized_cadre sc ON sc.id = p.standardized_cadre_id "
                + "JOIN hrh.cadre_type ct ON ct.id = sc.carder_type_id "
                + "WHERE a.application_id = ?";

        try {
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setInt(1, leaveID);
            conn.rs = conn.pst.executeQuery();
            if (conn.rs.next()) {
                leaveApplication = new LeaveApplication();
                leaveApplication.setApplication_id(conn.rs.getInt("id"));
                leaveApplication.setStart_date(conn.rs.getString("startdate"));
                leaveApplication.setEnd_date(conn.rs.getString("enddate"));
                leaveApplication.setDate_of_application(conn.rs.getString("applicationdate"));
//            leaveApplication.setSupervisor(conn.rs.getString("supervisor"));
                leaveApplication.setSupervisor("Facility in Charge");
                leaveApplication.setLeave_status(conn.rs.getInt("status"));
                leaveApplication.setNumber_days(conn.rs.getDouble("no_days"));
                leaveApplication.setLeave_type_name(conn.rs.getString("leave_name"));
                leaveApplication.setEmployee_name(conn.rs.getString("employee_name"));
                leaveApplication.setEmployee_id(conn.rs.getString("employee_no"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(LeaveApplicationsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return leaveApplication;
    }

    public boolean saveLeaveApplication(String employeeId, int leaveId, String startDate, String endDate, int numDays, int status, int supervisorApprovalStatus, int technicalMonitorApprovalStatus, int supervisorId, int technicalMonitorId, String applicationDate) {

        try {

            String sql = "INSERT INTO leave_requests (employee_id, leave_id, start_date, end_date, num_days, l_status, supervisor_id, technical_monitor_id, application_date) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, employeeId);
            conn.pst.setInt(2, leaveId);
            conn.pst.setString(3, startDate);
            conn.pst.setString(4, endDate);
            conn.pst.setInt(5, numDays);
            conn.pst.setInt(6, status);
            conn.pst.setInt(7, supervisorId);
            conn.pst.setInt(8, technicalMonitorId);
            conn.pst.setString(9, applicationDate);
            int rowsAffected = conn.pst.executeUpdate();;
            return (rowsAffected > 0);

        } catch (SQLException ex) {
            // Handle the exception
            Logger.getLogger(LeaveApplicationsDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }

    public boolean saveLeaveApproval(int leaveRequestId, int supervisorId, int technicalMonitorId, int supervisorApprovalStatus, int technicalMonitorApprovalStatus, String supervisorComments, String technicalMonitorComments, Date supervisorApprovalDate) throws SQLException {

        int rowsInserted = 0;

        try {
            String sql = "INSERT INTO hrh.leave_approvals (leave_request_id, supervisor_id, technical_monitor_id, status, supervisor_approval_status, technical_monitor_approval_status, supcomments, tocomments, sup_approval_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            conn.pst = conn.conn.prepareStatement(sql);

            conn.pst.setInt(1, leaveRequestId);
            conn.pst.setInt(2, supervisorId);
            conn.pst.setInt(3, technicalMonitorId);
            conn.pst.setInt(4, 0); // status = 0 to represent pending
            conn.pst.setInt(5, supervisorApprovalStatus);
            conn.pst.setInt(6, technicalMonitorApprovalStatus);
            conn.pst.setString(7, supervisorComments);
            conn.pst.setString(8, technicalMonitorComments);
            conn.pst.setDate(9, supervisorApprovalDate);

            rowsInserted = conn.pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LeaveApplicationsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rowsInserted > 0;
    }

//    public boolean updateLeaveApproval(int leaveRequestId, int supervisorId, int technicalMonitorId, boolean b, boolean b0, String approvalComments) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
    public boolean isLeaveRequestApprovedBySupervisor(int leaveRequestId) throws SQLException {

        try {

            String query = "SELECT supervisor_approval_status FROM leave_approvals WHERE leave_request_id = ?";
            conn.pst = conn.conn.prepareStatement(query);
            conn.pst.setInt(1, leaveRequestId);
            conn.rs = conn.pst.executeQuery();

            if (conn.rs.next()) {
                int supervisorApprovalStatus = conn.rs.getInt("supervisor_approval_status");
                if (supervisorApprovalStatus == 1) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(LeaveApplicationsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean isLeaveRequestApprovedByTechnicalMonitor(int leaveRequestId) throws SQLException {
      
        try {

            String query = "SELECT technical_monitor_approval_status FROM leave_approvals WHERE leave_request_id = ? ";
            conn.pst = conn.conn.prepareStatement(query);
            conn.pst.setInt(1, leaveRequestId);
            conn.rs = conn.pst.executeQuery();

            if (conn.rs.next()) {
                int technical_monitor_approval_status = conn.rs.getInt("technical_monitor_approval_status");
                 if (technical_monitor_approval_status == 1) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(LeaveApplicationsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateLeaveRequestSupervisorApprovalStatus(int leaveRequestId, int supervisorApprovalStatus) throws SQLException {

        int rowsUpdated = 0;

        try {

            String query = "UPDATE leave_approvals SET supervisor_approval_status = ? WHERE leave_request_id = ?";
            conn.pst = conn.conn.prepareStatement(query);
            conn.pst.setInt(1, supervisorApprovalStatus);
            conn.pst.setInt(2, leaveRequestId);
            rowsUpdated = conn.pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LeaveApplicationsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rowsUpdated > 0;
    }

    public boolean updateLeaveRequestTechnicalMonitorApprovalStatus(int leaveRequestId, int technicalMonitorApprovalStatus) throws SQLException {
        int rowsUpdated = 0;

        try {
            String query = "UPDATE leave_approvals SET technical_monitor_approval_status = ? WHERE leave_request_id = ?";
            conn.pst = conn.conn.prepareStatement(query);
            conn.pst.setInt(1, technicalMonitorApprovalStatus);
            conn.pst.setInt(2, leaveRequestId);
            rowsUpdated = conn.pst.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(LeaveApplicationsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rowsUpdated > 0;
    }

    public boolean updateLeaveRequestStatus(int leaveRequestId, int newStatus) {

        int rowsUpdated = 0;

        try {

            String query = "UPDATE leave_requests SET l_status = ? WHERE application_id = ?";
            conn.pst = conn.conn.prepareStatement(query);
            conn.pst.setInt(1, newStatus);
            conn.pst.setInt(2, leaveRequestId);
            rowsUpdated = conn.pst.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Failed to update leave request status: " + ex.getMessage());
        }

        return rowsUpdated > 0;
    }

    public String getEmployeeEmail(int leaveRequestId) {
        String email = null;
        try {
            String sql = "SELECT e.email FROM leave_requests la JOIN emp_bio e ON la.employee_id = e.emp_no WHERE la.application_id = ?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setInt(1, leaveRequestId);
            conn.rs = conn.pst.executeQuery();

            if (conn.rs.next()) {
                email = conn.rs.getString("email");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return email;
    }

    public String getEmployeeEmail_(String employee_id) {
        String email = null;
        try {
            String sql = "SELECT e.email FROM  hrh.emp_bio e WHERE e.emp_no= ?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, employee_id);
            conn.rs = conn.pst.executeQuery();

            if (conn.rs.next()) {
                email = conn.rs.getString("email");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return email;
    }

    public List<LeaveApplication> getAllLeaveApplicationsByEmployeeId(String employeeId) {
        List<LeaveApplication> leaveApplications = new ArrayList<>();
        try {

            String sql = "SELECT * FROM leave_requests WHERE employee_id = ?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, employeeId);
            conn.rs = conn.pst.executeQuery();
            while (conn.rs.next()) {
                String startDate = sdf.format(conn.rs.getDate("start_date"));
                String endDate = sdf.format(conn.rs.getDate("end_date"));
                LeaveApplication leaveApplication = new LeaveApplication();
                leaveApplication.setApplication_id(conn.rs.getInt("id"));
                leaveApplication.setEmployee_id(conn.rs.getString("employee_id"));
                leaveApplication.setStart_date(startDate);
                leaveApplication.setEnd_date(endDate);
                leaveApplication.setNumber_days(conn.rs.getDouble("num_days"));
                leaveApplication.setLeave_status(conn.rs.getInt("status"));
                leaveApplications.add(leaveApplication);
            }
     
        } catch (SQLException ex) {
            // handle any exceptions
        }
        return leaveApplications;
    }

    public boolean updateLeaveApproval(int leaveRequestId, int technicalMonitor_id, int i, String approvalComments) {
       int rowsUpdated = 0;
       approvalComments="Approved";
        try {

            String query = "UPDATE leave_approvals SET technical_monitor_approval_status = ?, tocomments=?,to_approval_at=? WHERE leave_request_id = ?";
            conn.pst = conn.conn.prepareStatement(query);
            conn.pst.setInt(1, i);
            conn.pst.setString(2, approvalComments);
            conn.pst.setDate(3, approved_at);
            conn.pst.setInt(4, leaveRequestId);
            rowsUpdated = conn.pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LeaveApplicationsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rowsUpdated > 0;
    }
    
    public void updateBalance(int employee_id, int leave_type_id, double days_taken, int year) {
    try {
        String sql = "UPDATE leave_balance SET balance = balance - ?, days_taken = days_taken + ? WHERE employee_id = ? AND leave_type_id = ? AND year = ?";
        conn.pst = conn.conn.prepareStatement(sql);
        conn.pst.setDouble(1, days_taken);
        conn.pst.setDouble(2, days_taken);
        conn.pst.setInt(3, employee_id);
        conn.pst.setInt(4, leave_type_id);
        conn.pst.setInt(5, year);
        conn.pst.executeUpdate();
    } catch (SQLException e) {
        // handle the exception
    }
}


}
