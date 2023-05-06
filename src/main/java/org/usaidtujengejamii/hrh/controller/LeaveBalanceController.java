package org.usaidtujengejamii.hrh.controller;

import com.google.gson.Gson;
import java.io.*;
import java.sql.SQLException;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Employee;
import models.Leave;
import models.LeaveBalance;
import org.usaidtujengejamii.hrh.db.DatabaseConnection;
import utils.EmployeeDAO;
import utils.JSONConverter;
import utils.LeaveBalanceDAO;
import utils.LeaveTypeDAO;

/**
 *
 * @author CBwahyi
 */
public class LeaveBalanceController extends HttpServlet {

    private final EmployeeDAO employeeDao;
    private final LeaveTypeDAO leaveTypeDao;
    private final LeaveBalanceDAO leaveBalanceDAO;
    private final DatabaseConnection conn;
    PrintWriter out;
    Gson gson = new Gson();
    public JSONConverter json;

    public LeaveBalanceController() {
        conn = new DatabaseConnection();
        employeeDao = new EmployeeDAO();
        leaveTypeDao= new LeaveTypeDAO();
        leaveBalanceDAO= new LeaveBalanceDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        // Get the selected year and employee option from the form
        String year = request.getParameter("year");
        String employeeOption = request.getParameter("employeeOption");
        String employeeIdStr = request.getParameter("employeeId");
        String employeeId = "";

        if (employeeOption.equals("select")) {
            employeeId = employeeIdStr;
        }

        // Retrieve financial year start date
        LocalDate startDate = getFinancialYearStartDate(year);
        System.out.println(startDate);
        // Get list of active employees
        List<Employee> employeeList = employeeDao.findActive();
//        String employeeList = JSONConverter.convert(employeeDao.findActive());
        if (employeeList == null) {
            // handle the case where no active employees were found
            System.out.println("No active employees found.");
        } else {

//            System.out.println(JSONConverter.convert(employeeList));
            // Get list of leave types
            List<Leave> leaveTypes = leaveTypeDao.getAllLeaves();
            // Update leave balances for selected employee(s)
            List<LeaveBalance> updatedLeaveBalances = new ArrayList<>();

            for (Employee employee : employeeList) {
                if (employeeOption.equals("all") || (employee.getEmp_no() == null ? employeeId == null : employee.getEmp_no().equals(employeeId))) {
                    for (Leave leaveType : leaveTypes) {
                        int leaveTypeId = leaveType.getLeave_id();
                        int maxDays = leaveType.getMax_days();
                        double accrualRate;
                   
                        int daysAccruedThisYear = 0;
                        // Check if a leave balance exists for the employee and leave type for the current year
                        boolean leaveBalanceExists = leaveBalanceDAO.exists(employee.getEmp_no(), leaveTypeId, year);
                        // If leave balance does not exist, create a new one with accrued days
                        if (!leaveBalanceExists) {
                            // For annual leave, calculate days accrued based on months worked
                            if (leaveType.getLeave_type().equals("Annual Leave")) {
                                int max_days=21;
                                 accrualRate = max_days / 12.0; // accrual rate per month
                                int monthsWorked = (int) Period.between(startDate, LocalDate.now()).toTotalMonths();
//                                   System.out.println(monthsWorked);
                                daysAccruedThisYear = (int) Math.floor(accrualRate * monthsWorked);
                                daysAccruedThisYear = Math.min(daysAccruedThisYear, max_days);
                              
                            } else {
                                daysAccruedThisYear = maxDays;
                            }
                            LeaveBalance newBalance;
                            newBalance = new LeaveBalance(leaveTypeId, daysAccruedThisYear, 0, employee.getEmp_no(), year);
                            leaveBalanceDAO.create(newBalance);
                            updatedLeaveBalances.add(newBalance);
                        } // If leave balance already exists, update it with the accrued days
                        else {
                            // For annual leave, calculate days accrued based on months worked
                            if (leaveType.getLeave_type().equals("Annual Leave")) {
                                 int max_days=21;
                                 accrualRate = max_days / 12.0; // accrual rate per month
                                int monthsWorked = (int) Period.between(startDate, LocalDate.now()).toTotalMonths();
//                                System.out.println(monthsWorked);
                                daysAccruedThisYear = (int) Math.floor(accrualRate * monthsWorked);
                                daysAccruedThisYear = Math.min(daysAccruedThisYear, max_days);
                                
                            } else {
                                daysAccruedThisYear = maxDays;
                            }

                            LeaveBalance currentBalance = leaveBalanceDAO.findByEmployeeAndLeaveTypeAndYear(employee.getEmp_no(), leaveTypeId, year);
                            currentBalance.setDays_accrued(daysAccruedThisYear);
                            leaveBalanceDAO.update(currentBalance);
                            updatedLeaveBalances.add(currentBalance);
                        }

                    }
                }
            }
            // Send the updated leave balances to the client as a JSON object
        out.println(updatedLeaveBalances);
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
            Logger.getLogger(LeaveBalanceController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(LeaveBalanceController.class.getName()).log(Level.SEVERE, null, ex);
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

    public LocalDate getFinancialYearStartDate(String year) {
        LocalDate localDate = null;

        try {
            String sql = "SELECT start_date FROM hrh.tbl_financial_year WHERE year = ?";
            conn.pst = conn.conn.prepareStatement(sql);
            conn.pst.setString(1, year);
            conn.rs = conn.pst.executeQuery();

            if (conn.rs.next()) {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                String startDateStr = conn.rs.getString("start_date");
                localDate = LocalDate.parse(startDateStr, formatter);
            }
        } catch (SQLException e) {
            Logger.getLogger(LeaveBalanceController.class.getName()).log(Level.SEVERE, null, e);

        }

        // If start date is not found in the database, return October 1st of the previous year
        if (localDate == null) {
            try {
                int previousYear = Integer.parseInt(year) - 1;
                localDate = LocalDate.of(previousYear, Month.OCTOBER, 1);
            } catch (NumberFormatException e) {
                Logger.getLogger(LeaveBalanceController.class.getName()).log(Level.SEVERE, null, e);
                // If year is not a valid integer, return current date
                localDate = LocalDate.now();
            }
        }
        return localDate;
    }

}
