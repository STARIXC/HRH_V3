package org.usaidtujengejamii.hrh.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import utils.JSONConverter;
import utils.LeaveModel;


@WebServlet("/LeaveType")
public class LeaveType extends HttpServlet {

    private static final long serialVersionUID = 1L;
    HttpSession session = null;
//    private final DatabaseConnection conn;
    Gson gson = new Gson();
    @SuppressWarnings("unused")
    private final LeaveModel dao;
    private JSONConverter json;
    int status = 0;
    String message = "";
    PrintWriter out;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LeaveType() {
        super();
        dao = new LeaveModel();
//        conn = new DatabaseConnection();
    }

    /**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        out = response.getWriter();
        @SuppressWarnings("static-access")
        String leave = json.convert(dao.getAllLeaves());
        out.println(leave);

    }

    /**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
