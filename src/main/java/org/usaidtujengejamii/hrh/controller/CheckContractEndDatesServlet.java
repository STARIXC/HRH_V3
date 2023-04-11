/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author CBwahyi
 */
@WebServlet(name = "CheckContractEndDatesServlet", urlPatterns = {"/contractEnder"})
public class CheckContractEndDatesServlet extends HttpServlet {

    HttpSession session;
    String found;
    MessageDigest m;
    PrintWriter out;
    private final DatabaseConnection conn;

    public CheckContractEndDatesServlet() {
        super();
        conn = new DatabaseConnection();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        try {
            // Execute the query to get the contracts that are ending today

            String checker_ = "SELECT emprecordid, contract_end_date FROM employee_history WHERE contract_end_date = ?";
            conn.pst = conn.conn.prepareStatement(checker_);
            conn.pst.setDate(1, new java.sql.Date(new Date().getTime()));
            conn.rs = conn.pst.executeQuery();

            // Update the contracts that have ended
            while (conn.rs.next()) {
                String emprecordid = conn.rs.getString("emprecordid");
                java.sql.Date contractEndDate = conn.rs.getDate("contract_end_date");

                // Mark the contract as ended
                String updater_= "UPDATE employee_history SET "
                        + "date_ended = ?, "
                        + "isActive = '1' "
                        + "WHERE emprecordid = ?";
              conn.pst = conn.conn.prepareStatement(updater_);
                conn.pst.setDate(1, contractEndDate);
                conn.pst.setString(2, emprecordid);
                conn.pst.executeUpdate();
            }
        } catch (SQLException e) {
            // Log the error
            e.printStackTrace();
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
            Logger.getLogger(CheckContractEndDatesServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CheckContractEndDatesServlet.class.getName()).log(Level.SEVERE, null, ex);
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
