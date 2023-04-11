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

import com.google.gson.Gson;

import utils.JSONConverter;
import utils.PositionDAO;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;

/**
 * Servlet implementation class PositionServlet
 */
@WebServlet("/PositionServlet")
public class PositionServlet extends HttpServlet {

    HttpSession session = null;
    private final DatabaseConnection conn;
    Gson gson = new Gson();
    private final PositionDAO dao;
    private static final long serialVersionUID = 1L;
    int status = 0;
    String message = "";
    PrintWriter out;
    @SuppressWarnings("unused")
    private JSONConverter json;

    public PositionServlet() {
        super();
        dao = new PositionDAO();
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
        out = response.getWriter();
        String positions = JSONConverter.convert(dao.getAllPosition());
        //String positions = new Gson().toJson(dao.getAllPosition());
        out.println(positions);
    }

    /**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @SuppressWarnings("static-access")
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession();

        String positiononsession = "";

        String cadre_category;

        cadre_category = request.getParameter("cadre_category");

        if (session.getAttribute("positionid") != null) {
            positiononsession = session.getAttribute("positionid").toString();

        }
        System.out.println("Position on session__" + positiononsession);

        out = response.getWriter();

        try {

            String position = "<option value=''>Select Position</option>";
            String getpositions;

            if (cadre_category != null) {
                getpositions = "SELECT p.id,p.position_title, c.standardized_cadre_name FROM hrh.cadre_positions p join standardized_cadre c on c.id=p.standardized_cadre_id where carder_category_id='"
                        + cadre_category + "' order by SubPartnerNom ";
            } else {
                getpositions = "SELECT p.id,p.position_title, c.standardized_cadre_name FROM hrh.cadre_positions p join standardized_cadre c on c.id=p.standardized_cadre_id";

            }
            conn.rs = conn.st.executeQuery(getpositions);
            System.out.println(getpositions);
            while (conn.rs.next()) {
                // if the current facility on loop is same as the facility on session, then make
                // it selected
                if (positiononsession.equalsIgnoreCase(conn.rs.getString(1).trim())) {

                    position += "<option selected value='" + conn.rs.getString(1) + "'> " + conn.rs.getString(2)
                            + " </option>";
                } else {
                    position += "<option value='" + conn.rs.getString(1) + "'> " + conn.rs.getString(2) + " </option>";
                }
                // System.out.println("~~"+conn.rs.getString(2));

            }

            out.println(position);
        } catch (SQLException ex) {
            Logger.getLogger(PositionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        doGet(request, response);
    }

}
