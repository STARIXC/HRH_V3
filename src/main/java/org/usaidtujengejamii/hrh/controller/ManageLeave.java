package org.usaidtujengejamii.hrh.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.LeaveModel;
import models.Leave;

/**
 * Servlet implementation class ManageLeave
 */
@WebServlet("/ManageLeave")
public class ManageLeave extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/LeaveForm.jsp";
    private static String LIST_LEAVE = "/LeaveView.jsp";
    private LeaveModel dao;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageLeave() {
        super();
        dao = new LeaveModel();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String forward = "";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.deleteLeave(id);
            forward = LIST_LEAVE;
            request.setAttribute("leaves", dao.getAllLeaves());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = INSERT_OR_EDIT;
            int id = Integer.parseInt(request.getParameter("id"));
            Leave leave = dao.getLeaveById(id);
            request.setAttribute("leave", leave);
        } else if (action.equalsIgnoreCase("listLeaves")) {
            forward = LIST_LEAVE;
            request.setAttribute("listLeave", dao.getAllLeaves());
        } else {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Leave leave = new Leave();
        String leave_type = request.getParameter("leave_name");
        String isaccrued = request.getParameter("is_accrued");
        String accrualRate = request.getParameter("is_accrued");
        String leave_description = request.getParameter("leave_description");
        String number_days = request.getParameter("max_days");
        String id = request.getParameter("leave_id");
         String deleteId = request.getParameter("deleteId");
        int lid = Integer.parseInt(id);
        int accrual_rate = Integer.parseInt(accrualRate);
        int max_days = Integer.parseInt(number_days);
        Boolean is_accrued = Boolean.parseBoolean(isaccrued);
        
        leave.setLeave_type(leave_type);
        leave.setIs_accrued(is_accrued);
        leave.setAccrual_rate(accrual_rate);
        leave.setMax_days(max_days);
        leave.setDescription(leave_description);

        String typeID = request.getParameter("id");
        if (typeID == null || typeID.isEmpty()) {
            dao.addLeave(leave);
        } else {
            leave.setLeave_id(Integer.parseInt(typeID));
            dao.updateLeave(leave);
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST_LEAVE);
        request.setAttribute("listLeave", dao.getAllLeaves());
        view.forward(request, response);
    }

}
