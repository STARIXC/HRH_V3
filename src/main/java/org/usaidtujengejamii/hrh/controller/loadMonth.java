package org.usaidtujengejamii.hrh.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 *
 * @author CBWAHYI
 */
public class loadMonth extends HttpServlet {

    HttpSession session;
    private final DatabaseConnection conn;

    public loadMonth() {
        conn = new DatabaseConnection();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        session = request.getSession();
        String sessionmonth = "";
        session.getAttribute("month");
        if (session.getAttribute("month") != null) {

            sessionmonth = session.getAttribute("month").toString();

        }
        System.out.println("current month ___" + sessionmonth);
        String current_year, current_months;
        current_year = request.getParameter("year");
        // System.out.println(" County:"+ county_name);
        //current_months = "";
        String months = "SELECT  DISTINCT monthName,m FROM calendar_table WHERE y='" + current_year + "' ";

        conn.rs = conn.st.executeQuery(months);
        current_months = "<option value=\"\">Select Timesheet MOnth</option>";
        while (conn.rs.next()) {
            if (sessionmonth.equalsIgnoreCase(conn.rs.getString("m"))) {

                current_months = current_months + "<option selected value=\""
                        + conn.rs.getString("m") + "\">" + conn.rs.getString("monthName") + "</option>";

            } else {
                current_months = current_months + "<option value=\"" + conn.rs.getString("m") + "\">"
                        + conn.rs.getString("monthName") + "</option>";

            }

        }
        PrintWriter out = response.getWriter();
        try {
            out.println(current_months);

        } finally {
            if (conn.conn != null) {
                conn.conn.close();
            }
            if (conn.rs != null) {
                conn.rs.close();
            }
            if (conn.st != null) {
                conn.st.close();
            }
            out.close();
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
            Logger.getLogger(loadMonth.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(loadMonth.class.getName()).log(Level.SEVERE, null, ex);
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
