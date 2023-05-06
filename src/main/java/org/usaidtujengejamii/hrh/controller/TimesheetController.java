package org.usaidtujengejamii.hrh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Timesheet;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import utils.JSONConverter;
import utils.TimesheetDAO;

/**
 *
 * @author CBwahyi
 */
@WebServlet(name = "TimesheetController", urlPatterns = {"/timesheetController"})
public class TimesheetController extends HttpServlet {

    PrintWriter out;
    private final TimesheetDAO dao;

    public TimesheetController() {
        dao = new TimesheetDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        out = response.getWriter();
        // setting the response type
        response.setContentType("application/json");
        String action = request.getParameter("action");

        switch (action) {
            case "save":
//                saveTimesheetEntries(request, response);
                break;
            case "getEmployeeEntries":
                String emp_no = request.getParameter("emp_no");
                String year = request.getParameter("year");
                String month = request.getParameter("month");
                System.out.println(year + "_" + emp_no + "_" + month);
                // Retrieve the timesheet data for the selected month
                List<Timesheet> timesheetData = dao.getTimesheetEntriesForMonth(emp_no, year, month);
                boolean ans = timesheetData.isEmpty();
                if (ans == true) {
                    System.out.println("The data cannot be found for" + year + "_" + emp_no + "_" + month);
                } else {
                    out.println(JSONConverter.convert(timesheetData));

                }
//               
                break;
            case "getAllEntries":
                String year_ = request.getParameter("year");
                String month_ = request.getParameter("month");
                List<Timesheet> timesheetData_ = dao.getTimesheetData(year_, month_);
                 // Create a JSON object for the response
                JSONObject jsonResponse = new JSONObject();
              
//                jsonResponse.put("data", timesheetData_);
                out.println(JSONConverter.convert(timesheetData_));
                break;
            case "approve":
//                approveTimesheetEntries(request, response);
                break;
            default:
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("Invalid action specified");
                break;
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
            Logger.getLogger(TimesheetController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(TimesheetController.class.getName()).log(Level.SEVERE, null, ex);
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
