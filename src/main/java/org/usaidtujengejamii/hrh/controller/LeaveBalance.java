package org.usaidtujengejamii.hrh.controller;


import utils.LeaveBalanceDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CBwahyi
 */
public class LeaveBalance extends HttpServlet {
  PrintWriter out;
    int status, execute_activity = 0;
    private LeaveBalanceDAO dao;
    Gson gson = new Gson();
    String result, nextPage;

    public LeaveBalance() {
        super();
        dao = new LeaveBalanceDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String employeeId = request.getParameter("employee_id");
        int leaveType = Integer.parseInt(request.getParameter("leave_type"));

        // Retrieve leave balance from database
        int leaveBalance = dao.getLeaveBalance(employeeId, leaveType);

        // Set leave balance as a request attribute
        request.setAttribute("leave_balance", leaveBalance);

        // Forward the request to the JSP page
        request.getRequestDispatcher("/leave_balance.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
