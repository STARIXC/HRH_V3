/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.LeaveBalance;
import utils.LeaveBalanceDAO;

/**
 *
 * @author CBWAHYI
 */
public class AvailableDays extends HttpServlet {

    private final LeaveBalanceDAO dao;
    PrintWriter out;
    private final Gson gson;

    public AvailableDays() {
    dao = new LeaveBalanceDAO();
        gson = new Gson();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String leave_type = request.getParameter("leave_type");
        String fy = request.getParameter("fy");
        String emp_no = request.getParameter("employee_id");
 int lp=Integer.parseInt(leave_type);
        JsonObject myObj = new JsonObject();

        LeaveBalance daysInfo = dao.findByEmployeeAndLeaveTypeAndYear(emp_no, lp, fy);
        JsonElement dayObj = gson.toJsonTree(daysInfo);
       if(daysInfo== null){
            myObj.addProperty("success", false);
        }
        else {
            myObj.addProperty("success", true);
        }
        myObj.add("result", dayObj);
        out.println(myObj.toString());
//    staff.models.AvailableDay result = dao.getAvailableDays(leave_type, fy,emp_no);
//    String dayJsonString = this.gson.toJson(result);
        System.out.println(myObj.toString());
//    //System.out.println(leave_type + ":" + fy + "totalHOurs :" + result);
//    out.println(dayJsonString);
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
