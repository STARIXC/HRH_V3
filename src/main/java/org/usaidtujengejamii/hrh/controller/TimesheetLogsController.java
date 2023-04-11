package org.usaidtujengejamii.hrh.controller;

import utils.JSONConverter;
import utils.TimesheetLogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.TimesheetLog;

/**
 * Servlet implementation class TimesheetLogsController
 */
@WebServlet("/TimesheetLogsController")
public class TimesheetLogsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
PrintWriter out;
	int status, execute_activity = 0;
	private TimesheetLogDAO dao;
//	Gson gson = new Gson();
	String result,nextPage;
        
    public TimesheetLogsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out = response.getWriter();
				// setting the response type
				response.setContentType("application/json");
				request.getParameter("action");
				String emp_no = request.getParameter("emp_no");
				List<TimesheetLog> logs = dao.getActivityByStaffID();
				System.out.print(logs);
                out.println(JSONConverter.convert(logs));
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
