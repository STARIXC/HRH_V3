/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;

import utils.JSONConverter;
import utils.LeaveApplicationsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/**
 *
 * @author UTJ
 */
public class ProcessLeaveApplications extends HttpServlet {

    PrintWriter out;
    private static final String INSERT_OR_EDIT = "leave_approval.jsp";
    int status, execute_activity = 0;
    private final LeaveApplicationsDAO dao;
    //  Gson gson = new Gson();
    String result, nextPage;
//    private JSONConverter json;

    public ProcessLeaveApplications() throws SQLException {
        super();
        dao = new LeaveApplicationsDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
//        Leave leave = new Leave();
        String action = request.getParameter("action");
        String[] application_ids = request.getParameterValues("leave[]");

        int supervisor_id = 1;

        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Calendar cal = Calendar.getInstance();
        Date date = cal.getTime();
        String todaysdate = dateFormat.format(date);
        System.out.println("Today's date : " + todaysdate);
        System.out.println("Applications : " + Arrays.toString(application_ids));

        if (action.equalsIgnoreCase("Approve")) {
            for (String application_id1 : application_ids) {
                int application_id = Integer.parseInt(application_id1);
                String remarks = "Approved";
                int leave_status = 2;
                String sql = "update leave_requests set lstatus='" + leave_status + "',date_of_approval='" + todaysdate + "',remarks='" + remarks + "', supervisor_id='" + supervisor_id + "'  where application_id='" + application_id + "'";
//                dao.approveLeave(sql);
                //  dao.addActivityLog(sql);
            }
            //  int leave_id = Integer.parseInt(deleteId);
            // System.out.println(leave_id);
            //  status = dao.deleteLeave(leave_id);
            JSONObject obj = new JSONObject();   //create globally JSONObject and name is "obj"

            if (status != 0) {   //check if condition variable "i" not equal to zero after continue

                obj.put("status", "success");
                obj.put("message", "Leave Request Approved Successfully");    //create json object "status","message" and apply custome messages for "delete data"
            } else {

                obj.put("status", "error");
                obj.put("message", "Unable to Approve The leave request....");   //create json object "status","message" and apply custome messages for "unable to delete data"
            }

            out.print(obj); //finally print the "obj" object

        } else if (action.equalsIgnoreCase("reject")) {
            String reject_id = request.getParameter("application");
            String remarks = request.getParameter("reason");
            int application_id = Integer.parseInt(reject_id);
            int leave_status = 3;
             String sql = "update tbl_leave_application set leave_status='" + leave_status + "',date_of_approval='" + todaysdate + "',remarks='" + remarks + "', supervisor_id='" + supervisor_id + "'  where application_id='" + application_id + "'";
//               status = dao.approveLeave(sql);
            JSONObject obj = new JSONObject();   //create globally JSONObject and name is "obj"
            if (status != 0) {   //check if condition variable "i" not equal to zero after continue
                obj.put("status", "success");
                obj.put("message", "Leave Request Rejected");    //create json object "status","message" and apply custome messages for "delete data"
            } else {
                obj.put("status", "error");
                obj.put("message", "Unable to perform request....");   //create json object "status","message" and apply custome messages for "unable to delete data"
            }
            out.print(obj); //finally print the "obj" object

        } else {
            String ccate = JSONConverter.convert(dao.getAllApplied());
            System.out.println(ccate);
            out.println(ccate);
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
        processRequest(request, response);
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
        processRequest(request, response);
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

}
