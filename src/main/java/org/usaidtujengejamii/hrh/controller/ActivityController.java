package org.usaidtujengejamii.hrh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.ActivityDAO;
import models.Activity;

/**
 * Servlet implementation class ActivityController
 */
@WebServlet("/ActivityController")
public class ActivityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String INSERT_OR_EDIT = "/ActivityForm.jsp";
	private static String LIST_ACTIVITIES = "/ActivityView.jsp";
	private ActivityDAO dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivityController() {
        super();
       dao= new ActivityDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward = "";
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			dao.deleteActivity(id);
			forward = LIST_ACTIVITIES;
			request.setAttribute("listActivities", dao.getAllActivities());
		} else if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			int activity_id = Integer.parseInt(request.getParameter("activity_id"));
			Activity activity = dao.getActivityById(activity_id);
			request.setAttribute("activity", activity);
		} else if (action.equalsIgnoreCase("listActivities")) {
			forward = LIST_ACTIVITIES;
			request.setAttribute("listActivities", dao.getAllActivities());
		} else {
			forward = INSERT_OR_EDIT;
		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Activity activity = new Activity();
		activity.setActivity_description(request.getParameter("activity_description"));
		activity.setActivity_cadre_type(Integer.parseInt(request.getParameter("activity_cadre_type")));
		
		String activity_id = request.getParameter("activity_id");
		if (activity_id ==null || activity_id.isEmpty()) {
			dao.addActivity(activity);
		}else {
			activity.setActivity_id(Integer.parseInt(activity_id));
			dao.updateActivity(activity);
		}
		RequestDispatcher view = request.getRequestDispatcher(LIST_ACTIVITIES);
	    request.setAttribute("listActivities", dao.getAllActivities());
	    view.forward(request, response);
		}
	}


