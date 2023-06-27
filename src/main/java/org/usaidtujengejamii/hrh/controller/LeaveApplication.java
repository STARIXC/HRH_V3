package org.usaidtujengejamii.hrh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import utils.JSONConverter;
import utils.LeaveApplicationsDAO;
import utils.MailUtil;

/**
 *
 * @author CBWAHYI
 */
public class LeaveApplication extends HttpServlet {

    PrintWriter out;
    int status, execute_activity = 0;
    private final LeaveApplicationsDAO dao;
//    private final TechnicalMonitorsDAO tDao;
//    private final SupervisorsDAO sDao;
    private final MailUtil mailUtil;

    //  Gson gson = new Gson();
    String result, nextPage;
//    private JSONConverter json;
    private final JSONObject obj;

    public LeaveApplication() throws SQLException {
        super();
        dao = new LeaveApplicationsDAO();
        obj = new JSONObject();
        mailUtil = new MailUtil();
//        tDao = new TechnicalMonitorsDAO();
//        sDao = new SupervisorsDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        out = response.getWriter();
        response.setContentType("application/json");
        String action = request.getParameter("action");
        String emp = request.getParameter("emp_no");
        String startDate = request.getParameter("from_date");
        String endDate = request.getParameter("to_date");
        JSONObject obj_ = new JSONObject();
        String employeeId = request.getParameter("employee_id");

        String sDate = request.getParameter("start_date");
        String eDate = request.getParameter("end_date");

        int supervisor_approval_status = 0;
        int technical_monitor_approval_status = 0;

        String applicationDate = request.getParameter("application_date");
        String jsonResponse = null;
        String supervisorEmail = null;
        String technicalMonitorEmail = null;

        switch (action.toLowerCase()) {
            case "get_leave_balance":
                jsonResponse = JSONConverter.convert(dao.getBalanceByEmpNo(emp, startDate, endDate));
                break;
            case "get_leave_empl":
                String employee = request.getParameter("emp_no");
                System.out.println(employee);
                jsonResponse = JSONConverter.convert(dao.getAllAppliedByEmpNo(employee));
                break;

            case "pendingapproval":
                jsonResponse = JSONConverter.convert(dao.getAllpending());
                break;
            case "all_leaves":
                jsonResponse = JSONConverter.convert(dao.getAllApplied());
//                System.out.println(jsonResponse);
                break;
            case "all_leaves_by_employee":
                employee = request.getParameter("emp_no");
                jsonResponse = JSONConverter.convert(dao.getAllAppliedByEmpNo(employee));
                break;
            case "get_by_sup":
                employee = request.getParameter("id");
                jsonResponse = JSONConverter.convert(dao.getAllBySup(employee));
                break;
            case "getleavedetails":
                String id = request.getParameter("id");
                int leaveID = Integer.parseInt(id);
                jsonResponse = JSONConverter.convert(dao.getLeaveDetails(leaveID));
//                System.out.println(jsonResponse);
                break;
            case "save_leave":
                int numDays = Integer.parseInt(request.getParameter("no_days"));
                int lstatus = Integer.parseInt(request.getParameter("leave_status"));
                int leaveId = Integer.parseInt(request.getParameter("leave_type_id"));
                int supervisorId = Integer.parseInt(request.getParameter("supervisor_id"));
                int technicalMonitorId = Integer.parseInt(request.getParameter("technical_monitor_id"));
                String data = numDays + " " + lstatus + " " + leaveId + " " + supervisorId + " " + technicalMonitorId;
                System.out.println(data);
                boolean overlap = dao.isLeaveDateOverlap(employeeId, leaveId, sDate, eDate, 2);
                if (overlap) {
                    obj_.put("status", "failed");
                    obj_.put("message", "You have an existing leave request in the period specified");
                } else {
                    boolean saveSuccessful = dao.saveLeaveApplication(employeeId, leaveId, sDate, eDate, numDays, lstatus, supervisor_approval_status, technical_monitor_approval_status, supervisorId, technicalMonitorId, applicationDate); // Handle the exception
                    if (saveSuccessful) {
                        supervisorEmail = "starixc@gmail.com";
                        mailUtil.sendNotificationToSupervisor(supervisorEmail, employeeId, sDate, eDate);
                        obj_.put("status", "success");
                        obj_.put("message", "Saved Successfully....");
                        jsonResponse = JSONConverter.convert(obj_);
//                    System.out.println(jsonResponse);
                    } else {
                        obj_.put("status", "failed");
                        obj_.put("message", "Something Went Wrong");
                    }
                }

                break;
            case "approve_leave":
                String[] leaveRequestIds = request.getParameterValues("leave[]");
//                int supervisor_d = Integer.parseInt(request.getParameter("supervisor_id"));
//                int technicalMonitor_id = Integer.parseInt(request.getParameter("technical_monitor_id"));
                int supervisor_d = 30;
                int technicalMonitor_id = 2;
//                int approvalStatus = Integer.parseInt(request.getParameter("approval_status"));
                int approvalStatus = 3;
//                String approvalComments = request.getParameter("approval_comments");
                String approvalComments = "Approved";
                boolean approvalSuccessful = false;

                for (String leaveRequestIdStr : leaveRequestIds) {
                    int leaveRequestId = Integer.parseInt(leaveRequestIdStr);

                    switch (approvalStatus) {
                        case 2: // Supervisor approval
//                            supervisorEmail = sDao.getSupervisorEmail(leaveRequestId); // replace with method to get supervisor email
                            supervisorEmail = "starixc@gmail.com";
                            approvalSuccessful = dao.saveLeaveApproval(leaveRequestId, supervisor_d, 0, 1, 0, approvalComments, null, null); // Handle the exception
                            break;
                        case 3: // Technical monitor approval
                            technicalMonitorEmail = "starixc@gmail.com"; // placeholder for testing
//                            technicalMonitorEmail = tDao.getTechnicalMonitorEmail(leaveRequestId); // replace with method to get technical monitor email
                            approvalSuccessful = dao.updateLeaveApproval(leaveRequestId, technicalMonitor_id, 1, approvalComments); // Handle the exception
                            break;
                        default:
                            obj_.put("status", "failed");
                            obj_.put("message", "Invalid approval status.");
                            break;
                    }

                    if (approvalSuccessful) {
                        if (approvalStatus == 2 && dao.isLeaveRequestApprovedBySupervisor(leaveRequestId)) {
                            dao.updateLeaveRequestSupervisorApprovalStatus(leaveRequestId, 1); // Update the leave request supervisor approval status to approved
                        } else if (approvalStatus == 3 && dao.isLeaveRequestApprovedByTechnicalMonitor(leaveRequestId)) {
                            dao.updateLeaveRequestTechnicalMonitorApprovalStatus(leaveRequestId, 1); // Update the leave request technical monitor approval status to approved
                            dao.updateLeaveRequestStatus(leaveRequestId, 1); //Update the leave request supervisor approval status to approved
                        } else {
                            dao.updateLeaveRequestStatus(leaveRequestId, 3); // Update the leave request status to rejected if either approval is rejected
//                            String employeeEmail = dao.getEmployeeEmail_(employeeId);
                            String employeeEmail = "starixc@gmail.com";
                            mailUtil.sendRejectionNotificationToEmployee(employeeEmail, leaveRequestId); // Send notification to the employee
                            if (technicalMonitorEmail != null) {
                                mailUtil.sendRejectionNotificationToTechnicalMonitor(technicalMonitorEmail, leaveRequestId);
                            }
                        }

                        if (approvalStatus == 2 && supervisorEmail != null) {
                            mailUtil.sendApprovalNotificationToSupervisor(supervisorEmail, leaveRequestId);
                        } else if (approvalStatus == 3 && technicalMonitorEmail != null) {
                            mailUtil.sendApprovalNotificationToTechnicalMonitor(technicalMonitorEmail, leaveRequestId);
                        }

                        obj_.put("status", "success");
                        obj_.put("message", "Leave application was approved/rejected successfully.");
                    } else {
                        obj_.put("status", "failed");
                        obj_.put("message", "Failed to update leave application status.");
                        break;
                    }
                }
                break;

            default:
                sendErrorResponse("Invalid action.");
                return;
        }

        if (jsonResponse != null) {
            out.println(jsonResponse);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LeaveApplication.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LeaveApplication.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void sendErrorResponse(String message) {
        obj.put("success", false);
        obj.put("message", message);
        out.println(obj);
    }

}
