/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.JSONConverter;
import utils.LeaveBalanceDAO;

/**
 *
 * @author CBWAHYI
 */
public class LeaveApplication extends HttpServlet {

    PrintWriter out;
    int status, execute_activity = 0;
    private LeaveBalanceDAO dao;
    //  Gson gson = new Gson();
    String result, nextPage;
    private JSONConverter json;

    public LeaveApplication() {
        super();
        dao = new LeaveBalanceDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        out = response.getWriter();
        // setting the response type
        response.setContentType("application/json");
        String action = request.getParameter("action");

       if (action.equalsIgnoreCase("get_leave_balance")) {
            int emp_id;
            String emp = request.getParameter("employee_id");
           // emp_id= Integer.parseInt(emp);
            String start = request.getParameter("from_date");
            String end = request.getParameter("to_date");
            String leaves = JSONConverter.convert(dao.getBalanceByEmpNo(emp, start, end));
            out.println(leaves);
        } else if (action.equalsIgnoreCase("get_leave_empl")) {
            int emp_id;
            String emp = request.getParameter("employee_id");
            emp_id= Integer.parseInt(emp);
            String start = request.getParameter("from_date");
            String end = request.getParameter("to_date");
            String leaves = JSONConverter.convert(dao.getAllAppliedByEmpNo(emp_id, start, end));
            out.println(leaves);
        }
        else if (action.equalsIgnoreCase("pendingapproval")) {
            String leaves = JSONConverter.convert(dao.getAllpending());
            out.println(leaves);
        } else {
            String leaves = JSONConverter.convert(dao.getAllApplied());
            out.println(leaves);
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
