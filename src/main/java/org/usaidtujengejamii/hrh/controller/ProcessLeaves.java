/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;

import utils.JSONConverter;
import utils.LeaveDAO;
import utils.LeaveModel;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Leave;
import org.json.simple.JSONObject;

/**
 *
 * @author UTJ
 */
public class ProcessLeaves extends HttpServlet {

    PrintWriter out;
    private static final String INSERT_OR_EDIT = "leave_approval.jsp";
    int status, execute_activity, accrual_rate = 0;
    private LeaveModel dao;
    //  Gson gson = new Gson();
    String result, nextPage;
    private JSONConverter json;

    public ProcessLeaves() {
        super();
        dao = new LeaveModel();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        Leave leave = new Leave();
        String action = request.getParameter("action");
        String leave_type = request.getParameter("leave_name");
        String isaccrued = request.getParameter("is_accrued");
        String accrualRate = request.getParameter("rate_");
        String leave_description = request.getParameter("leave_description");
        String number_days = request.getParameter("max_days");
        String id = request.getParameter("type_id");
        String deleteId = request.getParameter("deleteId");
        if (action.equalsIgnoreCase("save_leave_type")) {
//            leave.setLeave_id(lid);
            if (!"".equals(accrualRate) && !accrualRate.isEmpty()) {
                accrual_rate = Integer.parseInt(accrualRate);
            } else {
                accrual_rate = 0;
            }

            int max_days = Integer.parseInt(number_days);
            Boolean is_accrued = Boolean.parseBoolean(isaccrued);
            if (id == null || id.isEmpty()) {
                leave.setLeave_type(leave_type);
                leave.setIs_accrued(is_accrued);
                leave.setAccrual_rate(accrual_rate);
                leave.setMax_days(max_days);
                leave.setDescription(leave_description);
                
                
                status = dao.addLeave(leave);
                JSONObject obj = new JSONObject();   //create globally JSONObject and name is "obj"

                if (status != 0) {   //check if condition variable "i" not equal to zero after continue

                    obj.put("status", "success");
                    obj.put("message", " Successfully");    //create json object "status","message" and apply custome messages for "delete data"
                } else {

                    obj.put("status", "error");
                    obj.put("message", "Unable to submit request....");   //create json object "status","message" and apply custome messages for "unable to delete data"
                }

                out.print(obj);
            } else {
                int lid = Integer.parseInt(id);
                leave.setLeave_id(lid);
                leave.setLeave_type(leave_type);
                leave.setIs_accrued(is_accrued);
                leave.setAccrual_rate(accrual_rate);
                leave.setMax_days(max_days);
                leave.setDescription(leave_description);
                
                 status = dao.updateLeave(leave);
                JSONObject obj = new JSONObject();   //create globally JSONObject and name is "obj"

                if (status != 0) {   //check if condition variable "i" not equal to zero after continue

                    obj.put("status", "success");
                    obj.put("message", " Update Successfull");    //create json object "status","message" and apply custome messages for "delete data"
                } else {

                    obj.put("status", "error");
                    obj.put("message", "Unable to submit request....");   //create json object "status","message" and apply custome messages for "unable to delete data"
                }

                out.print(obj);
            }

        } else if (action.equalsIgnoreCase("getLeave")) {
            id = request.getParameter("id");
            int leave_id = Integer.parseInt(id);
            String leave_ = json.convert(dao.getLeaveById(leave_id));
            out.println(leave_);
        } else if (action.equalsIgnoreCase("delete")) {

            int leave_id = Integer.parseInt(deleteId);
            System.out.println(leave_id);
            status = dao.deleteLeave(leave_id);
            JSONObject obj = new JSONObject();   //create globally JSONObject and name is "obj"

            if (status != 0) {   //check if condition variable "i" not equal to zero after continue

                obj.put("status", "success");
                obj.put("message", "Leave Type Delete Successfully");    //create json object "status","message" and apply custome messages for "delete data"
            } else {

                obj.put("status", "error");
                obj.put("message", "Unable to delete Leave Type....");   //create json object "status","message" and apply custome messages for "unable to delete data"
            }

            out.print(obj); //finally print the "obj" object

        } else {
            String ccate = json.convert(dao.getAllLeaves());
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
