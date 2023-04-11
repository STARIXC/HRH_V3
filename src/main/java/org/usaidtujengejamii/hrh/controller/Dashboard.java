/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;

import utils.EmployeesRepo;
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
/**
 *
 * @author CBWAHYI
 */
public class Dashboard extends HttpServlet {

    //HttpSession session;
    String query;
    //private final DatabaseConnection conn;
    String message;
    PrintWriter out;
//    private final JSONConverter json;
    public EmployeesRepo dao;

    int active_staff, onleave, pending_leave_applications, approvedleaves, execute_activity = 0;

    public Dashboard() {
        super();
        dao = new EmployeesRepo();
//        json= new JSONConverter();
    }

    int row;
    int errors;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        out = response.getWriter();

        response.setContentType("application/json");
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("staff")) {
            int get_all_active = dao.get_all_activestaff();
            // active_staff=dao.get_all_active_staff();
            active_staff = get_all_active;
//            System.out.println("Number of active staff: " + active_staff);
           JSONObject obj = new JSONObject();
           obj.put("staff", new Integer(active_staff));

            out.println(obj);
        } else if (action.equalsIgnoreCase("leave")) {

        } else if (action.equalsIgnoreCase("approvedleaves")) {

        } else if (action.equalsIgnoreCase("pendingapproval")) {
            // getPendingLeaves();

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
            Logger.getLogger(Dashboard.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Dashboard.class.getName()).log(Level.SEVERE, null, ex);
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

}
