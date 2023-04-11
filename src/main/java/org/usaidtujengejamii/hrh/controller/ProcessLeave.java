package org.usaidtujengejamii.hrh.controller;

import utils.JSONConverter;
import utils.LeaveBalanceDAO;
import utils.LeaveDAO;
import models.LeaveApplication;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CBWAHYI
 */
public class ProcessLeave extends HttpServlet {

    PrintWriter out;
    private static final String INSERT_OR_EDIT = "leave_approval.jsp";
    int status, execute_activity = 0;
    private LeaveBalanceDAO dao;
    //  Gson gson = new Gson();
    String result, nextPage;
    private JSONConverter json;

    public ProcessLeave() {
        super();
        dao = new LeaveBalanceDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        out = response.getWriter();
        String forward = "";
        String action = request.getServletPath();
        int leave = Integer.parseInt(request.getParameter("tambua"));

        if (leave > 0) {
            LeaveApplication application = null;
            application = dao.getAppliedLeaveById(leave);
            request.getSession().setAttribute("application", application);

            out.println("Attribute Value : " + application);

        }
        RequestDispatcher view = request.getRequestDispatcher(INSERT_OR_EDIT);
        view.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
