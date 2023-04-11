package org.usaidtujengejamii.hrh.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DepartmentDAO;
import utils.JSONConverter;
import java.sql.SQLException;
import java.util.List;
import models.Department;

/**
 * Servlet implementation class DepartmentController
 */
@WebServlet("/DepartmentController")
public class DepartmentController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/add_department.jsp";
    private static String LIST_DEPARTMENTS = "/manage_department.jsp";
    private DepartmentDAO dao;
    private JSONConverter json;
    PrintWriter out;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DepartmentController() {
        super();
        dao = new DepartmentDAO();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        @SuppressWarnings("unused")
        String forward = "";
        String action = request.getParameter("action");
        out = response.getWriter();
        try {
            switch (action) {
                case "/department/create":
                    showNewForm(request, response);
                    break;
                case "/department/insert":
                    insertDept(request, response);
                    break;
                case "/department/delete":
                    deleteDept(request, response);
                    break;
                case "/department/edit":
                    showEditForm(request, response);
                    break;
                case "/department/update":
                    updateDept(request, response);
                    break;
                default:
                    listDept(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }


        /*
		 * RequestDispatcher view = request.getRequestDispatcher(forward);
		 * view.forward(request, response);
         */
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void listDept(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Department> listDept = dao.getAllDepartment();
        String departments = json.convert(listDept);
        out.println(departments);
        RequestDispatcher dispatcher = request.getRequestDispatcher(LIST_DEPARTMENTS);
        dispatcher.forward(request, response);

    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher(INSERT_OR_EDIT);
        dispatcher.forward(request, response);
    }

    private void insertDept(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String dept_name = request.getParameter("dept_name");
        String dept_desc = request.getParameter("dept_desc");
        Department newDept = new Department(dept_name, dept_desc);
        dao.addDepartment(newDept);
        response.sendRedirect("/department/list");
    }

    private void deleteDept(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int dept_id = Integer.parseInt(request.getParameter("dept_id"));
        dao.deleteDepartment(dept_id);
        //  forward = LIST_DEPARTMENTS;
        request.setAttribute("listDepartments", dao.getAllDepartment());
        response.sendRedirect("/department/list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
        int dept_id = Integer.parseInt(request.getParameter("dept_id"));
        Department existingDept = dao.getDepartmentByID(dept_id);
        RequestDispatcher dispatcher = request.getRequestDispatcher(INSERT_OR_EDIT);
        request.setAttribute("department", existingDept);
        dispatcher.forward(request, response);

    }

    private void updateDept(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int dept_id = Integer.parseInt(request.getParameter("dept_id"));
        String dept_name = request.getParameter("dept_name");
        String dept_desc = request.getParameter("dept_desc");
        Department dept = new Department(dept_id, dept_name, dept_desc);
        dao.updateDepartment(dept);
        response.sendRedirect("/department/list");
    }
}
