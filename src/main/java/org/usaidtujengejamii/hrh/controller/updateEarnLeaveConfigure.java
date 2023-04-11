/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;

import utils.JSONConverter;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author UTJ
 */
public class updateEarnLeaveConfigure extends HttpServlet {

    HttpSession session;
    String found;
    MessageDigest m;
    PrintWriter out;
    private final DatabaseConnection conn;
    public JSONConverter json;
    public static final String INSERT_EARN = "REPLACE INTO earn_leave_tbl(earn_leave_rule_id, for_month, day_of_earn_leave) VALUES (?,?,?)";
    public static final String UPDATE_EARN = "Update  earn_leave_tbl  set for_month=?,day_of_earn_leave=? where earn_leave_rule_id=?";
    public static final String SELECT_ALL_EARN_LEAVE = "SELECT * FROM hrh.earn_leave_tbl";

    public updateEarnLeaveConfigure() {
        super();
        conn = new DatabaseConnection();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        session = request.getSession();

        JSONObject obj = new JSONObject();
      //  IdGen IG = new IdGen();

        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("all")) {
            conn.pst = conn.conn.prepareStatement(SELECT_ALL_EARN_LEAVE);
            conn.rs = conn.pst.executeQuery();
            while (conn.rs.next()) {
                int earn_leave_rule_id = conn.rs.getInt("earn_leave_rule_id");
                int for_month = conn.rs.getInt("for_month");
                String day_of_earn_leave = conn.rs.getString("day_of_earn_leave");

                obj.put("earn_leave_rule_id", earn_leave_rule_id);
                obj.put("for_month", for_month);
                obj.put("day_of_earn_leave", day_of_earn_leave);

            }
            out.println(obj);
        } else if (action.equalsIgnoreCase("updateEarnLeaveConfigure")) {
            String earn_leave_id = request.getParameter("earn_leave_rule_id");
            int earn_leave_rule_id = Integer.parseInt(earn_leave_id);
            int for_month = Integer.parseInt(request.getParameter("for_month"));
            String day_of_earn_leave = request.getParameter("day_of_earn_leave");
            if (earn_leave_id == null || earn_leave_id.isEmpty()) {
                conn.pst = conn.conn.prepareStatement(UPDATE_EARN);
                conn.pst.setInt(1, for_month);
                conn.pst.setString(2, day_of_earn_leave);
                conn.pst.setInt(3, earn_leave_rule_id);
                int execute = conn.pst.executeUpdate();
                if (execute > 0) {
                    obj.put("status", "success");
                    obj.put("message", "Update Successfully");    //create json object "status","message" and apply custome messages for "delete data"
                } else {
                    obj.put("status", "error");
                    obj.put("message", "Failed....");   //create json object "status","message" and apply custome messages for "unable to delete data"}
                }
                 out.print(obj);
            } else {
                   conn.pst = conn.conn.prepareStatement(UPDATE_EARN);
                conn.pst.setInt(1, for_month);
                conn.pst.setString(2, day_of_earn_leave);
                conn.pst.setInt(3, earn_leave_rule_id);
                int execute = conn.pst.executeUpdate();
                if (execute > 0) {
                    obj.put("status", "success");
                    obj.put("message", "New Record Successfully");    //create json object "status","message" and apply custome messages for "delete data"
                } else {
                    obj.put("status", "error");
                    obj.put("message", "Failed....");   //create json object "status","message" and apply custome messages for "unable to delete data"}
                }
                
            }
             out.print(obj);
        } else {
             conn.pst = conn.conn.prepareStatement(SELECT_ALL_EARN_LEAVE);
            conn.rs = conn.pst.executeQuery();
            while (conn.rs.next()) {
                int earn_leave_rule_id = conn.rs.getInt("earn_leave_rule_id");
                int for_month = conn.rs.getInt("for_month");
                String day_of_earn_leave = conn.rs.getString("day_of_earn_leave");

                obj.put("day_of_earn_leave", earn_leave_rule_id);
                obj.put("for_month", for_month);
                obj.put("day_of_earn_leave", day_of_earn_leave);

            }
            out.println(obj);
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
            Logger.getLogger(updateEarnLeaveConfigure.class  

.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(updateEarnLeaveConfigure.class  

.getName()).log(Level.SEVERE, null, ex);
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
