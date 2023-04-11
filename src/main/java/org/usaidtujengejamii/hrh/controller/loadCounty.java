package org.usaidtujengejamii.hrh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
 * Servlet implementation class loadCounty
 */
@WebServlet("/loadCounty")
public class loadCounty extends HttpServlet {

    private static final long serialVersionUID = 1L;
    HttpSession session = null;
    private final DatabaseConnection conn;
    PrintWriter out;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public loadCounty() {
        super();
        conn = new DatabaseConnection();
    }
    

    /**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doPost(request, response);
    }

    /**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            session = request.getSession();
            String sessioncounty = "";

            if (session.getAttribute("countyid") != null) {

                sessioncounty = session.getAttribute("countyid").toString();
            }

            String county;

            county = "<option value=\"\">Select County</option>";
            String qr = "SELECT * FROM county where active =1 order by County ASC;";
            conn.rs = conn.st.executeQuery(qr);
            while (conn.rs.next()) {
                if (sessioncounty.equalsIgnoreCase(conn.rs.getString(1))) {

                    county += "<option selected value=\"" + conn.rs.getString(1) + "\">" + conn.rs.getString(2)
                            + "</option>";
                } else {
                    county += "<option value=\"" + conn.rs.getString(1) + "\">" + conn.rs.getString(2) + "</option>";
                }

            }

            out = response.getWriter();
            out.println(county);
      
        } catch (SQLException ex) {
            Logger.getLogger(loadCounty.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
