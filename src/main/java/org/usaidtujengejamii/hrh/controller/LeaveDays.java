package org.usaidtujengejamii.hrh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author CBwahyi
 */
public class LeaveDays extends HttpServlet {

    private final DatabaseConnection conn;

    public LeaveDays() {
        conn = new DatabaseConnection();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {

        String startDateStr = request.getParameter("start_date");
        String endDateStr = request.getParameter("end_date");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date startDate = sdf.parse(startDateStr);
            Date endDate = sdf.parse(endDateStr);

            int daysBetween = getDaysBetween(startDate, endDate);

            response.setContentType("text/plain");
            response.getWriter().write(Integer.toString(daysBetween));

        } catch (ParseException e) {
            throw new ServletException("Invalid date format", e);
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
        } catch (ParseException ex) {
            Logger.getLogger(LeaveDays.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(LeaveDays.class.getName()).log(Level.SEVERE, null, ex);
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

    private int getDaysBetween(Date startDate, Date endDate) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String startDateStr = sdf.format(startDate);
        String endDateStr = sdf.format(endDate);

        // Query the database for weekdays that are not holidays
        String query = "SELECT COUNT(*) AS num_weekdays "
                + "FROM calendar_table "
                + "WHERE dt BETWEEN ? AND ? "
                + "AND isWeekday = 1 "
                + "AND isHoliday = 0";
        int daysBetween = 0;

        try {
            conn.pst = conn.conn.prepareStatement(query);
            conn.pst.setString(1, startDateStr);
            conn.pst.setString(2, endDateStr);
            conn.rs = conn.pst.executeQuery();

            if (conn.rs.next()) {
                daysBetween = conn.rs.getInt("num_weekdays");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LeaveDays.class.getName()).log(Level.SEVERE, null, ex);
        }
        return daysBetween;
    }
}
