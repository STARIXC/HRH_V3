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
 * Servlet implementation class loadEmpType
 */
@WebServlet("/loadEmpType")
public class loadEmpType extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session = null;
        private final DatabaseConnection conn;
        PrintWriter out;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loadEmpType() {
        super();
        // TODO Auto-generated constructor stub
        conn = new DatabaseConnection();
    }

	/**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
        @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("text/html;charset=UTF-8");
			session = request.getSession();
			String sessionemptype = "";

			if (session.getAttribute("emp_type_id") != null) {

				sessionemptype = session.getAttribute("emp_type_id").toString();
			}

			String emp_type;

			
			emp_type = "<option value=\"\">Select Employee Type</option>";
			String qr = "SELECT * FROM cadre_type";
			conn.rs = conn.st.executeQuery(qr);
			while (conn.rs.next()) {
				if (sessionemptype.equalsIgnoreCase(conn.rs.getString(1))) {

					emp_type += "<option selected value=\"" + conn.rs.getInt("id") + "\">" + conn.rs.getString("cadre_type_name")
					+ "</option>";
				}

				else {
					emp_type += "<option value=\"" + conn.rs.getInt("id") + "\">" + conn.rs.getString("cadre_type_name") + "</option>";
				}

			}

			 out = response.getWriter();
			try {
				out.println(emp_type);
			} finally {
				out.close();
				if (conn != null)
					try {

						if (conn.conn != null) {
							conn.conn.close();
						}
						if (conn.rs != null) {
							conn.rs.close();
						}
						if (conn.st != null) {
							conn.st.close();
						}

					} catch (SQLException ignore) {
					}
			}
		} catch (SQLException ex) {
			Logger.getLogger(loadCounty.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

}
