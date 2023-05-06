package org.usaidtujengejamii.hrh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Employee;
import models.EmployeeProfileData;
import models.EmploymentHistory;
import models.Login;
import utils.EmployeeProfileDAO;
import utils.JSONConverter;

/**
 *
 * @author CBwahyi
 */
public class Profile extends HttpServlet {

    private EmployeeProfileDAO employeeDAO;
    private EmployeeProfileData employeeData;
    private PrintWriter out;
    String details;
    public Profile() {
         employeeDAO= new EmployeeProfileDAO();
    }

    @Override
    public void init() throws ServletException {
        super.init();
        employeeData = null;
    }

    private String empNo;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("application/json;charset=UTF-8");
        out = response.getWriter();
        try {
            empNo = request.getParameter("emp_no");
            System.out.println("This the request position: " + empNo);
            Employee employee = employeeDAO.getEmployeeDetails(empNo);
            Login loginDetails = employeeDAO.getLoginInfo(empNo);
            List<EmploymentHistory> history = employeeDAO.getEmployeeHistory(empNo);
            employeeData = new EmployeeProfileData(employee, loginDetails, history);
            details = JSONConverter.convert(employeeData);
//            System.out.println("Personal Details: " + details);
            
        } catch (SQLException ex) {
            Logger.getLogger(Profile.class.getName()).log(Level.SEVERE, null, ex);
        }
        out.println(details);
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
            Logger.getLogger(Profile.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Profile.class.getName()).log(Level.SEVERE, null, ex);
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
