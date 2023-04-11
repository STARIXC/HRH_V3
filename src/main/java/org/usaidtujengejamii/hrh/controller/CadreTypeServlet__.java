package org.usaidtujengejamii.hrh.controller;

import utils.CarderTypeDAO;
import utils.JSONConverter;
import com.google.gson.Gson;
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
 * Servlet implementation class CadreTypeServlet__
 */
@WebServlet("/CadreTypeServlet")
public class CadreTypeServlet__ extends HttpServlet {

    HttpSession session = null;
    private final DatabaseConnection conn ;
    private static final long serialVersionUID = 1L;
    Gson gson = new Gson();
    public JSONConverter json;
    public CarderTypeDAO dao;
    PrintWriter out;

    public CadreTypeServlet__() {
        dao = new CarderTypeDAO();
        conn = new DatabaseConnection();
    }

    @SuppressWarnings("static-access")
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        out = response.getWriter();
        //String action = request.getParameter("action");
        // String emp_no = request.getParameter("emp_no");

        String ctypes = json.convert(dao.getAllCarderType());
//            System.out.println(ctypes);
        out.println(ctypes);

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
            String sessioncadretype = "";

            if (session.getAttribute("cadre_type_id") != null) {

                sessioncadretype = session.getAttribute("cadre_type_id").toString();
            }

            String cadre_type = "";

            String qr = "SELECT * FROM hrh.cadre_category";
            conn.rs = conn.st.executeQuery(qr);
            while (conn.rs.next()) {
                if (sessioncadretype.equalsIgnoreCase(conn.rs.getString(1))) {

                    cadre_type += "<option selected value=\"" + conn.rs.getInt("id") + "\">"
                            + conn.rs.getString("cadre_category_name") + "</option>";
                } else {
                    cadre_type += "<option value=\"" + conn.rs.getInt("id") + "\">"
                            + conn.rs.getString("cadre_category_name") + "</option>";
                }

            }

            out = response.getWriter();
       
                out.println(cadre_type);
         
        } catch (SQLException ex) {
            Logger.getLogger(CadreTypeServlet__.class.getName()).log(Level.SEVERE, null, ex);
        }

        //  doGet(request, response);

        //  doGet(request, response);

        //  doGet(request, response);

        //  doGet(request, response);
    }

}
