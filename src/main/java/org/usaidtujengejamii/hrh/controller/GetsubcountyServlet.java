package org.usaidtujengejamii.hrh.controller;

import utils.JSONConverter;
import utils.SubcountyDAO;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class GetsubcountyServlet
 */
@WebServlet("/GetsubcountyServlet")
public class GetsubcountyServlet extends HttpServlet {

   
    private static final long serialVersionUID = 1L;
     HttpSession session = null;
    PrintWriter out;
    public JSONConverter json;
    public SubcountyDAO dao;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetsubcountyServlet() {
        super();
        dao = new SubcountyDAO();
    }

    @SuppressWarnings("static-access")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        out = response.getWriter();
        String county_id, current_districts;
        county_id = request.getParameter("county");
        current_districts = json.convert(dao.getSubCountyByCountyId(county_id));
        System.out.println(current_districts);
        out.println(current_districts);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @SuppressWarnings("static-access")
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }

}
