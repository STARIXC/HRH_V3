package org.usaidtujengejamii.hrh.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Calendar;
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
public class loadYear extends HttpServlet {

  HttpSession session;
  private DatabaseConnection conn;

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException, SQLException {
    try {
      response.setContentType("text/html;charset=UTF-8");

      session = request.getSession();

      String sessionyear = "";

      session.getAttribute("year");

      if (session.getAttribute("year") != null) {

        sessionyear = session.getAttribute("year").toString();

      }
      System.out.println("current cadre ___" + sessionyear);

      String current_year;
      Calendar cal = Calendar.getInstance();
      int year_ = cal.get(Calendar.YEAR)+1;

      System.out.println("Next Year:"+ year_);
      String year = "SELECT DISTINCT(y) FROM calendar_table WHERE y <'"+year_+"'";

      DatabaseConnection conn = new DatabaseConnection();

      conn.rs = conn.st.executeQuery(year);

      current_year = "<option value=\"\">Select Year</option>";

      while (conn.rs.next()) {
        if (sessionyear.equalsIgnoreCase(conn.rs.getString("y"))) {

          current_year = current_year + "<option selected value=\""
                  + conn.rs.getString("y") + "\">" + conn.rs.getString("y") + "</option>";

        } else {
          current_year = current_year + "<option value=\"" + conn.rs.getString("y") + "\">"
                  + conn.rs.getString("y") + "</option>";

        }

      }

      PrintWriter out = response.getWriter();

      try {
        out.println(current_year);

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
    } catch (SQLException ex) {
      Logger.getLogger(loadYear.class.getName()).log(Level.SEVERE, null, ex);
    }

  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    try {
      processRequest(request, response);
    } catch (SQLException ex) {
      Logger.getLogger(loadYear.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    try {
      processRequest(request, response);
    } catch (SQLException ex) {
      Logger.getLogger(loadYear.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
