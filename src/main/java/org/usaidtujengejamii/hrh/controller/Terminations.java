/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package org.usaidtujengejamii.hrh.controller;

import utils.JSONConverter;
import utils.TerminationDAO;
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
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author CBWAHYI
 */
public class Terminations extends HttpServlet {

    PrintWriter out;
    int status, execute_activity = 0;
    public final TerminationDAO dao;
    //  Gson gson = new Gson();
    String result, nextPage;
    public JSONConverter json;
    JSONObject obj = new JSONObject();
    private final DatabaseConnection conn;

    public Terminations() {
        dao = new TerminationDAO();
        json = new JSONConverter();
        conn = new DatabaseConnection();
    }

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        out = response.getWriter();
        // setting the response type
        response.setContentType("application/json");
        String action = request.getParameter("action");
        String emp_no = request.getParameter("emp_no");

        if (action.equalsIgnoreCase("view")) {
            String termination = JSONConverter.convert(dao.getTerminationModelById(emp_no));
            out.println(termination);
        } else if (action.equalsIgnoreCase("delete")) {
            String deleteId = request.getParameter("deleteId");
            int deleted = deleteTermination(deleteId);
            if(deleted>0){
            reactivate(deleteId);
//                    obj.put("status", "success");
//                    obj.put("message", "Record Deleted Successfully");    //create json object "status","message" and apply custome messages for "delete data"

                } else {
                    obj.put("status", "error");
                    obj.put("message", "Unable  To the Record....");   //create json object "status","message" and apply custome messages for "unable to delete data"

                }
            out.println(obj);
        } else {
            String termination = JSONConverter.convert(dao.getAllTerminationModels());
            out.println(termination);
          //  System.out.println(termination);
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
            Logger.getLogger(Terminations.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Terminations.class.getName()).log(Level.SEVERE, null, ex);
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

    private int deleteTermination(String deleteId) throws SQLException {
         int deleted = 0;
        String delete = "DELETE FROM hrh.tbl_termination WHERE t_id='" + deleteId + "'";
        conn.pst = conn.conn.prepareStatement(delete);
        if (conn.pst.executeUpdate() > 0) {
            deleted += 1;
        } else {
            deleted = 0;
        }
        return deleted;
    }

    private void reactivate(String t_emp_no) throws SQLException {
           String deactivate = "UPDATE `hrh`.`employee_hist` SET active ='1' WHERE `emp_no` ='"+t_emp_no+"' and `active`='0' order by created_at desc limit 1";
                conn.pst = conn.conn.prepareStatement(deactivate);
               // conn.pst.setString(1, t_emp_no);
                int execute=conn.pst.executeUpdate();
                if ( execute > 0) {
                    obj.put("status", "success");
                    obj.put("message", "Record Reactived Successfully");    //create json object "status","message" and apply custome messages for "delete data"
                } else {
                    obj.put("status", "error");
                    obj.put("message", "Failed....");   //create json object "status","message" and apply custome messages for "unable to delete data"}
                }
    }

}
